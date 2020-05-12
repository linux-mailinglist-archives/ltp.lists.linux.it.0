Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92D1CFF1B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 22:14:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 297F83C23B2
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 22:14:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5F6D43C1414
 for <ltp@lists.linux.it>; Tue, 12 May 2020 22:14:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C7D781000C6E
 for <ltp@lists.linux.it>; Tue, 12 May 2020 22:14:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC6DDAC46;
 Tue, 12 May 2020 20:14:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 22:14:16 +0200
Message-Id: <20200512201416.8299-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] rpc: TCONF when tests aren't compiled + remove
 kill warning
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Without this test failure was wrongly reported:
rpc_test 1 TFAIL: tirpc_rpcb_getaddr 10.0.0.2 536875000 failed unexpectedly

Also make sure with variable that server has started before trying to
kill it.

Kill server with SIGPIPE, should be enough and SIGKILL
produced warning, which might be confused:
/opt/ltp/testcases/bin/rpc_test.sh: line 61: 3827 Killed  $SERVER $PROGNUMNOSVC

Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

with this implementation (suggested by Alexey), we get TCONF twice. It's
a bit strange, but I'll keep it, because I like that required binary is
printed:
rpc_test 1 TCONF: 'tirpc_rpcb_getaddr' not found
rpc_test 1 TCONF: LTP compiled without TI-RPC support?

Also added proper detection if kill is needed (related to the change in
the commit) and kill with SIGPIPE (unrelated change, I can add it as
separate commit).

Kind regards,
Petr

 testcases/network/rpc/rpc-tirpc/rpc_test.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
index 30cfd2564..dc97213d0 100755
--- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -54,12 +54,13 @@ setup()
 	fi
 
 	[ -n "$CLIENT" ] || tst_brk TBROK "client program not set"
+	tst_check_cmds $CLIENT $SERVER || tst_brk TCONF "LTP compiled without TI-RPC support?"
 }
 
 cleanup()
 {
-	if [ ! -z "$SERVER" ]; then
-		pkill -9 $SERVER > /dev/null 2>&1
+	if [ "$SERVER_STARTED" ]; then
+		pkill -13 -x $SERVER
 		$CLEANER $PROGNUMNOSVC
 	fi
 }
@@ -70,6 +71,7 @@ do_test()
 
 	if [ -n "$SERVER" ]; then
 		$SERVER $PROGNUMNOSVC &
+		SERVER_STARTED=1
 
 		for i in $(seq 1 10); do
 			rpcinfo -p localhost | grep -q $PROGNUMNOSVC && break
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
