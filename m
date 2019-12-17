Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4196412286D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10D883C234F
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 11:13:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 268393C22D4
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 639CB1400551
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 11:12:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,325,1571673600"; d="scan'208";a="80413201"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Dec 2019 18:12:49 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 232E64CE1C91
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:04:05 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 17 Dec 2019 18:12:44 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 17 Dec 2019 18:12:49 +0800
Message-ID: <1576577571-3668-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1576577571-3668-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 232E64CE1C91.AFC79
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/4] syscalls/capset02: Cleanup & convert to new
 library
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

It adds a preferred linux capabilities version check like
capget02. Also, it adds various cases about EPERM error.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/capset/capset02.c | 364 ++++++++------------
 1 file changed, 135 insertions(+), 229 deletions(-)

diff --git a/testcases/kernel/syscalls/capset/capset02.c b/testcases/kernel/syscalls/capset/capset02.c
index aece29511..4df555ce4 100644
--- a/testcases/kernel/syscalls/capset/capset02.c
+++ b/testcases/kernel/syscalls/capset/capset02.c
@@ -1,261 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
+ * Author: Saji Kumar.V.R <saji.kumar@wipro.com>
+ *
+ * Tests basic error handling of the capset syscall.
+ * 1) capset() fails with errno set to EFAULT if an invalid address
+ * is given for header.
+ * 2) capset() fails with errno set to EFAULT if an invalid address
+ * is given for data.
+ * 3) capset() fails with errno set ot EINVAL if an unused pid is
+ * given for header->pid.
+ * 4) capset() fails with errno set to EINVAL if an invalid value
+ * is given for header->version.
+ * 5) capset() fails with errno set to EPERM if the new_Effective is
+ * not a subset of the new_Permitted.
+ * 6) capset() fails with errno set to EPERM if the new_Permitted is
+ * not a subset of the old_Permitted.
+ * 7) capset() fails with errno set ot EPERM if the new_Inheritable is
+ * not a subset of  the old_Inheritable and bounding set.
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: capset02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Tests for error conditions.
- *
- *    TEST CASE TOTAL	: 4
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that
- *	1) capset() fails with errno set to EFAULT if an invalid address
- *	   is given for header
- *	2) capset() fails with errno set to EFAULT if an invalid address
- *	   is given for data
- *	3) capset() fails with errno set to EINVAL if an invalid value
- *	   is given for header->version
- *	4) capset() fails with errno set to EPERM the process does not
- *	   have enough privilege to set capabilities
- *
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  Call capget() to save current capability data
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	  do test specific setup.
- * 	  call capset with proper arguments
- *	  if capset() fails with expected errno
- *		Test passed
- *	  Otherwise
- *		Test failed
- *	  do test specific cleanup
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * capset02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
+#include <stdlib.h>
 #include <sys/types.h>
-#include <sys/wait.h>
-#include <errno.h>
-#include <pwd.h>
-#include <signal.h>
-#include <string.h>
 #include <unistd.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <sys/prctl.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-
-/**************************************************************************/
-/*                                                                        */
-/*   Some archs do not have the manpage documented sys/capability.h file, */
-/*   and require the use of the line below                                */
-
 #include <linux/capability.h>
 
-/*   If you are having issues with including this file and have the sys/  */
-/*   version, then you may want to try switching to it. -Robbie W.        */
-/**************************************************************************/
+#define CAP1 (1 << CAP_NET_RAW | 1 << CAP_CHOWN  | 1 << CAP_SETPCAP)
+#define CAP2 (CAP1 | 1 << CAP_KILL)
 
-#define INVALID_VERSION 0
-
-static void setup(void);
-static void cleanup(void);
-static void test_setup(int, char *);
-static void child_func(void);
+static unsigned int check_root_flag, drop_flag;
+static struct __user_cap_header_struct header, bad_version_header, unused_pid_header;
+static struct __user_cap_data_struct data[2];
+static struct __user_cap_data_struct good_data[2] = {
+	{
+		.effective = CAP1,
+		.permitted = CAP1,
+		.inheritable = CAP1,
+	},
+};
 
-static pid_t child_pid = -1;
+static struct __user_cap_data_struct bad_data_pe[2] = {
+	{
+		.effective = CAP2,
+		.permitted = CAP1,
+		.inheritable = CAP1,
+	},
+};
 
-char *TCID = "capset02";
+static struct __user_cap_data_struct bad_data_pp[2] = {
+	{
+		.effective = CAP1,
+		.permitted = CAP2,
+		.inheritable = CAP1,
+	},
+};
 
-static struct __user_cap_header_struct header;
-static struct __user_cap_data_struct data;
+static struct __user_cap_data_struct bad_data_pi[2] = {
+	{
+		.effective = CAP1,
+		.permitted = CAP1,
+		.inheritable = CAP2,
+	},
+};
 
-struct test_case_t {
+static struct tcase {
 	cap_user_header_t headerp;
 	cap_user_data_t datap;
-	int exp_errno;
-	char *errdesc;
-} test_cases[] = {
-#ifndef UCLINUX
-	/* Skip since uClinux does not implement memory protection */
-	{
-	(cap_user_header_t) - 1, &data, EFAULT, "EFAULT"}, {
-	&header, (cap_user_data_t) - 1, EFAULT, "EFAULT"},
-#endif
-	{
-	&header, &data, EINVAL, "EINVAL"}, {
-&header, &data, EPERM, "EPERM"},};
-
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+	int exp_err;
+	/*
+	 * 1 needs reset header version
+	 * 2 needs root privilege
+	 * 3 needs drop cap in bouding set
+	 */
+	int flag;
+	char *message;
+} tcases[] = {
+	{NULL, data, EFAULT, 0, "Test bad address header"},
+	{&header, NULL, EFAULT, 0, "Test bad address data"},
+	{&unused_pid_header, data, EINVAL, 1, "Test bad pid"},
+	{&bad_version_header, data, EINVAL, 1, "Test bad version"},
+	{&header, bad_data_pe, EPERM, 0, "Test bad value data(when pE is not in pP)"},
+	{&header, bad_data_pp, EPERM, 2, "Test bad value data(when pP is not in old pP)"},
+	{&header, bad_data_pi, EPERM, 3, "Test bad value data(when pI is not in bounding set or old pI)"},
+};
+
+static void verify_capset(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-#ifdef UCLINUX
-	maybe_run_child(&child_func, "");
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-#ifdef UCLINUX
-		i = 2;
-#else
-		i = 0;
-#endif
-
-		for (; i < TST_TOTAL; i++) {
-
-			test_setup(i, av[0]);
-			TEST(ltp_syscall(__NR_capset, test_cases[i].headerp,
-				     test_cases[i].datap));
-
-			if (TEST_RETURN == -1 &&
-			    TEST_ERRNO == test_cases[i].exp_errno) {
-				tst_resm(TPASS, "capset() returned -1,"
-					 " errno: %s", test_cases[i].errdesc);
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "Test Failed, capset() returned %ld",
-					 TEST_RETURN);
-			}
-		}
+	tst_res(TINFO, "%s", tc->message);
+	if (tc->flag == 2 && !check_root_flag) {
+		tst_res(TCONF, "This test needs root privilege, skip it");
+		return;
+	}
+	if (tc->flag == 3 && !drop_flag) {
+		tst_res(TCONF, "This test needs to drop CAP_KILL in bounding set, skip it");
+		return;
 	}
 
-	cleanup();
-
-	tst_exit();
-
-}
-
-void setup(void)
-{
-	tst_require_root();
-
-	TEST_PAUSE;
-
+	TEST(tst_syscall(__NR_capset, tc->headerp, tc->datap));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "capset() succeed unexpectedly");
+		return;
+	}
+	if (TST_ERR == tc->exp_err)
+		tst_res(TPASS | TTERRNO, "capset() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "capset() expected %s got ",
+			tst_strerrno(tc->exp_err));
 	/*
-	 * Save current capability data.
-	 * header.version must be _LINUX_CAPABILITY_VERSION
+	 * When an unsupported version value is specified, it will
+	 * return the kernel preferred value of _LINUX_CAPABILITY_VERSION_?.
+	 * Since linux 2.6.26, version 3 is default. We use it.
 	 */
-	header.version = _LINUX_CAPABILITY_VERSION;
-	if (ltp_syscall(__NR_capget, &header, &data) == -1)
-		tst_brkm(TBROK | TERRNO, NULL, "capget failed");
-}
-
-void cleanup(void)
-{
-	if (0 < child_pid) {
-		kill(child_pid, SIGTERM);
-		wait(NULL);
+	if (tc->flag == 1) {
+		if (tc->headerp->version == 0x20080522)
+			tc->headerp->version = 0;
+		else
+			tst_res(TFAIL, "kernel doesn't return preferred linux"
+				" capability version when using bad version");
 	}
 }
 
-void child_func(void)
+static void setup(void)
 {
-	for (;;) {
-		sleep(10);
-	}
-}
-
-void test_setup(int i, char *argv0)
-{
-	char nobody_uid[] = "nobody";
-	struct passwd *ltpuser;
+	unsigned int i;
+	pid_t pid;
 
-	switch (i) {
-	case 0:
-		break;
+	pid = getpid();
 
-	case 1:
-		header.version = _LINUX_CAPABILITY_VERSION;
-		header.pid = 0;
-		break;
+	header.version = 0x20080522;
+	header.pid = pid;
+	bad_version_header.version = 0;
+	bad_version_header.pid = pid;
+	unused_pid_header.pid = 0x20080522;
+	unused_pid_header.pid = tst_get_unused_pid();
 
-	case 2:
-		header.version = INVALID_VERSION;
-		header.pid = 0;
-		break;
 
-	case 3:
-		header.version = _LINUX_CAPABILITY_VERSION;
-		/*
-		 * when a non-zero pid is specified, process should have
-		 * CAP_SETPCAP capability to change capabilities.
-		 * by default, CAP_SETPCAP is not enabled. So giving
-		 * a non-zero pid results in capset() failing with
-		 * errno EPERM
-		 *
-		 * Note: this seems to have changed with recent kernels
-		 * => create a child and try to set its capabilities
-		 */
-		child_pid = FORK_OR_VFORK();
-		if (child_pid == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "fork failed");
-		else if (child_pid == 0) {
-#ifdef UCLINUX
-			if (self_exec(argv0, "") < 0) {
-				perror("self_exec failed");
-				exit(1);
-			}
-#else
-			child_func();
-#endif
-		} else {
-			header.pid = child_pid;
-			ltpuser = getpwnam(nobody_uid);
-			if (ltpuser == NULL)
-				tst_brkm(TBROK | TERRNO, cleanup,
-					 "getpwnam failed");
-			SAFE_SETEUID(cleanup, ltpuser->pw_uid);
-
-		}
-		break;
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (!tcases[i].headerp)
+			tcases[i].headerp = tst_get_bad_addr(NULL);
+		if (!tcases[i].datap)
+			tcases[i].datap = tst_get_bad_addr(NULL);
+	}
 
+	if (geteuid() == 0) {
+		TEST(tst_syscall(__NR_capset, &header, good_data));
+		if (TST_RET == -1)
+			tst_res(TFAIL | TTERRNO, "capset good_data failed");
+		else
+			check_root_flag = 1;
+		TEST(prctl(PR_CAPBSET_DROP, CAP_KILL));
+		if (TST_RET == -1)
+			tst_res(TFAIL | TTERRNO, "drop CAP_KILL failed");
+		else
+			drop_flag = 1;
 	}
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_capset,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
