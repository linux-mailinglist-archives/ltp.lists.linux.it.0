Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA424D1B1
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:47:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F73F3C2F73
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 11:47:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 573C53C2F6E
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:47:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B7AD0140053C
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 11:47:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98386503"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:47:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E796348990D7
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 17:47:18 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:47:20 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 21 Aug 2020 05:47:11 -0400
Message-ID: <1598003231-25276-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598003231-25276-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1598003231-25276-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E796348990D7.A948F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [v2 3/3] syscalls/kill06:Cleanup && Convert to new library
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

1) Take use of some safe macros

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/kill/kill06.c | 200 +++++---------------------------
 1 file changed, 31 insertions(+), 169 deletions(-)

diff --git a/testcases/kernel/syscalls/kill/kill06.c b/testcases/kernel/syscalls/kill/kill06.c
index 7a1e8bf..ed14f35 100644
--- a/testcases/kernel/syscalls/kill/kill06.c
+++ b/testcases/kernel/syscalls/kill/kill06.c
@@ -1,187 +1,49 @@
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
- *	kill06.c
- *
- * DESCRIPTION
- *	Test case to check the basic functionality of kill() when killing an
- *	entire process group with a negative pid.
- *
- * ALGORITHM
- *	call setup
- *	loop if the -i option was given
- *	fork 5 children
- *	execute the kill system call
- *	check the return value
- *	if return value is -1
- *		issue a FAIL message, break remaining tests and cleanup
- *	if we are doing functional testing
- *		if the processes were terminated with the expected signal.
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	call cleanup
- *
- * USAGE
- *  kill06 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * Test case to check the basic functionality of kill() when killing an
+ * entire process group with a negative pid.
  *
  * HISTORY
  *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	This test should be run as a non-root user.
  */
 
-#include "test.h"
-
+#include <sys/types.h>
 #include <signal.h>
-#include <errno.h>
 #include <sys/wait.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include "tst_test.h"
 
-void cleanup(void);
-void setup(void);
-void do_child(void);
-
-char *TCID = "kill06";
-int TST_TOTAL = 1;
-
-#define TEST_SIG SIGKILL
-
-int main(int ac, char **av)
+static void verify_kill(void)
 {
-	int lc;
-	pid_t pid1, pid2;
-	int exno, status, nsig, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-#ifdef UCLINUX
-	maybe_run_child(&do_child, "");
-#endif
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-		status = 1;
-		exno = 1;
-
-		/* Fork a process and set the process group so that */
-		/* it is different from this one.  Fork 5 more children. */
-
-		pid1 = FORK_OR_VFORK();
-		if (pid1 < 0) {
-			tst_brkm(TBROK, cleanup, "Fork of first child failed");
-		} else if (pid1 == 0) {
-			setpgrp();
-			for (i = 0; i < 5; i++) {
-				pid2 = FORK_OR_VFORK();
-				if (pid2 < 0) {
-					tst_brkm(TBROK, cleanup, "Fork failed");
-				} else if (pid2 == 0) {
-#ifdef UCLINUX
-					if (self_exec(av[0], "") < 0) {
-						tst_brkm(TBROK, cleanup,
-							 "self_exec of "
-							 "child failed");
-					}
-#else
-					do_child();
-#endif
-				}
-			}
-			/* Kill all processes in this process group */
-			TEST(kill(-getpgrp(), TEST_SIG));
-			sleep(300);
+	int nsig, i, status;
 
-			tst_resm(TINFO, "%d never received a"
-				 " signal", getpid());
-			exit(exno);
-		} else {
-			waitpid(pid1, &status, 0);
-			if (TEST_RETURN != 0) {
-				tst_brkm(TFAIL, cleanup, "%s failed - errno = "
-					 "%d : %s", TCID, TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			}
+	if (!SAFE_FORK()) {
+		setpgrp();
+		for (i = 0; i < 5; i++) {
+			if (!SAFE_FORK())
+				pause();
 		}
 
-		/*
-		 * Check to see if the process was terminated with the
-		 * expected signal.
-		 */
-		nsig = WTERMSIG(status);
-		if (!nsig) {
-			tst_resm(TFAIL, "Did not receive any signal");
-		} else if (nsig == TEST_SIG) {
-			tst_resm(TPASS, "received expected signal %d",
-				 nsig);
-		} else {
-			tst_resm(TFAIL,
-				 "expected signal %d received %d",
-				 TEST_SIG, nsig);
-		}
+		TEST(kill(-getpgrp(), SIGKILL));
+		if (TST_RET != 0)
+			tst_res(TFAIL | TTERRNO, "kill failed");
+		exit(0);
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
-
-	sleep(299);
-
-	tst_resm(TINFO, "%d never received a" " signal", getpid());
-	exit(exno);
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
-{
-	/* Setup default signal handling */
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	SAFE_WAITPID(-1, &status, 0);
+	nsig = WTERMSIG(status);
+	if (nsig != SIGKILL) {
+		tst_res(TFAIL, "wait: unexpected signal %d returned, "
+			"expected SIGKILL(9)", nsig);
+		return;
+	}
+	tst_res(TPASS, "receive expected signal SIGKILL(9)");
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
+	.forks_child = 1,
+	.test_all = verify_kill,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
