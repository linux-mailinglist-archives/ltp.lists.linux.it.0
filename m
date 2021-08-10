Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E370D3E7BF1
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:16:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F7E83C70B7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:16:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0232B3C4E18
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:16:16 +0200 (CEST)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5674F1400F8F
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:16:14 +0200 (CEST)
X-QQ-mid: bizesmtp53t1628608570t1e773sk
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 23:16:06 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000B0000000
X-QQ-FEAT: AcVMwFxYow3UmIQM88EPKaX02OwBvPdap+gqsDpp0Qb1Zing0VkwWFrA6F2N5
 KfhOF/uH933zigrJUhWN4YKziZ7WFr4PCb0foLylBN+M1DYtFswU7vrzF3XomJ6k7byPtpf
 vrASqFckMIJBhpQooXR4ReAejphMBgofwpvFPldsoqHghIGFrS/CTj92O+8/ZFwrI7Z3jJX
 8zxUCtWD6M6m9dA2sKFUaLy2mZudr1fZudBe1jIAmIK228Cv3+GErFs/OZdDQMEor/tZ8Ls
 n3awZciJvkP7mUP2zIy/9y/4BRn3YmR0T4NT+YgN0W55XHlgF1lLnEhRpXnxtvHwfiAa2sb
 W4f7nd7OngOwcYsx9kw5fr9elb26w==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 10 Aug 2021 23:16:04 +0800
Message-Id: <20210810151604.28281-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] syscalls/chmod04: Remove the testcase
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

diff --git a/runtest/syscalls b/runtest/syscalls
index 1e627ab47..2f95fd32c 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -64,7 +64,6 @@ chdir04 chdir04
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
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
