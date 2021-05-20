Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB038A0C7
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 11:24:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01C283C8758
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 11:24:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3C733C2FED
 for <ltp@lists.linux.it>; Thu, 20 May 2021 11:24:25 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D3524100024A
 for <ltp@lists.linux.it>; Thu, 20 May 2021 11:24:23 +0200 (CEST)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fm43N3skHzqVB8
 for <ltp@lists.linux.it>; Thu, 20 May 2021 17:20:48 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 17:24:19 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 17:24:18 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 20 May 2021 17:24:48 +0800
Message-ID: <20210520092449.162043-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520092449.162043-1-xieziyao@huawei.com>
References: <20210520092449.162043-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2 v2] syscalls/sendfile: Convert sendfile08 to the
 new API
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

Convert sendfile08 to the new API.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Add kernel commit to the tst_test structure as a tags.

 .../kernel/syscalls/sendfile/sendfile08.c     | 142 ++++++------------
 1 file changed, 50 insertions(+), 92 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile08.c b/testcases/kernel/syscalls/sendfile/sendfile08.c
index a29632712..ddb8f1dd2 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile08.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile08.c
@@ -1,123 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2012 Red Hat, Inc.
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */

-/*
+/*\
+ * [Description]
+ *
  * Bug in the splice code has caused the file position on the write side
  * of the sendfile system call to be incorrectly set to the read side file
  * position. This can result in the data being written to an incorrect offset.
  *
- * This is a regression test for kernel commit
- * 2cb4b05e7647891b46b91c07c9a60304803d1688
+ * This is a regression test for kernel commit 2cb4b05e76478.
  */

-#include <sys/sendfile.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <fcntl.h>
 #include <stdio.h>
+#include <fcntl.h>
 #include <string.h>
 #include <unistd.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/sendfile.h>

-#define TEST_MSG_IN "world"
-#define TEST_MSG_OUT "hello"
-#define TEST_MSG_ALL (TEST_MSG_OUT TEST_MSG_IN)
+#include "tst_test.h"

-TCID_DEFINE(sendfile08);
-int TST_TOTAL = 1;
+#define IN_FILE		"in_file"
+#define OUT_FILE	"out_file"
+
+#define TEST_MSG_IN	"world"
+#define TEST_MSG_OUT	"hello"
+#define TEST_MSG_ALL	(TEST_MSG_OUT TEST_MSG_IN)

 static int in_fd;
 static int out_fd;
-static char *in_file = "sendfile08.in";
-static char *out_file = "sendfile08.out";
-
-static void cleanup(void);
-static void setup(void);

-int main(int argc, char *argv[])
+static void run(void)
 {
-	int lc;
-	int ret;
-	char buf[BUFSIZ];
-
-	tst_parse_opts(argc, argv, NULL, NULL);
+	TEST(sendfile(out_fd, in_fd, NULL, strlen(TEST_MSG_IN)));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "sendfile() failed");

-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		TEST(sendfile(out_fd, in_fd, NULL, strlen(TEST_MSG_IN)));
-
-		if (TEST_RETURN == -1)
-			tst_brkm(TBROK | TTERRNO, cleanup, "sendfile() failed");
-
-		ret = SAFE_LSEEK(cleanup, out_fd, 0, SEEK_SET);
-		ret = read(out_fd, buf, BUFSIZ);
-		if (ret == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "read %s failed",
-				 out_file);
-
-		if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL)))
-			tst_resm(TPASS, "sendfile(2) copies data correctly");
-		else
-			tst_resm(TFAIL, "sendfile(2) copies data incorrectly."
-				 " Expect \"%s%s\", got \"%s\"", TEST_MSG_OUT,
-				 TEST_MSG_IN, buf);
-	}
-
-	cleanup();
-	tst_exit();
+	char buf[BUFSIZ];
+	SAFE_LSEEK(out_fd, 0, SEEK_SET);
+	SAFE_READ(0, out_fd, buf, BUFSIZ);
+
+	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL)))
+		tst_res(TPASS, "sendfile(2) copies data correctly");
+	else
+		tst_res(TFAIL, "sendfile(2) copies data incorrectly. "
+			       "Expect \"%s%s\", got \"%s\"",
+			TEST_MSG_OUT, TEST_MSG_IN, buf);
 }

 static void setup(void)
 {
-	int ret;
-
-	/* Disable test if the version of the kernel is less than 2.6.33 */
-	if ((tst_kvercmp(2, 6, 33)) < 0) {
-		tst_resm(TCONF, "The out_fd must be socket before kernel");
-		tst_brkm(TCONF, NULL, "2.6.33, see kernel commit cc56f7d");
-	}
+	in_fd = SAFE_CREAT(IN_FILE, 0700);
+	SAFE_WRITE(1, in_fd, TEST_MSG_IN, strlen(TEST_MSG_IN));
+	SAFE_CLOSE(in_fd);
+	in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);

-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	in_fd = SAFE_CREAT(cleanup, in_file, 0700);
-
-	ret = write(in_fd, TEST_MSG_IN, strlen(TEST_MSG_IN));
-	if (ret == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "Write %s failed", in_file);
-	close(in_fd);
-
-	in_fd = SAFE_OPEN(cleanup, in_file, O_RDONLY);
-	out_fd = SAFE_OPEN(cleanup, out_file, O_TRUNC | O_CREAT | O_RDWR, 0777);
-
-	ret = write(out_fd, TEST_MSG_OUT, strlen(TEST_MSG_OUT));
-	if (ret == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "Write %s failed", out_file);
+	out_fd = SAFE_OPEN(OUT_FILE, O_TRUNC | O_CREAT | O_RDWR, 0777);
+	SAFE_WRITE(1, out_fd, TEST_MSG_OUT, strlen(TEST_MSG_OUT));
 }

 static void cleanup(void)
 {
-	close(out_fd);
-	close(in_fd);
-
-	tst_rmdir();
+	SAFE_CLOSE(in_fd);
+	SAFE_CLOSE(out_fd);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.min_kver = "2.6.33",
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "2cb4b05e76478"},
+		{}
+	}
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
