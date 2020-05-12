Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD31CF91A
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:27:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1CE53C24E4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:27:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C1F3A3C1414
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:27:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2C253600C0C
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:27:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 426C0AB64
 for <ltp@lists.linux.it>; Tue, 12 May 2020 15:27:12 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 17:27:01 +0200
Message-Id: <20200512152701.23625-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] rpc: Warn when tests aren't compiled
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/rpc/rpc-tirpc/rpc_test.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/network/rpc/rpc-tirpc/rpc_test.sh b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
index 30cfd2564..fd72e6be4 100755
--- a/testcases/network/rpc/rpc-tirpc/rpc_test.sh
+++ b/testcases/network/rpc/rpc-tirpc/rpc_test.sh
@@ -35,10 +35,12 @@ EOF
 
 rpc_parse_args()
 {
+	local err="LTP compiled without TI-RPC support"
+
 	case "$1" in
-		c) CLIENT="$OPTARG" ;;
-		e) CLIENT_EXTRA_OPTS="$OPTARG" ;;
-		s) SERVER="$OPTARG" ;;
+	c) CLIENT="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
+	e) CLIENT_EXTRA_OPTS="$OPTARG";;
+	s) SERVER="$OPTARG"; tst_cmd_available $OPTARG || tst_brk TCONF $err;;
 	esac
 }
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
