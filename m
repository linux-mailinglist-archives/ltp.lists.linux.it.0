Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA5B3959B3
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:25:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 329AC3C90BD
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:25:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 61C1F3C2A0E
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:24:52 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CC6322009D0
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:24:50 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FttC31YW0z5yKM
 for <ltp@lists.linux.it>; Mon, 31 May 2021 19:21:03 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 19:24:45 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 19:24:45 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 31 May 2021 19:25:22 +0800
Message-ID: <20210531112522.9082-3-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531112522.9082-1-xieziyao@huawei.com>
References: <20210531112522.9082-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/fchown: Convert fchown05 to the new API
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

1. Cleanup and convert fchown05 to the new API.
2. Remove duplicate test points.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fchown/fchown05.c | 147 ++++++--------------
 1 file changed, 40 insertions(+), 107 deletions(-)

diff --git a/testcases/kernel/syscalls/fchown/fchown05.c b/testcases/kernel/syscalls/fchown/fchown05.c
index 1897a2e83..4edfe4db8 100644
--- a/testcases/kernel/syscalls/fchown/fchown05.c
+++ b/testcases/kernel/syscalls/fchown/fchown05.c
@@ -1,132 +1,65 @@
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
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
-/*
- * Test Description:
- *  Verify that, fchown(2) succeeds to change the owner and group of a file
- *  specified by file descriptor to any numeric owner(uid)/group(gid) values
- *  when invoked by super-user.
+ * 07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
+/*\
+ * [Description]
+ *
+ * Verify that, fchown() succeeds to change the owner and group of a file
+ * specified by file descriptor to any numeric owner(uid)/group(gid) values
+ * when invoked by super-user.
+ */

-#include "test.h"
-#include "safe_macros.h"
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"
+#include "tst_safe_macros.h"

-#define FILE_MODE	S_IFREG | S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
-#define TESTFILE	"testfile"
+#define FILE_MODE (S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
+#define TESTFILE "testfile"

-TCID_DEFINE(fchown05);
+static int fd;

-static struct test_case_t {
-	char *desc;
-	uid_t user_id;
-	gid_t group_id;
+struct test_case_t {
+	uid_t uid;
+	gid_t gid;
 } tc[] = {
-	{"Change Owner/Group ids", 700, 701},
-	{"Change Owner id only", 702, -1},
-	{"Change Owner id only", 703, 701},
-	{"Change Group id only", -1, 704},
-	{"Change Group id only", 703, 705},
-	{NULL, 0, 0}
+	{700, 701},
+	{702, 701},
+	{702, 703},
+	{704, 705}
 };

-int TST_TOTAL = ARRAY_SIZE(tc);
-
-static void setup(void);
-static void cleanup(void);
-static int fildes;
-
-int main(int ac, char **av)
+static void run(unsigned int i)
 {
 	struct stat stat_buf;
-	int i, lc;
-	uid_t user_id;
-	gid_t group_id;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; tc[i].desc != NULL; i++) {
-			user_id = tc[i].user_id;
-			group_id = tc[i].group_id;

-			TEST(FCHOWN(cleanup, fildes, user_id, group_id));
+	TST_EXP_PASS(FCHOWN(fd, tc[i].uid, tc[i].gid));

-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL | TTERRNO,
-					 "fchown() Fails to %s", tc[i].desc);
-				continue;
-			}
-
-			SAFE_FSTAT(cleanup, fildes, &stat_buf);
-
-			if (user_id == (uid_t)-1)
-				user_id = tc[i - 1].user_id;
-
-			if (group_id == (gid_t)-1)
-				group_id = tc[i - 1].group_id;
-
-			if ((stat_buf.st_uid != user_id) ||
-			    (stat_buf.st_gid != group_id)) {
-				tst_resm(TFAIL, "%s: Incorrect owner"
-					 "ship set, Expected %d %d",
-					 TESTFILE, user_id, group_id);
-			} else {
-				tst_resm(TPASS,
-					 "fchown() succeeds to %s of %s",
-					 tc[i].desc, TESTFILE);
-			}
-		}
+	SAFE_FSTAT(fd, &stat_buf);
+	if (stat_buf.st_uid != tc[i].uid || stat_buf.st_gid != tc[i].gid) {
+		tst_res(TFAIL, "%s: incorrect ownership set, expected %d %d",
+			TESTFILE, tc[i].uid, tc[i].gid);
 	}
-
-	cleanup();
-	tst_exit();
 }

 static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	fildes = SAFE_OPEN(cleanup, TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
+	fd = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
 }

 static void cleanup(void)
 {
-	if (fildes > 0 && close(fildes))
-		tst_resm(TWARN | TERRNO, "close(%s) Failed", TESTFILE);
-
-	tst_rmdir();
+	SAFE_CLOSE(fd);
 }
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tc),
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = run,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
