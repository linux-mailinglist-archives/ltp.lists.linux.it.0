Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCB36AAFE
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 05:11:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 024FD3C6807
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 05:11:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E5473C2619
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 05:11:26 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B105B1A0070E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 05:11:23 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FT8wb289xzpZWm
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:08:15 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Mon, 26 Apr 2021 11:11:11 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Apr 2021 11:10:43 +0800
Message-ID: <20210426031043.16212-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/reboot: Update to new API
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

For those:
	testcases/kernel/syscalls/reboot/reboot01.c
	testcases/kernel/syscalls/reboot/reboot02.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/reboot/reboot01.c | 167 ++++------------
 testcases/kernel/syscalls/reboot/reboot02.c | 209 ++++----------------
 2 files changed, 76 insertions(+), 300 deletions(-)

diff --git a/testcases/kernel/syscalls/reboot/reboot01.c b/testcases/kernel/syscalls/reboot/reboot01.c
index cbcfa354e..0d2ccfcd0 100644
--- a/testcases/kernel/syscalls/reboot/reboot01.c
+++ b/testcases/kernel/syscalls/reboot/reboot01.c
@@ -1,142 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
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
+ * AUTHOR: Aniruddha Marathe <aniruddha.marathe@wipro.com>
+ */
+
+/*\
+ * [Description]
+ * This is a Phase I test for the reboot(2) system call.
+ * It is intended to provide a limited exposure of the system call.
+ *
+ * [Algorithm]
+ * 1)for two test cases for two flag values
+ * 2)Execute system call
+ * 3)Check return code, if system call failed (return=-1)
+ * 4)Log the errno and Issue a FAIL message
+ * 5)Otherwise, Issue a PASS message
+ *
+ * [Restrictions]
+ * For lib4 and lib5 reboot(2) system call is implemented as
+ * int reboot(int magic, int magic2, int flag, void *arg); This test case
+ * is written for int reboot(int flag); which is implemented under glibc
+ * Therefore this testcase may not work under libc4 and libc5 libraries.
  */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: reboot01
- *
- *    EXECUTED BY	: root / superuser
- *
- *    TEST TITLE	: Basic test for reboot(2)
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *    This is a Phase I test for the reboot(2) system call.
- *    It is intended to provide a limited exposure of the system call.
- *   $
- *
- * 	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  setting the flag value for two tests.
- *
- * 	Test:
- *	 Loop if the proper options are given.
- *	 for two test cases for two flag values
- *	  Execute system call
- *	  Check return code, if system call failed (return=-1)
- *		Log the errno and Issue a FAIL message.
- *	  Otherwise, Issue a PASS message.
- *
- * 	Cleanup:
- * 	  Print errno log and/or timing stats if options given
- *
- * USAGE:  <for command-line>
- * reboot01 [-c n] [-e] [-i n] [-I x] [-p x] [-t] [-h] [-f] [-p]
- * where:
- * 	-c n : run the test for n number of times.
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
- *
- *RESTRICTIONS:
- *for lib4 and lib5 reboot(2) system call is implemented as
- *int reboot(int magic, int magic2, int flag, void *arg); This test case
- *is written for int reboot(int flag); which is implemented under glibc
- *Therefore this testcase may not work under libc4 and libc5 libraries
- *****************************************************************************/

 #include <unistd.h>
 #include <sys/reboot.h>
-#include "test.h"
-#include <errno.h>
 #include <linux/reboot.h>
-
-static void setup();
-static void cleanup();
-
-char *TCID = "reboot01";
-int TST_TOTAL = 2;
-
-static int flag[2] = { LINUX_REBOOT_CMD_CAD_ON, LINUX_REBOOT_CMD_CAD_OFF };
-
-static const char *option_message[] = { "LINUX_REBOOT_CMD_CAD_ON",
-	"LINUX_REBOOT_CMD_CAD_OFF"
+#include "tst_test.h"
+
+static struct tcase {
+	const char *option_message;
+	int flag;
+} tcases[] = {
+	{"LINUX_REBOOT_CMD_CAD_ON", LINUX_REBOOT_CMD_CAD_ON,},
+	{"LINUX_REBOOT_CMD_CAD_OFF", LINUX_REBOOT_CMD_CAD_OFF,},
 };

-int main(int ac, char **av)
+static void run(unsigned int n)
 {
-
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
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(reboot(flag[i]));
-			/* check return code */
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "reboot(2) Failed for "
-					 "option %s", option_message[i]);
-			} else {
-				tst_resm(TPASS, "reboot(2) Passed for "
-					 "option %s", option_message[i]);
-			}
-		}		/*End of TEST CASE LOOPING */
-	}			/*End for TEST_LOOPING */
-
-	/*Clean up and exit */
-	cleanup();
-
-	tst_exit();
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
+	TST_EXP_PASS(reboot(tcases[n].flag),
+		"reboot(%s)", tcases[n].option_message);
 }

-/*
- * cleanup() - Performs one time cleanup for this test at
- * completion or premature exit
- */
-
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
diff --git a/testcases/kernel/syscalls/reboot/reboot02.c b/testcases/kernel/syscalls/reboot/reboot02.c
index 65ddae242..dad9e2c39 100644
--- a/testcases/kernel/syscalls/reboot/reboot02.c
+++ b/testcases/kernel/syscalls/reboot/reboot02.c
@@ -1,196 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
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
+ * AUTHOR: Aniruddha Marathe <aniruddha.marathe@wipro.com>
  */
-/**************************************************************************
- *
- *    TEST IDENTIFIER	: reboot02
- *
- *
- *    EXECUTED BY	: root / superuser
- *
- *    TEST TITLE	: Test checking for basic error conditions
- *    				 for reboot(2)
- *
- *    TEST CASE TOTAL	: 2
- *
- *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
- *
- *    SIGNALS
- * 	Uses SIGUSR1 to pause before test if option set.
- * 	(See the parse_opts(3) man page).
- *
- *    DESCRIPTION
- *	This test case checks whether reboot(2) system call  returns
- *	appropriate error number for invalid
- *	flag parameter or invalid user.
- *
- * 	Setup:
- *	  Setup signal handling.
- *	  Pause for SIGUSR1 if option specified.
- *	  For testing error on invalid user, change the effective uid
- *
- * 	Test:
- *	  Loop if the proper options are given.
- *	  Execute system call with invaid flag parameter
- *	  and then for invalid user
- *	  Check return code, if system call fails with errno == expected errno
- *		Issue syscall passed with expected errno
- *	  Otherwise,
- *	  Issue syscall failed to produce expected errno
+
+/*\
+ * [Description]
+ * This test case checks whether reboot(2) system call  returns
+ * appropriate error number for invalid flag parameter or invalid user.
  *
- * 	Cleanup:
- * 	  Do cleanup for the test.
- * 	 $
- * USAGE:  <for command-line>
- *  reboot02 [-c n] [-e] [-i n] [-I x] [-p x] [-t] [-h] [-f] [-p]
- *  where
- *  	-c n: run n copies simultaneously
- *	-e   : Turn on errno logging.
- *	-i n : Execute test n times.
- *	-I x : Execute test for x seconds.
- *	-p   : Pause for SIGUSR1 before starting
- *	-P x : Pause for x seconds between iterations.
- *	-t   : Turn on syscall timing.
+ * [Algorithm]
+ * Execute system call with invaid flag parameter and then for invalid user
+ * check return value and errno.
  *
- *RESTRICTIONS:
- *for lib4 and lib5 reboot(2) system call is implemented as
- *int reboot(int magic, int magic2, int flag, void *arg); This test case
- *is written for int reboot(int flag); which is implemented under glibc
- *Therefore this testcase may not work under libc4 and libc5 libraries
- *****************************************************************************/
+ * [Restrictions]
+ * For lib4 and lib5 reboot(2) system call is implemented as
+ * int reboot(int magic, int magic2, int flag, void *arg); This test case
+ * is written for int reboot(int flag); which is implemented under glibc
+ * Therefore this testcase may not work under libc4 and libc5 libraries
+ */

 #include <unistd.h>
 #include <sys/reboot.h>
-#include <errno.h>
 #include <linux/reboot.h>
 #include <pwd.h>
-#include "test.h"
+#include "tst_test.h"

 #define INVALID_PARAMETER 100

-static void setup();
-static void cleanup();
-static int setup_test();
-
-char *TCID = "reboot02";
-int TST_TOTAL = 2;
 char nobody_uid[] = "nobody";
 struct passwd *ltpuser;

 static struct test_case_t {
-	char *err_desc;		/*error description */
-	int exp_errno;		/* expected error number */
-	char *exp_errval;	/*Expected errorvalue string */
-} testcase[] = {
-	{
-	"Invalid flag", EINVAL, "EINVAL"}, {
-	"Permission denied", EPERM, "EPERM "}
+	int flag;
+	int exp_errno;
+	const char *option_message;
+} tcases[] = {
+	{INVALID_PARAMETER, EINVAL, "INVALID_PARAMETER"},
+	{LINUX_REBOOT_CMD_CAD_ON, EPERM, "LINUX_REBOOT_CMD_CAD_ON"},
 };

-int main(int ac, char **av)
+static void run(int n)
 {
+	struct test_case_t *tcase = &tcases[n];

-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	if (n == 0)
+		TST_EXP_FAIL(reboot(tcase->flag),
+			tcase->exp_errno, "%s", tcase->option_message);
+	else {
+		ltpuser = SAFE_GETPWNAM(nobody_uid);
+		SAFE_SETEUID(ltpuser->pw_uid);

-		for (i = 0; i < TST_TOTAL; i++) {
+		TST_EXP_FAIL(reboot(tcase->flag),
+			tcase->exp_errno, "%s", tcase->option_message);

-			tst_count = 0;
-			if (i == 0) {
-				TEST(reboot(INVALID_PARAMETER));
-			} else {
-				/*change the user to nobody */
-				if (setup_test() == 0) {
-					TEST(reboot(LINUX_REBOOT_CMD_CAD_ON));
-					/* Set effective user id back to root */
-					if (seteuid(0) == -1) {
-						tst_brkm(TBROK, cleanup,
-							 "seteuid failed to "
-							 "set the effective uid"
-							 " to root");
-						perror("seteuid");
-					}
-				} else {
-					tst_resm(TWARN, "skipping the test");
-					continue;
-				}
-			}
-			/* check return code */
-			if ((TEST_RETURN == -1)
-			    && (TEST_ERRNO == testcase[i].exp_errno)) {
-				tst_resm(TPASS,
-					 "reboot(2) expected failure;"
-					 " Got errno - %s : %s",
-					 testcase[i].exp_errval,
-					 testcase[i].err_desc);
-			} else {
-				tst_resm(TFAIL, "reboot(2) failed to produce"
-					 " expected error; %d, errno"
-					 ": %s and got %d",
-					 testcase[i].exp_errno,
-					 testcase[i].exp_errval, TEST_ERRNO);
-			}
-		}		/*End of TEST LOOPS */
+		SAFE_SETEUID(0);
 	}
-
-	/*Clean up and exit */
-	cleanup();
-
-	tst_exit();
-}				/*End of main */
-
-/*
- * setup_test() - This function sets the user as nobdy
- */
-int setup_test(void)
-{
-	if ((ltpuser = getpwnam(nobody_uid)) == NULL) {
-		tst_resm(TWARN, "\"nobody\" user not present. skipping test");
-		return -1;
-	}
-	if (seteuid(ltpuser->pw_uid) == -1) {
-		tst_resm(TWARN, "seteuid failed to "
-			 "to set the effective uid to %d", ltpuser->pw_uid);
-		perror("seteuid");
-		return -1;
-	}
-	return 0;
 }

-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-	tst_require_root();
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-}
-
-/*
-* cleanup() - Performs one time cleanup for this test at
-* completion or premature exit
-*/
-void cleanup(void)
-{
-
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tcases),
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
