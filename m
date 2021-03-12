Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EF338646
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 07:58:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41E103C3032
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 07:58:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 349003C2FDA
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 07:58:12 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 22E4B601BCD
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 07:58:09 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AMv/GhK6QuMYQouZ7KgPXwCjXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz726RtB89elEF3eqBNq6JXG/G+fdOjLU5EL++UGDd1l?=
 =?us-ascii?q?eAA41v4IDryT+lOwCWzIRg/Ih6dawWMrzNJHxbqeq/3wWiCdYnx7C8gcWVrMPT?=
 =?us-ascii?q?1W1kQw0vS4wI1XYbNi+hHkd7RBZLCPMCffLy2uN8uzGidX4LB/7LZEUtYu6rnb?=
 =?us-ascii?q?32vaOjSRsHKjpi0wOWkA6vgYSQLzGomjsYTBNDqI1PzVT4?=
X-IronPort-AV: E=Sophos;i="5.81,242,1610380800"; d="scan'208";a="105537956"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 14:58:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 014CF4CE602A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 14:58:01 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 14:58:01 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 12 Mar 2021 14:58:01 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 14:57:56 +0800
Message-ID: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 014CF4CE602A.A35EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/chmod0{1,
 2}: Cleanup and Convert to the new API
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

Testcases in chmod02 is contained in chmod01. So remove it.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/chmod/.gitignore |   1 -
 testcases/kernel/syscalls/chmod/chmod01.c  | 175 +++++----------------
 testcases/kernel/syscalls/chmod/chmod02.c  | 107 -------------
 4 files changed, 37 insertions(+), 247 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/chmod/chmod02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index fe22ae5b6..6108d5fdb 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -61,7 +61,6 @@ chdir04 chdir04
 
 chmod01 chmod01
 chmod01A symlink01 -T chmod01
-chmod02 chmod02
 chmod03 chmod03
 chmod04 chmod04
 chmod05 chmod05
diff --git a/testcases/kernel/syscalls/chmod/.gitignore b/testcases/kernel/syscalls/chmod/.gitignore
index 4e856df43..072fa5b80 100644
--- a/testcases/kernel/syscalls/chmod/.gitignore
+++ b/testcases/kernel/syscalls/chmod/.gitignore
@@ -1,5 +1,4 @@
 /chmod01
-/chmod02
 /chmod03
 /chmod04
 /chmod05
diff --git a/testcases/kernel/syscalls/chmod/chmod01.c b/testcases/kernel/syscalls/chmod/chmod01.c
index 55ddf8a73..cbe83dab0 100644
--- a/testcases/kernel/syscalls/chmod/chmod01.c
+++ b/testcases/kernel/syscalls/chmod/chmod01.c
@@ -1,159 +1,58 @@
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
  */
 
-/*
- * Test Name: chmod01
- *
- * Test Description:
- *  Verify that, chmod(2) succeeds when used to change the mode permissions
- *  of a file.
- *
- * Expected Result:
- *  chmod(2) should return 0 and the mode permissions set on file should match
- *  the specified mode.
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
- *  chmod01 [-c n] [-e] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
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
+/*\
+ * [DESCRIPTION]
  *
+ * Verify that, chmod(2) succeeds when used to change the mode permissions of
+ * a file/directory, and the mode permissions set on file should match the
+ * specified mode.
  */
 
-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <string.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define FILE_MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
-#define TESTFILE	"testfile"
-
-char *TCID = "chmod01";
-int TST_TOTAL = 8;
+#include <sys/stat.h>
+#include "tst_test.h"
 
-int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
+#define FILE_MODE	(S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
+#define DIR_MODE	(FILE_MODE | S_IXUSR | S_IXGRP | S_IXOTH)
 
-void setup();
-void cleanup();
+static int tmodes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
+static char *tpaths[] = { "testfile", "testdir" };
 
-int main(int ac, char **av)
+static void verify_chmod(unsigned int i)
 {
 	struct stat stat_buf;
-	int lc;
-	int i;
-	int mode;
-
-	TST_TOTAL = sizeof(modes) / sizeof(int);
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
-			mode = modes[i];
+	int tmode = tmodes[i % ARRAY_SIZE(tmodes)];
+	char* tpath = tpaths[i / ARRAY_SIZE(tmodes)];
 
-			TEST(chmod(TESTFILE, mode));
+	TST_EXP_PASS_SILENT(chmod(tpath, tmode), "chmod(%s, %#o)", tpath, tmode);
 
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "chmod(%s, %#o) failed", TESTFILE,
-					 mode);
-				continue;
-			}
-			if (stat(TESTFILE, &stat_buf) < 0)
-				tst_brkm(TFAIL | TERRNO, cleanup,
-					 "stat(%s) failed", TESTFILE);
-			stat_buf.st_mode &= ~S_IFREG;
+	if (stat(tpath, &stat_buf) < 0)
+		tst_brk(TFAIL | TERRNO, "stat(%s) failed", tpath);
 
-			if (stat_buf.st_mode == (unsigned int)mode)
-				tst_resm(TPASS, "Functionality of "
-					 "chmod(%s, %#o) successful",
-					 TESTFILE, mode);
-			else
-				tst_resm(TFAIL, "%s: Incorrect "
-					 "modes 0%03o, Expected 0%03o",
-					 TESTFILE, stat_buf.st_mode,
-					 mode);
-		}
-	}
+	/* Ignore the file/dir flag */
+	stat_buf.st_mode &= ~S_IFREG;
+	stat_buf.st_mode &= ~S_IFDIR;
 
-	cleanup();
-	tst_exit();
+	if (stat_buf.st_mode == (unsigned int)tmode)
+		tst_res(TPASS, "Functionality of chmod(%s, %#o) successful",
+			tpath, tmode);
+	else
+		tst_res(TFAIL, "%s: Incorrect modes %#o, Expected %#o",
+			tpath, stat_buf.st_mode, tmode);
 }
 
-void setup(void)
+static void setup(void)
 {
-	int fd;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	fd = SAFE_OPEN(cleanup, TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
-	SAFE_CLOSE(cleanup, fd);
-
+	SAFE_TOUCH(tpaths[0], FILE_MODE, NULL);
+	SAFE_MKDIR(tpaths[1], DIR_MODE);
 }
 
-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test = verify_chmod,
+	.tcnt = ARRAY_SIZE(tmodes) * ARRAY_SIZE(tpaths),
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/chmod/chmod02.c b/testcases/kernel/syscalls/chmod/chmod02.c
deleted file mode 100644
index 94a77aeb1..000000000
--- a/testcases/kernel/syscalls/chmod/chmod02.c
+++ /dev/null
@@ -1,107 +0,0 @@
-/*
- * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- */
-
-/*
- * AUTHOR	: William Roske
- * CO-PILOT	: Dave Fenner
- * DATE STARTED	: 03/30/92
- *
- *  Calls chmod(2) with different modes and expects success.
- */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
-
-char *TCID = "chmod02";
-int TST_TOTAL = ARRAY_SIZE(modes);
-
-#define FNAME "test_file"
-
-static void setup(void);
-static void cleanup(void);
-
-int main(int ac, char **av)
-{
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
-			TEST(chmod(FNAME, modes[i]));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "chmod(%s, %#o) failed", FNAME, modes[i]);
-			} else {
-				tst_resm(TPASS,
-					 "chmod(%s, %#o) returned %ld",
-					 FNAME, modes[i], TEST_RETURN);
-			}
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	SAFE_FILE_PRINTF(cleanup, FNAME, "File content\n");
-}
-
-static void cleanup(void)
-{
-	tst_rmdir();
-}
-- 
2.30.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
