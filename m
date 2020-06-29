Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2F20CE49
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:41:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 358FA3C574A
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:41:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 379FC3C575B
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:41:45 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 11F4D6009E2
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:40:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,294,1589212800"; d="scan'208";a="95484788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jun 2020 19:41:38 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 55BCB4CE49DD;
 Mon, 29 Jun 2020 19:31:06 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 29 Jun 2020 19:41:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <jstancek@redhat.com>
Date: Mon, 29 Jun 2020 19:41:22 +0800
Message-ID: <1593430883-6131-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
References: <1904309747.19085433.1593428894028.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 55BCB4CE49DD.A008B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/2] tst_device: Add new api
 tst_find_backing_dev(path, dev)
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This api uses stat() to get major/minor devnumber of the path, assign the
10th column value to dev when match succeeds in "/proc/self/mountinfo".

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt | 11 +++++++++++
 include/tst_device.h            |  7 +++++++
 lib/newlib_tests/tst_device.c   |  8 ++++++++
 lib/tst_device.c                | 21 +++++++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 6e466ed0f..58116a40e 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1089,6 +1089,17 @@ FS deferred IO metadata/cache interference, we suggest doing "syncfs" before the
 tst_dev_bytes_written first invocation. And an inline function named tst_dev_sync
 is created for that intention.
 
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
+voud tst_find_backing_dev(const char *path, char *dev);
+-------------------------------------------------------------------------------
+
+This function finds the block dev that this path belongs to, it uses stat function
+to get the major/minor number of the path. Then scan them in "/proc/self/mountinfo"
+and list 10th column value as its block dev if match succeeds.
+
 2.2.16 Formatting a device with a filesystem
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
diff --git a/include/tst_device.h b/include/tst_device.h
index 950cfe1ed..6a1fc5186 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -84,4 +84,11 @@ unsigned long tst_dev_bytes_written(const char *dev);
  */
 void tst_purge_dir(const char *path);
 
+/*
+ * Find the file or path belongs to which block dev
+ * @path  Path to find the backing dev
+ * @dev   The block dev
+ */
+void tst_find_backing_dev(const char *path, char *dev);
+
 #endif	/* TST_DEVICE_H__ */
diff --git a/lib/newlib_tests/tst_device.c b/lib/newlib_tests/tst_device.c
index 1344495b3..ad077affd 100644
--- a/lib/newlib_tests/tst_device.c
+++ b/lib/newlib_tests/tst_device.c
@@ -13,6 +13,7 @@ static void do_test(void)
 {
 	int fd;
 	const char *dev;
+	char block_dev[100];
 	uint64_t ltp_dev_size;
 
 	dev = tst_device->dev;
@@ -29,6 +30,13 @@ static void do_test(void)
 		tst_res(TPASS, "Got expected device size");
 	else
 		tst_res(TFAIL, "Got unexpected device size");
+
+	tst_find_backing_dev("/boot", block_dev);
+	tst_res(TPASS, "/boot belongs to %s block dev", block_dev);
+	tst_find_backing_dev("/", block_dev);
+	tst_res(TPASS, "/ belongs to %s block dev", block_dev);
+	tst_find_backing_dev("/tmp", block_dev);
+	tst_find_backing_dev("/boot/xuyang", block_dev);
 }
 
 static struct tst_test test = {
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 67fe90ed6..842bb7ca7 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -31,6 +31,7 @@
 #include <linux/loop.h>
 #include <stdint.h>
 #include <inttypes.h>
+#include <sys/sysmacros.h>
 #include "lapi/syscalls.h"
 #include "test.h"
 #include "safe_macros.h"
@@ -488,3 +489,23 @@ unsigned long tst_dev_bytes_written(const char *dev)
 
 	return dev_bytes_written;
 }
+
+void tst_find_backing_dev(const char *path, char *dev)
+{
+	char fmt[1024];
+	struct stat buf;
+
+	if (stat(path, &buf) < 0)
+		 tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
+
+	snprintf(fmt, sizeof(fmt), "%%*i %%*i %u:%u %%*s %%*s %%*s %%*s %%*s %%*s %%s %%*s",
+			major(buf.st_dev), minor(buf.st_dev));
+
+	SAFE_FILE_LINES_SCANF(NULL, "/proc/self/mountinfo", fmt, dev);
+
+	if (stat(dev, &buf) < 0)
+		 tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
+
+	if (S_ISBLK(buf.st_mode) != 1)
+		tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
