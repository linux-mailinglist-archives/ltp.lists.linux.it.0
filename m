Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8924D1B0
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:47:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F33853C2F78
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:47:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 117103C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:47:23 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9137D1400528
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:47:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98386501"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:47:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3103048990C1
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 17:47:16 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:47:17 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 21 Aug 2020 05:47:09 -0400
Message-ID: <1598003231-25276-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3103048990C1.A64AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [v2 1/3] syscalls/kill03,
 04: Cleanup && Convert to new library
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

1) Remove uclinux code
2) Take use of safe macro
3) Merge kill04 into kill03
4) Add error test that pid is INT_MIN

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 runtest/syscalls                          |   1 -
 testcases/kernel/syscalls/kill/.gitignore |   1 -
 testcases/kernel/syscalls/kill/kill03.c   | 187 +++++++-----------------------
 testcases/kernel/syscalls/kill/kill04.c   | 133 ---------------------
 4 files changed, 41 insertions(+), 281 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/kill/kill04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 5e2bdb1..a6ab75b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -616,7 +616,6 @@ kcmp03 kcmp03
 
 kill02 kill02
 kill03 kill03
-kill04 kill04
 kill05 kill05
 kill06 kill06
 kill07 kill07
diff --git a/testcases/kernel/syscalls/kill/.gitignore b/testcases/kernel/syscalls/kill/.gitignore
index b62662f..75fdaa5 100644
--- a/testcases/kernel/syscalls/kill/.gitignore
+++ b/testcases/kernel/syscalls/kill/.gitignore
@@ -1,6 +1,5 @@
 /kill02
 /kill03
-/kill04
 /kill05
 /kill06
 /kill07
diff --git a/testcases/kernel/syscalls/kill/kill03.c b/testcases/kernel/syscalls/kill/kill03.c
index 5770ae0..04c9e6c 100644
--- a/testcases/kernel/syscalls/kill/kill03.c
+++ b/testcases/kernel/syscalls/kill/kill03.c
@@ -1,165 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2001
  *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * NAME
- *	kill03.c
- *
- * DESCRIPTION
- *	Test case to check that kill fails when given an invalid signal.
- *
- * ALGORITHM
- *	call setup
- *	loop if the -i option was given
- *	fork a child
- *	execute the kill system call with an invalid signal
- *	check the return value
- *	if return value is not -1
- *		issue a FAIL message, break remaining tests and cleanup
- *	if we are doing functional testing
- *		if the errno was set to 22 (invalid argument).
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	call cleanup
- *
- * USAGE
- *  kill03 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * 1) kill() fails with errno set to EINVAL if given an invalid signal.
+ * 2) kill() fails with errno set to ESRCH if given a non-existent pid.
+ * 3) kill() fails with errno set to ESRCH if the given pid is INT_MIN.
  *
  * HISTORY
  *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	none
  */
 
-#include "test.h"
-
+#include <sys/types.h>
 #include <signal.h>
-#include <errno.h>
-#include <sys/wait.h>
-
-void cleanup(void);
-void setup(void);
-void do_child(void);
-
-char *TCID = "kill03";
-int TST_TOTAL = 1;
-
-#define TEST_SIG 2000
-
-int main(int ac, char **av)
+#include <unistd.h>
+#include "tst_test.h"
+
+static pid_t real_pid, fake_pid, int_min_pid;
+
+static struct tcase {
+	int test_sig;
+	int exp_errno;
+	pid_t *pid;
+} tcases[] = {
+	{2000, EINVAL, &real_pid},
+	{SIGKILL, ESRCH, &fake_pid},
+	{SIGKILL, ESRCH, &int_min_pid}
+};
+
+static void verify_kill(unsigned int n)
 {
-	int lc;
-	pid_t pid;
-	int exno, status;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-#ifdef UCLINUX
-	maybe_run_child(&do_child, "");
-#endif
+	struct tcase *tc = &tcases[n];
 
-	setup();
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-		status = 1;
-		exno = 1;
-		pid = FORK_OR_VFORK();
-		if (pid < 0) {
-			tst_brkm(TBROK, cleanup, "Fork of child failed");
-		} else if (pid == 0) {
-#ifdef UCLINUX
-			if (self_exec(av[0], "") < 0) {
-				tst_brkm(TBROK, cleanup,
-					 "self_exec of child failed");
-			}
-#else
-			do_child();
-#endif
-		} else {
-			TEST(kill(pid, TEST_SIG));
-			kill(pid, SIGKILL);
-			waitpid(pid, &status, 0);
-		}
-
-		if (TEST_RETURN != -1) {
-			tst_brkm(TFAIL, cleanup, "%s failed - errno = %d : %s "
-				 "Expected a return value of -1 got %ld",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO),
-				 TEST_RETURN);
-		}
-
-		/*
-		 * Check to see if the errno was set to the expected
-		 * value of 22 : EINVAL.
-		 */
-		if (TEST_ERRNO == EINVAL) {
-			tst_resm(TPASS, "errno set to %d : %s, as "
-				 "expected", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TFAIL, "errno set to %d : %s expected "
-				 "%d : %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO), 22,
-				 strerror(22));
-		}
+	TEST(kill(*tc->pid, tc->test_sig));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "kill should fail but not, return %ld", TST_RET);
+		return;
 	}
 
-	cleanup();
-	tst_exit();
-}
-
-/*
- * do_child()
- */
-void do_child(void)
-{
-	int exno = 1;
+	if (tc->exp_errno == TST_ERR)
+		tst_res(TPASS | TTERRNO, "kill failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "kill expected %s but got",
+			tst_strerrno(tc->exp_errno));
 
-	pause();
-	exit(exno);
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
+static void setup(void)
 {
+	real_pid = getpid();
+	fake_pid = tst_get_unused_pid();
+	int_min_pid = INT_MIN;
 
-	TEST_PAUSE;
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * or premature exit.
- */
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.test = verify_kill,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/kill/kill04.c b/testcases/kernel/syscalls/kill/kill04.c
deleted file mode 100644
index f3bec13..0000000
--- a/testcases/kernel/syscalls/kill/kill04.c
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * NAME
- *	kill04.c
- *
- * DESCRIPTION
- *	Test case to check that kill() fails when passed a non-existant pid.
- *
- * ALGORITHM
- *	call setup
- *	loop if the -i option was given
- *	fork a child
- *	execute the kill system call with a non-existant PID
- *	check the return value
- *	if return value is not -1
- *		issue a FAIL message, break remaining tests and cleanup
- *	if we are doing functional testing
- *		if the errno was set to 3 (No such proccess)
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	call cleanup
- *
- * USAGE
- *  kill04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	This test should be run by a non-root user
- */
-
-#include "test.h"
-
-#include <signal.h>
-#include <errno.h>
-#include <sys/wait.h>
-
-void cleanup(void);
-void setup(void);
-void do_child(void);
-
-char *TCID = "kill04";
-int TST_TOTAL = 1;
-
-#define TEST_SIG SIGKILL
-
-int main(int ac, char **av)
-{
-	int lc;
-	pid_t fake_pid;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		fake_pid = tst_get_unused_pid(cleanup);
-		TEST(kill(fake_pid, TEST_SIG));
-
-		if (TEST_RETURN != -1) {
-			tst_brkm(TFAIL, cleanup, "%s failed - errno = %d : %s "
-				 "Expected a return value of -1 got %ld",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO),
-				 TEST_RETURN);
-		}
-
-		/*
-		 * Check to see if the errno was set to the expected
-		 * value of 3 : ESRCH
-		 */
-		if (TEST_ERRNO == ESRCH) {
-			tst_resm(TPASS, "errno set to %d : %s, as "
-				 "expected", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		} else {
-			tst_resm(TFAIL, "errno set to %d : %s expected "
-				 "%d : %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO), 3, strerror(3));
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
-{
-
-	TEST_PAUSE;
-}
-
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * or premature exit.
- */
-void cleanup(void)
-{
-
-}
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
