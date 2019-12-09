Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A08117779
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 21:32:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6AD53C2352
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 21:32:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 77C063C03E8
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 21:32:56 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2C4E76021F5
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 21:32:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43A17AC66
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 20:32:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  9 Dec 2019 21:32:48 +0100
Message-Id: <20191209203248.2427967-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] shell: TST_NEEDS_DEVICE imply TST_TMPDIR
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

instead of requiring to be set.
This is a sync with C API (previous commit).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

sync shell API with patch for C API
(should be accepted only if we agree on
https://patchwork.ozlabs.org/patch/1204029/).

Kind regards,
Petr

 doc/test-writing-guidelines.txt                            | 1 +
 testcases/commands/df/df01.sh                              | 1 -
 testcases/commands/mkfs/mkfs01.sh                          | 1 -
 testcases/commands/mkswap/mkswap01.sh                      | 1 -
 testcases/kernel/security/integrity/ima/tests/ima_setup.sh | 1 -
 testcases/lib/tst_test.sh                                  | 5 ++---
 6 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index e8e766753..79d857fea 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2125,6 +2125,7 @@ simply by setting right '$TST_NEEDS_FOO'.
 | 'TST_NEEDS_TMPDIR' | Create test temporary directory and cd into it.
 | 'TST_NEEDS_DEVICE' | Prepare test temporary device, the path to testing
                        device is stored in '$TST_DEVICE' variable.
+                       The option implies 'TST_NEEDS_TMPDIR'.
 | 'TST_NEEDS_CMDS'   | String with command names that has to be present for
                        the test (see below).
 | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
index 1ab4547f4..02aeec7b4 100755
--- a/testcases/commands/df/df01.sh
+++ b/testcases/commands/df/df01.sh
@@ -13,7 +13,6 @@ TST_OPTS="f:"
 TST_USAGE=usage
 TST_PARSE_ARGS=parse_args
 TST_NEEDS_ROOT=1
-TST_NEEDS_TMPDIR=1
 TST_NEEDS_DEVICE=1
 . tst_test.sh
 
diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
index 81f1a168c..90368190d 100755
--- a/testcases/commands/mkfs/mkfs01.sh
+++ b/testcases/commands/mkfs/mkfs01.sh
@@ -12,7 +12,6 @@ TST_OPTS="f:"
 TST_USAGE=usage
 TST_PARSE_ARGS=parse_args
 TST_NEEDS_ROOT=1
-TST_NEEDS_TMPDIR=1
 TST_NEEDS_DEVICE=1
 TST_NEEDS_CMDS="blkid df"
 . tst_test.sh
diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
index 9437c4a4e..f6494f6e3 100755
--- a/testcases/commands/mkswap/mkswap01.sh
+++ b/testcases/commands/mkswap/mkswap01.sh
@@ -9,7 +9,6 @@ TST_CNT=10
 TST_SETUP=setup
 TST_TESTFUNC=do_test
 TST_NEEDS_ROOT=1
-TST_NEEDS_TMPDIR=1
 TST_NEEDS_DEVICE=1
 TST_NEEDS_CMDS="uuidgen blkid blockdev mkswap"
 . tst_test.sh
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 51c03013d..422ec0b47 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -9,7 +9,6 @@ TST_SETUP_CALLER="$TST_SETUP"
 TST_SETUP="ima_setup"
 TST_CLEANUP_CALLER="$TST_CLEANUP"
 TST_CLEANUP="ima_cleanup"
-TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
 
 . tst_test.sh
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index f772857eb..e0265c1d1 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -525,6 +525,8 @@ tst_run()
 
 	_tst_setup_timer
 
+	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_TMPDIR=1
+
 	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
 		if [ -z "$TMPDIR" ]; then
 			export TMPDIR="/tmp"
@@ -541,9 +543,6 @@ tst_run()
 
 	TST_MNTPOINT="${TST_MNTPOINT:-mntpoint}"
 	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
-		if [ -z ${TST_TMPDIR} ]; then
-			tst_brk TBROK "Use TST_NEEDS_TMPDIR must be set for TST_NEEDS_DEVICE"
-		fi
 
 		TST_DEVICE=$(tst_device acquire)
 
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
