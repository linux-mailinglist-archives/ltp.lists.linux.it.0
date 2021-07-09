Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F643C203B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:52:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 003483C681B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:52:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C7253C67DB
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:52:11 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D8D16601489
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625817129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YWMPr44kytVUkHT9pNke2/oXb3L6fDdQYYyp6xTfHrQ=;
 b=Qs0wfijbtwsDMuGfNVs/cJ+Ou8usOopRvVkLbYi5owHEf49hrAeePFRj9BSbz3+BxjqtR4
 nrQ0ui7pPermdN5iAJ0QIlbOlhsfmEVedypNlXxsYzmzaSvaG89chg/GfeTcGf3jeKqM/q
 xXfzZfZVSK1otpD+QgAtxvn+kDJkS0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-0rpgiNnOPe-ye-kjxP1rBw-1; Fri, 09 Jul 2021 03:52:07 -0400
X-MC-Unique: 0rpgiNnOPe-ye-kjxP1rBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C310D10C1ADC
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 07:52:06 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED6245D6A8
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 07:52:05 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  9 Jul 2021 15:52:02 +0800
Message-Id: <20210709075204.999168-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] lib: add new function tst_get_device_size
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 doc/c-test-api.txt   | 10 ++++++
 include/tst_device.h |  7 ++++
 lib/tst_device.c     | 76 +++++++++++++++++++++++++-------------------
 3 files changed, 60 insertions(+), 33 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 4af1a9c97..e4ba858cf 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -979,6 +979,16 @@ This function finds the block dev that this path belongs to, it uses stat functi
 to get the major/minor number of the path. Then scan them in "/proc/self/mountinfo"
 and list 2th column value after ' - ' string as its block dev if match succeeds.
 
+[source,c]
+-------------------------------------------------------------------------------
+#include "tst_test.h"
+
+uint64_t tst_get_device_size(const char *dev_path);
+-------------------------------------------------------------------------------
+
+This function gets size of the given block device, it checks the dev_path is
+valid first, if yes, return the size in MB, otherwise return -1.
+
 1.16 Formatting a device with a filesystem
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/tst_device.h b/include/tst_device.h
index 1d1246e82..72c560c02 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -7,10 +7,12 @@
 #define TST_DEVICE_H__
 
 #include <unistd.h>
+#include <stdint.h>
 
 struct tst_device {
 	const char *dev;
 	const char *fs_type;
+	uint64_t size;
 };
 
 /*
@@ -57,6 +59,11 @@ int tst_find_free_loopdev(const char *path, size_t path_len);
  */
 int tst_attach_device(const char *dev_path, const char *file_path);
 
+/*
+ * Get size (in MB) of the given device
+ */
+uint64_t tst_get_device_size(const char *dev_path);
+
 /*
  * Detaches a file from a loop device fd.
  *
diff --git a/lib/tst_device.c b/lib/tst_device.c
index c096b418b..c91c6cd55 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -187,6 +187,48 @@ int tst_attach_device(const char *dev, const char *file)
 	return 0;
 }
 
+uint64_t tst_get_device_size(const char *dev_path)
+{
+	int fd;
+	uint64_t size;
+	struct stat st;
+
+	if (!dev_path)
+		tst_brkm(TBROK, NULL, "No block device path");
+
+	if (stat(dev_path, &st)) {
+		tst_resm(TWARN | TERRNO, "stat() failed");
+		return -1;
+	}
+
+	if (!S_ISBLK(st.st_mode)) {
+		tst_resm(TWARN, "%s is not a block device", dev_path);
+		return -1;
+	}
+
+	fd = open(dev_path, O_RDONLY);
+	if (fd < 0) {
+		tst_resm(TWARN | TERRNO,
+				"open(%s, O_RDONLY) failed", dev_path);
+		return -1;
+	}
+
+	if (ioctl(fd, BLKGETSIZE64, &size)) {
+		tst_resm(TWARN | TERRNO,
+				"ioctl(fd, BLKGETSIZE64, ...) failed");
+		close(fd);
+		return -1;
+	}
+
+	if (close(fd)) {
+		tst_resm(TWARN | TERRNO,
+				"close(fd) failed");
+		return -1;
+	}
+
+	return size/1024/1024;
+}
+
 int tst_detach_device_by_fd(const char *dev, int dev_fd)
 {
 	int ret, i;
@@ -254,9 +296,7 @@ const char *tst_acquire_loop_device(unsigned int size, const char *filename)
 
 const char *tst_acquire_device__(unsigned int size)
 {
-	int fd;
 	const char *dev;
-	struct stat st;
 	unsigned int acq_dev_size;
 	uint64_t ltp_dev_size;
 
@@ -267,37 +307,7 @@ const char *tst_acquire_device__(unsigned int size)
 	if (dev) {
 		tst_resm(TINFO, "Using test device LTP_DEV='%s'", dev);
 
-		if (stat(dev, &st)) {
-			tst_resm(TWARN | TERRNO, "stat() failed");
-			return NULL;
-		}
-
-		if (!S_ISBLK(st.st_mode)) {
-			tst_resm(TWARN, "%s is not a block device", dev);
-			return NULL;
-		}
-
-		fd = open(dev, O_RDONLY);
-		if (fd < 0) {
-			tst_resm(TWARN | TERRNO,
-				 "open(%s, O_RDONLY) failed", dev);
-			return NULL;
-		}
-
-		if (ioctl(fd, BLKGETSIZE64, &ltp_dev_size)) {
-			tst_resm(TWARN | TERRNO,
-				 "ioctl(fd, BLKGETSIZE64, ...) failed");
-			close(fd);
-			return NULL;
-		}
-
-		if (close(fd)) {
-			tst_resm(TWARN | TERRNO,
-				 "close(fd) failed");
-			return NULL;
-		}
-
-		ltp_dev_size = ltp_dev_size/1024/1024;
+		ltp_dev_size = tst_get_device_size(dev);
 
 		if (acq_dev_size <= ltp_dev_size)
 			return dev;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
