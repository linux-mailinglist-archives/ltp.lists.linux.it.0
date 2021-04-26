Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589636AFDA
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:42:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23FEC3C66D1
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 10:42:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CBF83C1DA6
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:42:15 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 046B8200B93
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 10:42:13 +0200 (CEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FTJGK00D6zpc0M
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 16:39:04 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 26 Apr 2021 16:42:03 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Apr 2021 16:42:14 +0800
Message-ID: <20210426084215.259071-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426084215.259071-1-xieziyao@huawei.com>
References: <20210426084215.259071-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/sendfile: Convert sendfile03 to the new
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

1. Convert sendfile04 to the new API;
2. Remove the useless testcase in which out_fd = -1 and in_fd = -1.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 .../kernel/syscalls/sendfile/sendfile03.c     | 190 ++++--------------
 1 file changed, 37 insertions(+), 153 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile03.c b/testcases/kernel/syscalls/sendfile/sendfile03.c
index cd790ccde..72dce40b9 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile03.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile03.c
@@ -1,179 +1,63 @@
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
+ * 07/2001 Ported by Wayne Boyer
  */

-/*
- * NAME
- *	sendfile03.c
- *
- * DESCRIPTION
- *	Testcase to test that sendfile(2) system call returns appropriete
- *	errnos on error.
+/*\
+ * [Description]
  *
- * ALGORITHM
- *	1. Call sendfile(2) with out_fd = -1, and expect EBADF to be returned.
- *	2. Call sendfile(2) with in_fd = -1, and expect EBADF to be returned.
- *	3. Call sendfile(2) with in_fd = out_fd = -1, and expect EBADF.
+ * Testcase to test that sendfile(2) system call returns EBADF when passing
+ * negative out_fd or in_fd.
  *
- * USAGE:  <for command-line>
- *  sendfile03 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+ * [Algorithm]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- *	NONE
+ * - call sendfile(2) with out_fd = -1, and expect EBADF to be returned
+ * - call sendfile(2) with in_fd = -1, and expect EBADF to be returned
  */

 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <sys/sendfile.h>
-#include "test.h"
-
-#define FAILED 1

-#ifndef OFF_T
-#define OFF_T off_t
-#endif /* Not def: OFF_T */
+#include "tst_test.h"

-TCID_DEFINE(sendfile03);
-int TST_TOTAL = 3;
-
-int in_fd, out_fd;
-char in_file[100], out_file[100];
-
-void cleanup(void);
-void setup(void);
-void setup_func1(void);
+static int in_fd;
+static int out_fd;
+static int negative_fd = -1;

 struct test_case_t {
-	char *desc;
-	void (*setupfunc) ();
-	int out_fd;
-	int in_fd;
-	OFF_T *offset;
-	int count;
-	int exp_errno;
-} testcases[] = {
-	{
-	"Test for EBADF, in_fd = -1", NULL, 8, -1, NULL, 0, EBADF}, {
-	"Test for EBADF, out_fd = -1", NULL, -1, 7, NULL, 0, EBADF}, {
-	"Test for EBADF, in_fd = out_fd = -1", NULL, -1, -1, NULL,
-		    0, EBADF}
+	int *in_fd;
+	int *out_fd;
+	const char *desc;
+} tc[] = {
+	{&in_fd, &negative_fd, "out_fd=-1"},
+	{&negative_fd, &out_fd, "in_fd=-1"},
 };

-int main(int ac, char **av)
+static void setup(void)
 {
-	int i;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/*
-	 * The following loop checks looping state if -c option given
-	 */
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			if (testcases[i].setupfunc != NULL) {
-				testcases[i].setupfunc();
-			}
-
-			TEST(sendfile(testcases[i].out_fd, testcases[i].in_fd,
-				      testcases[i].offset, testcases[i].count));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO != testcases[i].exp_errno) {
-				tst_resm(TFAIL, "sendfile returned unexpected "
-					 "errno, expected: %d, got: %d",
-					 testcases[i].exp_errno, TEST_ERRNO);
-			} else {
-				tst_resm(TPASS, "sendfile() returned %d : %s",
-					 TEST_ERRNO, strerror(TEST_ERRNO));
-			}
-		}
-	}
-	cleanup();
-
-	tst_exit();
+	in_fd = SAFE_OPEN("in_file", O_CREAT | O_RDWR, 0600);
+	out_fd = SAFE_CREAT("out_file", 0600);
 }

-/*
- * setup() - performs all ONE TIME setup for this test.
- */
-void setup(void)
+static void cleanup(void)
 {
-	char buf[100];
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
-	sprintf(out_file, "out.%d", getpid());
-	if ((out_fd = open(out_file, O_TRUNC | O_CREAT | O_RDWR, 0777)) < 0) {
-		tst_brkm(TBROK, cleanup, "open failed, errno: %d", errno);
-	}
+	SAFE_CLOSE(in_fd);
+	SAFE_CLOSE(out_fd);
 }

-/*
- * cleanup() - performs all ONE TIME cleanup for this test at
- *	       completion or premature exit.
- */
-void cleanup(void)
+static void run(unsigned int i)
 {
-	/*
-	 * print timing stats if that option was specified.
-	 * print errno log if that option was specified.
-	 */
-	close(out_fd);
-	close(in_fd);
-
-	/* delete the test directory created in setup() */
-	tst_rmdir();
-
+	TST_EXP_FAIL(sendfile(*(tc[i].out_fd), *(tc[i].in_fd), NULL, 1),
+		     EBADF, "sendfile(..) with %s", tc[i].desc);
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.cleanup = cleanup,
+	.setup = setup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
