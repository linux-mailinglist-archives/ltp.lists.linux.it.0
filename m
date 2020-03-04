Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0A178CBB
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 09:44:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E68B03C6601
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 09:44:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id CC6553C65F9
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 09:44:43 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5580B1A00907
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 09:44:41 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,513,1574092800"; d="scan'208";a="85641109"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Mar 2020 16:44:40 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 7C5B850A997D
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:34:45 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 4 Mar 2020 16:44:35 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 4 Mar 2020 16:44:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 4 Mar 2020 16:44:27 +0800
Message-ID: <1583311467-2379-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7C5B850A997D.AC668
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] syscalls/settimeofday02: convert to new library
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

As well as settimeofday01, using tst_sycall for gettimeofday
and remove EFAULT error test. Also, add EINVAL error test.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../syscalls/settimeofday/settimeofday02.c    | 207 +++++-------------
 1 file changed, 49 insertions(+), 158 deletions(-)

diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday02.c b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
index 5516e619e..290c692b8 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday02.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
@@ -1,189 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
- * 	settimeofday02.c
+ * Copyright (c) International Business Machines  Corp., 2001
  *
  * DESCRIPTION
  *	Testcase to check that settimeofday() sets errnos correctly.
  *
- * ALGORITHM
- *	Setup:
- *	  Setup signal handling.
- *	  Check that we are not root.
- *	  Setup expected errnos.
- *	  Pause for SIGUSER1 if option specified.
- *	  Save the current time values.
- *	Loop if the proper options are given.
- *	  Call settimeofday with an invalid "buf" address and verify that
- *		errno is set to EFAULT.
- *	  Call settimeofday as a non-root user.  Verify that the call fails
- *		and errno is set to EPERM.
- *	Cleanup:
- *	  Print errno log and/or timing stats if options given.
- *
- * USAGE:  <for command-line>
- *	settimeofday02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-e   : Turn on errno logging.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
  * History
  *	07/2001 John George
  *		-Ported
- *
- * Restrictions
- *	Must not be run as root
  */
 
 #include <stdio.h>
 #include <sys/time.h>
 #include <errno.h>
-#include "test.h"
-#include <pwd.h>
+#include <linux/capability.h>
+#include "tst_capability.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
 
 #define	VAL_SEC		100
 #define	VAL_MSEC	100
 
-char *TCID = "settimeofday02";
-int TST_TOTAL = 1;
-
-struct timeval tp;
-time_t save_tv_sec, save_tv_usec;
-
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+struct timeval tv_saved;
+static int flag;
 
-void setup(void);
-void cleanup(void);
-void restore_time(void);
+static struct tcase {
+	struct timeval tv;
+	int exp_errno;
+	char *message;
+} tcases[] = {
+	{{-1, 0}, EINVAL, "tv.tv_sec is negative"},
+	{{0, -1}, EINVAL, "tv.tv_usec is outside the range [0..999,999]"},
+	{{100, 100}, EPERM, "calling process without CAP_SYS_TIME capability"},
+};
 
-#if !defined(UCLINUX)
-
-int main(int argc, char **argv)
+static void verify_settimeofday(unsigned int n)
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		TEST(settimeofday((void *)-1, NULL));
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "settimeofday(2) failed to FAIL");
-			restore_time();
-		} else {
-			if (TEST_ERRNO != EFAULT) {
-				tst_resm(TFAIL, "Expected EFAULT got %d",
-					 TEST_ERRNO);
-			} else {
-				tst_resm(TPASS, "Received expected errno");
-			}
-		}
-
-		tp.tv_sec = VAL_SEC;
-		tp.tv_usec = VAL_MSEC;
-		TEST(settimeofday(&tp, NULL));
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "settimeofday(2) failed to FAIL");
-			restore_time();
-		} else {
-			if (TEST_ERRNO != EPERM) {
-				tst_resm(TFAIL, "Expected EPERM got %d",
-					 TEST_ERRNO);
-			} else {
-				tst_resm(TPASS, "Received expected errno");
-			}
-		}
+	struct tcase *tc = &tcases[n];
+
+	flag = 0;
+	tst_res(TINFO, "%s", tc->message);
+	TEST(settimeofday(&tc->tv, NULL));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "settimeofday() succeeded unexpectedly");
+		flag = 1;
+		return;
 	}
-	cleanup();
-	tst_exit();
 
+	if (TST_ERR != tc->exp_errno)
+		tst_res(TFAIL | TTERRNO, "Expected %s got ", tst_strerrno(tc->exp_errno));
+	else
+		tst_res(TPASS | TTERRNO, "Received expected errno");
 }
 
-#else
-
-int main(void)
+static void setup(void)
 {
-	tst_resm(TINFO, "test is not available on uClinux");
-	tst_exit();
+	if (tst_syscall(__NR_gettimeofday, &tv_saved, NULL) == -1)
+		tst_brk(TBROK | TERRNO, "gettimeofday(&tv_saved, NULL) failed");
 }
 
-#endif /* if !defined(UCLINUX) */
-
-/*
- * setup()
- *	performs all ONE TIME setup for this test
- */
-void setup(void)
+static void cleanup(void)
 {
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	/* Switch to nobody user for correct error code collection */
-	ltpuser = getpwnam(nobody_uid);
-	if (setuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TINFO, "setuid failed to "
-			 "to set the effective uid to %d", ltpuser->pw_uid);
-		perror("setuid");
-	}
-
-	/* Pause if that option was specified
-	 * TEST_PAUSE contains the code to fork the test with the -c option.
-	 */
-	TEST_PAUSE;
-
-	/* Save the current time values */
-	if ((gettimeofday(&tp, (struct timezone *)&tp)) == -1) {
-		tst_brkm(TBROK, cleanup, "gettimeofday failed. "
-			 "errno=%d", errno);
-	}
-	save_tv_sec = tp.tv_sec;
-	save_tv_usec = tp.tv_usec;
+	if (!flag)
+		return;
+	if ((settimeofday(&tv_saved, NULL)) == -1)
+		tst_brk(TBROK | TERRNO, "settimeofday(&tv_saved, NULL) failed");
 }
 
-/*
- * cleanup()
- *	performs all ONE TIME cleanup for this test at
- *	completion or premature exit
- */
-void cleanup(void)
-{
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_settimeofday,
+	.tcnt = ARRAY_SIZE(tcases),
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_DROP, CAP_SYS_TIME),
+		{}
+	},
+};
 
-}
-
-void restore_time(void)
-{
-	/* restore the original time values. */
-	tp.tv_sec = save_tv_sec;
-	tp.tv_usec = save_tv_usec;
-	if ((settimeofday(&tp, NULL)) == -1) {
-		tst_resm(TWARN, "FATAL COULD NOT RESET THE CLOCK");
-		tst_resm(TFAIL, "Error Setting Time, errno=%d", errno);
-	}
-}
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
