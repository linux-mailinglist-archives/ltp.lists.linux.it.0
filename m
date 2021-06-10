Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF63A27E1
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 11:10:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 330683C31BB
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 11:10:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73BF83C1C6B
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 11:10:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id EE0AE201103
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 11:10:53 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AUclZtakbQyIZG4gQN84RpLp+ZlXpDfIQ3DAb?=
 =?us-ascii?q?v31ZSRFFG/Fw9vre+MjzsCWYtN9/Yh8dcK+7UpVoLUm8yXcX2/h1AV7BZniEhI?=
 =?us-ascii?q?LAFugLgrcKqAeQeREWmNQ86Y5QN4B6CPDVSWNxlNvG5mCDeOoI8Z2q97+JiI7l?=
 =?us-ascii?q?o0tQcQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.83,263,1616428800"; d="scan'208";a="109455605"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2021 17:10:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 8F9EF4C36A13
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 17:10:48 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 10 Jun 2021 17:10:48 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 10 Jun 2021 17:10:48 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 10 Jun 2021 17:10:42 +0800
Message-ID: <20210610091043.900863-1-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8F9EF4C36A13.AFBC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/read03: Convert to new API
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

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/read/read03.c | 155 +++++-------------------
 1 file changed, 33 insertions(+), 122 deletions(-)

diff --git a/testcases/kernel/syscalls/read/read03.c b/testcases/kernel/syscalls/read/read03.c
index 28554f5ba..2bee29c13 100644
--- a/testcases/kernel/syscalls/read/read03.c
+++ b/testcases/kernel/syscalls/read/read03.c
@@ -1,146 +1,57 @@
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
- * NAME
- *	read03.c
- *
- * DESCRIPTION
- *	Testcase to check that read() sets errno to EAGAIN
- *
- * ALGORITHM
- *	Create a named pipe (fifo), open it in O_NONBLOCK mode, and
- *	attempt to read from it, without writing to it. read() should fail
- *	with EAGAIN.
- *
- * USAGE:  <for command-line>
- *  read03 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+/*\
+ * [DESCRIPTION]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	NONE
+ * Testcase to check if read() successfully sets errno to EAGAIN when read from
+ * a pipe(fifo, opened in O_NONBLOCK mode) without writing to it.
  */
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <signal.h>
-#include <errno.h>
-#include "test.h"
 
-char *TCID = "read03";
-int TST_TOTAL = 1;
-
-char fifo[100] = "fifo";
-int rfd, wfd;
-struct stat buf;
+#include <stdio.h>
+#include <fcntl.h>
+#include "tst_test.h"
 
-void alarm_handler();
-void setup();
-void cleanup();
+static char fifo[100];
+static int rfd, wfd;
 
-int main(int ac, char **av)
+static void verify_read(void)
 {
-	int lc;
-
 	int c;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/*
-	 * The following loop checks looping state if -i option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		TEST(read(rfd, &c, 1));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "read() failed to fail when nothing "
-				 "is written to a pipe");
-			continue;
-		}
-
-		if (TEST_ERRNO != EAGAIN) {
-			tst_resm(TFAIL, "read set bad errno, expected "
-				 "EAGAIN, got %d", TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "read() succeded in setting errno to "
-				 "EAGAIN");
-		}
-	}
-	cleanup();
-	tst_exit();
-
+	TST_EXP_FAIL(read(rfd, &c, 1), EAGAIN,
+		     "read() when nothing is written to a pipe");
 }
 
-/*
- * setup() - performs all ONE TIME setup for this test
- */
-void setup(void)
+static void setup(void)
 {
+	struct stat buf;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* create a temporary filename */
-	sprintf(fifo, "%s.%d", fifo, getpid());
+	sprintf(fifo, "fifo.%d", getpid());
 
-	/* Create a temporary directory and cd to it */
-	tst_tmpdir();
+	SAFE_MKNOD(fifo, S_IFIFO | 0777, 0);
+	SAFE_STAT(fifo, &buf);
 
-	if (mknod(fifo, S_IFIFO | 0777, 0) < 0) {
-		tst_brkm(TBROK, cleanup, "mknod() failed, errno: %d", errno);
-	}
-	if (stat(fifo, &buf) != 0) {
-		tst_brkm(TBROK, cleanup, "stat() failed, errno: %d", errno);
-	}
 	if ((buf.st_mode & S_IFIFO) == 0) {
-		tst_brkm(TBROK, cleanup, "Mode does not indicate fifo file");
+		tst_brk(TBROK, "Mode does not indicate fifo file");
 	}
 
-	rfd = open(fifo, O_RDONLY | O_NONBLOCK);
-	wfd = open(fifo, O_WRONLY | O_NONBLOCK);
+	rfd = SAFE_OPEN(fifo, O_RDONLY | O_NONBLOCK);
+	wfd = SAFE_OPEN(fifo, O_WRONLY | O_NONBLOCK);
 }
 
-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-
-	close(rfd);
-	close(wfd);
-	unlink(fifo);
-
-	/* delete the test directory created in setup() */
-	tst_rmdir();
-
+	SAFE_CLOSE(rfd);
+	SAFE_CLOSE(wfd);
+	SAFE_UNLINK(fifo);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_read,
+};
-- 
2.31.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
