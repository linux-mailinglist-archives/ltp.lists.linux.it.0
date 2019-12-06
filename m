Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE131153AF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 15:55:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 499B43C2405
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Dec 2019 15:55:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DD5993C14F0
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 15:55:19 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F31401424A26
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 15:55:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4D9FAB0BF
 for <ltp@lists.linux.it>; Fri,  6 Dec 2019 14:55:18 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  6 Dec 2019 15:55:17 +0100
Message-Id: <20191206145517.3415-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl01: Cleanup & convert to new library
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/ioctl/ioctl01.c | 184 +++++++---------------
 1 file changed, 59 insertions(+), 125 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl01.c b/testcases/kernel/syscalls/ioctl/ioctl01.c
index ceb54aa65..7fb8d417e 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl01.c
@@ -1,26 +1,10 @@
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
+ *  07/2001 Ported by Wayne Boyer
+ *  04/2002 Fixes by wjhuie
  */
-
 /*
- * NAME
- *	ioctl01.c
- *
  * DESCRIPTION
  *	Testcase to check the errnos set by the ioctl(2) system call.
  *
@@ -31,22 +15,6 @@
  *	4. ENOTTY: Pass an non-streams fd in ioctl(fd, cmd, arg)
  *	5. EFAULT: Pass a NULL address for termio
  *
- * USAGE:  <for command-line>
- *  ioctl01 -D /dev/tty[0-9] [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	04/2002 Fixes by wjhuie
- *
- * RESTRICTIONS
- *      test must be run with the -D option
- *      test may have to be run as root depending on the tty permissions
  */
 
 #include <errno.h>
@@ -54,128 +22,94 @@
 #include <stdio.h>
 #include <termio.h>
 #include <termios.h>
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "ioctl01";
-int TST_TOTAL = 5;
+#include "tst_test.h"
 
 #define	INVAL_IOCTL	9999999
 
-static void setup(void);
-static void cleanup(void);
-static void help(void);
-
-static int fd, fd1;
+static int fd, fd_file;
 static int bfd = -1;
 
 static struct termio termio;
 
-static struct test_case_t {
+static struct tcase {
 	int *fd;
 	int request;
 	struct termio *s_tio;
 	int error;
-} TC[] = {
+} tcases[] = {
 	/* file descriptor is invalid */
-	{
-	&bfd, TCGETA, &termio, EBADF},
-	    /* termio address is invalid */
-	{
-	&fd, TCGETA, (struct termio *)-1, EFAULT},
-	    /* command is invalid */
-	    /* This errno value was changed from EINVAL to ENOTTY
-	     * by kernel commit 07d106d0 and bbb63c51
-	     */
-	{
-	&fd, INVAL_IOCTL, &termio, ENOTTY},
-	    /* file descriptor is for a regular file */
-	{
-	&fd1, TCGETA, &termio, ENOTTY},
-	    /* termio is NULL */
-	{
-	&fd, TCGETA, NULL, EFAULT}
+	{&bfd, TCGETA, &termio, EBADF},
+	/* termio address is invalid */
+	{&fd, TCGETA, (struct termio *)-1, EFAULT},
+	/* command is invalid */
+	/* This errno value was changed from EINVAL to ENOTTY
+	 * by kernel commit 07d106d0 and bbb63c51
+	 */
+	{&fd, INVAL_IOCTL, &termio, ENOTTY},
+	/* file descriptor is for a regular file */
+	{&fd_file, TCGETA, &termio, ENOTTY},
+	/* termio is NULL */
+	{&fd, TCGETA, NULL, EFAULT}
 };
 
-static int Devflag;
-static char *devname;
-
-static option_t options[] = {
-	{"D:", &Devflag, &devname},
-	{NULL, NULL, NULL}
-};
+static char *device;
 
-int main(int ac, char **av)
+static void verify_ioctl(unsigned int i)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, options, &help);
-
-	if (!Devflag)
-		tst_brkm(TBROK, NULL, "You must specify a tty device with "
-			 "the -D option.");
-
-	tst_require_root();
+	TEST(ioctl(*(tcases[i].fd), tcases[i].request, tcases[i].s_tio));
 
-	setup();
-
-	fd = SAFE_OPEN(cleanup, devname, O_RDWR, 0777);
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/* loop through the test cases */
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(ioctl(*(TC[i].fd), TC[i].request, TC[i].s_tio));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error)
-				tst_resm(TPASS | TTERRNO, "failed as expected");
-			else
-				tst_resm(TFAIL | TTERRNO,
-					 "failed unexpectedly; expected %d - %s",
-					 TC[i].error, strerror(TC[i].error));
-		}
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "call succeeded unexpectedly");
+		return;
 	}
-	cleanup();
 
-	tst_exit();
-}
+	if (TST_ERR != tcases[i].error) {
+		tst_res(TFAIL | TTERRNO,
+			"failed unexpectedly; expected %s",
+		        tst_strerrno(tcases[i].error));
+		return;
+	}
 
-static void help(void)
-{
-	printf("  -D <tty device> : for example, /dev/tty[0-9]\n");
+	tst_res(TPASS | TTERRNO, "failed as expected");
 }
 
 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	unsigned int i;
 
-	TEST_PAUSE;
+	if (!device)
+		tst_brk(TBROK, "You must specify a tty device with -D option");
 
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
+	fd = SAFE_OPEN(device, O_RDWR, 0777);
 
 	if (tst_kvercmp(3, 7, 0) < 0) {
-		TC[2].error = EINVAL;
+		for (i = 0; i < ARRAY_SIZE(tcases); i++) {
+			if (tcases[i].request == INVAL_IOCTL)
+				tcases[i].error = EINVAL;
+		}
 	}
 
-	/* create a temporary file */
-	fd1 = open("x", O_CREAT, 0777);
-	if (fd1 == -1)
-		tst_resm(TFAIL | TERRNO, "Could not open test file");
+	fd_file = SAFE_OPEN("x", O_CREAT, 0777);
 }
 
 static void cleanup(void)
 {
-	close(fd1);
+	if (fd > 0)
+		SAFE_CLOSE(fd);
 
-	tst_rmdir();
+	if (fd_file > 0)
+		SAFE_CLOSE(fd_file);
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_ioctl,
+	.tcnt = ARRAY_SIZE(tcases),
+	.options = (struct tst_option[]) {
+		{"D:", &device, "-D <tty device> : for example, /dev/tty[0-9]"},
+		{}
+	}
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
