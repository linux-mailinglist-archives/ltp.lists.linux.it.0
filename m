Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F07B1181E0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:15:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 098A23C243A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:15:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 492EC3C209F
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:14:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 73ACD14044C6
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:14:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,299,1571673600"; d="scan'208";a="79931879"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Dec 2019 16:14:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C91FF406AB15
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 16:06:15 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.31) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Dec 2019 16:14:48 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 10 Dec 2019 16:14:17 -0500
Message-ID: <1576012458-31108-2-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576012458-31108-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1576012458-31108-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.31]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C91FF406AB15.ACEC3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=2.9 required=7.0 tests=DATE_IN_FUTURE_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/llseek02: convert to new library
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

---
 testcases/kernel/syscalls/llseek/llseek02.c | 294 +++++-----------------------
 1 file changed, 45 insertions(+), 249 deletions(-)

diff --git a/testcases/kernel/syscalls/llseek/llseek02.c b/testcases/kernel/syscalls/llseek/llseek02.c
index 5f2e398..cfe276e 100644
--- a/testcases/kernel/syscalls/llseek/llseek02.c
+++ b/testcases/kernel/syscalls/llseek/llseek02.c
@@ -1,70 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
  *   Copyright (c) International Business Machines  Corp., 2001
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
+ *   07/2001 Ported by Wayne Boyer
  */
-
 /*
- * Test Name: llseek02
- * Note that glibc exports the llseek syscall as lseek64.
- *
- * Test Description:
- *  Verify that,
- *  1. llseek() returns -1 and sets errno to EINVAL, if the 'Whence' argument
- *     is not a proper value.
- *  2. llseek() returns -1 and sets errno to EBADF, if the file handle of
- *     the specified file is not valid.
- *
- * Expected Result:
- *  llseek() should fail with return value -1 and set expected errno.
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
- *	if errno set == expected errno
- *		Issue sys call fails with expected return value and errno.
- *	Otherwise,
- *		Issue sys call fails with unexpected errno.
- *   Otherwise,
- *	Issue sys call returns unexpected value.
- *
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *   Delete the temporary directory(s)/file(s) created.
- *
- * Usage:  <for command-line>
- *  llseek02 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  None.
+ * Description:
+ * 1) lseek64(2) fails and sets errno to EINVAL when whence is invalid.
+ * 2) lseek64(2) fails ans sets errno to EBADF when fd is not an open
+ * file descriptor.
  */
 
 #ifndef _GNU_SOURCE
@@ -72,204 +15,57 @@
 #endif
 
 #include <stdio.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <utime.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
-#define TEMP_FILE1	"tmp_file1"
-#define TEMP_FILE2	"tmp_file2"
-#define FILE_MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
-#define SEEK_TOP	10
+#define TEMP_FILE1 "tmp_file1"
+#define TEMP_FILE2 "tmp_file2"
 
-char *TCID = "llseek02";
-int TST_TOTAL = 2;
+#define FILE_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
+#define SEEK_TOP 10
 
-int no_setup();
-int setup1();			/* setup function to test llseek() for EINVAL */
-int setup2();			/* setup function to test llseek() for EBADF */
+static int fd1;
+static int fd2;
 
-int fd1;			/* file handle for testfile1  */
-int fd2;			/* file handle for testfile2  */
-
-struct test_case_t {		/* test case struct. to hold ref. test cond's */
-	int fd;
-	int Whence;
-	char *desc;
-	int exp_errno;
-	int (*setupfunc) ();
-} Test_cases[] = {
-	{
-	1, SEEK_TOP, "'whence' argument is not valid", EINVAL, setup1}, {
-	2, SEEK_SET, "'fd' is not an open file descriptor", EBADF, setup2},
-	{
-	0, 0, NULL, 0, no_setup}
+static struct tcase {
+	int *fd;
+	int whence;
+	int exp_err;
+} tcases[] = {
+	{&fd1, SEEK_TOP, EINVAL},
+	{&fd2, SEEK_SET, EBADF},
 };
 
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
-{
-	int lc;
-	int fildes;		/* file handle for testfile */
-	int whence;		/* position of file handle in the file */
-	char *test_desc;	/* test specific error message */
-	int ind;		/* counter to test different test conditions */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (ind = 0; Test_cases[ind].desc != NULL; ind++) {
-			fildes = Test_cases[ind].fd;
-			test_desc = Test_cases[ind].desc;
-			whence = Test_cases[ind].Whence;
-
-			/* Assign the 'fd' values appropriatly */
-			if (fildes == 1) {
-				fildes = fd1;
-			} else {
-				fildes = fd2;
-			}
-
-			/*
-			 * Invoke llseek(2) to test different test conditions.
-			 * Verify that it fails with -1 return value and
-			 * sets appropriate errno.
-			 */
-			TEST(lseek64(fildes, (loff_t) 0, whence));
-
-			if (TEST_RETURN != (loff_t) - 1) {
-				tst_resm(TFAIL,
-					 "llseek() returned %ld, expected"
-					 " -1, errno:%d", TEST_RETURN,
-					 Test_cases[ind].exp_errno);
-				continue;
-			}
-			if (TEST_ERRNO == Test_cases[ind].exp_errno) {
-				tst_resm(TPASS, "llseek() fails, %s, errno:%d",
-					 test_desc, TEST_ERRNO);
-			} else {
-				tst_resm(TFAIL, "llseek() fails, %s, errno:%d, "
-					 "expected errno:%d", test_desc,
-					 TEST_ERRNO, Test_cases[ind].exp_errno);
-			}
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- *           Create a temporary directory and change directory to it.
- *           Invoke individual test setup functions according to the order
- *           set in test struct. definition.
- */
-void setup(void)
-{
-	int ind;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* call individual setup functions */
-	for (ind = 0; Test_cases[ind].desc != NULL; ind++) {
-		Test_cases[ind].setupfunc();
-	}
-}
-
-/*
- * no_setup() - This is a dummy function which simply returns 0.
- */
-int no_setup(void)
+static void verify_llseek(unsigned int n)
 {
-	return 0;
-}
-
-/*
- * setup1() - setup function for a test condition for which llseek(2)
- *            returns -1 and sets errno to EINVAL.
- *            Creat a temporary file for reading/writing and write some data
- *            into it.
- *            This function returns 0 on success.
- */
-int setup1(void)
-{
-	char write_buff[BUFSIZ];	/* buffer to hold data */
-
-	/* Get the data to be written to temporary file */
-	strcpy(write_buff, "abcdefg");
-
-	/* Creat/open a temporary file under above directory */
-	if ((fd1 = open(TEMP_FILE1, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %#o) Failed, errno=%d :%s",
-			 TEMP_FILE1, FILE_MODE, errno, strerror(errno));
+	struct tcase *tc = &tcases[n];
+	
+	TEST(lseek64(*tc->fd, (loff_t) 1, tc->whence));
+	if (TST_RET != (off_t) -1) {
+		tst_res(TFAIL, "lseek64(%d, 1, %d) succeeded unexpectedly",
+			*tc->fd, tc->whence);
+		return;
 	}
-
-	/* Write data into temporary file */
-	if (write(fd1, write_buff, sizeof(write_buff)) <= 0) {
-		tst_brkm(TBROK, cleanup, "write(2) on %s Failed, errno=%d : %s",
-			 TEMP_FILE1, errno, strerror(errno));
+	if (TST_ERR == tc->exp_err) {
+		tst_res(TPASS | TTERRNO, "lseek64(%d, 1, %d) failed as expected",
+			*tc->fd, tc->whence);
+	} else {
+		tst_res(TFAIL | TTERRNO, "lseek64(%d, 1, %d) failed "
+		"unexpectedly, expected %s", *tc->fd, tc->whence,
+		tst_strerrno(tc->exp_err));
 	}
-
-	return 0;
 }
 
-/*
- * setup2() - setup function for a test condition for which llseek(2)
- *            returns -1 and sets errno to EBADF.
- *            Creat a temporary file for reading/writing and close it.
- *            This function returns 0 on success.
- */
-int setup2(void)
+static void setup(void)
 {
-	/* Creat/open a temporary file under above directory */
-	if ((fd2 = open(TEMP_FILE2, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %#o) Failed, errno=%d :%s",
-			 TEMP_FILE2, FILE_MODE, errno, strerror(errno));
-	}
-
-	/* Close the temporary file created above */
-	SAFE_CLOSE(cleanup, fd2);
+	fd1 = SAFE_OPEN(TEMP_FILE1, O_RDWR | O_CREAT, FILE_MODE);
 
-	return 0;
+	fd2 = SAFE_OPEN(TEMP_FILE2, O_RDWR | O_CREAT, FILE_MODE);
+	SAFE_CLOSE(fd2);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- *             Close the temporary file.
- *             Remove the test directory and testfile created in the setup.
- */
-void cleanup(void)
-{
-
-	/* Close the temporary file(s) created in setup1/setup2 */
-	if (close(fd1) < 0) {
-		tst_brkm(TFAIL, NULL, "close(%s) Failed, errno=%d : %s:",
-			 TEMP_FILE1, errno, strerror(errno));
-	}
-
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.setup = setup ,
+	.needs_tmpdir = 1 ,
+	.test = verify_llseek,
+	.tcnt = ARRAY_SIZE(tcases),
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
