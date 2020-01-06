Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD1D130D38
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 06:39:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCBB63C2496
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 06:39:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 578433C23B2
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 06:39:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 53FFB1400DD5
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 06:39:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; d="scan'208";a="81335043"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 13:39:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4DB9349E9327
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 13:30:41 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 13:39:38 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 6 Jan 2020 13:39:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 6 Jan 2020 13:38:45 +0800
Message-ID: <1578289125-2491-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 4DB9349E9327.AD4D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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

Now, tst_dev_bytes_written api can get the whole disk stat correctly(such as /dev/sda),
but can not get partition stat correctly(such as /dev/sda5).
fail as below:
export LTP_DEV=/dev/sda5
tst_device.c:388: CONF: Test device stat file: /sys/block/sda5/stat not found

To fix this, use /proc/diskstats to parse instead of /sys/block/<devices>/stat.
Data format as same as diskstats_show function in kernel genhd.c[1].

Also, add hint when loop driver doesn't support blk-mq[2]. So that, user can export
LTP_DEV to test.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/block/genhd.c
[2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5dd2f60

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 lib/tst_device.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 10f71901d..58877c810 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -375,24 +375,22 @@ int tst_umount(const char *path)
 
 unsigned long tst_dev_bytes_written(const char *dev)
 {
-	struct stat st;
-	unsigned long dev_sec_write = 0, dev_bytes_written, io_ticks = 0;
-	char dev_stat_path[1024];
-
-	snprintf(dev_stat_path, sizeof(dev_stat_path), "/sys/block/%s/stat",
-		 strrchr(dev, '/') + 1);
+	unsigned long dev_sec_write = 0, dev_bytes_written;
+	unsigned int io_ticks = 0;
+	char fmt[1024];
 
-	if (stat(dev_stat_path, &st) != 0)
-		tst_brkm(TCONF, NULL, "Test device stat file: %s not found",
-			 dev_stat_path);
+	sprintf(fmt, "%%*4d %%*7d %s %%*lu %%*lu %%*lu %%*u %%*lu %%*lu %%lu %%*u %%*u %%u",
+			strrchr(dev, '/') + 1);
 
-	SAFE_FILE_SCANF(NULL, dev_stat_path,
-			"%*s %*s %*s %*s %*s %*s %lu %*s %*s %lu",
-			&dev_sec_write, &io_ticks);
+	FILE_LINES_SCANF(NULL, "/proc/diskstats", fmt, &dev_sec_write, &io_ticks);
 
+	/* If we create block device by attaching a free loop device, loop driver
+	 * needs to support blk-mq(commit b5dd2f6047c), so that kernel can get I/O
+	 * statistics about loop device.
+	 */
 	if (!io_ticks)
-		tst_brkm(TCONF, NULL, "Test device stat file: %s broken",
-			 dev_stat_path);
+		tst_brkm(TCONF, NULL, "Test device %s io_ticks is always 0, "
+				"exporting LTP_DEV to test", dev);
 
 	dev_bytes_written = (dev_sec_write - prev_dev_sec_write) * 512;
 
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
