Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460F134470
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 15:00:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D7BD3C2439
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 15:00:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AB4B43C2393
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 15:00:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B6C631401A93
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 15:00:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0413EAD6C
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 14:00:21 +0000 (UTC)
From: Jorik Cronenberg <jcronenberg@suse.de>
To: ltp@lists.linux.it
Date: Wed,  8 Jan 2020 14:59:49 +0100
Message-Id: <20200108135949.15048-1-jcronenberg@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ptrace: Merge ptrace01 and ptrace02
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

Combine ptrace01 and ptrace02 into one.

Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
---
 testcases/kernel/syscalls/ptrace/ptrace01.c |  54 ++--
 testcases/kernel/syscalls/ptrace/ptrace02.c | 288 --------------------
 2 files changed, 38 insertions(+), 304 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ptrace/ptrace02.c

diff --git a/testcases/kernel/syscalls/ptrace/ptrace01.c b/testcases/kernel/syscalls/ptrace/ptrace01.c
index 274e5389b..4b00ee009 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace01.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace01.c
@@ -1,20 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- * Copyright (c) 2019 Jorik Cronenberg <jcronenberg@suse.de>
+ * Copyright (c) 2019 SUSE LLC
  *
  * Author: Saji Kumar.V.R <saji.kumar@wipro.com>
  * Ported to new library: Jorik Cronenberg <jcronenberg@suse.de>
  *
- * Test the functionality of ptrace() for PTRACE_TRACEME & PTRACE_KILL requests.
+ * Test the functionality of ptrace() for PTRACE_TRACEME in combination with
+ * PTRACE_KILL and PTRACE_CONT requests.
  * Forked child does ptrace(PTRACE_TRACEME, ...).
  * Then a signal is delivered to the child and verified that parent
  * is notified via wait().
- * After parent does ptrace(PTRACE_KILL, ..) to kill the child
- * and parent wait() for child to finish.
- * Test passes if child finished abnormally.
+ * Afterwards parent does ptrace(PTRACE_KILL, ..)/ptrace(PTRACE_CONT, ..)
+ * and then parent does wait() for child to finish.
+ * Test passes if child exits with SIGKILL for PTRACE_KILL.
+ * Test passes if child exits normally for PTRACE_CONT.
  *
- * Testing two cases:
+ * Testing two cases for each:
  * 1) child ignore SIGUSR2 signal
  * 2) using a signal handler for child for SIGUSR2
  * In both cases, child should stop & notify parent on reception of SIGUSR2.
@@ -28,6 +30,19 @@
 #include "ptrace.h"
 #include "tst_test.h"
 
+static struct tcase {
+	int handler;
+	int request;
+	int exp_wifexited;
+	int exp_wtermsig;
+	char *message;
+} tcases[] = {
+	{0, PTRACE_KILL, 0, 9, "Testing PTRACE_KILL without child handler"},
+	{1, PTRACE_KILL, 0, 9, "Testing PTRACE_KILL with child handler"},
+	{0, PTRACE_CONT, 1, 0, "Testing PTRACE_CONT without child handler"},
+	{1, PTRACE_CONT, 1, 0, "Testing PTRACE_CONT with child handler"},
+};
+
 static volatile int got_signal;
 
 static void child_handler(int sig LTP_ATTRIBUTE_UNUSED)
@@ -64,13 +79,16 @@ static void do_child(unsigned int i)
 
 static void run(unsigned int i)
 {
+	struct tcase *tc = &tcases[i];
 	pid_t child_pid;
 	int status;
 	struct sigaction parent_act;
 
 	got_signal = 0;
 
-	if (i == 1) {
+	tst_res(TINFO, tc->message);
+
+	if (tc->handler == 1) {
 		parent_act.sa_handler = parent_handler;
 		parent_act.sa_flags = SA_RESTART;
 		sigemptyset(&parent_act.sa_mask);
@@ -80,28 +98,32 @@ static void run(unsigned int i)
 	child_pid = SAFE_FORK();
 
 	if (!child_pid)
-		do_child(i);
+		do_child(tc->handler);
 
 	SAFE_WAITPID(child_pid, &status, 0);
 
 	if (((WIFEXITED(status)) && (WEXITSTATUS(status)))
 		 || (got_signal == 1))
 		tst_res(TFAIL, "Test Failed");
-	else if ((ptrace(PTRACE_KILL, child_pid, 0, 0)) == -1)
-		tst_res(TFAIL | TERRNO, "ptrace(PTRACE_KILL, %i, 0, 0) failed",
-				child_pid);
+	else if ((ptrace(tc->request, child_pid, 0, 0)) == -1)
+		tst_res(TFAIL | TERRNO, "ptrace(%i, %i, 0, 0) failed",
+			tc->request, child_pid);
 
 	SAFE_WAITPID(child_pid, &status, 0);
 
-	if (WTERMSIG(status) == 9)
-		tst_res(TPASS, "Child %s as expected", tst_strstatus(status));
-	else
-		tst_res(TFAIL, "Child %s unexpectedly", tst_strstatus(status));
+	if (WIFEXITED(status) == tc->exp_wifexited
+		&& WTERMSIG(status) == tc->exp_wtermsig) {
+		tst_res(TPASS, "Child %s as expected",
+		    tst_strstatus(status));
+	} else {
+		tst_res(TFAIL, "Child %s unexpectedly",
+		    tst_strstatus(status));
+	}
 
 }
 
 static struct tst_test test = {
 	.test = run,
-	.tcnt = 2,
+	.tcnt = ARRAY_SIZE(tcases),
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/ptrace/ptrace02.c b/testcases/kernel/syscalls/ptrace/ptrace02.c
deleted file mode 100644
index 057591f62..000000000
--- a/testcases/kernel/syscalls/ptrace/ptrace02.c
+++ /dev/null
@@ -1,288 +0,0 @@
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
- *    TEST IDENTIFIER	: ptrace02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: functionality test for ptrace(2)
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This test case tests the functionality of ptrace() for
- *	PTRACE_TRACEME & PTRACE_CONT requests.
- *	Here, we fork a child & the child does ptrace(PTRACE_TRACEME, ...).
- *	Then a signal is delivered to the child & verified that parent
- *	is notified via wait(). then parent does ptrace(PTRACE_CONT, ..)
- *	to make the child to continue. Again parent wait() for child to finish.
- *	If child finished normally, test passes.
- *		We test two cases
- *			1) By telling child to ignore SIGUSR2 signal
- *			2) By installing a signal handler for child for SIGUSR2
- *		In both cases, child should stop & notify parent on reception
- *		of SIGUSR2
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 setup signal handler for SIGUSR2 signal
- *	 fork a child
- *
- *	 CHILD:
- *		setup signal handler for SIGUSR2 signal
- *		call ptrace() with PTRACE_TRACEME request
- *		send SIGUSR2 signal to self
- *	 PARENT:
- *		wait() for child.
- *		if parent is notified when child gets a signal through wait(),
- *		then
- *			do  ptrace(PTRACE_CONT, ..) on child
- * 			wait() for child to finish,
- * 			if child exited normaly,
- *				TEST passed
- * 			else
- * 				TEST failed
- *		else
- *			TEST failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- *  ptrace02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
-#include <signal.h>
-#include <sys/wait.h>
-
-#include <config.h>
-#include "ptrace.h"
-
-#include "test.h"
-
-static void do_child(void);
-static void setup(void);
-static void cleanup(void);
-static void child_handler();
-static void parent_handler();
-
-static int got_signal = 0;
-
-char *TCID = "ptrace02";
-static int i;			/* loop test case counter, shared with do_child */
-
-int TST_TOTAL = 2;
-
-int main(int ac, char **av)
-{
-
-	int lc;
-	pid_t child_pid;
-	int status;
-	struct sigaction parent_act;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-#ifdef UCLINUX
-	maybe_run_child(&do_child, "d", &i);
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			got_signal = 0;
-
-			/* Setup signal handler for parent */
-			if (i == 1) {
-				parent_act.sa_handler = parent_handler;
-				parent_act.sa_flags = SA_RESTART;
-				sigemptyset(&parent_act.sa_mask);
-
-				if ((sigaction(SIGUSR2, &parent_act, NULL))
-				    == -1) {
-					tst_resm(TWARN, "sigaction() failed"
-						 " in parent");
-					continue;
-				}
-			}
-
-			switch (child_pid = FORK_OR_VFORK()) {
-
-			case -1:
-				/* fork() failed */
-				tst_resm(TFAIL, "fork() failed");
-				continue;
-
-			case 0:
-				/* Child */
-#ifdef UCLINUX
-				if (self_exec(av[0], "d", i) < 0) {
-					tst_resm(TFAIL, "self_exec failed");
-					continue;
-				}
-#else
-				do_child();
-#endif
-
-			default:
-				/* Parent */
-				if ((waitpid(child_pid, &status, 0)) < 0) {
-					tst_resm(TFAIL, "waitpid() failed");
-					continue;
-				}
-
-				/*
-				 * Check the exit status of child. If (it exits
-				 * normally with exit value 1) OR (child came
-				 * through signal handler), Test Failed
-				 */
-
-				if (((WIFEXITED(status)) &&
-				     (WEXITSTATUS(status))) ||
-				    (got_signal == 1)) {
-					tst_resm(TFAIL, "Test Failed");
-					continue;
-				} else {
-					/* Restart child */
-					if ((ptrace(PTRACE_CONT, child_pid,
-						    0, 0)) == -1) {
-						tst_resm(TFAIL, "Test Failed:"
-							 " Parent was not able to do"
-							 " ptrace(PTRACE_CONT, ..) on"
-							 " child");
-						continue;
-					}
-				}
-
-				if ((waitpid(child_pid, &status, 0)) < 0) {
-					tst_resm(TFAIL, "waitpid() failed");
-					continue;
-				}
-
-				if (WIFEXITED(status)) {
-					/* Child exits normally */
-					tst_resm(TPASS, "Test Passed");
-				} else {
-					tst_resm(TFAIL, "Test Failed");
-				}
-
-			}
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
-
-}
-
-/* do_child() */
-void do_child(void)
-{
-	struct sigaction child_act;
-
-	/* Setup signal handler for child */
-	if (i == 0) {
-		child_act.sa_handler = SIG_IGN;
-	} else {
-		child_act.sa_handler = child_handler;
-	}
-	child_act.sa_flags = SA_RESTART;
-	sigemptyset(&child_act.sa_mask);
-
-	if ((sigaction(SIGUSR2, &child_act, NULL)) == -1) {
-		tst_resm(TWARN, "sigaction() failed in child");
-		exit(1);
-	}
-
-	if ((ptrace(PTRACE_TRACEME, 0, 0, 0)) == -1) {
-		tst_resm(TWARN, "ptrace() failed in child");
-		exit(1);
-	}
-
-	/* ensure that child bypasses signal handler */
-	if ((kill(getpid(), SIGUSR2)) == -1) {
-		tst_resm(TWARN, "kill() failed in child");
-		exit(1);
-	}
-	exit(1);
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
-
-}
-
-/*
- * child_handler() - Signal handler for child
- */
-void child_handler(void)
-{
-
-	if ((kill(getppid(), SIGUSR2)) == -1) {
-		tst_resm(TWARN, "kill() failed in child_handler()");
-		exit(1);
-	}
-}
-
-/*
- * parent_handler() - Signal handler for parent
- */
-void parent_handler(void)
-{
-
-	got_signal = 1;
-}
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
