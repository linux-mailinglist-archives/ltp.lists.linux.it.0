Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6F122CB6
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 14:17:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B87803C2385
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 14:17:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9411C3C133E
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 14:17:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B044760139A
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 14:17:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB472AEC7;
 Tue, 17 Dec 2019 13:17:03 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 17 Dec 2019 14:17:03 +0100
Message-Id: <20191217131703.16935-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213134002.GE20795@rei.lan>
References: <20191213134002.GE20795@rei.lan>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Use real FS block size in fallocate05
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

fallocate() behavior depends on whether the file range is aligned to full
blocks. Make sure that the test always uses aligned file range so that
the test is consistent across platforms.

Also use the TEST() macro to prevent errno pollution and increase test device
size to avoid weird edge cases that don't happen in the real world.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Using fixed-size buffer in fallocate05 caused some failures in the past
due to allocation requests being misaligned with actual file system blocks.
Btrfs in particular will treat misaligned allocation as regular write()
and apply copy-on-write to partially allocated blocks even on the first real
write().

While that behavior is somewhat surprising, it does make sense. Fix the error
by using multiples of real block size in fallocate() and write().

I'll also write another fallocate() test later for checking FS behavior
on intentionally misaligned allocation. But this fix can be committed before
that.

Changes since v1:
- XFS keeps some free blocks even when write() failed with ENOSPC. Repeat
  fallocate() until it gets ENOSPC, too.
- Deallocate only part of the file. Btrfs will fail this check because it has
  a bug.
- Add description of test scenario in the header comment.
- Increase test device size to 1GB to avoid unrealistic Btrfs edge cases.

 .../kernel/syscalls/fallocate/fallocate05.c   | 108 +++++++++++++-----
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/testcases/kernel/syscalls/fallocate/fallocate05.c b/testcases/kernel/syscalls/fallocate/fallocate05.c
index 17034e5b1..36ca84bdc 100644
--- a/testcases/kernel/syscalls/fallocate/fallocate05.c
+++ b/testcases/kernel/syscalls/fallocate/fallocate05.c
@@ -1,75 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
  */
 
 /*
  * Tests that writing to fallocated file works when filesystem is full.
+ * Test scenario:
+ * - fallocate() some empty blocks
+ * - fill the filesystem
+ * - write() into the preallocated space
+ * - try to fallocate() more blocks until we get ENOSPC
+ * - write() into the extra allocated space
+ * - deallocate part of the file
+ * - write() to the end of file to check that some blocks were freed
  */
 
 #define _GNU_SOURCE
 
 #include <stdio.h>
 #include <stdlib.h>
-#include <errno.h>
 #include <fcntl.h>
 #include "tst_test.h"
 #include "lapi/fallocate.h"
 
 #define MNTPOINT "mntpoint"
-#define FALLOCATE_SIZE (1024*1024)
+#define FALLOCATE_BLOCKS 16
+#define DEALLOCATE_BLOCKS 4
 #define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
 
 static int fd;
+static char *buf = NULL;
 
 static void run(void)
 {
-	char buf[FALLOCATE_SIZE];
-	ssize_t ret;
+	long bufsize, extsize;
+	blksize_t blocksize;
+	struct stat statbuf;
 
 	fd = SAFE_OPEN(MNTPOINT "/test_file", O_WRONLY | O_CREAT);
 
-	if (fallocate(fd, 0, 0, FALLOCATE_SIZE)) {
-		if (errno == EOPNOTSUPP) {
-			tst_res(TCONF | TERRNO, "fallocate() not supported");
+	/*
+	 * Use real FS block size, otherwise fallocate() call will test
+	 * different things on different platforms
+	 */
+	SAFE_FSTAT(fd, &statbuf);
+	blocksize = statbuf.st_blksize;
+	bufsize = FALLOCATE_BLOCKS * blocksize;
+	buf = realloc(buf, bufsize);
+
+	if (!buf) {
+		SAFE_CLOSE(fd);
+		tst_brk(TBROK, "Buffer allocation failed");
+	}
+
+	TEST(fallocate(fd, 0, 0, bufsize));
+
+	if (TST_RET) {
+		if (TST_ERR == ENOTSUP) {
 			SAFE_CLOSE(fd);
-			return;
+			tst_brk(TCONF | TTERRNO, "fallocate() not supported");
 		}
 
-		tst_brk(TBROK | TERRNO,
-			"fallocate(fd, 0, 0, %i)", FALLOCATE_SIZE);
+		tst_brk(TBROK | TTERRNO, "fallocate(fd, 0, 0, %ld)", bufsize);
 	}
 
 	tst_fill_fs(MNTPOINT, 1);
 
-	ret = write(fd, buf, sizeof(buf));
+	TEST(write(fd, buf, bufsize));
 
-	if (ret < 0)
-		tst_res(TFAIL | TERRNO, "write() failed unexpectedly");
+	if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO, "write() failed unexpectedly");
+	else if (TST_RET != bufsize)
+		tst_res(TFAIL,
+			"Short write(): %ld bytes (expected %zu)",
+			TST_RET, bufsize);
 	else
-		tst_res(TPASS, "write() wrote %zu bytes", ret);
+		tst_res(TPASS, "write() wrote %ld bytes", TST_RET);
+
+	/*
+	 * Some file systems may still have a few extra blocks that can be
+	 * allocated.
+	 */
+	for (TST_RET = 0, extsize = 0; !TST_RET; extsize += blocksize) {
+		TEST(fallocate(fd, 0, bufsize + extsize, blocksize));
+	}
 
-	ret = fallocate(fd, 0, FALLOCATE_SIZE, FALLOCATE_SIZE);
-	if (ret != -1)
-		tst_brk(TFAIL, "fallocate() succeeded unexpectedly");
+	if (TST_RET != -1)
+		tst_brk(TFAIL, "Invalid fallocate() return value %ld",
+			TST_RET);
 
-	if (errno != ENOSPC)
-		tst_brk(TFAIL | TERRNO, "fallocate() should fail with ENOSPC");
+	if (TST_ERR != ENOSPC)
+		tst_brk(TFAIL | TTERRNO, "fallocate() should fail with ENOSPC");
 
-	tst_res(TPASS | TERRNO, "fallocate() on full FS");
+	/* The loop above always counts 1 more block than it should. */
+	extsize -= blocksize;
+	tst_res(TINFO, "fallocate()d %ld extra blocks on full FS",
+		extsize / blocksize);
 
-	ret = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, FALLOCATE_SIZE);
-	if (ret == -1) {
-		if (errno == EOPNOTSUPP)
+	for (; extsize > 0; extsize -= TST_RET) {
+		TEST(write(fd, buf, MIN(bufsize, extsize)));
+
+		if (TST_RET <= 0)
+			tst_brk(TFAIL | TTERRNO, "write() failed unexpectedly");
+	}
+
+	tst_res(TPASS, "fallocate() on full FS");
+
+	TEST(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
+		DEALLOCATE_BLOCKS * blocksize));
+
+	if (TST_RET == -1) {
+		if (TST_ERR == ENOTSUP)
 			tst_brk(TCONF, TESTED_FLAGS);
 
-		tst_brk(TBROK | TERRNO, TESTED_FLAGS);
+		tst_brk(TBROK | TTERRNO, TESTED_FLAGS);
 	}
 	tst_res(TPASS, TESTED_FLAGS);
 
-	ret = write(fd, buf, 10);
-	if (ret == -1)
-		tst_res(TFAIL | TERRNO, "write()");
+	TEST(write(fd, buf, 10));
+	if (TST_RET == -1)
+		tst_res(TFAIL | TTERRNO, "write()");
 	else
 		tst_res(TPASS, "write()");
 
@@ -80,12 +131,15 @@ static void cleanup(void)
 {
 	if (fd > 0)
 		SAFE_CLOSE(fd);
+
+	free(buf);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
 	.needs_tmpdir = 1,
 	.mount_device = 1,
+	.dev_min_size = 1024,
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.cleanup = cleanup,
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
