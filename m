Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B0132045
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 08:13:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A12B3C2399
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 08:13:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BF65F3C1C8A
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 08:13:37 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8FAB2140185B
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 08:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578381214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=887hQkKcXoksEyasr9abF++YvtN6U93p0+w2NqitWRA=;
 b=ClOBjZTRrwTefAERM7fRdK5Z8qEJJUVKgT5LgRLaYUDBIAoIxq6d+swJCbgY1Q/R4iridI
 ct2WkhSevw982Ebe6QLoLBFQ1znkhG71AO95kE1FG9EmXSVXkM4AWbQ45noCCp+zHwPvKX
 G3u4tQMtTPLVcBo5jYtLCfMvOfS9onE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-M6sonQavMaiEbohwQlTK_A-1; Tue, 07 Jan 2020 02:13:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EE65800D41;
 Tue,  7 Jan 2020 07:13:30 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 899BF60BEC;
 Tue,  7 Jan 2020 07:13:27 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  7 Jan 2020 15:13:24 +0800
Message-Id: <20200107071324.29492-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: M6sonQavMaiEbohwQlTK_A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_device: add new tst_dev_sync
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

To follow up commit: 0e2ec72de49ab48c151a3c30a1e6ea0cdaea321c
  tst_device: do sync() before reading test block device stat file

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
Cc: Sumit Garg <sumit.garg@linaro.org>
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt                        |  5 ++++-
 include/tst_device.h                                   | 10 ++++++++++
 testcases/kernel/syscalls/fdatasync/fdatasync03.c      |  3 +--
 testcases/kernel/syscalls/fsync/fsync04.c              |  3 +--
 testcases/kernel/syscalls/sync/sync03.c                |  3 +--
 .../syscalls/sync_file_range/sync_file_range02.c       |  3 +--
 testcases/kernel/syscalls/syncfs/syncfs01.c            |  3 +--
 7 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 88f771823..dfe28ef3f 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1072,7 +1072,10 @@ unsigned long tst_dev_bytes_written(const char *dev);
 -------------------------------------------------------------------------------
 
 This function reads test block device stat file (/sys/block/<device>/stat) and
-returns the bytes written since the last invocation of this function.
+returns the bytes written since the last invocation of this function. To avoid
+FS deferred IO metadata/cache interferes the result, we suggest doing "syncfs"
+before the tst_dev_bytes_written first invocation. And an inline function named
+tst_dev_sync is created for that intention.
 
 2.2.16 Formatting a device with a filesystem
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/include/tst_device.h b/include/tst_device.h
index 56835e712..992d1383d 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -68,6 +68,16 @@ int tst_attach_device(const char *dev_path, const char *file_path);
  */
 int tst_detach_device(const char *dev_path);
 
+/*
+ * To avoid FS deferred IO metadata/cache interferes test result, so we do
+ * syncfs simply before the tst_dev_bytes_written invocation. For easy to
+ * use, we create this inline function tst_dev_sync.
+ */
+static inline void tst_dev_sync(int fd)
+{
+	syncfs(fd);
+}
+
 /*
  * Reads test block device stat file and returns the bytes written since the
  * last call of this function.
diff --git a/testcases/kernel/syscalls/fdatasync/fdatasync03.c b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
index 032ac4b58..263175b85 100644
--- a/testcases/kernel/syscalls/fdatasync/fdatasync03.c
+++ b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
@@ -32,8 +32,7 @@ static void verify_fdatasync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
-	sync();
-
+	tst_dev_sync(fd);
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/fsync/fsync04.c b/testcases/kernel/syscalls/fsync/fsync04.c
index 3c1f45e94..1e4b8754c 100644
--- a/testcases/kernel/syscalls/fsync/fsync04.c
+++ b/testcases/kernel/syscalls/fsync/fsync04.c
@@ -32,8 +32,7 @@ static void verify_fsync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
-	sync();
-
+	tst_dev_sync(fd);
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/sync/sync03.c b/testcases/kernel/syscalls/sync/sync03.c
index 085ccfdeb..c5c02f877 100644
--- a/testcases/kernel/syscalls/sync/sync03.c
+++ b/testcases/kernel/syscalls/sync/sync03.c
@@ -32,8 +32,7 @@ static void verify_sync(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
-	sync();
-
+	tst_dev_sync(fd);
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index 1a6d84c49..64d069e93 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -48,8 +48,7 @@ static void verify_sync_file_range(struct testcase *tc)
 
 	lseek(fd, tc->write_off, SEEK_SET);
 
-	sync();
-
+	tst_dev_sync(fd);
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
diff --git a/testcases/kernel/syscalls/syncfs/syncfs01.c b/testcases/kernel/syscalls/syncfs/syncfs01.c
index 3cf404450..333726eaa 100644
--- a/testcases/kernel/syscalls/syncfs/syncfs01.c
+++ b/testcases/kernel/syscalls/syncfs/syncfs01.c
@@ -33,8 +33,7 @@ static void verify_syncfs(void)
 
 	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
 
-	sync();
-
+	tst_dev_sync(fd);
 	tst_dev_bytes_written(tst_device->dev);
 
 	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
