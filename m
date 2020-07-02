Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94B2125E4
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 16:15:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34E073C2A4D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 16:15:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E99A43C0781
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 16:15:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7679E1A01157
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 16:15:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B02DADC2
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 14:15:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Jul 2020 16:15:03 +0200
Message-Id: <20200702141503.2556-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Use fallocate() to create loop device backing file
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

Creating large loop device backing files using tst_fill_file() on shared
testing machines  may lead to performance issues and timeouts. Preallocating
space using fallocate() is fast and sufficient.

Space allocation will fall back to tst_fill_file() if fallocate() fails for any
other reason than lack of space.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 doc/test-writing-guidelines.txt | 20 +++++++++++++++++
 include/tst_fs.h                | 17 ++++++++++++++
 lib/tst_device.c                |  2 +-
 lib/tst_fill_file.c             | 40 +++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 6e466ed0f..4e7ee1628 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1225,11 +1225,31 @@ Fill a file with specified pattern using file descriptor.
 -------------------------------------------------------------------------------
 #include "tst_test.h"
 
+int tst_prealloc_size_fd(int fd, size_t bs, size_t bcount);
+-------------------------------------------------------------------------------
+
+Preallocate the specified amount of space using 'fallocate()'. Falls back to
+'tst_fill_fd()' if 'fallocate()' fails.
+
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
 int tst_fill_file(const char *path, char pattern, size_t bs, size_t bcount);
 -------------------------------------------------------------------------------
 
 Creates/overwrites a file with specified pattern using file path.
 
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
+int tst_prealloc_file(const char *path, size_t bs, size_t bcount);
+-------------------------------------------------------------------------------
+
+Create/overwrite a file and preallocate the specified amount of space for it.
+The allocated space will not be initialized to any particular content.
+
 2.2.19 Getting an unused PID number
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/include/tst_fs.h b/include/tst_fs.h
index bcef87a40..fc0390582 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -140,6 +140,15 @@ int tst_get_path(const char *prog_name, char *buf, size_t buf_len);
  */
 int tst_fill_fd(int fd, char pattern, size_t bs, size_t bcount);
 
+/*
+ * Preallocate space in open file. If fallocate() fails, falls back to
+ * using tst_fill_fd().
+ * @fd: file descriptor
+ * @bs: block size
+ * @bcount: blocks count
+ */
+int tst_prealloc_size_fd(int fd, size_t bs, size_t bcount);
+
 /*
  * Creates/ovewrites a file with specified pattern
  * @path: path to file
@@ -149,6 +158,14 @@ int tst_fill_fd(int fd, char pattern, size_t bs, size_t bcount);
  */
 int tst_fill_file(const char *path, char pattern, size_t bs, size_t bcount);
 
+/*
+ * Creates file of specified size. Space will be only preallocated if possible.
+ * @path: path to file
+ * @bs: block size
+ * @bcount: blocks amount
+ */
+int tst_prealloc_file(const char *path, size_t bs, size_t bcount);
+
 #define TST_FS_SKIP_FUSE 0x01
 
 /*
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 67fe90ed6..b46ae722e 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -232,7 +232,7 @@ const char *tst_acquire_loop_device(unsigned int size, const char *filename)
 {
 	unsigned int acq_dev_size = MAX(size, DEV_SIZE_MB);
 
-	if (tst_fill_file(filename, 0, 1024 * 1024, acq_dev_size)) {
+	if (tst_prealloc_file(filename, 1024 * 1024, acq_dev_size)) {
 		tst_resm(TWARN | TERRNO, "Failed to create %s", filename);
 		return NULL;
 	}
diff --git a/lib/tst_fill_file.c b/lib/tst_fill_file.c
index f2bc52d42..80472007f 100644
--- a/lib/tst_fill_file.c
+++ b/lib/tst_fill_file.c
@@ -19,12 +19,14 @@
  *
  */
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <fcntl.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
+#include "lapi/fallocate.h"
 
 #include "test.h"
 
@@ -54,6 +56,22 @@ int tst_fill_fd(int fd, char pattern, size_t bs, size_t bcount)
 	return 0;
 }
 
+int tst_prealloc_size_fd(int fd, size_t bs, size_t bcount)
+{
+	int ret;
+
+	errno = 0;
+	ret = fallocate(fd, 0, 0, bs * bcount);
+
+	if (ret && errno == ENOSPC)
+		return ret;
+
+	if (ret)
+		ret = tst_fill_fd(fd, 0, bs, bcount);
+
+	return ret;
+}
+
 int tst_fill_file(const char *path, char pattern, size_t bs, size_t bcount)
 {
 	int fd;
@@ -76,3 +94,25 @@ int tst_fill_file(const char *path, char pattern, size_t bs, size_t bcount)
 
 	return 0;
 }
+
+int tst_prealloc_file(const char *path, size_t bs, size_t bcount)
+{
+	int fd;
+
+	fd = open(path, O_CREAT|O_WRONLY|O_TRUNC, S_IRUSR|S_IWUSR);
+	if (fd < 0)
+		return -1;
+
+	if (tst_prealloc_size_fd(fd, bs, bcount)) {
+		close(fd);
+		unlink(path);
+		return -1;
+	}
+
+	if (close(fd) < 0) {
+		unlink(path);
+		return -1;
+	}
+
+	return 0;
+}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
