Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CA36B38E
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:53:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 883C73C6726
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:53:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E4DD3C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:53:31 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 17594200927
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:53:28 +0200 (CEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FTPsS3pm9zkkXf
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 20:51:24 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 26 Apr 2021 20:53:15 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 26 Apr 2021 20:52:22 +0800
Message-ID: <20210426125224.150268-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426125224.150268-1-xieziyao@huawei.com>
References: <20210426125224.150268-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3 v2] syscalls/close: Convert close01 to the new API
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

1. Cleanup and convert close01 to the new API;
2. Add SAFE_CLOSE() to the file descriptor.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Cleanup with TST_EXP_PASS();
2. Add SAFE_CLOSE() to the file descriptor for a pipe.

 testcases/kernel/syscalls/close/close01.c | 134 +++++++---------------
 1 file changed, 40 insertions(+), 94 deletions(-)

diff --git a/testcases/kernel/syscalls/close/close01.c b/testcases/kernel/syscalls/close/close01.c
index c734ff7d2..759c43af0 100644
--- a/testcases/kernel/syscalls/close/close01.c
+++ b/testcases/kernel/syscalls/close/close01.c
@@ -1,124 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
- *  07/2001 Ported by Wayne Boyer
+ * 07/2001 Ported by Wayne Boyer
+ */
+
+/*\
+ * [Description]
  *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
+ * Basic test for the close() syscall.
  *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
+ * [Description]
  *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-
-/*
- * DESCRIPTION
- *	Test that closing a regular file and a pipe works correctly
+ * Test that closing a regular file and a pipe works correctly.
  */

 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <sys/stat.h>
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"

-void cleanup(void);
-void setup(void);
+#define FILENAME "close01_testfile"

-char *TCID = "close01";
-int TST_TOTAL = 2;
+int fild, newfd, pipefildes[2];

-char fname[40] = "";
+static void setup_file(void)
+{
+	newfd = SAFE_DUP(fild);
+}

-int fild, newfd, pipefildes[2];
+static void setup_pipe(void)
+{
+	SAFE_PIPE(pipefildes);
+	SAFE_CLOSE(pipefildes[1]);
+}

 struct test_case_t {
 	int *fd;
 	char *type;
-} TC[] = {
-	/* file descriptor for a regular file */
-	{
-	&newfd, "file"},
-	    /* file descriptor for a pipe */
-	{
-	&pipefildes[0], "pipe"}
+	void (*setupfunc) ();
+} tc[] = {
+	{&newfd, "file", setup_file},
+	{&pipefildes[0], "pipe", setup_pipe}
 };

-int main(int ac, char **av)
+static void run(unsigned int i)
 {
-
-	int i;
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		if ((fild = creat(fname, 0777)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "can't open file %s",
-				 fname);
-
-		if ((newfd = dup(fild)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "can't dup the file des");
-
-		SAFE_PIPE(cleanup, pipefildes);
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(close(*TC[i].fd));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "call failed unexpectedly");
-				continue;
-			}
-
-			if (close(*TC[i].fd) == -1) {
-				tst_resm(TPASS, "%s appears closed",
-					 TC[i].type);
-			} else {
-				tst_resm(TFAIL, "%s close succeeded on"
-					 "second attempt", TC[i].type);
-			}
-		}
-
-	}
-
-	cleanup();
-	tst_exit();
+	tc[i].setupfunc();
+	TST_EXP_PASS(close(*tc[i].fd), "close a %s", tc[i].type);
 }

-void setup(void)
+static void setup(void)
 {
-	int mypid;
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
 	umask(0);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	mypid = getpid();
-	sprintf(fname, "fname.%d", mypid);
+	fild = SAFE_CREAT(FILENAME, 0777);
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	close(fild);
-
-	tst_rmdir();
-
+	SAFE_CLOSE(fild);
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
