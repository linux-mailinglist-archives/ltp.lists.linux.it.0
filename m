Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5043959B5
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:25:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 257983C90BD
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:25:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DEFE3C9098
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:24:52 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A08926005EC
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:24:50 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FttDC0CLlzYp0K
 for <ltp@lists.linux.it>; Mon, 31 May 2021 19:22:03 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 19:24:45 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 19:24:45 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 31 May 2021 19:25:21 +0800
Message-ID: <20210531112522.9082-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531112522.9082-1-xieziyao@huawei.com>
References: <20210531112522.9082-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/fchown: Convert fchown04 to the new API
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

Cleanup and convert fchown04 to the new API.

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fchown/fchown04.c | 179 +++++---------------
 1 file changed, 47 insertions(+), 132 deletions(-)

diff --git a/testcases/kernel/syscalls/fchown/fchown04.c b/testcases/kernel/syscalls/fchown/fchown04.c
index 12e332671..da14920d3 100644
--- a/testcases/kernel/syscalls/fchown/fchown04.c
+++ b/testcases/kernel/syscalls/fchown/fchown04.c
@@ -1,168 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *   Copyright (c) International Business Machines  Corp., 2001
- *	07/2001 Ported by Wayne Boyer
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
- *   along with this program;  if not, write to the Free Software Foundation,
- *   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) International Business Machines  Corp., 2001
+ * 07/2001 Ported by Wayne Boyer
+ * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
  */

-/*
- * Test Description:
- *   Verify that,
- *   1) fchown(2) returns -1 and sets errno to EPERM if the effective user id
- *	of process does not match the owner of the file and the process is
- *	not super user.
- *   2) fchown(2) returns -1 and sets errno to EBADF if the file descriptor
- *	of the specified file is not valid.
- *   3) fchown(2) returns -1 and sets errno to EROFS if the named file resides
- *	on a read-only file system.
+/*\
+ * [Description]
+ *
+ * Verify that:
+ *
+ * 1. fchown() returns -1 and sets errno to EPERM if the effective user id
+ *    of process does not match the owner of the file and the process is
+ *    not super user.
+ * 2. fchown() returns -1 and sets errno to EBADF if the file descriptor
+ *    of the specified file is not valid.
+ * 3. fchown() returns -1 and sets errno to EROFS if the named file resides
+ *    on a read-only file system.
  */

-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <grp.h>
 #include <pwd.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/mount.h>

-#include "test.h"
-#include "safe_macros.h"
-#include "compat_16.h"
+#include "tst_test.h"
+#include "compat_tst_16.h"
+#include "tst_safe_macros.h"

-#define DIR_MODE	(S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP| \
-			 S_IXGRP|S_IROTH|S_IXOTH)
+#define MNT_POINT	"mntpoint"
+#define TEST_FILE	"tfile_1"
+#define MODE		0666
+#define DIR_MODE	(S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP|S_IXGRP|S_IROTH|S_IXOTH)

 static int fd1;
 static int fd2 = -1;
 static int fd3;
-static const char *device;
-static int mount_flag;

 static struct test_case_t {
 	int *fd;
 	int exp_errno;
-} test_cases[] = {
+} tc[] = {
 	{&fd1, EPERM},
 	{&fd2, EBADF},
 	{&fd3, EROFS},
 };

-TCID_DEFINE(fchown04);
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-
-static void setup(void);
-static void fchown_verify(int);
-static void cleanup(void);
-
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++)
-			fchown_verify(i);
-	}
-
-	cleanup();
-	tst_exit();
-}
-
 static void setup(void)
 {
 	struct passwd *ltpuser;
-	const char *fs_type;
-
-	TEST_PAUSE;
-
-	tst_require_root();
-
-	tst_tmpdir();
-
-	fs_type = tst_dev_fs_type();
-	device = tst_acquire_device(cleanup);
-
-	if (!device)
-		tst_brkm(TCONF, cleanup, "Failed to acquire device");
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	fd1 = SAFE_OPEN(cleanup, "tfile_1", O_RDWR | O_CREAT, 0666);

-	tst_mkfs(cleanup, device, fs_type, NULL, NULL);
-	SAFE_MKDIR(cleanup, "mntpoint", DIR_MODE);
-	SAFE_MOUNT(cleanup, device, "mntpoint", fs_type, 0, NULL);
-	mount_flag = 1;
-	SAFE_TOUCH(cleanup, "mntpoint/tfile_3", 0644, NULL);
-	SAFE_MOUNT(cleanup, device, "mntpoint", fs_type,
-		   MS_REMOUNT | MS_RDONLY, NULL);
-	fd3 = SAFE_OPEN(cleanup, "mntpoint/tfile_3", O_RDONLY);
+	fd1 = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, MODE);
+	fd3 = SAFE_OPEN(MNT_POINT, O_RDONLY);

-	ltpuser = SAFE_GETPWNAM(cleanup, "nobody");
-	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
 }

-static void fchown_verify(int i)
+static void run(unsigned int i)
 {
-	UID16_CHECK(geteuid(), "fchown", cleanup)
-	GID16_CHECK(getegid(), "fchown", cleanup)
+	uid_t uid;
+	gid_t gid;

-	TEST(FCHOWN(cleanup, *test_cases[i].fd, geteuid(), getegid()));
+	UID16_CHECK((uid = geteuid()), "fchown");
+	GID16_CHECK((gid = getegid()), "fchown");

-	if (TEST_RETURN == -1) {
-		if (TEST_ERRNO == test_cases[i].exp_errno) {
-			tst_resm(TPASS | TTERRNO, "fchown failed as expected");
-		} else {
-			tst_resm(TFAIL | TTERRNO,
-				 "fchown failed unexpectedly; expected %d - %s",
-				 test_cases[i].exp_errno,
-				 strerror(test_cases[i].exp_errno));
-		}
-	} else {
-		tst_resm(TFAIL, "fchown passed unexpectedly");
-	}
+	TST_EXP_FAIL(FCHOWN(*tc[i].fd, uid, gid), tc[i].exp_errno);
 }

 static void cleanup(void)
 {
-	if (seteuid(0))
-		tst_resm(TWARN | TERRNO, "Failet to seteuid(0) before cleanup");
-
-	if (fd1 > 0 && close(fd1))
-		tst_resm(TWARN | TERRNO, "Failed to close fd1");
-
-	if (fd3 > 0 && close(fd3))
-		tst_resm(TWARN | TERRNO, "Failed to close fd3");
-
-	if (mount_flag && tst_umount("mntpoint") < 0)
-		tst_resm(TWARN | TERRNO, "umount device:%s failed", device);
-
-	if (device)
-		tst_release_device(device);
-
-	tst_rmdir();
+	SAFE_SETEUID(0);
+	SAFE_CLOSE(fd1);
+	SAFE_CLOSE(fd3);
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_rofs = 1,
+	.mntpoint = MNT_POINT,
+	.tcnt = ARRAY_SIZE(tc),
+	.test = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
