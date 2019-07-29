Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 205CD783A4
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 05:29:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF3043C1D7D
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 05:29:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0BC983C1D2B
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 05:29:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 338BC600CEF
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 05:29:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,320,1559491200"; d="scan'208";a="72409603"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jul 2019 11:29:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 126FC4B4041E
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 11:28:59 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 29 Jul 2019 11:28:58 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Jul 2019 09:27:31 +0800
Message-ID: <1564363652-3975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 126FC4B4041E.AE7EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/nanosleep03: remove duplicated
 nanosleep03
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

1) remove duplicated nanosleep03, because nanosleep02 also
test EINTR when it is interrupted by a signal handler
2)nanosleep01:Replace GPL verbose text by SPDX license identifier

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 -
 .../kernel/syscalls/nanosleep/.gitignore      |   1 -
 .../kernel/syscalls/nanosleep/nanosleep01.c   |  16 +-
 .../kernel/syscalls/nanosleep/nanosleep02.c   |   7 +-
 .../kernel/syscalls/nanosleep/nanosleep03.c   | 148 ------------------
 5 files changed, 7 insertions(+), 166 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/nanosleep/nanosleep03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 48836f422..881ed2403 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -784,7 +784,6 @@ munmap03 munmap03
 
 nanosleep01 nanosleep01
 nanosleep02 nanosleep02
-nanosleep03 nanosleep03
 nanosleep04 nanosleep04
 
 nftw01 nftw01
diff --git a/testcases/kernel/syscalls/nanosleep/.gitignore b/testcases/kernel/syscalls/nanosleep/.gitignore
index 11ed6bbcb..9bf03ea97 100644
--- a/testcases/kernel/syscalls/nanosleep/.gitignore
+++ b/testcases/kernel/syscalls/nanosleep/.gitignore
@@ -1,4 +1,3 @@
 /nanosleep01
 /nanosleep02
-/nanosleep03
 /nanosleep04
diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep01.c b/testcases/kernel/syscalls/nanosleep/nanosleep01.c
index 96e1cf1b4..418f86565 100644
--- a/testcases/kernel/syscalls/nanosleep/nanosleep01.c
+++ b/testcases/kernel/syscalls/nanosleep/nanosleep01.c
@@ -1,21 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-lat
 /*
  * Copyright (c) International Business Machines  Corp., 2001
  *  07/2001 Ported by Wayne Boyer
  * Copyright (C) 2015-2017 Cyril Hrubis <chrubis@suse.cz>
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
 /*
@@ -25,7 +12,6 @@
  */
 
 #include <errno.h>
-
 #include "tst_timer_test.h"
 
 int sample_fn(int clk_id, long long usec)
diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep02.c b/testcases/kernel/syscalls/nanosleep/nanosleep02.c
index 8bd2c44c4..20a93d3b6 100644
--- a/testcases/kernel/syscalls/nanosleep/nanosleep02.c
+++ b/testcases/kernel/syscalls/nanosleep/nanosleep02.c
@@ -10,6 +10,9 @@
  *  Verify that nanosleep() will be successful to suspend the execution
  *  of a process, returns after the receipt of a signal and writes the
  *  remaining sleep time into the structure.
+ *
+ *  This test also verifies that if the call is interrupted by a signal
+ *  handler, nanosleep() returns -1, sets errno to EINTR.
  */
 
 #include <errno.h>
@@ -39,11 +42,13 @@ static void do_child(void)
 	TEST(nanosleep(&timereq, &timerem));
 	tst_timer_stop();
 
-	if (!TST_RET)
+	if (TST_RET != -1)
 		tst_brk(TBROK, "nanosleep was not interrupted");
 	if (TST_ERR != EINTR)
 		tst_brk(TBROK | TTERRNO, "nanosleep() failed");
 
+	tst_res(TPASS, "nanosleep() returned -1, set errno to EINTER");
+
 	if (tst_timespec_lt(timereq, tst_timer_elapsed()))
 		tst_brk(TFAIL, "nanosleep() slept more than timereq");
 
diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep03.c b/testcases/kernel/syscalls/nanosleep/nanosleep03.c
deleted file mode 100644
index 456e140e9..000000000
--- a/testcases/kernel/syscalls/nanosleep/nanosleep03.c
+++ /dev/null
@@ -1,148 +0,0 @@
-/*
- * Copyright (c) International Business Machines  Corp., 2001
- *  07/2001 Ported by Wayne Boyer
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * Test Description:
- *  Verify that nanosleep() will fail to suspend the execution
- *  of a process for a specified time if interrupted by a non-blocked signal.
- *
- * Expected Result:
- *  nanosleep() should return with -1 value and sets errno to EINTR.
- */
-
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <time.h>
-#include <sys/wait.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "nanosleep03";
-int TST_TOTAL = 1;
-
-static void do_child(void);
-static void setup(void);
-static void sig_handler();
-
-int main(int ac, char **av)
-{
-	int lc;
-	pid_t cpid;
-	int status;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-#ifdef UCLINUX
-	maybe_run_child(&do_child, "dddd", &timereq.tv_sec, &timereq.tv_nsec,
-			&timerem.tv_sec, &timerem.tv_nsec);
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		/*
-		 * Creat a child process and suspend its
-		 * execution using nanosleep()
-		 */
-		if ((cpid = FORK_OR_VFORK()) == -1)
-			tst_brkm(TBROK, NULL, "fork() failed");
-
-		if (cpid == 0) {
-#ifdef UCLINUX
-			if (self_exec(av[0], "dddd",
-				      timereq.tv_sec, timereq.tv_nsec,
-				      timerem.tv_sec, timerem.tv_nsec) < 0) {
-				tst_brkm(TBROK, NULL, "self_exec failed");
-			}
-#else
-			do_child();
-#endif
-		}
-
-		sleep(1);
-
-		/* Now send signal to child */
-		SAFE_KILL(NULL, cpid, SIGINT);
-
-		/* Wait for child to execute */
-		wait(&status);
-		if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
-			tst_resm(TPASS, "nanosleep() failed, interrupted"
-				 " by signal (%d) as expected", EINTR);
-		} else {
-			tst_resm(TFAIL, "child process exited abnormally; "
-				 "status = %d", status);
-		}
-	}
-
-	tst_exit();
-}
-
-static void do_child(void)
-{
-	struct timespec timereq = {.tv_sec = 5, .tv_nsec = 9999};
-	struct timespec timerem;
-
-	/*
-	 * Call nanosleep() to suspend child process
-	 * for specified time 'tv_sec'.
-	 * Call should return before suspending execution
-	 * for the specified time due to receipt of signal
-	 * from Parent.
-	 */
-	TEST(nanosleep(&timereq, &timerem));
-
-	if (TEST_RETURN == -1) {
-
-		/* Check for expected errno is set */
-		if (TEST_ERRNO != EINTR) {
-			tst_resm(TFAIL | TTERRNO,
-				 "nanosleep() failed; expected errno: %d",
-				 EINTR);
-			exit(1);
-		}
-	} else {
-		tst_resm(TFAIL, "nanosleep() returns %ld, "
-			 "expected -1, errno:%d", TEST_RETURN, EINTR);
-		exit(1);
-	}
-
-	exit(0);
-}
-
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, NULL);
-
-	TEST_PAUSE;
-
-	if (signal(SIGINT, sig_handler) == SIG_ERR) {
-		tst_brkm(TBROK, NULL,
-			 "signal() fails to setup signal handler");
-	}
-
-}
-
-static void sig_handler(void)
-{
-}
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
