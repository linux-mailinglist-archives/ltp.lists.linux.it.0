Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF53E23F0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 324723C6B94
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 09:24:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 757783C4C1F
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:49 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 230B61000A6C
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 09:24:47 +0200 (CEST)
X-QQ-mid: bizesmtp33t1628234683temg6g72
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 15:24:39 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000C0000000
X-QQ-FEAT: itsx81vBVv0pS+FLn62sGR2oxbQ8U76xC1rujGxvY8//IVg+ZkDBpf2oDKPrd
 a/KyD+JkTMrqCG9vwbOI4DSQhP0XK70uMOYI5aVtEZWOgmIruc5Zc9s+48SBOFe31bXJg00
 N1N4YlaCFY2xy9/c9DOJjGpIdY9wvsltHQgtHtROFO75vOac89k81YCEIWF22um+6W3dBby
 Q/rN3Tq4oNuO9ujFw0TP4HvHvvdAkIRwLM2md0sGIXLEWkiGuTj0DoLT3JPNPRdUX2otMIf
 cjcBG20AoNI7N3NZLRMEDI+7FqojSPeYsiRtO3ZbG/S/CZpFwdlvP9qKtOALmCYLpv3hmUG
 +n+QdrO1knfMKDrs0U=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 15:24:38 +0800
Message-Id: <20210806072438.9093-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] syscalls/chmod04: Convert to new API
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

diff --git a/testcases/kernel/syscalls/chmod/chmod04.c b/testcases/kernel/syscalls/chmod/chmod04.c
index cbc13cf61..4a72a4aa6 100644
--- a/testcases/kernel/syscalls/chmod/chmod04.c
+++ b/testcases/kernel/syscalls/chmod/chmod04.c
@@ -1,24 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
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
- * Test Name: chmod04
+/*\
+ * [Description]
  *
  * Test Description:
  *  Verify that, chmod(2) will succeed to change the mode of a directory
@@ -32,55 +20,10 @@
  *  chmod() should return value 0 on success and succeeds to set sticky bit
  *  on the specified directory.
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

 #define DIR_MODE 	S_IRWXU | S_IRWXG | S_IRWXO
 #define PERMS		01777	/*
@@ -89,103 +32,55 @@
 				 */
 #define TESTDIR		"testdir_4"

-char *TCID = "chmod04";
-int TST_TOTAL = 1;
-char nobody_uid[] = "nobody";
-struct passwd *ltpuser;
-
-void setup();
-void cleanup();
+static char nobody_uid[] = "nobody";
+static struct passwd *ltpuser;

-int main(int ac, char **av)
+static void verify_chmod(void)
 {
 	struct stat stat_buf;	/* stat struct. */
-	int lc;
 	mode_t dir_mode;	/* mode permissions set on testdirectory */
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
+	/*
+		* Call chmod(2) with mode argument to
+		* set sticky bit on TESTDIR
+		*/
+	TST_EXP_PASS_SILENT(chmod(TESTDIR, PERMS), "chmod(%s, %#o) failed",
+		TESTDIR, PERMS);
+	if (TST_PASS) {
 		/*
-		 * Get the file information using
-		 * stat(2).
-		 */
-		if (stat(TESTDIR, &stat_buf) < 0) {
-			tst_brkm(TFAIL, cleanup,
-				 "stat(2) of %s failed, errno:%d",
-				 TESTDIR, TEST_ERRNO);
-		}
+			* Get the file information using
+			* stat(2).
+			*/
+		SAFE_STAT(TESTDIR, &stat_buf);
 		dir_mode = stat_buf.st_mode;

 		/* Verify STICKY BIT SET on directory */
 		if ((dir_mode & PERMS) == PERMS) {
-			tst_resm(TPASS, "Functionality of "
-				 "chmod(%s, %#o) successful",
-				 TESTDIR, PERMS);
+			tst_res(TPASS, "Functionality of "
+					"chmod(%s, %#o) successful",
+					TESTDIR, PERMS);
 		} else {
-			tst_resm(TFAIL, "%s: Incorrect modes 0%03o, "
-				 "Expected 0%03o",
-				 TESTDIR, dir_mode, PERMS);
+			tst_res(TFAIL, "%s: Incorrect modes 0%03o, "
+					"Expected 0%03o",
+					TESTDIR, dir_mode, PERMS);
 		}
 	}
-
-	cleanup();
-	tst_exit();
 }

-/*
- * void
- * setup() - performs all ONE TIME setup for this test.
- *  Create a temporary directory and cd to it.
- *  Create another test directory under temporary directory.
- */
 void setup(void)
 {
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
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	SAFE_SETEUID(ltpuser->pw_uid);
 	/*
 	 * Create a test directory under temporary directory with specified
 	 * mode permissios.
 	 */
-	SAFE_MKDIR(cleanup, TESTDIR, DIR_MODE);
+	SAFE_MKDIR(TESTDIR, DIR_MODE);
 }

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
