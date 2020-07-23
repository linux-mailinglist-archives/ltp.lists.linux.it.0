Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D04D22AAA3
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 10:29:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1C2B3C4D4A
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 10:29:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C52C23C20F6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 10:29:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CB2431000DB6
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 10:29:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="96792918"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 16:29:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0022B4CE4BD0
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 16:29:30 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 16:29:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 23 Jul 2020 16:30:00 +0800
Message-ID: <1595493001-15724-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0022B4CE4BD0.AC778
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/2] Allow detach file from loop device with
 opening dev_fd
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

Before this api, it will report the following error when using
tst_attach_device with opening device fd because the device was
opened twice at this point.

tst_device.c:223: WARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for
>> too long

Add a tst_detach_device_by_fd() and change the library so that
tst_detach_device() opens/close the dev_path and calls tst_detach_device_by_fd()
internally.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/tst_device.h | 11 +++++++++++
 lib/tst_device.c     | 31 ++++++++++++++++++-------------
 2 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 6a1fc5186..59cc5b96c 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -57,11 +57,22 @@ int tst_find_free_loopdev(const char *path, size_t path_len);
  */
 int tst_attach_device(const char *dev_path, const char *file_path);
 
+/*
+ * Detaches a file from a loop device fd.
+ *
+ * @dev_path Path to the loop device e.g. /dev/loop0
+ * @dev_fd a open fd for the loop device
+ * @return Zero on succes, non-zero otherwise.
+ * */
+
+int tst_detach_device_by_fd(const char *dev_path, int dev_fd);
+
 /*
  * Detaches a file from a loop device.
  *
  * @dev_path Path to the loop device e.g. /dev/loop0
  * @return Zero on succes, non-zero otherwise.
+ * In internal, call tst_detach_device_by_fd api.
  */
 int tst_detach_device(const char *dev_path);
 
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 131a223be..8d8bc5b40 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -187,43 +187,48 @@ int tst_attach_device(const char *dev, const char *file)
 	return 0;
 }
 
-int tst_detach_device(const char *dev)
+int tst_detach_device_by_fd(const char *dev, int dev_fd)
 {
-	int dev_fd, ret, i;
-
-	dev_fd = open(dev, O_RDONLY);
-	if (dev_fd < 0) {
-		tst_resm(TWARN | TERRNO, "open(%s) failed", dev);
-		return 1;
-	}
+	int ret, i;
 
 	/* keep trying to clear LOOPDEV until we get ENXIO, a quick succession
 	 * of attach/detach might not give udev enough time to complete */
 	for (i = 0; i < 40; i++) {
 		ret = ioctl(dev_fd, LOOP_CLR_FD, 0);
 
-		if (ret && (errno == ENXIO)) {
-			close(dev_fd);
+		if (ret && (errno == ENXIO))
 			return 0;
-		}
 
 		if (ret && (errno != EBUSY)) {
 			tst_resm(TWARN,
 				 "ioctl(%s, LOOP_CLR_FD, 0) unexpectedly failed with: %s",
 				 dev, tst_strerrno(errno));
-			close(dev_fd);
 			return 1;
 		}
 
 		usleep(50000);
 	}
 
-	close(dev_fd);
 	tst_resm(TWARN,
 		"ioctl(%s, LOOP_CLR_FD, 0) no ENXIO for too long", dev);
 	return 1;
 }
 
+int tst_detach_device(const char *dev)
+{
+	int dev_fd, ret;
+
+	dev_fd = open(dev, O_RDONLY);
+	if (dev_fd < 0) {
+		tst_resm(TWARN | TERRNO, "open(%s) failed", dev);
+		return 1;
+	}
+
+	ret = tst_detach_device_by_fd(dev, dev_fd);
+	close(dev_fd);
+	return ret;
+}
+
 int tst_dev_sync(int fd)
 {
 	return syscall(__NR_syncfs, fd);
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
