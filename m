Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D629624B5A4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:26:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB14A3C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 12:26:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7C9123C12A1
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:26:39 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 29A446008EC
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 12:26:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,332,1592841600"; d="scan'208";a="98313490"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Aug 2020 18:26:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 930B448990D4
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 18:26:33 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.75) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 Aug 2020 18:26:34 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 20 Aug 2020 06:26:05 -0400
Message-ID: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.75]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 930B448990D4.A7C21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] syscalls/kill01: Remove it
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

kill11 has covered this test, so remove it.

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 runtest/syscalls                          |   1 -
 testcases/kernel/syscalls/kill/.gitignore |   1 -
 testcases/kernel/syscalls/kill/kill01.c   | 161 ------------------------------
 3 files changed, 163 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/kill/kill01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 860c5c3..5e2bdb1 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -614,7 +614,6 @@ kcmp01 kcmp01
 kcmp02 kcmp02
 kcmp03 kcmp03
 
-kill01 kill01
 kill02 kill02
 kill03 kill03
 kill04 kill04
diff --git a/testcases/kernel/syscalls/kill/.gitignore b/testcases/kernel/syscalls/kill/.gitignore
index 490a1e2..b62662f 100644
--- a/testcases/kernel/syscalls/kill/.gitignore
+++ b/testcases/kernel/syscalls/kill/.gitignore
@@ -1,4 +1,3 @@
-/kill01
 /kill02
 /kill03
 /kill04
diff --git a/testcases/kernel/syscalls/kill/kill01.c b/testcases/kernel/syscalls/kill/kill01.c
deleted file mode 100644
index 0aa77b9..0000000
--- a/testcases/kernel/syscalls/kill/kill01.c
+++ /dev/null
@@ -1,161 +0,0 @@
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
- *	kill01.c
- *
- * DESCRIPTION
- *	Test case to check the basic functionality of kill().
- *
- * ALGORITHM
- *	call setup
- *	loop if the -i option was given
- *	fork a child
- *	execute the kill system call
- *	check the return value
- *	if return value is -1
- *		issue a FAIL message, break remaining tests and cleanup
- *	if we are doing functional testing
- *		if the process was terminated with the expected signal.
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	call cleanup
- *
- * USAGE
- *  kill01 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
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
- *	This test should be ran as a non-root user.
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
-char *TCID = "kill01";
-int TST_TOTAL = 1;
-
-#define TEST_SIG SIGKILL
-
-int main(int ac, char **av)
-{
-	int lc;
-	pid_t pid;
-	int exno, status, nsig;
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
-			waitpid(pid, &status, 0);
-		}
-
-		if (TEST_RETURN == -1) {
-			tst_brkm(TFAIL, cleanup, "%s failed - errno = %d : %s",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO));
-		}
-
-		/*
-		 * Check to see if the process was terminated with the
-		 * expected signal.
-		 */
-		nsig = WTERMSIG(status);
-		if (nsig == TEST_SIG) {
-			tst_resm(TPASS, "received expected signal %d",
-				 nsig);
-		} else {
-			tst_resm(TFAIL,
-				 "expected signal %d received %d",
-				 TEST_SIG, nsig);
-		}
-	}
-
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
-	pause();
-	exit(exno);
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
