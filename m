Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD420C6D4
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Jun 2020 09:42:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76B313C2AFE
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Jun 2020 09:42:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B67143C12E6
 for <ltp@lists.linux.it>; Sun, 28 Jun 2020 09:42:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3D8CC6011A5
 for <ltp@lists.linux.it>; Sun, 28 Jun 2020 09:42:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,290,1589212800"; d="scan'208";a="95413842"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jun 2020 15:42:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5E9894CE49B5;
 Sun, 28 Jun 2020 15:31:33 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Jun 2020 15:42:02 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>, <jstancek@redhat.com>
Date: Sun, 28 Jun 2020 15:42:02 +0800
Message-ID: <1593330123-19631-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200624113217.GC30917@yuki.lan>
References: <20200624113217.GC30917@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5E9894CE49B5.AFD6D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] tst_device: Add new api
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

This api reads the /proc/self/mountinfo and compare path with
the 5th column each row in this file, assign the 10th column
value to dev when match succeed.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt | 11 ++++++++
 include/tst_device.h            |  7 +++++
 lib/newlib_tests/tst_device.c   |  8 ++++++
 lib/tst_device.c                | 47 +++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 6e466ed0f..1fe11abca 100644
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
+This function finds the block dev that this path belongs to, it compares path buf
+with the fifth column of each row in "/proc/self/mountinfo" and list 10th column
+as its block dev.
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
index 67fe90ed6..97b42eb4f 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -488,3 +488,50 @@ unsigned long tst_dev_bytes_written(const char *dev)
 
 	return dev_bytes_written;
 }
+
+void tst_find_backing_dev(const char *path, char *dev)
+{
+	char fmt[100];
+	char mnt_root[100];
+	char bd_device[100];
+	char line[1024];
+	FILE *file;
+	int flag = 0;
+	int ret;
+	int fd;
+	struct stat st;
+
+	if (access(path, F_OK))
+		tst_brkm(TCONF, NULL, "path(%s) doesn't exist", path);
+
+	sprintf(fmt, "%%*i %%*i %%*u:%%*u %%*s %%s %%*s %%*s %%*s %%*s %%s %%*s");
+	file = SAFE_FOPEN(NULL, "/proc/self/mountinfo", "r");
+	while (fgets(line, sizeof(line), file) != NULL) {
+		ret = sscanf(line, fmt, mnt_root, bd_device);
+		if (ret != 2)
+			 tst_brkm(TCONF, NULL, "paring /proc/self/mountfinfo file failed, expected 2, got %d", ret);
+		if (!strcmp(mnt_root, path)) {
+			strcpy(dev, bd_device);
+			flag = 1;
+			break;
+		}
+		if (!strncmp(mnt_root, path, strlen(mnt_root))) {
+			strcpy(dev, bd_device);
+			flag = 1;
+		}
+	}
+	SAFE_FCLOSE(NULL, file);
+	if (!flag || access(dev, F_OK))
+		tst_brkm(TCONF, NULL, "Can not find backing dev(%s)", path);
+
+	fd = open(dev, O_RDONLY);
+	if (fd < 0)
+		tst_brkm(TWARN | TERRNO, NULL, "open(%s, O_RDONLY) failed", dev);
+	if (stat(dev, &st) < 0) {
+		close(fd);
+		tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
+	}
+	close(fd);
+	if (S_ISBLK(st.st_mode) != 1)
+		tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
