Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECC1D89D2
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:15:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DC423C220B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 23:15:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BA6C93C042A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:15:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D6415601797
 for <ltp@lists.linux.it>; Mon, 18 May 2020 23:14:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6B6ADB1C0;
 Mon, 18 May 2020 21:15:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 23:15:13 +0200
Message-Id: <20200518211514.20445-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_net.sh: Print output on unexpected PASS/FAIL
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

This helps debugging.

Use $TMPDIR and PID to guarantee writable directory and unique file
without the need to require TST_NEEDS_TMPDIR=1.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 011b62267..bfed4a44d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -250,22 +250,32 @@ tst_net_run()
 
 EXPECT_RHOST_PASS()
 {
-	tst_rhost_run -c "$*" > /dev/null
+	local log="$TMPDIR/log.$$"
+
+	tst_rhost_run -c "$*" > $log
 	if [ $? -eq 0 ]; then
 		tst_res_ TPASS "$* passed as expected"
 	else
 		tst_res_ TFAIL "$* failed unexpectedly"
+		cat $log
 	fi
+
+	rm -f $log
 }
 
 EXPECT_RHOST_FAIL()
 {
-	tst_rhost_run -c "$* 2> /dev/null"
+	local log="$TMPDIR/log.$$"
+
+	tst_rhost_run -c "$*" > $log
 	if [ $? -ne 0 ]; then
 		tst_res_ TPASS "$* failed as expected"
 	else
 		tst_res_ TFAIL "$* passed unexpectedly"
+		cat $log
 	fi
+
+	rm -f $log
 }
 
 # Get test interface names for local/remote host.
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
