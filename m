Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A123309A
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:54:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 207333C4BFC
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:54:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 4FE843C260D
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:54:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 08826601929
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:54:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,414,1589212800"; d="scan'208";a="97110263"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 18:54:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 99E5B4CE5059
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 18:53:58 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 18:53:59 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 30 Jul 2020 18:53:57 +0800
Message-ID: <1596106437-28781-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 99E5B4CE5059.AE5AB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1] tst_find_backing_dev: modify find bdev logic
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

On proc(5) man-pages,  it says:
36 35 98:0 /mnt1 /mnt2 rw,noatime master:1 - ext3 /dev/root rw,errors=continue
(1)(2)(3)   (4)   (5)      (6)      (7)   (8) (9)   (10)         (11)

(7)  optional fields: zero or more fields of the form
     "tag[:value]"; see below.

So we cannot really parse the information with a static scanf() string,
since the number of elements in the line is not constant.

As cyril suggested, use " - " to delim string and get the bdev value after two fileds.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 doc/test-writing-guidelines.txt |  2 +-
 lib/tst_device.c                | 25 ++++++++++++++++++++-----
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 10e0cdd75..67aed1ac9 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1098,7 +1098,7 @@ voud tst_find_backing_dev(const char *path, char *dev);
 
 This function finds the block dev that this path belongs to, it uses stat function
 to get the major/minor number of the path. Then scan them in "/proc/self/mountinfo"
-and list 10th column value as its block dev if match succeeds.
+and list 2th column value after ' - ' string as its block dev if match succeeds.
 
 2.2.16 Formatting a device with a filesystem
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/lib/tst_device.c b/lib/tst_device.c
index 8d8bc5b40..0e98a7280 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -497,16 +497,31 @@ unsigned long tst_dev_bytes_written(const char *dev)
 
 void tst_find_backing_dev(const char *path, char *dev)
 {
-	char fmt[1024];
+	char fmt[20];
 	struct stat buf;
+	FILE *file;
+	char line[PATH_MAX];
+	char *pre = NULL;
+	char *next = NULL;
 
 	if (stat(path, &buf) < 0)
-		 tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
+		tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
 
-	snprintf(fmt, sizeof(fmt), "%%*i %%*i %u:%u %%*s %%*s %%*s %%*s %%*s %%*s %%s %%*s",
-			major(buf.st_dev), minor(buf.st_dev));
+	snprintf(fmt, sizeof(fmt), "%u:%u", major(buf.st_dev), minor(buf.st_dev));
+	file = SAFE_FOPEN(NULL, "/proc/self/mountinfo", "r");
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, fmt) != NULL) {
+			pre = strstr(line, " - ");
+			pre = strtok_r(pre, " ", &next);
+			pre = strtok_r(NULL, " ", &next);
+			pre = strtok_r(NULL, " ", &next);
+			strcpy(dev, pre);
+			break;
+		}
+	}
 
-	SAFE_FILE_LINES_SCANF(NULL, "/proc/self/mountinfo", fmt, dev);
+	SAFE_FCLOSE(NULL, file);
 
 	if (stat(dev, &buf) < 0)
 		 tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
