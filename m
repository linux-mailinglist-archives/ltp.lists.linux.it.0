Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E3298699
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 06:49:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 492B03C5629
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 06:49:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 004153C561E
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 06:48:37 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A8160200749
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 06:48:36 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,417,1596470400"; d="scan'208";a="100494218"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Oct 2020 13:48:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 131A948990DE
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 13:48:31 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 26 Oct 2020 13:48:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Oct 2020 13:48:34 +0800
Message-ID: <1603691317-22811-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 131A948990DE.AB830
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/sync02: Remove it
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

As man-pages said
"According to the standard specification (e.g., POSIX.1-2001), sync() schedules the writes,
but may return before the actual writing is done. "

So checking the data whether has been written into disk make no sense. Also, we check the data
from read buffer in this test and we can't ensure the data from disk instead of buffer/cache.

So remove the confusing case.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                          |   1 -
 testcases/kernel/syscalls/sync/.gitignore |   1 -
 testcases/kernel/syscalls/sync/sync02.c   | 204 ----------------------
 3 files changed, 206 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/sync/sync02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 2e7108655..afc27c142 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1477,7 +1477,6 @@ symlink05 symlink05
 #symlinkat test cases
 symlinkat01 symlinkat01
 
-sync02 sync02
 sync03 sync03
 
 syncfs01 syncfs01
diff --git a/testcases/kernel/syscalls/sync/.gitignore b/testcases/kernel/syscalls/sync/.gitignore
index d006746c2..8008fa6e2 100644
--- a/testcases/kernel/syscalls/sync/.gitignore
+++ b/testcases/kernel/syscalls/sync/.gitignore
@@ -1,2 +1 @@
-/sync02
 /sync03
diff --git a/testcases/kernel/syscalls/sync/sync02.c b/testcases/kernel/syscalls/sync/sync02.c
deleted file mode 100644
index d4fd94c0e..000000000
--- a/testcases/kernel/syscalls/sync/sync02.c
+++ /dev/null
@@ -1,204 +0,0 @@
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
- * Test Name: sync02
- *
- * Test Description:
- *  Open a file for write; modify the file, then do a sync().
- *  Verify that the data has been written to disk by re-opening the file.
- *
- * Expected Result:
- *  sync() alawys returns 0 in Linux. The data written to the file should
- *  be updated to the disk.
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
- *  sync02 [-c n] [-f] [-i n] [-I x] [-p x] [-t]
- *	where,  -c n : Run n copies concurrently.
- *		-f   : Turn off functionality Testing.
- *		-i n : Execute test n times.
- *		-I x : Execute test for x seconds.
- *		-P x : Pause for x seconds between iterations.
- *		-t   : Turn on syscall timing.
- *
- * History
- *	07/2001 John George
- *		-Ported
- *
- * Restrictions:
- *  None.
- */
-
-#include <stdio.h>
-#include <unistd.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/stat.h>
-
-#include "test.h"
-
-#define TEMP_FILE	"temp_file"
-#define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
-
-char *TCID = "sync02";
-int TST_TOTAL = 1;
-char write_buffer[BUFSIZ];	/* buffer used to write data to file */
-int fildes;			/* file descriptor for temporary file */
-
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
-{
-	int lc;
-	char read_buffer[BUFSIZ];	/* buffer used to read data from file */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call sync(2) to commit buffer data to disk.
-		 */
-		TEST_VOID(sync());
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "%s, Failed, errno=%d : %s",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			/* Set the file ptr to b'nning of file */
-			if (lseek(fildes, 0, SEEK_SET) < 0) {
-				tst_brkm(TFAIL, cleanup, "lseek() "
-					 "failed on %s, error=%d",
-					 TEMP_FILE, errno);
-			}
-
-			/* Read the contents of file */
-			if (read(fildes, read_buffer,
-				 sizeof(read_buffer)) > 0) {
-				if (strcmp(read_buffer, write_buffer)) {
-					tst_resm(TFAIL, "Data read "
-						 "from %s doesn't match "
-						 "with witten data",
-						 TEMP_FILE);
-				} else {
-					tst_resm(TPASS, "Functionality "
-						 "of sync() successful");
-				}
-			} else {
-				tst_brkm(TFAIL, cleanup,
-					 "read() Fails on %s, error=%d",
-					 TEMP_FILE, errno);
-			}
-		}
-		tst_count++;	/* incr. TEST_LOOP counter */
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and change directory to it.
- *  Create a test file under temporary directory and write some
- *  data into it.
- */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	/* Pause if that option was specified
-	 * TEST_PAUSE contains the code to fork the test with the -i option.
-	 * You want to make sure you do this before you create your temporary
-	 * directory.
-	 */
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* Copy some data into data buffer */
-	strcpy(write_buffer, "abcdefghijklmnopqrstuvwxyz");
-
-	/* Creat a temporary file under above directory */
-	if ((fildes = open(TEMP_FILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK, cleanup,
-			 "open(%s, O_RDWR | O_CREAT, %#o) Failed, errno=%d :%s",
-			 TEMP_FILE, FILE_MODE, errno, strerror(errno));
-	}
-
-	/* Write the buffer data into file */
-	if (write(fildes, write_buffer, strlen(write_buffer) + 1) !=
-	    strlen(write_buffer) + 1) {
-		tst_brkm(TBROK, cleanup,
-			 "write() failed to write buffer data to %s",
-			 TEMP_FILE);
-	}
-
-}
-
-/*
- * void
- * cleanup() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- *  Remove the test directory and testfile created in the setup.
- */
-void cleanup(void)
-{
-
-	/* Close the temporary file */
-	if (close(fildes) == -1) {
-		tst_brkm(TFAIL, NULL,
-			 "close(%s) Failed, errno=%d : %s",
-			 TEMP_FILE, errno, strerror(errno));
-	}
-
-	tst_rmdir();
-
-}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
