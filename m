Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD68241B59
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBE973C3142
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 15:05:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CDC543C1CB2
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F36931A01964
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 15:05:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C0D2B038
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 13:05:25 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 15:04:59 +0200
Message-Id: <20200811130502.12010-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] Integrate tst_taint_check() into main LTP library
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

Add .taint_check attribute to struct tst_test and use it to initialize
taint checking functions. Then call tst_taint_check() automatically at the end
of testing if needed.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 doc/test-writing-guidelines.txt | 37 ++++++++++++++++++---------------
 include/tst_taint.h             | 21 ++++++++++++-------
 include/tst_test.h              |  9 ++++++++
 lib/tst_test.c                  |  6 ++++++
 4 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 67aed1ac9..b2265a778 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1535,38 +1535,41 @@ test.c:8: INFO: do_action(arg) failed
 2.2.24 Tainted kernels
 ^^^^^^^^^^^^^^^^^^^^^^
 
-If you need to detect, if a testcase triggers a kernel warning, bug or oops,
-the following can be used to detect TAINT_W or TAINT_D:
+If you need to detect whether a testcase triggers a kernel warning, bug or
+oops, the following can be used to detect TAINT_W or TAINT_D:
 
 [source,c]
 -------------------------------------------------------------------------------
 #include "tst_test.h"
-#include "tst_taint.h"
 
-void setup(void)
-{
+static struct tst_test test = {
 	...
-	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	...
-}
-...
+};
+
 void run(void)
 {
 	...
-	if (tst_taint_check() == 0)
-		tst_res(TPASS, "kernel is not tainted");
+	if (tst_taint_check() != 0)
+		tst_res(TFAIL, "kernel has issues");
 	else
-		tst_res(TFAIL, "kernel is tainted");
+		tst_res(TPASS, "kernel seems to be fine");
 }
 -------------------------------------------------------------------------------
 
-You have to call 'tst_taint_init()' with non-zero flags first, preferably during
-setup(). The function will generate a 'TCONF' if the requested flags are not
-fully supported on the running kernel, and 'TBROK' if either a zero mask was
-supplied or if the kernel is already tainted before executing the test.
+To initialize taint checks, you have to set the taint flags you want to test
+for in the 'taint_check' attribute of the tst_test struct. LTP library will
+then automatically call 'tst_taint_init()' during test setup. The function
+will generate a 'TCONF' if the requested flags are not fully supported on the
+running kernel, and 'TBROK' if the kernel is already tainted before executing
+the test.
 
-Then you can call 'tst_taint_check()' during 'run()', which returns 0 or the
-tainted flags set in '/proc/sys/kernel/tainted' as specified earlier.
+LTP library will then automatically check kernel taint at the end of testing.
+If '.all_filesystems' is set in struct tst_test, taint check will be performed
+after each file system and testing may be aborted early by 'TBROK'. You can
+optionally also call 'tst_taint_check()' during 'run()', which returns 0 or
+the tainted flags set in '/proc/sys/kernel/tainted' as specified earlier.
 
 Depending on your kernel version, not all tainted-flags will be supported.
 
diff --git a/include/tst_taint.h b/include/tst_taint.h
index cfa84dded..bd8076c1c 100644
--- a/include/tst_taint.h
+++ b/include/tst_taint.h
@@ -7,14 +7,12 @@
  *
  * ...
  * #include "tst_test.h"
- * #include "tst_taint.h"
  * ..
- * void setup(void)
- * {
+ * static struct tst_test test = {
  *	...
- *	tst_taint_init(TST_TAINT_W | TST_TAINT_D));
+ *	.taint_check = TST_TAINT_W | TST_TAINT_D,
  *	...
- * }
+ * };
  *
  * void run(void)
  * {
@@ -29,10 +27,14 @@
  *
  *
  *
- * The above code checks, if the kernel issued a warning (TST_TAINT_W)
+ * The above code checks whether the kernel issued a warning (TST_TAINT_W)
  * or even died (TST_TAINT_D) during test execution.
  * If these are set after running a test case, we most likely
  * triggered a kernel bug.
+ *
+ * You do not need to use tst_taint_check() explicitly because it'll be called
+ * automatically at the end of testing by the LTP library if
+ * tst_test.taint_check in non-zero.
  */
 
 #ifndef TST_TAINTED_H__
@@ -64,7 +66,10 @@
 #define TST_TAINT_T     (1 << 17) /* kernel was built with the struct randomization plugin */
 
 /*
- * Initialize and prepare support for checking tainted kernel.
+ * Initialize and prepare support for checking tainted kernel. Called
+ * automatically by LTP library during test setup if tst_test.taint_check
+ * is non-zero. The value of tst_test.taint_check will be passed as the mask
+ * argument.
  *
  * supply the mask of TAINT-flags you want to check, for example
  * (TST_TAINT_W | TST_TAINT_D) when you want to check if the kernel issued
@@ -72,7 +77,7 @@
  *
  * This function tests if the requested flags are supported on the
  * locally running kernel. In case the tainted-flags are already set by
- * the kernel, there is no reason to continue and TCONF is generated.
+ * the kernel, there is no reason to continue and TBROK is generated.
  *
  * The mask must not be zero.
  */
diff --git a/include/tst_test.h b/include/tst_test.h
index b02de4597..c91d3f18a 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -41,6 +41,7 @@
 #include "tst_assert.h"
 #include "tst_cgroup.h"
 #include "tst_lockdown.h"
+#include "tst_taint.h"
 
 /*
  * Reports testcase result.
@@ -168,6 +169,14 @@ struct tst_test {
 	 */
 	unsigned long request_hugepages;
 
+	/*
+	 * If set to non-zero, call tst_taint_init(taint_check) during setup
+	 * and check kernel taint at the end of the test. If all_filesystems
+	 * is non-zero, taint check will be performed after each FS test and
+	 * testing will be terminated by TBROK if taint is detected.
+	 */
+	unsigned int taint_check;
+
 	/*
 	 * If set non-zero denotes number of test variant, the test is executed
 	 * variants times each time with tst_variant set to different number.
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 175dea7c4..3a37f61ca 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1001,6 +1001,9 @@ static void do_setup(int argc, char *argv[])
 
 	if (tst_test->restore_wallclock)
 		tst_wallclock_save();
+
+	if (tst_test->taint_check)
+		tst_taint_init(tst_test->taint_check);
 }
 
 static void do_test_setup(void)
@@ -1279,6 +1282,9 @@ static int fork_testrun(void)
 	alarm(0);
 	SAFE_SIGNAL(SIGINT, SIG_DFL);
 
+	if (tst_test->taint_check && tst_taint_check())
+		tst_brk(TBROK, "Kernel is now tainted.");
+
 	if (WIFEXITED(status) && WEXITSTATUS(status))
 		return WEXITSTATUS(status);
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
