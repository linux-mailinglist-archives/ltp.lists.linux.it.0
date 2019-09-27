Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE75C04F0
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 14:15:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D58073C14BB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 14:15:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C03303C091C
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 14:15:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2CFEF10009E3
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 14:15:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84FB7B135;
 Fri, 27 Sep 2019 12:15:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Sep 2019 14:15:28 +0200
Message-Id: <20190927121528.31888-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02: skip if cross-fs isn't
 supported
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

copy_file_range02 was written to verify copy_file_range() v5.3 changes.
Detect it via cross-filesystem copy_file_range() functionality, so that we
cover also backports to stable/enterprise distro kernels (if backported,
it should be with all those API fixes).

Missing these API fixes is detected by errno changes introduced by
This fixes errors caused by commits from v5.3-rc1:
5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
96e6e8f4a68d ("vfs: add missing checks to copy_file_range")

This check requires to put back into copy_file_range02 .mount_device = 1
and .mntpoint = MNTPOINT (but .all_filesystems = 1 is obviously not needed).

+ Remove few unused imports.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

pre-release fix, based on Amir's suggestions:
https://marc.info/?l=linux-xfs&m=156952762409662&w=2

Kind regards,
Petr

 .../copy_file_range/copy_file_range.h         | 35 +++++++++++++++++--
 .../copy_file_range/copy_file_range01.c       | 22 ++----------
 .../copy_file_range/copy_file_range02.c       | 11 +++++-
 3 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
index 40d05d653..7aa273a9d 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
@@ -7,9 +7,7 @@
 #ifndef __COPY_FILE_RANGE_H__
 #define __COPY_FILE_RANGE_H__
 
-#include <stdbool.h>
-#include <unistd.h>
-#include <sys/sysmacros.h>
+#include <stdio.h>
 #include "lapi/syscalls.h"
 #include "lapi/fs.h"
 
@@ -62,4 +60,35 @@ static int sys_copy_file_range(int fd_in, loff_t *off_in,
 	return -1;
 }
 
+/*
+ * Required setup:
+ * .mount_device = 1
+ * .mntpoint = MNTPOINT
+ */
+static inline int verify_cross_fs_copy_support(void)
+{
+	int i, fd, fd_test;
+
+	if (!test.mount_device)
+		tst_brk(TBROK, "using %s() requires setting .mount_device = 1", __func__);
+
+	if (strcmp(test.mntpoint, MNTPOINT))
+		tst_brk(TBROK, "using %s() requires setting .mntpoint = MNTPOINT ('%s')",
+				__func__, test.mntpoint);
+
+	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
+	/* Writing page_size * 4 of data into test file */
+	for (i = 0; i < (int)(getpagesize() * 4); i++)
+		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
+
+	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
+	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
+
+	SAFE_CLOSE(fd_test);
+	remove(FILE_MNTED_PATH);
+	SAFE_CLOSE(fd);
+
+	return TST_ERR == EXDEV ? 0 : 1;
+}
+
 #endif /* __COPY_FILE_RANGE_H__ */
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
index ec55e5da1..3f3ef3b58 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
@@ -16,8 +16,6 @@
 
 #define _GNU_SOURCE
 
-#include <stdio.h>
-#include <stdlib.h>
 #include "tst_test.h"
 #include "tst_safe_stdio.h"
 #include "copy_file_range.h"
@@ -179,7 +177,7 @@ static void copy_file_range_verify(unsigned int n)
 
 	if (tc->flags && !cross_sup) {
 		tst_res(TCONF,
-			"copy_file_range doesn't support cross-device, skip it");
+			"copy_file_range() doesn't support cross-device, skip it");
 		return;
 	}
 
@@ -215,25 +213,9 @@ static void copy_file_range_verify(unsigned int n)
 
 static void setup(void)
 {
-	int i, fd, fd_test;
-
 	syscall_info();
-
 	page_size = getpagesize();
-	cross_sup = 1;
-	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
-	/* Writing page_size * 4 of data into test file */
-	for (i = 0; i < (int)(page_size * 4); i++)
-		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
-
-	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
-	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
-	if (TST_ERR == EXDEV)
-		cross_sup = 0;
-
-	SAFE_CLOSE(fd_test);
-	remove(FILE_MNTED_PATH);
-	SAFE_CLOSE(fd);
+	cross_sup = verify_cross_fs_copy_support();
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index d6e843ee4..938d1abb5 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -49,6 +49,7 @@ static int fd_blkdev;
 static int fd_chrdev;
 static int fd_fifo;
 static int fd_copy;
+static int need_unlink;
 
 static int chattr_i_nsup;
 static int swap_nsup;
@@ -160,7 +161,8 @@ static void cleanup(void)
 		SAFE_CLOSE(fd_dup);
 	if (fd_copy > 0)
 		SAFE_CLOSE(fd_copy);
-	SAFE_UNLINK(FILE_FIFO);
+	if (need_unlink > 0)
+		SAFE_UNLINK(FILE_FIFO);
 }
 
 static void setup(void)
@@ -168,6 +170,10 @@ static void setup(void)
 	syscall_info();
 	char dev_path[1024];
 
+	if (!verify_cross_fs_copy_support())
+		tst_brk(TCONF,
+			"copy_file_range() doesn't support cross-device, skip it");
+
 	if (access(FILE_DIR_PATH, F_OK) == -1)
 		SAFE_MKDIR(FILE_DIR_PATH, 0777);
 	/*
@@ -177,6 +183,7 @@ static void setup(void)
 	loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
 
 	SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
+	need_unlink = 1;
 
 	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
 	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
@@ -223,6 +230,8 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
 	.cleanup = cleanup,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.test_variants = TEST_VARIANTS,
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
