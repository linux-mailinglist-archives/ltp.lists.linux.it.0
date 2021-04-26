Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F409C36AFDC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:42:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 769B63C66DD
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 732743C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:42:15 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 00A3A600A53
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:42:13 +0200 (CEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FTJGK0Bshzpc0P
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 16:39:05 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 26 Apr 2021 16:42:03 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Apr 2021 16:42:15 +0800
Message-ID: <20210426084215.259071-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426084215.259071-1-xieziyao@huawei.com>
References: <20210426084215.259071-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile07 to the new
 API
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

Cleanup and convert sendfile07 to the new API.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/sendfile/sendfile07.c     | 221 +++++-------------
 1 file changed, 56 insertions(+), 165 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile07.c b/testcases/kernel/syscalls/sendfile/sendfile07.c
index c93363bad..847b26614 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile07.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile07.c
@@ -1,194 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *   Copyright (c) Red Hat Inc., 2007
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
+ * Copyright (c) Red Hat Inc., 2007
+ * 12/2007 Copyed from sendfile03.c by Masatake YAMATO
  */

-/*
- * NAME
- *	sendfile07.c
- *
- * DESCRIPTION
- *	Testcase to test that sendfile(2) system call returns EAGAIN
- *	when passing blocked out_fd. Here out_fd is opend with O_NONBLOCK.
+/*\
+ * [Description]
  *
- * ALGORITHM
- *      1. Make sockets with socketpair(&p). Use p[1] as out_fd.
- *      2. Set O_NONBLOCK flag of out_fd on.
- *      3. Write much datum to out_fd till write() returns EAGAIN.
- *      4. Call sendfile with out_fd, and expect EAGAIN.
+ * Testcase to test that sendfile(2) system call returns EAGAIN
+ * when passing blocked out_fd. Here out_fd is opend with O_NONBLOCK.
  *
- * USAGE:  <for command-line>
- *  sendfile07 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * [Algorithm]
  *
- * HISTORY
- *	12/2007 Copyed from sendfile03.c by Masatake YAMATO
- *
- * RESTRICTIONS
- *	NONE
+ * 1. Set O_NONBLOCK flag of out_fd on;
+ * 2. Write much datum to out_fd till write() returns EAGAIN;
+ * 3. Call sendfile with out_fd, and expect EAGAIN.
  */

 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <sys/stat.h>
 #include <sys/sendfile.h>
+#include <sys/types.h>
 #include <sys/socket.h>
-#include "test.h"
-
-#ifndef OFF_T
-#define OFF_T off_t
-#endif /* Not def: OFF_T */
-
-TCID_DEFINE(sendfile07);
-int TST_TOTAL = 1;
+#include <sys/mman.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>

-int in_fd, out_fd = 0, ignored_fd = 0;
-char in_file[100];
+#include "tst_test.h"

-/* To make out_fd overflow, write much chars
- to out_fd. MAX_FILL_DATA_LENGTH defines the `much'. */
 #define MAX_FILL_DATA_LENGTH 0xFFFFFFF

-void cleanup(void);
-void setup(void);
+int p[2];
+static int in_fd;
+static int out_fd;
+static char buf[] = "abcdefghijklmnopqrstuvwxyz";

-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	in_fd = SAFE_CREAT("in_file", 00700);
+	SAFE_WRITE(1, in_fd, buf, strlen(buf));
+	SAFE_CLOSE(in_fd);
+	in_fd = SAFE_OPEN("in_file", O_RDONLY);

-	/*
-	 * The following loop checks looping state if -c option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(sendfile(out_fd, in_fd, NULL, 1));
-
-		if (TEST_RETURN != -1) {
-			tst_resm(TFAIL, "call succeeded unexpectedly");
-			continue;
-		}
-
-		if (TEST_ERRNO != EAGAIN) {
-			tst_resm(TFAIL, "sendfile returned unexpected "
-				 "errno, expected: %d, got: %d",
-				 EAGAIN, TEST_ERRNO);
-		} else {
-			tst_resm(TPASS, "sendfile() returned %d : %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-		}
-	}
-
-	cleanup();
-	tst_exit();
-
-}
-
-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
-{
-	char buf[100];
-	int p[2];
-	int i, r;
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/* make a temporary directory and cd to it */
-	tst_tmpdir();
-
-	sprintf(in_file, "in.%d", getpid());
-	if ((in_fd = creat(in_file, 00700)) < 0) {
-		tst_brkm(TBROK, cleanup, "creat failed in setup, errno: %d",
-			 errno);
-	}
-	sprintf(buf, "abcdefghijklmnopqrstuvwxyz");
-	if (write(in_fd, buf, strlen(buf)) < 0) {
-		tst_brkm(TBROK, cleanup, "write failed, errno: %d", errno);
-	}
-	close(in_fd);
-	if ((in_fd = open(in_file, O_RDONLY)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed, errno: %d", errno);
-	}
-
-	/* Make fulfilled out_fd. */
-	if (socketpair(PF_UNIX, SOCK_DGRAM, 0, p) < 0) {
-		tst_brkm(TBROK, cleanup, "socketpair failed, errno: %d", errno);
-	}
-
-	/* Don't close.
-	   You cannot write nothing on out_fd if ignored_fd is closed. */
-	ignored_fd = p[0];
+	SAFE_SOCKETPAIR(PF_UNIX, SOCK_DGRAM, 0, p);
 	out_fd = p[1];
-	if (fcntl(out_fd, F_SETFL, O_WRONLY | O_NONBLOCK) < 0) {
-		tst_brkm(TBROK, cleanup, "fcntl failed, errno: %d", errno);
-	}
-
-	i = MAX_FILL_DATA_LENGTH;
-	while (i > 0) {
-		r = write(out_fd, buf, 1);
-		if (r < 0) {
-			if (errno == EAGAIN) {
+	SAFE_FCNTL(out_fd, F_SETFL, O_WRONLY | O_NONBLOCK);
+	for (int i = 0; i < MAX_FILL_DATA_LENGTH; ++i) {
+		TEST(write(out_fd, buf, 1));
+		if (TST_RET < 0) {
+			if (TST_ERR == EAGAIN)
 				break;
-			} else {
-				tst_brkm(TBROK, cleanup,
-					 "write failed to fill out_fd, errno: %d",
-					 errno);
-			}
+			else
+				tst_brk(TBROK | TTERRNO, "write(out_fd, buf, 1)");
 		}
-		i--;
-	}
-	if (i == 0) {
-		tst_brkm(TBROK, cleanup,
-			 "fail to fill out_fd, write %d bytes but EAGAIN it not returned.",
-			 MAX_FILL_DATA_LENGTH);
+	if (i == MAX_FILL_DATA_LENGTH - 1)
+		tst_brk(TBROK, "fail to fill out_fd, write %d bytes but EAGAIN "
+			       "it not returned.", MAX_FILL_DATA_LENGTH);
 	}
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
-	if (out_fd)
-		close(out_fd);
-	if (ignored_fd)
-		close(ignored_fd);
-	close(in_fd);
-
-	/* delete the test directory created in setup() */
-	tst_rmdir();
+	if (p[0])
+		SAFE_CLOSE(p[0]);
+	if (p[1])
+		SAFE_CLOSE(p[1]);
+	SAFE_CLOSE(in_fd);
+}

+static void run(void)
+{
+	TST_EXP_FAIL(sendfile(out_fd, in_fd, NULL, 1), EAGAIN,
+		     "sendfile(out_fd, in_fd, NULL, 1) with blocked out_fd");
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+	.setup = setup,
+	.test_all = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
