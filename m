Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E38125E18
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:50:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 910FB3C2215
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 10:50:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AE74D3C149E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:50:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C636A60223E
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 10:50:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6499AF83
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 09:50:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Dec 2019 10:50:50 +0100
Message-Id: <20191219095050.26106-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Add return value to
 _tst_expect_{fail, pass}
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

And use this feature in isofs.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

there'll be probably more uses than just isofs.sh.
I can put isofs.sh changes into separate commit.

Kind regards,
Petr

 doc/test-writing-guidelines.txt      | 8 ++++++++
 testcases/kernel/fs/iso9660/isofs.sh | 9 ++-------
 testcases/lib/tst_test.sh            | 4 ++++
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 79d857fea..88f771823 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2465,6 +2465,14 @@ to that, 'EXPECT_FAIL' always redirects the command's stderr to '/dev/null'.
 There are also 'EXPECT_PASS_BRK' and 'EXPECT_FAIL_BRK', which works the same way
 except breaking a test when unexpected action happen.
 
+It's possible to detect whether expected value happened:
+[source,sh]
+-------------------------------------------------------------------------------
+if ! EXPECT_PASS command arg1 2\> /dev/null; then
+	continue
+fi
+-------------------------------------------------------------------------------
+
 tst_kvcmp
 +++++++++
 
diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
index 781ccdc88..9de3f7cdc 100755
--- a/testcases/kernel/fs/iso9660/isofs.sh
+++ b/testcases/kernel/fs/iso9660/isofs.sh
@@ -56,13 +56,8 @@ do_test() {
 		"-allow-lowercase -allow-multidot -iso-level 3 -f -l -D -J -allow-leading-dots -R"
 	do
 		rm -f isofs.iso
-		mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2> /dev/null
-		if [ $? -eq 0 ]; then
-			tst_res TPASS "mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir"
-		else
-			tst_res TFAIL "mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir"
-			continue
-		fi
+		EXPECT_PASS mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
+			|| continue
 
 		for mount_opt in \
 			"loop" \
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0265c1d1..b98f86e8e 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -146,8 +146,10 @@ _tst_expect_pass()
 	tst_rod "$@"
 	if [ $? -eq 0 ]; then
 		tst_res TPASS "$@ passed as expected"
+		return 0
 	else
 		$fnc TFAIL "$@ failed unexpectedly"
+		return 1
 	fi
 }
 
@@ -160,8 +162,10 @@ _tst_expect_fail()
 	tst_rod "$@" 2> /dev/null
 	if [ $? -ne 0 ]; then
 		tst_res TPASS "$@ failed as expected"
+		return 0
 	else
 		$fnc TFAIL "$@ passed unexpectedly"
+		return 1
 	fi
 }
 
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
