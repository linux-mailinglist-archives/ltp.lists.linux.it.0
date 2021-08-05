Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C33E0F4A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 09:34:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0559F3C7D90
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 09:34:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B3C6F3C5F37
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 09:34:18 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0155C140051E
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 09:34:16 +0200 (CEST)
X-QQ-mid: bizesmtp52t1628148850tj0mrv4w
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 05 Aug 2021 15:34:06 +0800 (CST)
X-QQ-SSF: 0140000000200020B000000A0000000
X-QQ-FEAT: uPKj8ga2w7HKFXHXQWoNQza7tVqpRg089AKtYwrYwxpL60CnQOeJ9jhd7zmJC
 r8T7oZ0gRBMH8RrJ97Wr7mhWfvG8gAiGvwk8r+JUpmdZR1inMjg8aq7w2aGQtIJaePuaduM
 m2mGbyTWJxalyY+WlxfDAXIUokzp/0kp5DjjMZCTnSXlqfR5y1XOVOmJUM5p2YzglWJAuDE
 +YmPEisQtvRclvyPCnvfYfa2z8OJ9hKUH01fSq1arrXUmRM387KaVcxQeY/JG/1hQvxMcBr
 YIal+Go6XuJG4qJ3TqiY/5KBcm2SkQTAMksPO+DlCSUFx+64cn7xbCODd9IdauPdVlVgwfI
 owEMcPBqiqZ1sQPNQ8BCey7DbUKzg==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  5 Aug 2021 15:34:05 +0800
Message-Id: <20210805073405.15310-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] [2/4] syscalls/chroot02: Convert to new API
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

diff --git a/testcases/kernel/syscalls/chroot/chroot02.c b/testcases/kernel/syscalls/chroot/chroot02.c
index e483ca4b5..ac8bff304 100644
--- a/testcases/kernel/syscalls/chroot/chroot02.c
+++ b/testcases/kernel/syscalls/chroot/chroot02.c
@@ -1,148 +1,78 @@
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
  */

-/*
- * NAME
- *	chroot02.c
- *
- * DESCRIPTION
- *	Test functionality of chroot(2)
- *
- * ALGORITHM
- *	Change root directory and then stat a file.
- *
- * USAGE:  <for command-line>
- *  chroot02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+/*\
+ * [DESCRIPTION]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	04/2003 Modified by Manoj Iyer - manjo@mail.utexas.edu
- *	Change testcase to chroot into a temporary directory
- *	and stat() a known file.
- *
- * RESTRICTIONS
- *	NONE
+ * Change root directory and then stat a file.
  */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/wait.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <errno.h>
-#include "test.h"
+#include <sys/stat.h>
 #include <fcntl.h>
-
-char *TCID = "chroot02";
-int TST_TOTAL = 1;
-int fileHandle = 0;
+#include "tst_test.h"

 #define TMP_FILENAME	"chroot02_testfile"
+int fileHandle = 0;
 struct stat buf;

-void setup(void);
-void cleanup(void);
-
-int main(int ac, char **av)
+static void verify_chroot(void)
 {
-	int lc;
 	int pid, status, retval;

-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* Check for looping state if -i option is given */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		if ((pid = FORK_OR_VFORK()) == -1) {
-			tst_brkm(TBROK, cleanup, "Could not fork");
-		}
+	if ((pid = SAFE_FORK()) == -1) {
+		tst_brk(TBROK, "Could not fork");
+	}

-		if (pid == 0) {
-			retval = 0;
+	if (pid == 0) {
+		retval = 0;

-			if (chroot(tst_get_tmpdir()) == -1) {
-				perror("chroot failed");
+		if (chroot(tst_get_tmpdir()) == -1) {
+			perror("chroot failed");
+			retval = 1;
+		} else {
+			if (stat("/" TMP_FILENAME, &buf) == -1) {
 				retval = 1;
-			} else {
-				if (stat("/" TMP_FILENAME, &buf) == -1) {
-					retval = 1;
-					perror("stat failed");
-				}
+				perror("stat failed");
 			}
-
-			exit(retval);
 		}

-		/* parent */
-		wait(&status);
-		/* make sure the child returned a good exit status */
-		if (WIFSIGNALED(status) ||
-		    (WIFEXITED(status) && WEXITSTATUS(status) != 0))
-			tst_resm(TFAIL, "chroot functionality incorrect");
-		else
-			tst_resm(TPASS, "chroot functionality correct");
+		exit(retval);
 	}

-	cleanup();
-	tst_exit();
+	/* parent */
+	SAFE_WAIT(&status);
+	/* make sure the child returned a good exit status */
+	if (WIFSIGNALED(status) ||
+			(WIFEXITED(status) && WEXITSTATUS(status) != 0))
+		tst_res(TFAIL, "chroot functionality incorrect");
+	else
+		tst_res(TPASS, "chroot functionality correct");

 }

-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_tmpdir();
 	if ((fileHandle = creat(TMP_FILENAME, 0777)) == -1)
-		tst_brkm(TBROK, cleanup, "failed to create temporary file "
-			 TMP_FILENAME);
+		tst_brk(TBROK, "failed to create temporary file "
+				TMP_FILENAME);
 	if (stat(TMP_FILENAME, &buf) != 0)
-		tst_brkm(TBROK, cleanup, TMP_FILENAME " does not exist");
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+		tst_brk(TBROK, TMP_FILENAME " does not exist");
 }

-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	/*
-	 * print timing stats if that option was specified.
-	 * print errno log if that option was specified.
-	 */
 	close(fileHandle);
-
-	tst_rmdir();
-
 }
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = verify_chroot,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
