Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C236D102
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 05:56:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6461B3C65C4
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 05:56:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 048B33C0F91
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 05:56:45 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E91C520077D
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 05:56:43 +0200 (CEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FVPsB3gW8zklWr
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 11:54:38 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 28 Apr 2021 11:56:29 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 28 Apr 2021 11:55:58 +0800
Message-ID: <20210428035558.13894-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/unlinkat01: Bugfix and update to new API
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

1) When run the test with option "-i 2", test will fail, and fixed
2) Update to new API

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../kernel/syscalls/unlinkat/unlinkat01.c     | 167 ++++++++----------
 1 file changed, 70 insertions(+), 97 deletions(-)

diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
index 76566e85a..b90142092 100644
--- a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
+++ b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
@@ -1,43 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Oracle and/or its affiliates. All Rights Reserved.
  * Copyright (c) International Business Machines  Corp., 2006
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
- *
- * DESCRIPTION
- *	This test case will verify basic function of unlinkat
- *	added by kernel 2.6.16 or up.
- *
- * Author
- *	Yi Yang <yyangcdl@cn.ibm.com>
+ * AUTHOR: Yi Yang <yyangcdl@cn.ibm.com>
+ */
+
+/*\
+ * [Description]
+ * This test case will verify basic function of unlinkat
+ * added by kernel 2.6.16 or up.
  */

 #define _GNU_SOURCE

-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/time.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <linux/limits.h>
+#include "tst_test.h"
 #include "lapi/syscalls.h"
+#include "tst_safe_stdio.h"

 #define TEST_CASES 7
+
 #ifndef AT_FDCWD
 #define AT_FDCWD -100
 #endif
@@ -45,12 +27,6 @@
 #define AT_REMOVEDIR 0x200
 #endif

-void setup();
-void cleanup();
-
-char *TCID = "unlinkat01";
-int TST_TOTAL = TEST_CASES;
-
 static const char pathname[] = "unlinkattestdir",
 		  subpathname[] = "unlinkatsubtestdir",
 		  subpathdir[] = "unlinkattestdir/unlinkatsubtestdir",
@@ -65,82 +41,79 @@ static const int flags[] = { 0, 0, 0, 0, 9999, 0, AT_REMOVEDIR };

 int myunlinkat(int dirfd, const char *filename, int flags)
 {
-	return ltp_syscall(__NR_unlinkat, dirfd, filename, flags);
+	return tst_syscall(__NR_unlinkat, dirfd, filename, flags);
 }

-int main(int ac, char **av)
+static void run(int i)
 {
-	int lc;
-	int i;
-
-	if ((tst_kvercmp(2, 6, 16)) < 0)
-		tst_brkm(TCONF, NULL, "Test must be run with kernel 2.6.16+");
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(myunlinkat(fds[i], filenames[i], flags[i]));
-
-			if (TEST_ERRNO == expected_errno[i]) {
-				tst_resm(TPASS | TTERRNO,
-					 "unlinkat() returned expected errno");
-			} else {
-				tst_resm(TFAIL | TTERRNO, "unlinkat() failed");
-			}
-		}
-
+	if (!expected_errno[i]) {
+		fds[0] = SAFE_OPEN(pathname, O_DIRECTORY);
+		fds[1] = fds[4] = fds[6] = fds[0];
+
+		/* tesfile2 will be unlinked by test0. */
+		if (access(testfile2, F_OK))
+			SAFE_FILE_PRINTF(testfile2, testfile2);
+
+		/* testfile3 will be unlined by test1. */
+		if (access(testfile3, F_OK))
+			SAFE_OPEN(testfile3, O_CREAT | O_RDWR, 0600);
+
+		/* subpathdir will be unlinked by test6. */
+		if (access(subpathdir, F_OK))
+			SAFE_MKDIR(subpathdir, 0700);
+	} else
+		fds[2] = SAFE_OPEN(testfile3, O_CREAT | O_RDWR, 0600);
+
+	/* testfile must exist except test1 and test6. */
+	if (access(testfile, F_OK))
+		SAFE_FILE_PRINTF(testfile, testfile);
+
+	TEST(myunlinkat(fds[i], filenames[i], flags[i]));
+	if (TST_ERR == expected_errno[i])
+		tst_res(TPASS | TTERRNO, "unlinkat() returned expected errno");
+	else
+		tst_res(TFAIL | TTERRNO, "unlinkat() failed");
+
+	if (!expected_errno[i]) {
+		SAFE_CLOSE(fds[0]);
+	} else {
+		SAFE_CLOSE(fds[2]);
 	}
-
-	cleanup();
-	tst_exit();
 }

-void setup(void)
+static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	tst_tmpdir();
-
-	char *abs_path = tst_get_tmpdir();
-
-	SAFE_ASPRINTF(cleanup, &testfile3, "%s/unlinkatfile3.txt", abs_path);
-
-	free(abs_path);
-
-	SAFE_MKDIR(cleanup, pathname, 0700);
-	SAFE_MKDIR(cleanup, subpathdir, 0700);
+	char buf[PATH_MAX];
+	SAFE_GETCWD(buf, PATH_MAX);
+	SAFE_ASPRINTF(&testfile3, "%s/unlinkatfile3.txt", buf);

-	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
-	fds[1] = fds[4] = fds[6] = fds[0];
-
-	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
-	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-
-	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
+	SAFE_MKDIR(pathname, 0700);

 	fds[3] = 100;
 	fds[5] = AT_FDCWD;

-	filenames[0] = filenames[2] = filenames[3] = filenames[4] =
-	    filenames[5] = testfile;
+	filenames[0] = filenames[2]
+		     = filenames[3]
+		     = filenames[4]
+		     = filenames[5]
+		     = testfile;
+
 	filenames[1] = testfile3;
 	filenames[6] = subpathname;
-
-	TEST_PAUSE;
 }

-void cleanup(void)
+static void cleanup(void)
 {
-	if (fds[0] > 0)
-		close(fds[0]);
-	if (fds[2] > 0)
-		close(fds[2]);
-
-	free(testfile3);
-	tst_rmdir();
+	SAFE_UNLINK(testfile);
+	SAFE_UNLINK(testfile2);
+	SAFE_RMDIR(pathname);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.tcnt = 7,
+	.min_kver = "2.6.16",
+	.setup = setup,
+	.test = run,
+	.cleanup = cleanup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
