Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4427850F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 12:27:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CABFD3C2FEF
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 12:27:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BC1413C061B
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 12:27:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2BE8D100061F
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 12:27:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61EADAD32;
 Fri, 25 Sep 2020 10:27:28 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
	ltp@lists.linux.it
Date: Fri, 25 Sep 2020 12:27:24 +0200
Message-Id: <20200925102724.25815-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix search for device ID in tst_find_backing_dev()
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

The current search using substrings can lead to false positives, e.g. search
for device 0:5 could return device 10:50 instead. Parse device IDs in
/proc/self/mountinfo properly using sscanf() and also check whether the device
was really found.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_device.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 0e98a7280..c096b418b 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -497,21 +497,26 @@ unsigned long tst_dev_bytes_written(const char *dev)
 
 void tst_find_backing_dev(const char *path, char *dev)
 {
-	char fmt[20];
 	struct stat buf;
 	FILE *file;
 	char line[PATH_MAX];
 	char *pre = NULL;
 	char *next = NULL;
+	unsigned int dev_major, dev_minor, line_mjr, line_mnr;
 
 	if (stat(path, &buf) < 0)
 		tst_brkm(TWARN | TERRNO, NULL, "stat() failed");
 
-	snprintf(fmt, sizeof(fmt), "%u:%u", major(buf.st_dev), minor(buf.st_dev));
+	dev_major = major(buf.st_dev);
+	dev_minor = minor(buf.st_dev);
 	file = SAFE_FOPEN(NULL, "/proc/self/mountinfo", "r");
+	*dev = '\0';
 
 	while (fgets(line, sizeof(line), file)) {
-		if (strstr(line, fmt) != NULL) {
+		if (sscanf(line, "%*d %*d %d:%d", &line_mjr, &line_mnr) != 2)
+			continue;
+
+		if (line_mjr == dev_major && line_mnr == dev_minor) {
 			pre = strstr(line, " - ");
 			pre = strtok_r(pre, " ", &next);
 			pre = strtok_r(NULL, " ", &next);
@@ -523,8 +528,11 @@ void tst_find_backing_dev(const char *path, char *dev)
 
 	SAFE_FCLOSE(NULL, file);
 
+	if (!*dev)
+		tst_brkm(TBROK, NULL, "Cannot find block device for %s", path);
+
 	if (stat(dev, &buf) < 0)
-		 tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
+		tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
 
 	if (S_ISBLK(buf.st_mode) != 1)
 		tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
