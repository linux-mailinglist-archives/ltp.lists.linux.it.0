Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A462B3E23EF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 283FE3C7B00
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 080D63C4C1F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:33 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 46150601B18
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:31 +0200 (CEST)
X-QQ-mid: bizesmtp32t1628234666t78m0eu2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 15:24:23 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000C0000000
X-QQ-FEAT: 6k4kXr3IwR8DrhGEmR+4TeUzR+XpUeHKRcu60Tg7FdiAxJ48+0xL71cF4nN9m
 gS+NdMA6+X5ZCopW11R8/431VpA4Pm8P8oSpQdw+yPs8U3JVVbfD7aAcUdLLPp8OM8GlXAH
 n3MM/qE3I/MPxOnk8nFNoO4VdtuDrfy27D4qnTwH16gIBzyCSV33L0yTcfL0sPWwobVFyHY
 uQcsW4zRRimwcg6ZAcVIysAiMRmRtPfZZ5v12iJuSyvDvFxv6e+DddCKnBlipDDee1KPohm
 ufTJQ8p8DL9QuFHTCj3QNWeONtu0r+VEZ4Ym1wiMzSWdszMMyfTIf9x+r41lUJyGaRDMWlc
 HapdHAGUG0wHmRlDHY=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 15:24:21 +0800
Message-Id: <20210806072421.8892-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/chmod03: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/chmod/chmod03.c b/testcases/kernel/syscalls/chmod/chmod03.c
index f53e437e4..1e1d829da 100644
--- a/testcases/kernel/syscalls/chmod/chmod03.c
+++ b/testcases/kernel/syscalls/chmod/chmod03.c
@@ -1,23 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *   Copyright (c) International Business Machines  Corp., 2001
  *
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

-/*
- * Test Name: chmod03
+/*\
+ * [Description]
  *
  * Test Description:
  *  Verify that, chmod(2) will succeed to change the mode of a file
@@ -31,56 +20,10 @@
  *  chmod() should return value 0 on success and succeeds to change
  *  the mode of specified file with sticky bit set on it.
  *
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
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
 #include <pwd.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"

 #define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
 #define PERMS		01777	/*
@@ -89,95 +32,53 @@
 				 */
 #define TESTFILE	"testfile"

-char *TCID = "chmod03";
-int TST_TOTAL = 1;
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
+static char nobody_uid[] = "nobody";
+static struct passwd *ltpuser;

-void setup();			/* Main setup function for the test */
-void cleanup();			/* Main cleanup function for the test */
-
-int main(int ac, char **av)
+static void verify_chmod(void)
 {
 	struct stat stat_buf;
-	int lc;
 	mode_t file_mode;

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
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
+	TST_EXP_PASS_SILENT(chmod(TESTFILE, PERMS), "chmod(%s, %#o) failed",
+		TESTFILE, PERMS);
+	if (TST_PASS) {
+		SAFE_STAT(TESTFILE, &stat_buf);
 		file_mode = stat_buf.st_mode;

 		/* Verify STICKY BIT set on testfile */
 		if ((file_mode & PERMS) != PERMS) {
-			tst_resm(TFAIL, "%s: Incorrect modes 0%3o, "
-				 "Expected 0777", TESTFILE, file_mode);
+			tst_res(TFAIL, "%s: Incorrect modes 0%3o, "
+					"Expected 0777", TESTFILE, file_mode);
 		} else {
-			tst_resm(TPASS, "Functionality of "
-				 "chmod(%s, %#o) successful",
-				 TESTFILE, PERMS);
+			tst_res(TPASS, "Functionality of "
+					"chmod(%s, %#o) successful",
+					TESTFILE, PERMS);
 		}
 	}
-
-	cleanup();
-	tst_exit();
 }

-void setup(void)
+static void setup(void)
 {
 	int fd;

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
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	SAFE_SETEUID(ltpuser->pw_uid);

 	/*
 	 * Create a test file under temporary directory with specified
 	 * mode permissios and set the ownership of the test file to the
 	 * uid/gid of guest user.
 	 */
-	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "open(%s, O_RDWR|O_CREAT, %#o) failed",
-			 TESTFILE, FILE_MODE);
-	}
+	fd = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, FILE_MODE);

-	SAFE_CLOSE(cleanup, fd);
+	SAFE_CLOSE(fd);
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
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_chmod,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+};

-}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
