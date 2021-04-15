Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137336027C
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 08:35:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A92A3C702C
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 08:35:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8FCD43C01F4
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 08:35:32 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1AE7600D69
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 08:35:30 +0200 (CEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FLTzN31F5zPqtZ
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 14:32:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Thu, 15 Apr 2021 14:35:20 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 15 Apr 2021 14:35:18 +0800
Message-ID: <20210415063518.174631-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415063518.174631-1-xieziyao@huawei.com>
References: <20210415063518.174631-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/chown: rewrite chown/chown03.c with
 the new api
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

For this:
  testcases/kernel/syscalls/chown/chown03.c

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---

v1->v2:
1. Remove some unnecessary comments and judgment statements;
2. Replace TEST() and return value checks with TST_EXP_PASS() macro (+ TPASS message below).

 testcases/kernel/syscalls/chown/chown03.c | 240 +++++++---------------
 1 file changed, 74 insertions(+), 166 deletions(-)

diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
index 2c7bcfe7d..ec1da2e20 100644
--- a/testcases/kernel/syscalls/chown/chown03.c
+++ b/testcases/kernel/syscalls/chown/chown03.c
@@ -1,72 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2001
  *
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
+ * 07/2001 Ported by Wayne Boyer
  */

-/*
- * Test Name: chown03
- *
- * Test Description:
- *  Verify that, chown(2) succeeds to change the group of a file specified
- *  by path when called by non-root user with the following constraints,
- *	- euid of the process is equal to the owner of the file.
- *	- the intended gid is either egid, or one of the supplementary gids
- *	  of the process.
- *  Also, verify that chown() clears the setuid/setgid bits set on the file.
- *
- * Expected Result:
- *  chown(2) should return 0 and the ownership set on the file should match
- *  the numeric values contained in owner and group respectively.
+/*\
+ * [Description]
  *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Create temporary directory.
- *   Pause for SIGUSR1 if option specified.
+ * Verify that, chown(2) succeeds to change the group of a file specified
+ * by path when called by non-root user with the following constraints,
+ * - euid of the process is equal to the owner of the file.
+ * - the intended gid is either egid, or one of the supplementary gids
+ *   of the process.
+ * Also, verify that chown() clears the setuid/setgid bits set on the file.
  *
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
- *  chown03 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
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
+ * [Algorithm]
  *
+ * - Execute system call
+ * - Check return code, if system call failed (return=-1)
+ * -   Log the errno and Issue a FAIL message
+ * - Otherwise
+ * -   Verify the Functionality of system call
+ * -   if successful
+ * -     Issue Functionality-Pass message
+ * -   Otherwise
+ * -     Issue Functionality-Fail message
  */

 #include <stdio.h>
@@ -80,123 +39,72 @@
 #include <grp.h>
 #include <pwd.h>

-#include "test.h"
-#include "safe_macros.h"
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"

 #define FILE_MODE	(S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
 #define NEW_PERMS	(S_IFREG|S_IRWXU|S_IRWXG|S_ISUID|S_ISGID)
-#define TESTFILE	"testfile"
+#define FILENAME "chown03_testfile"

-TCID_DEFINE(chown03);
-int TST_TOTAL = 1;		/* Total number of test conditions */
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-void setup();			/* setup function for the test */
-void cleanup();			/* cleanup function for the test */
-
-int main(int ac, char **av)
+static void run(void)
 {
-	struct stat stat_buf;	/* stat(2) struct contents */
-	int lc;
-	uid_t user_id;		/* Owner id of the test file. */
-	gid_t group_id;		/* Group id of the test file. */
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		UID16_CHECK((user_id = geteuid()), "chown", cleanup)
-		GID16_CHECK((group_id = getegid()), "chown", cleanup)
-
-		TEST(CHOWN(cleanup, TESTFILE, -1, group_id));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO, "chown(%s, ..) failed",
-				 TESTFILE);
-			continue;
-		}
-
-		if (stat(TESTFILE, &stat_buf) == -1)
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "stat failed");
-
-		if (stat_buf.st_uid != user_id ||
-		    stat_buf.st_gid != group_id)
-			tst_resm(TFAIL, "%s: Incorrect ownership"
-				 "set to %d %d, Expected %d %d",
-				 TESTFILE, stat_buf.st_uid,
-				 stat_buf.st_gid, user_id, group_id);
-
-		if (stat_buf.st_mode !=
-		    (NEW_PERMS & ~(S_ISUID | S_ISGID)))
-			tst_resm(TFAIL, "%s: incorrect mode permissions"
-				 " %#o, Expected %#o", TESTFILE,
-				 stat_buf.st_mode,
-				 NEW_PERMS & ~(S_ISUID | S_ISGID));
-		else
-			tst_resm(TPASS, "chown(%s, ..) was successful",
-				 TESTFILE);
-	}
-
-	cleanup();
-	tst_exit();
+	struct stat stat_buf;
+	uid_t uid;
+	gid_t gid;
+
+	UID16_CHECK((uid = geteuid()), "chown");
+	GID16_CHECK((gid = getegid()), "chown");
+
+	TST_EXP_PASS(CHOWN(FILENAME, -1, gid), "chown(%s,%d,%d)",
+		     FILENAME, uid, gid);
+
+	SAFE_STAT(FILENAME, &stat_buf);
+
+	if (stat_buf.st_uid != uid || stat_buf.st_gid != gid)
+		tst_res(TFAIL, "%s: Incorrect ownership"
+			       "set to %d %d, Expected %d %d",
+			FILENAME, stat_buf.st_uid,
+			stat_buf.st_gid, uid, gid);
+
+	if (stat_buf.st_mode != (NEW_PERMS & ~(S_ISUID | S_ISGID)))
+		tst_res(TFAIL, "%s: incorrect mode permissions"
+			       " %#o, Expected %#o", FILENAME,
+			stat_buf.st_mode,
+			NEW_PERMS & ~(S_ISUID | S_ISGID));
+	else
+		tst_res(TPASS, "chown(%s, ..) was successful",
+			FILENAME);
 }

-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and change directory to it.
- *  Create a test file under temporary directory and close it
- *  Change the group ownership on testfile.
- */
-void setup(void)
+static void setup(void)
 {
-	int fd;			/* file handler for testfile */
-
-	TEST_PAUSE;
-
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_tmpdir();
-
-	ltpuser = getpwnam(nobody_uid);
-	if (ltpuser == NULL)
-		tst_brkm(TBROK | TERRNO, NULL, "getpwnam(\"nobody\") failed");
-	SAFE_SETEGID(NULL, ltpuser->pw_gid);
-	SAFE_SETEUID(NULL, ltpuser->pw_uid);
+	int fd;
+	struct passwd *ltpuser;

-	/* Create a test file under temporary directory */
-	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %o) failed", TESTFILE,
-			 FILE_MODE);
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEGID(ltpuser->pw_gid);
+	SAFE_SETEUID(ltpuser->pw_uid);

-	SAFE_SETEUID(cleanup, 0);
+	fd = SAFE_OPEN(FILENAME, O_RDWR | O_CREAT, FILE_MODE);

-	SAFE_FCHOWN(cleanup, fd, -1, 0);
-
-	SAFE_FCHMOD(cleanup, fd, NEW_PERMS);
-
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
-
-	SAFE_CLOSE(cleanup, fd);
+	SAFE_SETEUID(0);
+	SAFE_FCHOWN(fd, -1, 0);
+	SAFE_FCHMOD(fd, NEW_PERMS);
+	SAFE_SETEUID(ltpuser->pw_uid);
+	SAFE_CLOSE(fd);
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	if (setegid(0) == -1)
-		tst_resm(TWARN | TERRNO, "setegid(0) failed");
-	if (seteuid(0) == -1)
-		tst_resm(TWARN | TERRNO, "seteuid(0) failed");
+	SAFE_SETEGID(0);
+	SAFE_SETEUID(0);
+}

-	tst_rmdir();
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+};

-}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
