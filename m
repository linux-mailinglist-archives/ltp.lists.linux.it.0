Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7123E2245
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3A8F3C1DCF
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 06:00:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFCD73C1882
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:25 +0200 (CEST)
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3C83B1A0080C
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 06:00:23 +0200 (CEST)
X-QQ-mid: bizesmtp50t1628222417tfmkdgua
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 06 Aug 2021 12:00:13 +0800 (CST)
X-QQ-SSF: 0140000000200030B000000C0000000
X-QQ-FEAT: Ry58bBY793uudZl4VslGf3ZGOiLDAKzE4Rsx2iKFSty3XKbbbaXzRu2xotk6a
 MdLff4QRT6dcAZGJb8CvRpsJrhHg6xXYL8s+89mUT0IH0h05bMYPGXaX1C4LNSeIWi1oFfM
 bQ8vIDRhKFub4YVtKB6xvoLYmt7MJypey8wNpuIMt4YLdHqQrp5I4+ymN7UmAGYXc4MHIIg
 MVaHkGKl/MdpBDUxRx7i+J55e0bWrNug0NvvAsfxPr8EwOoIq8Poaeh9l9jDL26UMsafpNd
 72c+df4+O1EDbUQjXerIx2tiucC00vBf6MwGwqKMUyYUJKhOVCllGHi1wx4NB2Oh/N+SgFG
 B8Ix9GoDy3H2ZR0nOs=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 12:00:11 +0800
Message-Id: <20210806040011.18375-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [v2,2/4] syscalls/chroot02: Convert to new API
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
index e483ca4b5..ddba17d2e 100644
--- a/testcases/kernel/syscalls/chroot/chroot02.c
+++ b/testcases/kernel/syscalls/chroot/chroot02.c
@@ -1,148 +1,59 @@
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
+ *	 04/2003 Modified by Manoj Iyer - manjo@mail.utexas.edu
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
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *	04/2003 Modified by Manoj Iyer - manjo@mail.utexas.edu
- *	Change testcase to chroot into a temporary directory
- *	and stat() a known file.
+/*\
+ * [DESCRIPTION]
  *
- * RESTRICTIONS
- *	NONE
+ * Change root directory and then stat a file.
  */

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
-struct stat buf;
-
-void setup(void);
-void cleanup(void);
+static int fd;
+static struct stat buf;

-int main(int ac, char **av)
+static void verify_chroot(void)
 {
-	int lc;
-	int pid, status, retval;
-
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
-
-		if (pid == 0) {
-			retval = 0;
-
-			if (chroot(tst_get_tmpdir()) == -1) {
-				perror("chroot failed");
-				retval = 1;
+	if (!SAFE_FORK()) {
+		TST_EXP_PASS_SILENT(chroot(tst_get_tmpdir()), "chroot functionality correct");
+		if (TST_PASS) {
+			if (stat("/" TMP_FILENAME, &buf) == -1) {
+				tst_res(TFAIL, "chroot functionality incorrect");
 			} else {
-				if (stat("/" TMP_FILENAME, &buf) == -1) {
-					retval = 1;
-					perror("stat failed");
-				}
+				tst_res(TPASS, "chroot functionality correct");
 			}
-
-			exit(retval);
 		}
-
-		/* parent */
-		wait(&status);
-		/* make sure the child returned a good exit status */
-		if (WIFSIGNALED(status) ||
-		    (WIFEXITED(status) && WEXITSTATUS(status) != 0))
-			tst_resm(TFAIL, "chroot functionality incorrect");
-		else
-			tst_resm(TPASS, "chroot functionality correct");
 	}
-
-	cleanup();
-	tst_exit();
-
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
-	if ((fileHandle = creat(TMP_FILENAME, 0777)) == -1)
-		tst_brkm(TBROK, cleanup, "failed to create temporary file "
-			 TMP_FILENAME);
-	if (stat(TMP_FILENAME, &buf) != 0)
-		tst_brkm(TBROK, cleanup, TMP_FILENAME " does not exist");
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	fd = SAFE_CREAT(TMP_FILENAME, 0777);
+	SAFE_STAT(TMP_FILENAME, &buf);
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
-	close(fileHandle);
+	SAFE_CLOSE(fd);
+}

-	tst_rmdir();
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = verify_chroot,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+};

-}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
