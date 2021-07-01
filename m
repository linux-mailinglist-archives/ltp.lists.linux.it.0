Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 984A03B8D83
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:52:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B40A3C8CD9
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:52:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47D6C3C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:52:19 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 087C26019D2
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625118736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=39MvuXeA41LmAQ+Fo1Ju+E4cN5oUsnKF6xS1oBryMBw=;
 b=AySpjvM7qZnus9Kjj2PJYi6+qiL0zRWDDu2oSiombCCfoNwkKlncZELDW3AtCIQCFn33jV
 XcEh+hqyt1rY9usgQjx09tFmhD7WaQXIm+pbjAxXQWz9L0NOlg+/+LBaA9opEv5XViwJcl
 88cvupq3ctbGPT8WST0j2EJ2Xrjq5t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-OOZCa6gJNBOeRFKskjr3lQ-1; Thu, 01 Jul 2021 01:52:13 -0400
X-MC-Unique: OOZCa6gJNBOeRFKskjr3lQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B69685074D;
 Thu,  1 Jul 2021 05:52:11 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4CE418A77;
 Thu,  1 Jul 2021 05:52:09 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 13:52:07 +0800
Message-Id: <20210701055208.715395-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Subject: [LTP] [PATCH 1/2] lib: limit the size of tmpfs in LTP
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

LTP mount and make use of the whole tmpfs of the test system,
generally, it's fine. But if a test (e.g fallocate06) try to
fill full in the filesystem, it takes too long to complete
testing on a large memory system.

This patch adds a new function limit_tmpfs_mount_size with
appending '-o size=xxM' to the mount options in prepare_device()
which helps limit the tmpfs mount size.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/tst_device.h |  7 +++++++
 lib/tst_device.c     | 15 +++++++++++++++
 lib/tst_test.c       | 10 ++++++++++
 3 files changed, 32 insertions(+)

diff --git a/include/tst_device.h b/include/tst_device.h
index 1d1246e82..51bde4190 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -31,6 +31,13 @@ int tst_umount(const char *path);
 int tst_is_mounted(const char *path);
 int tst_is_mounted_at_tmpdir(const char *path);
 
+/*
+ * Limit the tmpfs mount size for LTP test
+ * @mnt_data: mount options from tst_test->mnt_data
+ * @size: tmpfs size to be mounted
+ */
+char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size);
+
 /*
  * Clears a first few blocks of the device. This is needed when device has
  * already been formatted with a filesystems, subset of mkfs.foo utils aborts
diff --git a/lib/tst_device.c b/lib/tst_device.c
index c096b418b..66a830b7b 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -45,6 +45,7 @@
 #define DEV_FILE "test_dev.img"
 #define DEV_SIZE_MB 256u
 
+static char tmpfs_buf[1024];
 static char dev_path[1024];
 static int device_acquired;
 static unsigned long prev_dev_sec_write;
@@ -368,6 +369,20 @@ int tst_clear_device(const char *dev)
 	return 0;
 }
 
+char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size)
+{
+	unsigned int dev_size = MAX(size, DEV_SIZE_MB);
+
+	if (mnt_data)
+		snprintf(tmpfs_buf, sizeof(tmpfs_buf), "%s,size=%uM", mnt_data, dev_size);
+	else
+		snprintf(tmpfs_buf, sizeof(tmpfs_buf), "size=%uM", dev_size);
+
+	tst_resm(TINFO, "Limiting tmpfs size to %uMB", dev_size);
+
+	return tmpfs_buf;
+}
+
 int tst_umount(const char *path)
 {
 	int err, ret, i;
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 55449c80b..27766fbfd 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -896,9 +896,19 @@ static void prepare_device(void)
 	}
 
 	if (tst_test->mount_device) {
+		char *mnt_data = tst_test->mnt_data;
+
+		if (!strcmp(tdev.fs_type, "tmpfs")) {
+			tst_test->mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
+					tst_test->dev_min_size);
+		}
+
 		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
 			   tst_test->mnt_flags, tst_test->mnt_data);
 		mntpoint_mounted = 1;
+
+		if (!strcmp(tdev.fs_type, "tmpfs"))
+			tst_test->mnt_data = mnt_data;
 	}
 }
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
