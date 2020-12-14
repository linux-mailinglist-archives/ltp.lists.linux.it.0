Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9489E2D9368
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 07:58:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 603A03C3365
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 07:58:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 793EB3C2DD3
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 07:58:12 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 32CD66005E0
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 07:58:10 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,417,1599494400"; d="scan'208";a="102365688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Dec 2020 14:58:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1358B4CE6013
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 14:58:06 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 14 Dec 2020 14:58:08 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Mon, 14 Dec 2020 14:58:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 14 Dec 2020 14:37:28 +0800
Message-ID: <20201214063729.1656200-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1358B4CE6013.AE61B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/sched_getparam{01,
 02}: Convert to new API and cleanup
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

Also merge sched_getparam02 into sched_getparam01.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 -
 .../kernel/syscalls/sched_getparam/.gitignore |   1 -
 .../sched_getparam/sched_getparam01.c         | 165 +++++------------
 .../sched_getparam/sched_getparam02.c         | 172 ------------------
 4 files changed, 49 insertions(+), 290 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/sched_getparam/sched_getparam02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 409800dbb..aae227a69 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1132,7 +1132,6 @@ sched_get_priority_min01 sched_get_priority_min01
 sched_get_priority_min02 sched_get_priority_min02
 
 sched_getparam01 sched_getparam01
-sched_getparam02 sched_getparam02
 sched_getparam03 sched_getparam03
 
 sched_rr_get_interval01 sched_rr_get_interval01
diff --git a/testcases/kernel/syscalls/sched_getparam/.gitignore b/testcases/kernel/syscalls/sched_getparam/.gitignore
index d1a7402e7..b7f9fd029 100644
--- a/testcases/kernel/syscalls/sched_getparam/.gitignore
+++ b/testcases/kernel/syscalls/sched_getparam/.gitignore
@@ -1,3 +1,2 @@
 /sched_getparam01
-/sched_getparam02
 /sched_getparam03
diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
index 82e97713b..df11fc8f0 100644
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
+++ b/testcases/kernel/syscalls/sched_getparam/sched_getparam01.c
@@ -1,137 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
+ * * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_getparam01
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Basic test for sched_getparam(2)
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This is a Phase I test for the sched_getparam(2) system call.
- *	It is intended to provide a limited exposure of the system call.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
+
+/*\
+ * [DESCRIPTION]
  *
- * USAGE:  <for command-line>
- *  sched_getparam01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
+ * Verify that:
  *
- ****************************************************************/
+ * - sched_getparam(2) gets correct scheduling parameters for
+ * the specified process:
+ * - If pid is zero, sched_getparam(2) gets the scheduling parameters
+ * for the calling process.
+ * - If pid is not zero, sched_getparam(2) gets the scheduling
+ * parameters for the specified [pid] process.
+\*/
 
 #include <errno.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <unistd.h>
 #include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_getparam01";
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
-static struct sched_param param;
+static pid_t pids[2] = {0, 0};
 
-int main(int ac, char **av)
+static void verify_sched_getparam(unsigned int n)
 {
+	pid_t child_pid;
+	struct sched_param param = {
+		.sched_priority = 100,
+	};
 
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		param.sched_priority = 100;
+	child_pid = SAFE_FORK();
+	if (!child_pid) {
+		TST_EXP_PASS(sched_getparam(pids[n], &param), "sched_getparam(%d)", pids[n]);
+		if (!TST_PASS)
+			exit(1);
 
 		/*
-		 * Call sched_getparam(2) with pid=0 sothat it will
-		 * get the scheduling parameters for the calling process
-		 */
-		TEST(sched_getparam(0, &param));
-
-		/*
-		 * Check return code & priority. For normal process,
-		 * scheduling policy is SCHED_OTHER. For this scheduling
-		 * policy, only allowed priority value is 0. So we should
-		 * get 0 for priority value
-		 */
-		if ((TEST_RETURN == 0) && (param.sched_priority == 0)) {
-			tst_resm(TPASS, "sched_getparam() returned %ld",
-				 TEST_RETURN);
-		} else {
-			tst_resm(TFAIL, "Test Failed, sched_getparam()"
-				 "returned %ld, errno = %d : %s; returned "
-				 "process priority value is %d", TEST_RETURN,
-				 TEST_ERRNO, strerror(TEST_ERRNO),
-				 param.sched_priority);
+	 	* For normal process, scheduling policy is SCHED_OTHER.
+	 	* For this scheduling policy, only allowed priority value is 0.
+	 	*/
+		if (param.sched_priority) {
+			tst_res(TFAIL,
+				"sched_getparam(%d) got wrong sched_priority %d, expected 0",
+				pids[n], param.sched_priority);
+			exit(1);
 		}
-	}
 
-	cleanup();
-	tst_exit();
+		tst_res(TPASS, "sched_getparam(%d) got expected sched_priority 0", pids[n]);
+		exit(0);
+	}
 
+	tst_reap_children();
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
+	pids[1] = getpid();
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.forks_child = 1,
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(pids),
+	.test = verify_sched_getparam,
+};
+
diff --git a/testcases/kernel/syscalls/sched_getparam/sched_getparam02.c b/testcases/kernel/syscalls/sched_getparam/sched_getparam02.c
deleted file mode 100644
index 1bbf686ae..000000000
--- a/testcases/kernel/syscalls/sched_getparam/sched_getparam02.c
+++ /dev/null
@@ -1,172 +0,0 @@
-/*
- * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: sched_getparam02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Get scheduling parametes for parent process
- *
- *    TEST CASE TOTAL	: 1
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verifies functionality of sched_getparam() for a process other than
- *	current process (ie, pid != 0). Here we get the scheduling parameters
- *	for parent process.
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 fork a child
- *
- *	 CHILD:
- * 	  Gets the scheduling parameters for parent process
- *	  If successfull,
- *		TEST passed
- *	  else
- *		TEST failed.
- *
- *	 PARENT:
- *	  wait for child to finish
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  sched_getparam02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
- *			where,  -c n : Run n copies concurrently.
- *				-e   : Turn on errno logging.
- *				-h   : Show help screen
- *				-f   : Turn off functional testing
- *				-i n : Execute test n times.
- *				-I x : Execute test for x seconds.
- *				-p   : Pause for SIGUSR1 before starting
- *				-P x : Pause for x seconds between iterations.
- *				-t   : Turn on syscall timing.
- *
- ****************************************************************/
-
-#include <errno.h>
-#include <sched.h>
-#include <sys/wait.h>
-#include <stdlib.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_getparam02";
-int TST_TOTAL = 1;
-
-static struct sched_param param;
-
-int main(int ac, char **av)
-{
-
-	int lc;
-	int status;
-	pid_t child_pid;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		switch (child_pid = FORK_OR_VFORK()) {
-
-		case -1:
-			/* fork() failed */
-			tst_resm(TFAIL, "fork() failed");
-			continue;
-
-		case 0:
-			/* Child */
-			param.sched_priority = 100;
-
-			/*
-			 * Call sched_getparam(2) with pid = getppid() sothat
-			 * it will get the scheduling parameters for parent
-			 * process
-			 */
-			TEST(sched_getparam(getppid(), &param));
-
-			/*
-			 * Check return code & priority. For normal process,
-			 * scheduling policy is SCHED_OTHER. For this
-			 * scheduling policy, only allowed priority value is 0.
-			 * So we should get 0 for priority value
-			 */
-			if (TEST_RETURN == 0 && param.sched_priority == 0)
-				exit(0);
-			else {
-				tst_resm(TWARN, "sched_getparam()"
-					 "returned %ld, errno = %d : %s;"
-					 " returned process priority value"
-					 " is %d", TEST_RETURN, TEST_ERRNO,
-					 strerror(TEST_ERRNO),
-					 param.sched_priority);
-				exit(1);
-			}
-
-		default:
-			/* Parent */
-			if ((waitpid(child_pid, &status, 0)) < 0) {
-				tst_resm(TFAIL, "wait() failed");
-				continue;
-			}
-			if ((WIFEXITED(status)) && (WEXITSTATUS(status) == 0))
-				tst_resm(TPASS, "Test Passed");
-			else
-				tst_resm(TFAIL, "Test Failed");
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
