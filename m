Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E87781181D8
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:14:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 605B63C2276
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 09:14:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D12313C209F
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:14:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9D6A81402C5C
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 09:14:48 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,299,1571673600"; d="scan'208";a="79931878"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Dec 2019 16:14:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3B188406AB15
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 16:06:10 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.31) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Dec 2019 16:14:43 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 10 Dec 2019 16:14:16 -0500
Message-ID: <1576012458-31108-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.31]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3B188406AB15.A9E43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=2.9 required=7.0 tests=DATE_IN_FUTURE_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/llseek01: convert to new library
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
 testcases/kernel/syscalls/llseek/llseek01.c | 224 ++++++----------------------
 1 file changed, 47 insertions(+), 177 deletions(-)

diff --git a/testcases/kernel/syscalls/llseek/llseek01.c b/testcases/kernel/syscalls/llseek/llseek01.c
index 9ae8218..2e826b2 100644
--- a/testcases/kernel/syscalls/llseek/llseek01.c
+++ b/testcases/kernel/syscalls/llseek/llseek01.c
@@ -1,211 +1,81 @@
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
- * Test Name: llseek01
- *
  * Test Description:
- *  Verify that, llseek() call succeeds to set the file pointer position
+ *  Verify that, lseek64() call succeeds to set the file pointer position
  *  to an offset larger than file size. Also, verify that any attempt
  *  to write to this location fails.
- *
- * Expected result:
- *  llseek() should return the offset from the beginning of the file measured
- *  in bytes. Attempt to write to the location ( > file size) should fail.
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
- *	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *	Verify the Functionality of system call
- *      if successful,
- *		Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *   Delete the temporary directory created.
- *
- * Usage:  <for command-line>
- *  llseek01 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
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
- *  None.
  */
 
 #ifndef _GNU_SOURCE
 #define _GNU_SOURCE
 #endif
 
-#include <unistd.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <utime.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/resource.h>
-#include <sys/stat.h>
 #include <sys/types.h>
-#include <inttypes.h>
+#include <unistd.h>
+#include <stdio.h>
 
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
 
 #define TEMP_FILE	"tmp_file"
 #define FILE_MODE	0644
 
-char *TCID = "llseek01";
-int TST_TOTAL = 1;
-char write_buff[BUFSIZ];	/* buffer to hold data */
-int fildes;			/* file handle for temp file */
-
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
+static char write_buff[BUFSIZ];
+static int fildes;
 
-int main(int ac, char **av)
+static void verify_llseek (void)
 {
-	int lc;
-	loff_t offset;		/* Ret value from llseek */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	offset = -1;
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * set file size limit, seek to a file using llseek.
-		 */
-		TEST(lseek64(fildes, (loff_t) (80 * BUFSIZ), SEEK_SET));
-
-		if (TEST_RETURN == (loff_t) - 1) {
-			tst_resm(TFAIL, "llseek on (%s) Failed, errno=%d : %s",
-				 TEMP_FILE, TEST_ERRNO, strerror(TEST_ERRNO));
-			continue;
-		}
-
-		if (TEST_RETURN != (loff_t) (80 * BUFSIZ)) {
-			tst_resm(TFAIL, "llseek() returned incorrect "
-				 "value %" PRId64 ", expected %d",
-				 (int64_t) offset, BUFSIZ);
-			continue;
-		}
-
-		/*
-		 * llseek() successful.  Now attempt to write past
-		 * file size limit.
-		 */
-		if (write(fildes, write_buff, BUFSIZ) != -1) {
-			tst_brkm(TFAIL, cleanup, "write successful "
-				 "after file size limit");
-		}
-
-		/* Seeking to end of last valid write */
-		offset = lseek64(fildes, (loff_t) BUFSIZ, SEEK_SET);
-		if (offset != (loff_t) BUFSIZ) {
-			tst_brkm(TFAIL, cleanup,
-				 "llseek under file size limit");
-		}
-
-		/*
-		 * llseek() successful.  Now, attempt to write to
-		 * file size limit.
-		 */
-		if (write(fildes, write_buff, BUFSIZ) != BUFSIZ) {
-			tst_brkm(TFAIL, cleanup, "write failed to "
-				 "write to file size limit");
-		}
-
-		/*
-		 * Again, attempt to write past file size limit.
-		 */
-		if (write(fildes, write_buff, BUFSIZ) != -1) {
-			tst_brkm(TFAIL, cleanup, "write past file "
-				 "size limit successful");
-		}
-
-		tst_resm(TPASS, "Functionality of llseek() on %s "
-			 "successful", TEMP_FILE);
-	}
-
-	cleanup();
-	tst_exit();
+	TEST(lseek64(fildes, (loff_t) (80 * BUFSIZ), SEEK_SET));
+	if (TST_RET == (80 * BUFSIZ))
+		tst_res(TPASS, "lseek64() can set file pointer position larger than file size limit");
+	else
+		tst_res(TFAIL, "lseek64() returned wrong value %ld when write past file size", TST_RET);
+
+	if (write(fildes, write_buff, BUFSIZ) == -1)
+		tst_res(TPASS,"write failed after file size limit");
+	else
+		tst_brk(TFAIL, "write successful after file size limit");
+
+	TEST(lseek64(fildes, (loff_t) BUFSIZ, SEEK_SET));
+	if (TST_RET == BUFSIZ)
+		tst_res(TPASS,"lseek64() can set file pointer position under filer size limit");
+	else
+		tst_brk(TFAIL,"lseek64() returns wrong value %ld when write under file size", TST_RET);
+
+	if (write(fildes, write_buff, BUFSIZ) != -1)
+		tst_res(TPASS, "write succcessfully under file size limit");
+	else
+		tst_brk(TFAIL, "write failed under file size limit");
+
+	if (write(fildes, write_buff, BUFSIZ) == -1)
+		tst_res(TPASS, "write failed after file size limit");
+	else
+		tst_brk(TFAIL, "write successfully after file size limit");
 }
 
-void setup(void)
+static void setup(void)
 {
-	struct sigaction act;	/* struct. to hold signal */
-	struct rlimit rlp;	/* resource for file size limit */
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	struct sigaction act;
+	struct rlimit rlp;
 
 	act.sa_handler = SIG_IGN;
 	act.sa_flags = 0;
 	sigemptyset(&act.sa_mask);
-	if (sigaction(SIGXFSZ, &act, NULL) == -1) {
-		tst_brkm(TFAIL, NULL, "sigaction() Failed to ignore SIGXFSZ");
-	}
-
-	tst_tmpdir();
+	SAFE_SIGACTION(SIGXFSZ, &act, NULL);
 
-	/* Set limit low, argument is # bytes */
 	rlp.rlim_cur = rlp.rlim_max = 2 * BUFSIZ;
+	SAFE_SETRLIMIT(RLIMIT_FSIZE, &rlp);
 
-	SAFE_SETRLIMIT(cleanup, RLIMIT_FSIZE, &rlp);
-
-	/* Creat/open a temporary file under above directory */
-	if ((fildes = open(TEMP_FILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, 0644) Failed, errno=%d :%s",
-			 TEMP_FILE, errno, strerror(errno));
-	}
+	fildes = SAFE_OPEN(TEMP_FILE, O_RDWR | O_CREAT, FILE_MODE);
 
-	SAFE_WRITE(cleanup, 1, fildes, write_buff, BUFSIZ);
+	SAFE_WRITE(1, fildes, write_buff, BUFSIZ);
 }
 
-void cleanup(void)
-{
-	SAFE_CLOSE(NULL, fildes);
-
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.setup = setup ,
+	.needs_tmpdir = 1 ,
+	.test_all = verify_llseek ,	
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
