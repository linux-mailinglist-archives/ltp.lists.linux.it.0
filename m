Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4FA14CCBB
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:49:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 128F33C2439
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:49:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 442B23C23F1
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:49:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B668F600FB9
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:49:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05641AE4B
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 14:49:21 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Jan 2020 15:49:12 +0100
Message-Id: <20200129144913.9889-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129144913.9889-1-mdoucha@suse.cz>
References: <20200129144913.9889-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Allow acquiring multiple loop devices
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

tst_acquire_device__() currently uses a hardcoded filename so only one loop
device can be used at a time. Allow setting arbitrary temp filename so that
multiple different loop devices can be acquired.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/old/old_device.h   | 15 ++++++++++++++-
 lib/tst_device.c           | 36 +++++++++++++++++++++++-------------
 testcases/lib/tst_device.c | 14 +++++++++-----
 3 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/include/old/old_device.h b/include/old/old_device.h
index d2f1ecde5..a6e9fea86 100644
--- a/include/old/old_device.h
+++ b/include/old/old_device.h
@@ -52,13 +52,26 @@ static inline const char *tst_acquire_device(void (cleanup_fn)(void))
 	return tst_acquire_device_(cleanup_fn, 0);
 }
 
+/*
+ * Acquire a loop device with specified temp filename. This function allows
+ * you to acquire multiple devices at the same time. LTP_DEV is ignored.
+ * If you call this function directly, use tst_detach_device() to release
+ * the devices. tst_release_device() will not work correctly.
+ *
+ * The return value points to a static buffer and additional calls of
+ * tst_acquire_loop_device() or tst_acquire_device() will overwrite it.
+ */
+const char *tst_acquire_loop_device(unsigned int size, const char *filename);
+
 /*
  * @dev: device path returned by the tst_acquire_device()
  */
 int tst_release_device(const char *dev);
 
 /*
- * @dev: device path returned by the tst_acquire_device()
+ * Cleanup function for tst_acquire_loop_device(). If you have acquired
+ * a device using tst_acquire_device(), use tst_release_device() instead.
+ * @dev: device path returned by the tst_acquire_loop_device()
  */
 int tst_detach_device(const char *dev);
 
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 89b9c96de..ac6806e43 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -228,10 +228,28 @@ int tst_dev_sync(int fd)
 	return syscall(__NR_syncfs, fd);
 }
 
+const char *tst_acquire_loop_device(unsigned int size, const char *filename)
+{
+	unsigned int acq_dev_size = MAX(size, DEV_SIZE_MB);
+
+	if (tst_fill_file(filename, 0, 1024 * 1024, acq_dev_size)) {
+		tst_resm(TWARN | TERRNO, "Failed to create %s", filename);
+		return NULL;
+	}
+
+	if (tst_find_free_loopdev(dev_path, sizeof(dev_path)) == -1)
+		return NULL;
+
+	if (tst_attach_device(dev_path, filename))
+		return NULL;
+
+	return dev_path;
+}
+
 const char *tst_acquire_device__(unsigned int size)
 {
 	int fd;
-	char *dev;
+	const char *dev;
 	struct stat st;
 	unsigned int acq_dev_size;
 	uint64_t ltp_dev_size;
@@ -282,20 +300,12 @@ const char *tst_acquire_device__(unsigned int size)
 				ltp_dev_size, acq_dev_size);
 	}
 
-	if (tst_fill_file(DEV_FILE, 0, 1024 * 1024, acq_dev_size)) {
-		tst_resm(TWARN | TERRNO, "Failed to create " DEV_FILE);
-		return NULL;
-	}
-
-	if (tst_find_free_loopdev(dev_path, sizeof(dev_path)) == -1)
-		return NULL;
+	dev = tst_acquire_loop_device(acq_dev_size, DEV_FILE);
 
-	if (tst_attach_device(dev_path, DEV_FILE))
-		return NULL;
+	if (dev)
+		device_acquired = 1;
 
-	device_acquired = 1;
-
-	return dev_path;
+	return dev;
 }
 
 const char *tst_acquire_device_(void (cleanup_fn)(void), unsigned int size)
diff --git a/testcases/lib/tst_device.c b/testcases/lib/tst_device.c
index a657db30b..2a3ab1222 100644
--- a/testcases/lib/tst_device.c
+++ b/testcases/lib/tst_device.c
@@ -18,7 +18,7 @@ static struct tst_test test = {
 
 static void print_help(void)
 {
-	fprintf(stderr, "\nUsage: tst_device acquire [size]\n");
+	fprintf(stderr, "\nUsage: tst_device acquire [size [filename]]\n");
 	fprintf(stderr, "   or: tst_device release /path/to/device\n\n");
 }
 
@@ -27,10 +27,10 @@ static int acquire_device(int argc, char *argv[])
 	unsigned int size = 0;
 	const char *device;
 
-	if (argc > 3)
+	if (argc > 4)
 		return 1;
 
-	if (argc == 3) {
+	if (argc >= 3) {
 		size = atoi(argv[2]);
 
 		if (!size) {
@@ -40,7 +40,11 @@ static int acquire_device(int argc, char *argv[])
 		}
 	}
 
-	device = tst_acquire_device__(size);
+	if (argc >= 4) {
+		device = tst_acquire_loop_device(size, argv[3]);
+	} else {
+		device = tst_acquire_device__(size);
+	}
 
 	if (!device)
 		return 1;
@@ -61,7 +65,7 @@ static int release_device(int argc, char *argv[])
 		return 1;
 
 	/*
-	 * tst_acquire_device() was called in a different process.
+	 * tst_acquire_[loop_]device() was called in a different process.
 	 * tst_release_device() would think that no device was acquired yet
 	 * and do nothing. Call tst_detach_device() directly to bypass
 	 * the check.
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
