Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7451B96A1
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 07:38:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4249D3C5FBE
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 07:38:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 859343C2876
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 07:38:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6DDF61A00811
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 07:38:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE5D9AD4B;
 Mon, 27 Apr 2020 05:38:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 27 Apr 2020 07:38:13 +0200
Message-Id: <20200427053813.23112-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200427053813.23112-1-pvorel@suse.cz>
References: <20200427053813.23112-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] net/sendfile01.sh: Check with timeout
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

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/tcp_cmds/sendfile/sendfile01.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/network/tcp_cmds/sendfile/sendfile01.sh b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
index af9cadf57..7104de7aa 100755
--- a/testcases/network/tcp_cmds/sendfile/sendfile01.sh
+++ b/testcases/network/tcp_cmds/sendfile/sendfile01.sh
@@ -11,7 +11,7 @@ TST_SETUP=do_setup
 TST_CLEANUP=do_cleanup
 TST_TESTFUNC=do_test
 TST_NEEDS_TMPDIR=1
-TST_NEEDS_CMDS="diff stat"
+TST_NEEDS_CMDS="diff ss stat"
 . tst_net.sh
 
 do_setup()
@@ -28,7 +28,7 @@ do_setup()
 	tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
 	server_started=1
 	tst_res TINFO "wait for the server to start"
-	sleep 1
+	TST_RETRY_FUNC "tst_rhost_run -c 'ss -ltp' | grep -q '$port.*testsf'" 0
 }
 
 do_test()
-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
