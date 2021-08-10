Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C913A3E7BEC
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:15:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6417E3C70B4
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 17:15:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F05F3C4E18
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:15:39 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 92B49600708
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 17:15:36 +0200 (CEST)
X-QQ-mid: bizesmtp33t1628608527tevmlifo
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 10 Aug 2021 23:15:22 +0800 (CST)
X-QQ-SSF: 0140000000200040B000000B0000000
X-QQ-FEAT: Tp2hW+Mew+eG/QxuLdRPDjeTdRGANSw/F7VeUmzriKv3A/VADqbJWqm9O0tXj
 zhmYMmz8mqM+jstiP4iyqaCRCd8Pus8DHKa6er7EJq5QhDJwydiK2VOUbwvJ0OCQO+OFTZR
 6nsst9ftihGDrar3i/Ox6MNbxcEuuarMRb13mFE72qbuH8QpjCvj91xhYF27cPfYtTQYfzR
 ELDao6NGZ8teBmBnucsIHg98CLPDXvVpSWbHwn9t1bnlnO6hcqXwbqa3jFBBEXt7SZru0mV
 pCkKozYMNRI8u8pDoehKD7jKgLXIHnFTxaTrm/DXnUHMwCoEbqY4I8tBVRtpqbQLayfNTY2
 1dHCTCK1hsxQY+XKRU=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 10 Aug 2021 23:15:18 +0800
Message-Id: <20210810151518.27618-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] syscalls/chmod01: Convert to new API and add
 directory tests
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

diff --git a/testcases/kernel/syscalls/chmod/chmod01.c b/testcases/kernel/syscalls/chmod/chmod01.c
index 55ddf8a73..4dd39efca 100644
--- a/testcases/kernel/syscalls/chmod/chmod01.c
+++ b/testcases/kernel/syscalls/chmod/chmod01.c
@@ -1,159 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *   Copyright (c) International Business Machines  Corp., 2001
+ *   07/2001 Ported by Wayne Boyer
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
  */

-/*
- * Test Name: chmod01
+/*\
+ * [Description]
  *
  * Test Description:
  *  Verify that, chmod(2) succeeds when used to change the mode permissions
- *  of a file.
+ *  of a file or directory.
  *
  * Expected Result:
  *  chmod(2) should return 0 and the mode permissions set on file should match
  *  the specified mode.
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
- *
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"

-#define FILE_MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
+#define MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
 #define TESTFILE	"testfile"
+#define TESTDIR		"testdir_1"

-char *TCID = "chmod01";
-int TST_TOTAL = 8;
+static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };

-int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
+static struct variant {
+	char *name;
+	unsigned int mode_mask;
+	char *desc;
+} variants[] = {
+	{TESTFILE, S_IFREG, "verify permissions of file"},
+	{TESTDIR, S_IFDIR, "verify permissions of directory"},
+};

-void setup();
-void cleanup();
-
-int main(int ac, char **av)
+static void verify_chmod(unsigned int n)
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
-
-			TEST(chmod(TESTFILE, mode));
-
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
-
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
-
-	cleanup();
-	tst_exit();
+	int mode = modes[n];
+	struct variant *tc = &variants[tst_variant];
+
+	TST_EXP_PASS(chmod(tc->name, mode), "chmod(%s, %04o)",
+	tc->name, mode);
+	if (!TST_PASS)
+		return;
+
+	SAFE_STAT(tc->name, &stat_buf);
+	stat_buf.st_mode &= ~tc->mode_mask;
+
+	if (stat_buf.st_mode == (unsigned int)mode)
+		tst_res(TPASS, "stat(%s) mode=%04o",
+				tc->name, stat_buf.st_mode);
+	else
+		tst_res(TFAIL, "stat(%s) mode=%04o",
+				tc->name, stat_buf.st_mode);
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
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	if (tst_variant)
+		SAFE_MKDIR(variants[tst_variant].name, MODE);
+	else
+		SAFE_TOUCH(variants[tst_variant].name, MODE, NULL);
 }

-void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_variants = ARRAY_SIZE(variants),
+	.tcnt = ARRAY_SIZE(modes),
+	.test = verify_chmod,
+	.needs_tmpdir = 1,
+};
+
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
