Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BD338647
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 07:58:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B91003C6834
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 07:58:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E4C973C305A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 07:58:13 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9DDF3601BCD
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 07:58:12 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AcPID565QIseenA95IgPXwOHXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/2/hfhz737JoRsYRX1Io7u9EYaaR3e0z/RIyK0wGZvnYwX8om?=
 =?us-ascii?q?uvK+hZg7fK5zH7ASXx+qp8+M5bH5RWM9H7AVhkgcuS2mDRL/8b3NKF/Kq07N2w?=
 =?us-ascii?q?815RS2hRBp1d0w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,242,1610380800"; d="scan'208";a="105537958"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 14:58:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B66864CEA9A9
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 14:58:01 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 14:58:02 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 12 Mar 2021 14:58:02 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 14:57:57 +0800
Message-ID: <20210312065757.380144-2-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
References: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: B66864CEA9A9.A134F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/chmod0{3,
 4}: Cleanup and Convert to the new API.
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

chmod03 and chmod04 test on file and directory with same logic, so
combine them together.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 runtest/syscalls                           |   1 -
 testcases/kernel/syscalls/chmod/.gitignore |   1 -
 testcases/kernel/syscalls/chmod/chmod03.c  | 196 ++++-----------------
 testcases/kernel/syscalls/chmod/chmod04.c  | 191 --------------------
 4 files changed, 36 insertions(+), 353 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/chmod/chmod04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 6108d5fdb..2bf870709 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -62,7 +62,6 @@ chdir04 chdir04
 chmod01 chmod01
 chmod01A symlink01 -T chmod01
 chmod03 chmod03
-chmod04 chmod04
 chmod05 chmod05
 chmod06 chmod06
 chmod07 chmod07
diff --git a/testcases/kernel/syscalls/chmod/.gitignore b/testcases/kernel/syscalls/chmod/.gitignore
index 072fa5b80..27ddfce16 100644
--- a/testcases/kernel/syscalls/chmod/.gitignore
+++ b/testcases/kernel/syscalls/chmod/.gitignore
@@ -1,6 +1,5 @@
 /chmod01
 /chmod03
-/chmod04
 /chmod05
 /chmod06
 /chmod07
diff --git a/testcases/kernel/syscalls/chmod/chmod03.c b/testcases/kernel/syscalls/chmod/chmod03.c
index f53e437e4..e451ca65a 100644
--- a/testcases/kernel/syscalls/chmod/chmod03.c
+++ b/testcases/kernel/syscalls/chmod/chmod03.c
@@ -1,183 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
- * Test Name: chmod03
+/*\
+ * [DESCRIPTION]
  *
- * Test Description:
- *  Verify that, chmod(2) will succeed to change the mode of a file
- *  and set the sticky bit on it if invoked by non-root (uid != 0)
- *  process with the following constraints,
- *	- the process is the owner of the file.
+ * Verify that, chmod(2) will succeed to change the mode of a file/directory
+ * and set the sticky bit on it if invoked by non-root (uid != 0) process with
+ * the following constraints:
+ *	- the process is the owner of the directory.
  *	- the effective group ID or one of the supplementary group ID's of the
- *	  process is equal to the group ID of the file.
- *
- * Expected Result:
- *  chmod() should return value 0 on success and succeeds to change
- *  the mode of specified file with sticky bit set on it.
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
- *  chmod03 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
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
- *  This test should be run by 'non-super-user' only.
- *
+ *	  process is equal to the group ID of the directory.
  */
 
-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
-#define PERMS		01777	/*
-				 * Mode permissions of test file with sticky
-				 * bit set.
-				 */
-#define TESTFILE	"testfile"
+#include <sys/stat.h>
+#include "tst_test.h"
 
-char *TCID = "chmod03";
-int TST_TOTAL = 1;
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+#define FILE_MODE	(S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
+#define DIR_MODE	(S_IRWXU | S_IRWXG | S_IRWXO)
+/* Mode permissions of test directory with sticky bit set. */
+#define PERMS		01777
 
-void setup();			/* Main setup function for the test */
-void cleanup();			/* Main cleanup function for the test */
+static char *tpaths[] = { "testfile", "testdir" };
 
-int main(int ac, char **av)
+static void verify_chmod(unsigned int i)
 {
 	struct stat stat_buf;
-	int lc;
-	mode_t file_mode;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	char *tpath = tpaths[i];
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	TST_EXP_PASS_SILENT(chmod(tpath, PERMS), "chmod(%s, %#o)", tpath, PERMS);
 
-		tst_count = 0;
+	if (stat(tpath, &stat_buf) < 0)
+		tst_brk(TFAIL | TERRNO, "stat(%s) failed", tpath);
 
-		TEST(chmod(TESTFILE, PERMS));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
-				 TESTFILE, PERMS);
-			continue;
-		}
-		if (stat(TESTFILE, &stat_buf) < 0) {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "stat(%s) failed", TESTFILE);
-		}
-		file_mode = stat_buf.st_mode;
-
-		/* Verify STICKY BIT set on testfile */
-		if ((file_mode & PERMS) != PERMS) {
-			tst_resm(TFAIL, "%s: Incorrect modes 0%3o, "
-				 "Expected 0777", TESTFILE, file_mode);
-		} else {
-			tst_resm(TPASS, "Functionality of "
-				 "chmod(%s, %#o) successful",
-				 TESTFILE, PERMS);
-		}
+	/* Verify STICKY BIT SET on file/directory */
+	if ((stat_buf.st_mode & PERMS) == PERMS) {
+		tst_res(TPASS, "Functionality of chmod(%s, %#o) successful",
+			tpath, PERMS);
+	} else {
+		tst_res(TFAIL, "%s: Incorrect modes 0%03o, Expected 0%03o",
+			tpath, stat_buf.st_mode, PERMS);
 	}
-
-	cleanup();
-	tst_exit();
 }
 
 void setup(void)
 {
-	int fd;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-	ltpuser = getpwnam(nobody_uid);
-	if (ltpuser == NULL)
-		tst_brkm(TBROK | TERRNO, NULL, "getpwnam failed");
-	SAFE_SETUID(NULL, ltpuser->pw_uid);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/*
-	 * Create a test file under temporary directory with specified
-	 * mode permissios and set the ownership of the test file to the
-	 * uid/gid of guest user.
-	 */
-	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %#o) failed",
-			 TESTFILE, FILE_MODE);
-	}
-
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_TOUCH(tpaths[0], FILE_MODE, NULL);
+	SAFE_MKDIR(tpaths[1], DIR_MODE);
 }
 
-/*
- * void
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- *  Delete the testfile and temporary directory created in setup().
- */
-void cleanup(void)
-{
-
-	tst_rmdir();
-
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.tcnt = ARRAY_SIZE(tpaths),
+	.test = verify_chmod,
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/chmod/chmod04.c b/testcases/kernel/syscalls/chmod/chmod04.c
deleted file mode 100644
index cbc13cf61..000000000
--- a/testcases/kernel/syscalls/chmod/chmod04.c
+++ /dev/null
@@ -1,191 +0,0 @@
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
- * Test Name: chmod04
- *
- * Test Description:
- *  Verify that, chmod(2) will succeed to change the mode of a directory
- *  and set the sticky bit on it if invoked by non-root (uid != 0) process
- *  with the following constraints,
- *	- the process is the owner of the directory.
- *	- the effective group ID or one of the supplementary group ID's of the
- *	  process is equal to the group ID of the directory.
- *
- * Expected Result:
- *  chmod() should return value 0 on success and succeeds to set sticky bit
- *  on the specified directory.
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
- *  chmod04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
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
- *  This test should be run by 'non-super-user' only.
- *
- */
-
-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-#define DIR_MODE 	S_IRWXU | S_IRWXG | S_IRWXO
-#define PERMS		01777	/*
-				 * Mode permissions of test directory with
-				 * sticky bit set.
-				 */
-#define TESTDIR		"testdir_4"
-
-char *TCID = "chmod04";
-int TST_TOTAL = 1;
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-void setup();
-void cleanup();
-
-int main(int ac, char **av)
-{
-	struct stat stat_buf;	/* stat struct. */
-	int lc;
-	mode_t dir_mode;	/* mode permissions set on testdirectory */
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
-		 * Call chmod(2) with mode argument to
-		 * set sticky bit on TESTDIR
-		 */
-		TEST(chmod(TESTDIR, PERMS));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
-				 TESTDIR, PERMS);
-			continue;
-		}
-
-		/*
-		 * Get the file information using
-		 * stat(2).
-		 */
-		if (stat(TESTDIR, &stat_buf) < 0) {
-			tst_brkm(TFAIL, cleanup,
-				 "stat(2) of %s failed, errno:%d",
-				 TESTDIR, TEST_ERRNO);
-		}
-		dir_mode = stat_buf.st_mode;
-
-		/* Verify STICKY BIT SET on directory */
-		if ((dir_mode & PERMS) == PERMS) {
-			tst_resm(TPASS, "Functionality of "
-				 "chmod(%s, %#o) successful",
-				 TESTDIR, PERMS);
-		} else {
-			tst_resm(TFAIL, "%s: Incorrect modes 0%03o, "
-				 "Expected 0%03o",
-				 TESTDIR, dir_mode, PERMS);
-		}
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and cd to it.
- *  Create another test directory under temporary directory.
- */
-void setup(void)
-{
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-	ltpuser = getpwnam(nobody_uid);
-	if (setuid(ltpuser->pw_uid) == -1)
-		tst_resm(TINFO | TERRNO, "setuid(%u) failed", ltpuser->pw_uid);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/*
-	 * Create a test directory under temporary directory with specified
-	 * mode permissios.
-	 */
-	SAFE_MKDIR(cleanup, TESTDIR, DIR_MODE);
-}
-
-/*
- * void
- * cleanup() - performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- *  Remove the test directory and temporary directory created in setup().
- */
-void cleanup(void)
-{
-
-	tst_rmdir();
-
-}
-- 
2.30.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
