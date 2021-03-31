Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38834F976
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 09:09:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54D9A3C7809
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 09:09:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51D3D3C2329
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 09:09:31 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A5E61A010EF
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 09:09:29 +0200 (CEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9HRq6wFdzPmY7
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 15:06:47 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 15:09:17 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 31 Mar 2021 15:09:12 +0800
Message-ID: <20210331070914.4401-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331070914.4401-1-xieziyao@huawei.com>
References: <20210331070914.4401-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/close: Convert close01 to the new API
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

convert close01 to the new API

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/close/close01.c | 122 +++++++---------------
 1 file changed, 36 insertions(+), 86 deletions(-)

diff --git a/testcases/kernel/syscalls/close/close01.c b/testcases/kernel/syscalls/close/close01.c
index c734ff7d2..fc753f414 100644
--- a/testcases/kernel/syscalls/close/close01.c
+++ b/testcases/kernel/syscalls/close/close01.c
@@ -1,124 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
- *  07/2001 Ported by Wayne Boyer
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
- * along with this program;  if not, write to the Free Software Foundation,
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * 07/2001 Ported by Wayne Boyer
  */

-/*
- * DESCRIPTION
- *	Test that closing a regular file and a pipe works correctly
+/*\
+ * [Description]
+ *
+ * Test that closing a regular file and a pipe works correctly
  */

 #include <stdio.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <sys/stat.h>
-#include "test.h"
-#include "safe_macros.h"
-
-void cleanup(void);
-void setup(void);

-char *TCID = "close01";
-int TST_TOTAL = 2;
+#include "tst_test.h"
+#include "tst_safe_macros.h"

 char fname[40] = "";
-
 int fild, newfd, pipefildes[2];

 struct test_case_t {
 	int *fd;
 	char *type;
-} TC[] = {
+} tc[] = {
 	/* file descriptor for a regular file */
-	{
-	&newfd, "file"},
-	    /* file descriptor for a pipe */
-	{
-	&pipefildes[0], "pipe"}
+	{&newfd, "file"},
+	/* file descriptor for a pipe */
+	{&pipefildes[0], "pipe"}
 };

-int main(int ac, char **av)
+static void run(unsigned int i)
 {
+	fild = SAFE_CREAT(fname, 0777);
+	newfd = SAFE_DUP(fild);
+	SAFE_PIPE(pipefildes);

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
+	TEST(close(*tc[i].fd));

-		SAFE_PIPE(cleanup, pipefildes);
+	if (TST_RET == -1)
+		tst_res(TFAIL, "call failed unexpectedly");

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
+	if (close(*tc[i].fd) == -1)
+		tst_res(TPASS, "%s appears closed", tc[i].type);
+	else
+		tst_res(TFAIL, "%s close succeeded on second attempt",
+			tc[i].type);
 }

-void setup(void)
+static void setup(void)
 {
 	int mypid;

-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
 	umask(0);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	mypid = getpid();
+
 	sprintf(fname, "fname.%d", mypid);
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	close(fild);
+	SAFE_CLOSE(fild);
+}

-	tst_rmdir();
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = run,
+};

-}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
