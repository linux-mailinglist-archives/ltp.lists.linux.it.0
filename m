Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED956B7F7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jul 2022 13:05:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 583113CA41C
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jul 2022 13:05:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DAC893CA3AC
 for <ltp@lists.linux.it>; Fri,  8 Jul 2022 13:05:37 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 90E21140118E
 for <ltp@lists.linux.it>; Fri,  8 Jul 2022 13:05:35 +0200 (CEST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LfVkC4zmVzcnjR
 for <ltp@lists.linux.it>; Fri,  8 Jul 2022 19:02:59 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.155) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 19:05:04 +0800
To: <ltp@lists.linux.it>
Date: Fri, 8 Jul 2022 19:02:28 +0800
Message-ID: <20220708110228.40301-1-luoxiaoyu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.155]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/open03.c: Rewrite open03.c using new LTP API
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
From: Luo xiaoyu via ltp <ltp@lists.linux.it>
Reply-To: Luo xiaoyu <luoxiaoyu9@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Luo xiaoyu <luoxiaoyu9@huawei.com>
---
 testcases/kernel/syscalls/open/open03.c | 103 +++++++-----------------
 1 file changed, 27 insertions(+), 76 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open03.c b/testcases/kernel/syscalls/open/open03.c
index aa15ee9e9..7926e50f4 100644
--- a/testcases/kernel/syscalls/open/open03.c
+++ b/testcases/kernel/syscalls/open/open03.c
@@ -1,90 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
  */

-#include <sys/types.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
-
-static void setup(void);
-static void cleanup(void);
+/*\
+ * [DESCRIPTION]
+ *
+ * Testcase to check that open a new file with O_RDWR | O_CREAT successfully.
+ */

-char *TCID = "open03";
-int TST_TOTAL = 1;
+#include "tst_test.h"

-static char fname[255];
-static int fd;
+#define TEST_FILE "testfile"

-int main(int ac, char **av)
+static void verify_open(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(open(fname, O_RDWR | O_CREAT, 0700));
-		fd = TEST_RETURN;
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL | TTERRNO,
-				 "open(%s,O_RDWR|O_CREAT,0700) failed", fname);
-		} else {
-			tst_resm(TPASS,
-				 "open(%s, O_RDWR|O_CREAT,0700) returned %ld",
-				 fname, TEST_RETURN);
-
-			SAFE_CLOSE(cleanup, fd);
-			SAFE_UNLINK(cleanup, fname);
-		}
+	int fd;
+
+	TEST(open(TEST_FILE, O_RDWR | O_CREAT, 0700));
+	fd = TST_RET;
+
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO,
+			"open(%s, O_RDWR | O_CREAT, 0700) failed", TEST_FILE);
+	} else {
+		tst_res(TPASS,
+			"open(%s, O_RDWR | O_CREAT, 0700) returned %ld",
+			TEST_FILE, TST_RET);
 	}

-	cleanup();
-	tst_exit();
+	SAFE_CLOSE(fd);
+	SAFE_UNLINK(TEST_FILE);
 }

-static void setup(void)
-{
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();

-	sprintf(fname, "tfile_%d", getpid());
-}

-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = verify_open,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
