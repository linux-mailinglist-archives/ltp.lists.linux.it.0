Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDF34D050
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 14:47:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F31A13C26CB
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 14:47:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3EC1F3C264C
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 14:47:21 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A6A711A008B9
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 14:47:20 +0200 (CEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F8C2c4VQ9zmbYT
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 20:44:40 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 20:47:11 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 29 Mar 2021 20:47:06 +0800
Message-ID: <20210329124707.117102-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329124707.117102-1-xieziyao@huawei.com>
References: <20210329124707.117102-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/chown: rewrite chown/chown02.c with the
 new api
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

rewrite chown/chown02.c with the new api

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/chown/chown02.c | 297 ++++++----------------
 1 file changed, 73 insertions(+), 224 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown02.c b/testcases/kernel/syscalls/chown/chown02.c
index a459f092b..2bcb1816f 100644
--- a/testcases/kernel/syscalls/chown/chown02.c
+++ b/testcases/kernel/syscalls/chown/chown02.c
@@ -1,72 +1,17 @@
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
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
  */

-/*
- * Test Name: chown02
+/*\
+ * [Description]
  *
- * Test Description:
  *  Verify that, when chown(2) invoked by super-user to change the owner and
  *  group of a file specified by path to any numeric owner(uid)/group(gid)
  *  values,
- *	- clears setuid and setgid bits set on an executable file.
- *	- preserves setgid bit set on a non-group-executable file.
- *
- * Expected Result:
- *  chown(2) should return 0 and the ownership set on the file should match
- *  the numeric values contained in owner and group respectively.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
- *   Pause for SIGUSR1 if option specified.
- *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *   	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *   	Verify the Functionality of system call
- *      if successful,
- *      	Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *   Delete the temporary directory created.
- *
- * Usage:  <for command-line>
- *  chown02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  This test should be run by 'super-user' (root) only.
- *
+ *  - clears setuid and setgid bits set on an executable file.
+ *  - preserves setgid bit set on a non-group-executable file.
  */

 #include <stdio.h>
@@ -77,9 +22,9 @@
 #include <string.h>
 #include <signal.h>

-#include "test.h"
-#include "safe_macros.h"
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"
+#include "tst_safe_macros.h"

 #define FILE_MODE	(S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
 #define NEW_PERMS1	(S_IFREG|S_IRWXU|S_IRWXG|S_ISUID|S_ISGID)
@@ -88,196 +33,100 @@
 #define TESTFILE1	"testfile1"
 #define TESTFILE2	"testfile2"

-TCID_DEFINE(chown02);
-
-int setup1();			/* Test specific setup functions */
-int setup2();
+static void setup1();
+static void setup2();

 struct test_case_t {
 	char *pathname;
 	uid_t user_id;
 	gid_t group_id;
 	int test_flag;
-	int (*setupfunc) ();
-} test_cases[] = {
-	/* setuid/setgid bits cleared */
-	{
-	TESTFILE1, 700, 701, 1, setup1},
-	    /* setgid bit not cleared */
-	{
-TESTFILE2, 700, 701, 2, setup2},};
-
-int TST_TOTAL = ARRAY_SIZE(test_cases);
+	void (*setupfunc) ();
+} tc[] = {
+	{TESTFILE1, 700, 701, 1, setup1},	/* setuid/setgid bits cleared */
+	{TESTFILE2, 700, 701, 2, setup2},	/* setgid bit not cleared */
+};

-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
+static void run(unsigned int i)
 {
 	struct stat stat_buf;	/* stat(2) struct contents */
-	int lc;
-	int i;
+
 	uid_t user_id;		/* user id of the user set for testfile */
 	gid_t group_id;		/* group id of the user set for testfile */
 	int test_flag;		/* test condition specific flag variable */
 	char *file_name;	/* ptr. for test file name */

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
-			file_name = test_cases[i].pathname;
-			user_id = test_cases[i].user_id;
-			group_id = test_cases[i].group_id;
-			test_flag = test_cases[i].test_flag;
-
-			/*
-			 * Call chown(2) with different user id and
-			 * group id (numeric values) to set it on testfile.
-			 */
-			TEST(CHOWN(cleanup, file_name, user_id, group_id));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "chown(%s, ..) failed", file_name);
-				continue;
-			}
-
-			/*
-			 * Get the testfile information using stat(2).
-			 */
-			if (stat(file_name, &stat_buf) < 0) {
-				tst_brkm(TFAIL, cleanup, "stat(2) of "
-					 "%s failed, errno:%d",
-					 file_name, TEST_ERRNO);
-			}
-
-			/*
-			 * Check for expected Ownership ids
-			 * set on testfile.
-			 */
-			if (stat_buf.st_uid != user_id ||
-			    stat_buf.st_gid != group_id) {
-				tst_brkm(TFAIL, cleanup, "%s: incorrect"
-					 " ownership set, Expected %d "
-					 "%d", file_name,
-					 user_id, group_id);
-			}
-
-			/*
-			 * Verify that S_ISUID/S_ISGID bits set on the
-			 * testfile(s) in setup()s are cleared by
-			 * chown().
-			 */
-			if (test_flag == 1 &&
-			    (stat_buf.st_mode & (S_ISUID | S_ISGID)) != 0) {
-				tst_resm(TFAIL,
-					 "%s: incorrect mode "
-					 "permissions %#o, Expected "
-					 "%#o", file_name, NEW_PERMS1,
-					 EXP_PERMS);
-			} else if (test_flag == 2
-				 && (stat_buf.st_mode & S_ISGID) == 0) {
-				tst_resm(TFAIL,
-					 "%s: Incorrect mode "
-					 "permissions %#o, Expected "
-					 "%#o", file_name,
-					 stat_buf.st_mode, NEW_PERMS2);
-			} else {
-				tst_resm(TPASS,
-					 "chown(%s, ..) succeeded",
-					 file_name);
-			}
-		}
-	}
-
-	cleanup();
-	tst_exit();
+	file_name = tc[i].pathname;
+	user_id = tc[i].user_id;
+	group_id = tc[i].group_id;
+	test_flag = tc[i].test_flag;
+
+	/*
+	 * Call chown(2) with different user id and
+	 * group id (numeric values) to set it on testfile.
+	 */
+	TEST(CHOWN(file_name, user_id, group_id));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "chown(%s, ..) failed", file_name);
+
+	SAFE_STAT(file_name, &stat_buf);
+	if (stat_buf.st_uid != user_id ||
+	    stat_buf.st_gid != group_id)
+		tst_brk(TFAIL, "%s: incorrect ownership set, Expected %d %d",
+			file_name, user_id, group_id);
+
+	/*
+	 * Verify that S_ISUID/S_ISGID bits set on the
+	 * testfile(s) in setup()s are cleared by chown().
+	*/
+	if (test_flag == 1 && (stat_buf.st_mode & (S_ISUID | S_ISGID)) != 0)
+		tst_res(TFAIL, "%s: incorrect mode permissions %#o, Expected %#o",
+			file_name, NEW_PERMS1, EXP_PERMS);
+	else if (test_flag == 2 && (stat_buf.st_mode & S_ISGID) == 0)
+		tst_res(TFAIL, "%s: Incorrect mode permissions %#o, Expected %#o",
+			file_name, stat_buf.st_mode, NEW_PERMS2);
+	else
+		tst_res(TPASS, "chown(%s, ..) succeeded", file_name);
 }

-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and change directory to it.
- *  Create a test file under temporary directory and close it
- */
-void setup(void)
+static void setup(void)
 {
-	int i;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	unsigned int i;

-	/* call iividual setup functions */
-	for (i = 0; i < TST_TOTAL; i++)
-		test_cases[i].setupfunc();
+	/* call individual setup functions */
+	for (i = 0; i < ARRAY_SIZE(tc); i++)
+		tc[i].setupfunc();
 }

-/*
- * int
- * setup1() - Setup function for chown(2) to verify setuid/setgid bits
- *	      set on an executable file will not be cleared.
- *  Creat a testfile and set setuid/setgid bits on the mode of file.$
- */
-int setup1(void)
+static void setup1(void)
 {
-	int fd;			/* File descriptor for testfile1 */
+	int fd;

 	/* Creat a testfile and close it */
-	if ((fd = open(TESTFILE1, O_RDWR | O_CREAT, FILE_MODE)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %o) failed",
-			 TESTFILE1, FILE_MODE);
-	SAFE_CLOSE(cleanup, fd);
+	fd = SAFE_OPEN(TESTFILE1, O_RDWR | O_CREAT, FILE_MODE);
+	SAFE_CLOSE(fd);

 	/* Set setuid/setgid bits on the test file created */
-	SAFE_CHMOD(cleanup, TESTFILE1, NEW_PERMS1);
-	return 0;
+	SAFE_CHMOD(TESTFILE1, NEW_PERMS1);
 }

-/*
- * int
- * setup2() - Setup function for chown(2) to verify setgid bit set
- *	      set on non-group executable file will not be cleared.
- *  Creat a testfile and set setgid bit on the mode of file.
- */
-int setup2(void)
+static void setup2(void)
 {
-	int fd;			/* File descriptor for testfile2 */
+	int fd;

 	/* Creat a testfile and close it */
-	if ((fd = open(TESTFILE2, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %o) failed",
-			 TESTFILE2, FILE_MODE);
-	}
+	fd = SAFE_OPEN(TESTFILE2, O_RDWR | O_CREAT, FILE_MODE);
+
 	/* Set setgid bit on the test file created */
-	if (fchmod(fd, NEW_PERMS2) != 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "fchmod failed");
-	SAFE_CLOSE(cleanup, fd);
-	return 0;
+	SAFE_FCHMOD(fd, NEW_PERMS2);
+	SAFE_CLOSE(fd);
 }

-/*
- * void
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- *  Remove the test directory and testfile created in the setup.
- */
-void cleanup(void)
-{
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test = run,
+};

-	tst_rmdir();
-
-}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
