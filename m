Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333311A50B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 08:26:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE3FF3C1D8A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 08:26:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 717C03C2398
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 08:25:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 06C721A03FCD
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 08:25:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,301,1571673600"; d="scan'208";a="80011848"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Dec 2019 15:25:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id EC1CA4CE1A0C
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 15:17:14 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Dec 2019 15:25:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 11 Dec 2019 15:25:59 +0800
Message-ID: <1576049159-14014-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1576049159-14014-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: EC1CA4CE1A0C.A3642
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/capget02: Cleanup & convert to new
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

It also adds a check for whether kernel returns preferred linux
capability version when we use a bad version.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/capget/capget02.c | 245 ++++++--------------
 1 file changed, 73 insertions(+), 172 deletions(-)

diff --git a/testcases/kernel/syscalls/capget/capget02.c b/testcases/kernel/syscalls/capget/capget02.c
index e8d237779..42c76a011 100644
--- a/testcases/kernel/syscalls/capget/capget02.c
+++ b/testcases/kernel/syscalls/capget/capget02.c
@@ -1,199 +1,100 @@
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
+ * Tests basic error handling of the capget syscall.
+ * 1) capget() fails with errno set to EFAULT if an invalid address
+ * is given for header.
+ * 2) capget() fails with errno set to EFAULT if an invalid address
+ * is given for data
+ * 3) capget() fails with errno set to EINVAL if an invalid value
+ * is given for header->version
+ * 4) capget() fails with errno set to EINVAL if header->pid < 0
+ * 5) capget() fails with errno set to ESRCH if the process with
+ *  pid, header->pid does not exist.
  */
-/**********************************************************
- *
- *    TEST IDENTIFIER	: capget02
- *
- *    EXECUTED BY	: anyone
- *
- *    TEST TITLE	: Tests for error conditions.
- *
- *    TEST CASE TOTAL	: 5
- *
- *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	Verify that
- *	1) capget() fails with errno set to EFAULT if an invalid address
- *	   is given for header
- *	2) capget() fails with errno set to EFAULT if an invalid address
- *	   is given for data
- *	3) capget() fails with errno set to EINVAL if an invalid value
- *	   is given for header->version
- *	4) capget() fails with errno set to EINVAL if header->pid < 0
- *	5) capget() fails with errno set to ESRCH if the process with
- *	   pid, header->pid does not exit
- *
- *
- * 	Setup:
- * 	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- * 	  call capget with proper arguments
- *	  if capget() fails with expected errno
- *		Test passed
- *	  Otherwise
- *		Test failed
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * capget02 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
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
 
-#include <errno.h>
-#include "test.h"
+#include <sys/types.h>
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
-
-static void setup();
-static void cleanup();
-static void test_setup(int);
-
-char *TCID = "capget02";
-
-static struct __user_cap_header_struct header;
+static struct __user_cap_header_struct header, bad_version_header, bad_pid_header, unused_pid_header;
 static struct __user_cap_data_struct data;
 
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
-	&header, &data, EINVAL, "EINVAL"}, {
-	&header, &data, ESRCH, "ESRCH"}
+	int exp_err;
+	int reset_flag;
+	char *message;
+} tcases[] = {
+	{NULL, &data, EFAULT, 0, "Test bad address header"},
+	{&header, NULL, EFAULT, 0, "Test bad address data"},
+	{&bad_version_header, &data, EINVAL, 1, "Test bad version"},
+	{&bad_pid_header, &data, EINVAL, 0, "Test bad pid"},
+	{&unused_pid_header, &data, ESRCH, 0, "Test unused pid"},
 };
 
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
+static void verify_capget(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			test_setup(i);
-			TEST(ltp_syscall(__NR_capget, test_cases[i].headerp,
-				     test_cases[i].datap));
-
-			if (TEST_RETURN == -1 &&
-			    TEST_ERRNO == test_cases[i].exp_errno) {
-				tst_resm(TPASS | TTERRNO,
-					 "capget failed as expected");
-			} else {
-				tst_resm(TFAIL | TTERRNO,
-					 "capget failed unexpectedly (%ld)",
-					 TEST_RETURN);
-			}
-		}
+	tst_res(TINFO, "%s", tc->message);
+	TEST(tst_syscall(__NR_capget, tc->headerp, tc->datap));
+	if (TST_RET == 0) {
+		tst_res(TFAIL, "capget() succeed unexpectedly");
+		return;
+	}
+	if (TST_ERR == tc->exp_err)
+		tst_res(TPASS | TTERRNO, "capget() failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "capget() expected %s got ",
+			tst_strerrno(tc->exp_err));
+
+	/*
+	 * When an unsupported version value is specified, it will
+	 * return the kernel preferred value of _LINUX_CAPABILITY_VERSION_?.
+	 * Since linux 2.6.26, version 3 is default. We use it.
+	 */
+	if (tc->reset_flag) {
+		if (tc->headerp->version == 0x20080522)
+			tc->headerp->version = 0;
+		else
+			tst_res(TFAIL, "kernel doesn't return preferred linux"
+				" capability version when using bad version");
 	}
-
-	cleanup();
-
-	tst_exit();
-
 }
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
+	unsigned int i, pid;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	pid = getpid();
 
-	TEST_PAUSE;
+	header.version = 0x19980330;
+	header.pid = pid;
 
-}
+	bad_version_header.version = 0;
+	bad_version_header.pid = pid;
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
-{
-}
+	bad_pid_header.version = 0x19980330;
+	bad_pid_header.pid = -1;
 
-void test_setup(int i)
-{
-#ifdef UCLINUX
-	i = i + 2;
-#endif
-	switch (i) {
+	unused_pid_header.version = 0x19980330;
+	unused_pid_header.pid = tst_get_unused_pid();
 
-	case 0:
-		break;
-	case 1:
-		header.version = _LINUX_CAPABILITY_VERSION;
-		header.pid = getpid();
-		break;
-	case 2:
-		header.version = 0;
-		header.pid = getpid();
-		break;
-	case 3:
-		header.version = _LINUX_CAPABILITY_VERSION;
-		header.pid = -1;
-		break;
-	case 4:
-		header.version = _LINUX_CAPABILITY_VERSION;
-		header.pid = tst_get_unused_pid(cleanup);
-		break;
+	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+		if (!tcases[i].headerp)
+			tcases[i].headerp = tst_get_bad_addr(NULL);
+		if (!tcases[i].datap)
+			tcases[i].datap = tst_get_bad_addr(NULL);
 	}
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_capget,
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
