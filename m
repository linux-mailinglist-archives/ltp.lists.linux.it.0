Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C9A134440
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 14:48:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB60A3C24F8
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 14:48:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 375393C2377
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 14:48:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83B4F200D5B
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 14:48:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB701ACA5;
 Wed,  8 Jan 2020 13:48:07 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Jan 2020 14:48:07 +0100
Message-Id: <20200108134807.27001-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_device: Scan /sys/block/* for stat file
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

The current tst_dev_bytes_written() function works only for simple cases
where the block device is not divided into partitions. This patch fixes
that scannning the sysfiles for pattern /sys/block/*/devname/stat.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
CC: Sumit Garg <sumit.garg@linaro.org>
---
 lib/tst_device.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 10f71901d..aca769559 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -373,16 +373,39 @@ int tst_umount(const char *path)
 	return -1;
 }
 
+int find_stat_file(const char *dev, char *path, size_t path_len)
+{
+	const char *devname = strrchr(dev, '/') + 1;
+
+	snprintf(path, path_len, "/sys/block/%s/stat", devname);
+
+	if (!access(path, F_OK))
+		return 1;
+
+	DIR *dir = SAFE_OPENDIR(NULL, "/sys/block/");
+	struct dirent *ent;
+
+	while ((ent = readdir(dir))) {
+		snprintf(path, path_len, "/sys/block/%s/%s/stat", ent->d_name, devname);
+
+		fprintf(stderr, "%s\n", path);
+
+		if (!access(path, F_OK)) {
+			SAFE_CLOSEDIR(NULL, dir);
+			return 1;
+		}
+	}
+
+	SAFE_CLOSEDIR(NULL, dir);
+	return 0;
+}
+
 unsigned long tst_dev_bytes_written(const char *dev)
 {
-	struct stat st;
 	unsigned long dev_sec_write = 0, dev_bytes_written, io_ticks = 0;
 	char dev_stat_path[1024];
 
-	snprintf(dev_stat_path, sizeof(dev_stat_path), "/sys/block/%s/stat",
-		 strrchr(dev, '/') + 1);
-
-	if (stat(dev_stat_path, &st) != 0)
+	if (!find_stat_file(dev, dev_stat_path, sizeof(dev_stat_path)))
 		tst_brkm(TCONF, NULL, "Test device stat file: %s not found",
 			 dev_stat_path);
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
