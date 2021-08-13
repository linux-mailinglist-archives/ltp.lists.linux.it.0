Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4783EB15F
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:26:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F6643C6573
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:26:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BDC83C57F3
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:26:41 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7FA31200965
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:26:37 +0200 (CEST)
X-QQ-mid: bizesmtp37t1628839591tdj5iukx
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:26:27 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: IS6yEL/sKA9ZPi5uX/OOBbIWaQmSrt79fMGJU0pWSbnbJ/zKhTmhYaw9J8Uo0
 H8nFEsOQbAnlpldy48b5hueRtNhKxdqj80IhDk8JP0oH/Z3kCiKkF3yRjUxPhWKdgPm2fnn
 LRsIGZrVY7hP1OC+yzv+NfQ6RyftNYNwjGRLMXUrAk660m3ZLDs6ZpwEt+WVgMK3wzoRuNw
 7TO/pxLyNkA7sp71jFs3x6n5JmxKMODROMmzHtG7nrNVQhewT1H07Gu4GtAL/J1TMQ+SRow
 QpuutYRyuAm/MrbexsjNXtiOuAMMnh7yDZX11iwmzVpuzfNMguYKWZ0COydPjN4YlwmgHY+
 Rv5VtbWdMOSv5MnS6RRxpkp1XczLg==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:26:25 +0800
Message-Id: <20210813072625.21404-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] syscalls/clone02: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/clone/clone02.c b/testcases/kernel/syscalls/clone/clone02.c
index 42eea135a..645ca898a 100644
--- a/testcases/kernel/syscalls/clone/clone02.c
+++ b/testcases/kernel/syscalls/clone/clone02.c
@@ -1,70 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  * Copyright (c) 2012 Wanlong Gao <gaowanlong@cn.fujitsu.com>
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
  */
-/*
- *	 TEST1
- *	 -----
- *		Call clone() with all resources shared.
- *
- *		CHILD:
- *			modify the shared resources
- *			return 1 on success
- *		PARENT:
- *			wait for child to finish
- *			verify that the shared resourses are modified
- *			return 1 on success
- *		If parent & child returns successfully
- *			test passed
- *		else
- *			test failed
+
+/*\
+ * [Description]
+ *   TEST1
+ * - call clone() with all resources shared.
+ * - child modify the shared resources.
+ * - parent wait for child to finish.
+ * - verify that the shared resourses are modified.
+ * - if the parent shared resource is modified, then pass.
  *
  *	 TEST2
- *	 -----
- *		Call clone() with no resources shared.
- *
- *		CHILD:
- *			modify the resources in child's address space
- *			return 1 on success
- *		PARENT:
- *			wait for child to finish
- *			verify that the parent's resourses are not modified
- *			return 1 on success
- *		If parent & child returns successfully
- *			test passed
- *		else
- *			test failed
+ * - call clone() with no resources shared.
+ * - modify the resources in child's address space.
+ * - parent wait for child to finish.
+ * - verify that the parent's resourses are not modified.
+ * - if the parent shared resource are modified, then pass.
  */

-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
-
 #define _GNU_SOURCE

-#include <errno.h>
-#include <fcntl.h>
-#include <sys/wait.h>
-#include <sys/types.h>
-#include <sys/syscall.h>
 #include <sched.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "clone_platform.h"

+#define TESTFILE "testfile"
+#define TESTDIR "testdir"
 #define FLAG_ALL (CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|SIGCHLD)
 #define FLAG_NONE SIGCHLD
 #define PARENT_VALUE 1
@@ -72,239 +39,28 @@
 #define TRUE 1
 #define FALSE 0

-#include "clone_platform.h"
-
-static void setup(void);
-static int test_setup(void);
-static void cleanup(void);
-static void test_cleanup(void);
-static int child_fn();
-static int parent_test1(void);
-static int parent_test2(void);
-static int test_VM(void);
-static int test_FS(void);
-static int test_FILES(void);
-static int test_SIG(void);
-static int modified_VM(void);
-static int modified_FS(void);
-static int modified_FILES(void);
-static int modified_SIG(void);
-static void sig_child_defined_handler(int);
-static void sig_default_handler();
-
 static int fd_parent;
-static char file_name[25];
 static int parent_variable;
-static char cwd_parent[FILENAME_MAX];
+static char *cwd_parent;
 static int parent_got_signal, child_pid;
+static void *child_stack;
+static char cwd_child[FILENAME_MAX];

-char *TCID = "clone02";
-
-struct test_case_t {
-	int flags;
-	int (*parent_fn) ();
-} test_cases[] = {
-	{
-	FLAG_ALL, parent_test1}, {
-	FLAG_NONE, parent_test2}
-};
-
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+static void sig_child_defined_handler(int pid LTP_ATTRIBUTE_UNUSED)
 {
-
-	int lc;
-	void *child_stack;
-	int status, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	child_stack = malloc(CHILD_STACK_SIZE);
-	if (child_stack == NULL)
-		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			if (test_setup() != 0) {
-				tst_resm(TWARN, "test_setup() failed, skipping this test case");
-				continue;
-			}
-
-			/* Test the system call */
-			TEST(ltp_clone(test_cases[i].flags, child_fn, NULL,
-				       CHILD_STACK_SIZE, child_stack));
-
-			/* check return code */
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO, "clone() failed");
-				/* Cleanup & continue with next test case */
-				test_cleanup();
-				continue;
-			}
-
-			/* Wait for child to finish */
-			if ((wait(&status)) == -1) {
-				tst_resm(TWARN | TERRNO,
-					 "wait failed; skipping testcase");
-				/* Cleanup & continue with next test case */
-				test_cleanup();
-				continue;
-			}
-
-			if (WTERMSIG(status))
-				tst_resm(TWARN, "child exitied with signal %d",
-					 WTERMSIG(status));
-
-			/*
-			 * Check the return value from child function and
-			 * parent function. If both functions returned
-			 * successfully, test passed, else failed
-			 */
-			if (WIFEXITED(status) && WEXITSTATUS(status) == 0 &&
-			    test_cases[i].parent_fn())
-				tst_resm(TPASS, "Test Passed");
-			else
-				tst_resm(TFAIL, "Test Failed");
-
-			/* Do test specific cleanup */
-			test_cleanup();
-		}
-	}
-
-	free(child_stack);
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
-	tst_tmpdir();
-
-	/* Get unique file name for each child process */
-	if ((sprintf(file_name, "parent_file_%ld", syscall(__NR_gettid))) <= 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "sprintf() failed");
-}
-
-static void cleanup(void)
-{
-	if (unlink(file_name) == -1)
-		tst_resm(TWARN | TERRNO, "unlink(%s) failed", file_name);
-	tst_rmdir();
-}
-
-static int test_setup(void)
-{
-
-	struct sigaction def_act;
-
-	/* Save current working directory of parent */
-	if (getcwd(cwd_parent, sizeof(cwd_parent)) == NULL) {
-		tst_resm(TWARN | TERRNO, "getcwd() failed in test_setup()");
-		return -1;
-	}
-
-	/*
-	 * Set value for parent_variable in parent, which will be
-	 * changed by child in test_VM(), for testing CLONE_VM flag
-	 */
-	parent_variable = PARENT_VALUE;
-
-	/*
-	 * Open file from parent, which will be closed by
-	 * child in test_FILES(), used for testing CLONE_FILES flag
-	 */
-	fd_parent = open(file_name, O_CREAT | O_RDWR, 0777);
-	if (fd_parent == -1) {
-		tst_resm(TWARN | TERRNO, "open() failed in test_setup()");
-		return -1;
-	}
-
-	/*
-	 * set parent_got_signal to FALSE, used for testing
-	 * CLONE_SIGHAND flag
-	 */
-	parent_got_signal = FALSE;
-
-	/* Setup signal handler for SIGUSR2 */
-	def_act.sa_handler = sig_default_handler;
-	def_act.sa_flags = SA_RESTART;
-	sigemptyset(&def_act.sa_mask);
-
-	if (sigaction(SIGUSR2, &def_act, NULL) == -1) {
-		tst_resm(TWARN | TERRNO, "sigaction() failed in test_setup()");
-		return -1;
-	}
-
-	return 0;
-}
-
-static void test_cleanup(void)
-{
-
-	/* Restore parent's working directory */
-	SAFE_CHDIR(cleanup, cwd_parent);
-
-}
-
-static int child_fn(void)
-{
-
-	/* save child pid */
-	child_pid = syscall(__NR_gettid);
-
-	if (test_VM() == 0 && test_FILES() == 0 && test_FS() == 0 &&
-	    test_SIG() == 0)
-		_exit(0);
-	_exit(1);
-}
-
-static int parent_test1(void)
-{
-
-	/*
-	 * For first test case (with all flags set), all resources are
-	 * shared between parent and child. So whatever changes made by
-	 * child should get reflected in parent also. modified_*()
-	 * functions check this. All of them should return 1 for
-	 * parent_test1() to return 1
-	 */
-
-	if (modified_VM() && modified_FILES() && modified_FS() &&
-	    modified_SIG())
-		return 0;
-	return -1;
-}
-
-static int parent_test2(void)
-{
-
-	/*
-	 * For second test case (with no resouce shared), all of the
-	 * modified_*() functions should return 0 for parent_test2()
-	 * to return 1
-	 */
-	if (modified_VM() || modified_FILES() || modified_FS() ||
-	    modified_SIG())
-		return 0;
-
-	return -1;
+	TEST(tst_syscall(__NR_gettid));
+	if (TST_RET == child_pid)
+		tst_res(TWARN, "Child got SIGUSR2 signal");
+	else
+		parent_got_signal = TRUE;
 }

 /*
- * test_VM() - function to change parent_variable from child's
- *	       address space. If CLONE_VM flag is set, child shares
- *	       the memory space with parent so this will be visible
- *	       to parent also.
+ * function to change parent_variable from child's
+ * address space. If CLONE_VM flag is set, child shares
+ * the memory space with parent so this will be visible
+ * to parent also.
  */
-
 static int test_VM(void)
 {
 	parent_variable = CHILD_VALUE;
@@ -312,157 +68,207 @@ static int test_VM(void)
 }

 /*
- * test_FILES() - This function closes a file descriptor opened by
- *		  parent. If CLONE_FILES flag is set, the parent and
- *		  the child process share the same file descriptor
- *		  table. so this affects the parent also
+ * This function closes a file descriptor opened by
+ * parent. If CLONE_FILES flag is set, the parent and
+ * the child process share the same file descriptor
+ * table. so this affects the parent also
  */
 static int test_FILES(void)
 {
-	if (close(fd_parent) == -1) {
-		tst_resm(TWARN | TERRNO, "close failed in test_FILES");
-		return -1;
-	}
-	return 0;
+	return close(fd_parent);;
 }

 /*
- * test_FS() -  This function changes the current working directory
- *		of the child process. If CLONE_FS flag is set, this
- *		will be visible to parent also.
+ * This function changes the current working directory
+ * of the child process. If CLONE_FS flag is set, this
+ * will be visible to parent also.
  */
 static int test_FS(void)
 {
-	char *test_tmpdir;
 	int rval;

-	test_tmpdir = tst_get_tmpdir();
-	if (test_tmpdir == NULL) {
-		tst_resm(TWARN | TERRNO, "tst_get_tmpdir failed");
-		rval = -1;
-	} else if (chdir(test_tmpdir) == -1) {
-		tst_resm(TWARN | TERRNO, "chdir failed in test_FS");
-		rval = -1;
-	} else {
-		rval = 0;
-	}
-
-	free(test_tmpdir);
+	rval = SAFE_CHDIR(cwd_child);
 	return rval;
 }

 /*
- * test_SIG() - This function changes the signal handler for SIGUSR2
- *		signal for child. If CLONE_SIGHAND flag is set, this
- *		affects parent also.
+ * This function changes the signal handler for SIGUSR2
+ * signal for child. If CLONE_SIGHAND flag is set, this
+ * affects parent also.
  */
 static int test_SIG(void)
 {
-
 	struct sigaction new_act;

 	new_act.sa_handler = sig_child_defined_handler;
 	new_act.sa_flags = SA_RESTART;
-	sigemptyset(&new_act.sa_mask);
+	SAFE_SIGEMPTYSET(&new_act.sa_mask);

-	/* Set signal handler to sig_child_defined_handler */
-	if (sigaction(SIGUSR2, &new_act, NULL) == -1) {
-		tst_resm(TWARN | TERRNO, "signal failed in test_SIG");
+	if (SAFE_SIGACTION(SIGUSR2, &new_act, NULL)) {
 		return -1;
 	}

-	/* Send SIGUSR2 signal to parent */
-	if (kill(getppid(), SIGUSR2) == -1) {
-		tst_resm(TWARN | TERRNO, "kill failed in test_SIG");
-		return -1;
-	}
-
-	return 0;
+	return SAFE_KILL(getppid(), SIGUSR2);
 }

 /*
- * modified_VM() - This function is called by parent process to check
- *		   whether child's modification to parent_variable
- *		   is visible to parent
+ * This function is called by parent process to check
+ * whether child's modification to parent_variable
+ * is visible to parent
  */
-
 static int modified_VM(void)
 {
-
-	if (parent_variable == CHILD_VALUE)
-		/* child has modified parent_variable */
-		return 1;
-
-	return 0;
+	return parent_variable == CHILD_VALUE;
 }

 /*
- * modified_FILES() - This function checks for file descriptor table
- *		      modifications done by child
+ * This function checks for file descriptor table
+ * modifications done by child
  */
 static int modified_FILES(void)
 {
 	char buff[20];
-
 	if (((read(fd_parent, buff, sizeof(buff))) == -1) && (errno == EBADF))
-		/* Child has closed this file descriptor */
 		return 1;
-
-	/* close fd_parent */
-	if ((close(fd_parent)) == -1)
-		tst_resm(TWARN | TERRNO, "close() failed in modified_FILES()");
-
+
+	SAFE_CLOSE(fd_parent);
 	return 0;
 }

 /*
- * modified_FS() - This function checks parent's current working directory
- *		   to see whether its modified by child or not.
+ * This function checks parent's current working directory
+ * to see whether its modified by child or not.
  */
 static int modified_FS(void)
 {
 	char cwd[FILENAME_MAX];
-
-	if ((getcwd(cwd, sizeof(cwd))) == NULL)
-		tst_resm(TWARN | TERRNO, "getcwd() failed");
-
-	if (!(strcmp(cwd, cwd_parent)))
-		/* cwd hasn't changed */
-		return 0;
-
-	return 1;
+
+	SAFE_GETCWD(cwd, sizeof(cwd));
+	return strcmp(cwd, cwd_parent);
 }

 /*
- * modified_SIG() - This function checks whether child has changed
- *		    parent's signal handler for signal, SIGUSR2
+ * This function checks whether child has changed
+ * parent's signal handler for signal, SIGUSR2
  */
 static int modified_SIG(void)
 {
+	return parent_got_signal;
+}

-	if (parent_got_signal)
-		/*
-		 * parent came through sig_child_defined_handler()
-		 * this means child has changed parent's handler
-		 */
-		return 1;
+static void sig_parent_default_handler(int pid LTP_ATTRIBUTE_UNUSED)
+{
+
+}
+
+static int child_fn(void *arg LTP_ATTRIBUTE_UNUSED)
+{
+	TEST(tst_syscall(__NR_gettid));
+	child_pid = TST_RET;
+
+	if (test_VM() == 0 && test_FILES() == 0 && test_FS() == 0 &&
+	    test_SIG() == 0)
+		_exit(0);
+	_exit(1);
+}
+
+static int parent_test1(void)
+{
+
+	/*
+	 * Verify that the parent process resource has changed
+	 */
+	if (modified_VM() && modified_FILES() && modified_FS() &&
+	    modified_SIG())
+		return 0;
+	return -1;
+}
+
+static int parent_test2(void)
+{
+	/*
+	 * Verify that the parent process resource has not changed
+	 */
+	if (modified_VM() || modified_FILES() || modified_FS() ||
+	    modified_SIG())
+		return -1;

 	return 0;
 }

-/*
- * sig_child_defined_handler()  - Signal handler installed by child
- */
-static void sig_child_defined_handler(int pid)
+struct tcase {
+	unsigned long flags;
+	int (*parent_fn) ();
+	char *desc;
+} tcases[] = {
+	{FLAG_ALL, parent_test1, "clone() with all resources shared"},
+	{FLAG_NONE, parent_test2, "clone() with all no resources shared"}
+};
+
+static void verify_clone(void)
 {
-	if ((syscall(__NR_gettid)) == child_pid)
-		/* Child got signal, give warning */
-		tst_resm(TWARN, "Child got SIGUSR2 signal");
-	else
-		parent_got_signal = TRUE;
+	TST_EXP_POSITIVE(ltp_clone(tcases[tst_variant].flags, child_fn, NULL,
+				CHILD_STACK_SIZE, child_stack),
+				"%s", tcases[tst_variant].desc);
+
+	if (!TST_PASS)
+		return;
+
+	tst_reap_children();
+
+	TST_EXP_PASS(tcases[tst_variant].parent_fn(), "%s", tcases[tst_variant].desc);
+}
+
+
+static void cleanup(void)
+{
+	SAFE_CHDIR(cwd_parent);
+	SAFE_UNLINK(TESTFILE);
+	SAFE_RMDIR(cwd_child);
+
+	free(cwd_parent);
+	free(child_stack);
 }

-/* sig_default_handler() - Default handler for parent */
-static void sig_default_handler(void)
+static void setup(void)
 {
+	struct sigaction def_act;
+
+	/* Save current working directory of parent */
+	cwd_parent = tst_get_tmpdir();
+
+	/*
+	 * Set value for parent_variable in parent, which will be
+	 * changed by child in test_VM(), for testing CLONE_VM flag
+	 */
+	parent_variable = PARENT_VALUE;
+
+	/*
+	 * Open file from parent, which will be closed by
+	 * child in test_FILES(), used for testing CLONE_FILES flag
+	 */
+	fd_parent = SAFE_OPEN(TESTFILE, O_CREAT | O_RDWR, 0777);
+
+	/*
+	 * set parent_got_signal to FALSE, used for testing
+	 * CLONE_SIGHAND flag
+	 */
+	parent_got_signal = FALSE;
+
+	def_act.sa_handler = sig_parent_default_handler;
+	def_act.sa_flags = SA_RESTART;
+	SAFE_SIGEMPTYSET(&def_act.sa_mask);
+	SAFE_SIGACTION(SIGUSR2, &def_act, NULL);
+
+	SAFE_MKDIR(TESTDIR, 0777);
+	sprintf(cwd_child, "%s/%s", cwd_parent, TESTDIR);
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_variants = ARRAY_SIZE(tcases),
+	.test_all = verify_clone,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
