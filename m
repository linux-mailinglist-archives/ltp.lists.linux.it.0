Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F39FA146E34
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0B843C254C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9CE473C24FF
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E12BF602147
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 60264AFB1
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 16:20:20 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 17:20:18 +0100
Message-Id: <20200123162019.18958-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123162019.18958-1-mdoucha@suse.cz>
References: <20200123162019.18958-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/3] Add test for misaligned fallocate()
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

Make sure that space allocation and deallocation works (or fails) correctly
even when the requested file range does not align with filesystem blocks.

Test on:
- empty file system
- full file system
- also test with and without copy-on-write when supported

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/fallocate/fallocate06.c   | 253 ++++++++++++++++++
 2 files changed, 254 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fallocate/fallocate06.c

diff --git a/runtest/syscalls b/runtest/syscalls
index fa87ef63f..ec522e8fa 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -184,6 +184,7 @@ fallocate02 fallocate02
 fallocate03 fallocate03
 fallocate04 fallocate04
 fallocate05 fallocate05
+fallocate06 fallocate06
 
 fsetxattr01 fsetxattr01
 fsetxattr02 fsetxattr02
diff --git a/testcases/kernel/syscalls/fallocate/fallocate06.c b/testcases/kernel/syscalls/fallocate/fallocate06.c
new file mode 100644
index 000000000..406249740
--- /dev/null
+++ b/testcases/kernel/syscalls/fallocate/fallocate06.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * Tests misaligned fallocate()
+ * Test scenario:
+ * 1. write() several blocks worth of data
+ * 2. fallocate() some more space (not aligned to FS blocks)
+ * 3. try to write() into the allocated space
+ * 4. deallocate misaligned part of file range written in step 1
+ * 5. read() the deallocated range and check that it was zeroed
+ *
+ * Subtests:
+ * - fill file system between step 2 and 3
+ * - disable copy-on-write on test file
+ * - combinations of above subtests
+ */
+
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <fcntl.h>
+#include <sys/ioctl.h>
+#include <linux/fs.h>
+#include "tst_test.h"
+#include "lapi/fallocate.h"
+
+#define MNTPOINT "mntpoint"
+#define TEMPFILE MNTPOINT "/test_file"
+#define WRITE_BLOCKS 8
+#define FALLOCATE_BLOCKS 2
+#define DEALLOCATE_BLOCKS 3
+#define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
+
+const struct test_case {
+	int no_cow, fill_fs;
+} testcase_list[] = {
+	{1, 0},
+	{1, 1},
+	{0, 0},
+	{0, 1}
+};
+
+static int cow_support;
+static char *wbuf, *rbuf;
+static blksize_t blocksize;
+static long wbuf_size, rbuf_size, block_offset;
+
+static int toggle_cow(int fd, int enable)
+{
+	int ret, attr;
+
+	ret = ioctl(fd, FS_IOC_GETFLAGS, &attr);
+
+	if (ret)
+		return ret;
+
+	if (enable)
+		attr &= ~FS_NOCOW_FL;
+	else
+		attr |= FS_NOCOW_FL;
+
+	return ioctl(fd, FS_IOC_SETFLAGS, &attr);
+}
+
+static void setup(void) {
+	unsigned char ch;
+	long i;
+	int fd;
+	struct stat statbuf;
+
+	fd = SAFE_OPEN(TEMPFILE, O_WRONLY | O_CREAT | O_TRUNC);
+
+	/*
+	 * Set FS_NOCOW_FL flag on the temp file. Non-CoW filesystems will
+	 * return error.
+	 */
+	TEST(toggle_cow(fd, 0));
+	SAFE_FSTAT(fd, &statbuf);
+	blocksize = statbuf.st_blksize;
+	block_offset = MIN(blocksize / 2, 512);
+	wbuf_size = MAX(WRITE_BLOCKS, FALLOCATE_BLOCKS) * blocksize;
+	rbuf_size = (DEALLOCATE_BLOCKS + 1) * blocksize;
+	SAFE_CLOSE(fd);
+	SAFE_UNLINK(TEMPFILE);
+
+	if (blocksize < 2)
+		tst_brk(TCONF, "Block size %ld too small for test", blocksize);
+
+	if (!TST_RET)
+		cow_support = 1;
+	else switch (TST_ERR) {
+	case ENOTSUP:
+	case ENOTTY:
+	case EINVAL:
+	case ENOSYS:
+		cow_support = 0;
+		break;
+
+	default:
+		tst_brk(TBROK|TTERRNO, "Error checking copy-on-write support");
+	}
+
+	tst_res(TINFO, "Copy-on-write is%s supported",
+		cow_support ? "" : " not");
+	wbuf = SAFE_MALLOC(wbuf_size);
+	rbuf = SAFE_MALLOC(rbuf_size);
+
+	/* Fill the buffer with known values */
+	for (i = 0, ch = 1; i < wbuf_size; i++, ch++) {
+		wbuf[i] = ch;
+	}
+}
+
+static int check_result(const struct test_case *tc, const char *func, long exp)
+{
+	if (tc->fill_fs && !tc->no_cow && TST_RET < 0) {
+		if (TST_RET != -1) {
+			tst_res(TFAIL, "%s returned unexpected value %ld",
+				func, TST_RET);
+			return 0;
+		}
+
+		if (TST_ERR != ENOSPC) {
+			tst_res(TFAIL | TTERRNO, "%s should fail with ENOSPC",
+				func);
+			return 0;
+		}
+
+		tst_res(TPASS | TTERRNO, "%s on full FS with CoW", func);
+	} else if (TST_RET < 0) {
+		tst_res(TFAIL | TTERRNO, "%s failed unexpectedly", func);
+		return 0;
+	} else if (TST_RET != exp) {
+		tst_res(TFAIL,
+			"Unexpected return value from %s: %ld (expected %ld)",
+			func, TST_RET, exp);
+		return 0;
+	} else
+		tst_res(TPASS, "%s successful", func);
+
+	return 1;
+}
+
+static void run(unsigned int n)
+{
+	int fd;
+	long offset, size;
+	const struct test_case *tc = testcase_list + n;
+
+	tst_res(TINFO, "Case %u. Fill FS: %s; Use copy on write: %s", n+1,
+		tc->fill_fs ? "yes" : "no", tc->no_cow ? "no" : "yes");
+	fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT | O_TRUNC);
+
+	if (cow_support)
+		toggle_cow(fd, !tc->no_cow);
+	else if (!tc->no_cow)
+		tst_brk(TCONF, "File system does not support copy-on-write");
+
+	/* Prepare test data for deallocation test */
+	size = WRITE_BLOCKS * blocksize;
+	TEST(write(fd, wbuf, size));
+
+	if (TST_RET < 0)
+		tst_res(TFAIL | TTERRNO, "write() failed unexpectedly");
+	else if (TST_RET != size)
+		tst_res(TFAIL, "Short write(): %ld bytes (expected %ld)",
+			TST_RET, size);
+	else
+		tst_res(TPASS, "write() wrote %ld bytes", TST_RET);
+
+	/* Allocation test */
+	offset = size + block_offset;
+	size = FALLOCATE_BLOCKS * blocksize;
+	TEST(fallocate(fd, 0, offset, size));
+
+	if (TST_RET) {
+		if (TST_ERR == ENOTSUP) {
+			SAFE_CLOSE(fd);
+			tst_brk(TCONF | TTERRNO, "fallocate() not supported");
+		}
+
+		tst_brk(TBROK | TTERRNO, "fallocate(fd, 0, %ld, %ld)", offset,
+			size);
+	}
+
+	if (tc->fill_fs)
+		tst_fill_fs(MNTPOINT, 1);
+
+	SAFE_LSEEK(fd, offset, SEEK_SET);
+	TEST(write(fd, wbuf, size));
+	if (check_result(tc, "write()", size))
+		tst_res(TPASS, "Misaligned allocation works as expected");
+
+	/* Deallocation test */
+	size = DEALLOCATE_BLOCKS * blocksize;
+	offset = block_offset;
+	TEST(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, offset,
+		size));
+
+	if (TST_RET == -1 && TST_ERR == ENOTSUP) {
+		tst_res(TCONF | TTERRNO, TESTED_FLAGS);
+	} else if (check_result(tc, TESTED_FLAGS, 0) && !TST_RET) {
+		int i, err = 0;
+
+		SAFE_LSEEK(fd, 0, SEEK_SET);
+		SAFE_READ(1, fd, rbuf, rbuf_size);
+
+		for (i = offset; i < offset + size; i++) {
+			if (rbuf[i]) {
+				err = 1;
+				break;
+			}
+		}
+
+		err = err || memcmp(rbuf, wbuf, offset);
+		offset += size;
+		size = rbuf_size - offset;
+		err = err || memcmp(rbuf + offset, wbuf + offset, size);
+
+		if (err)
+			tst_res(TFAIL, TESTED_FLAGS
+				" did not clear the correct file range.");
+		else
+			tst_res(TPASS, TESTED_FLAGS
+				" cleared the correct file range");
+	}
+
+	SAFE_CLOSE(fd);
+	tst_purge_dir(MNTPOINT);
+}
+
+static void cleanup(void)
+{
+	free(wbuf);
+	free(rbuf);
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.needs_root = 1,
+	.mount_device = 1,
+	.dev_min_size = 512,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+};
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
