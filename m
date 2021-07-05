Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBD63BB90F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 10:25:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CED753C69E0
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 10:25:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC7F23C4E40
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 10:25:37 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E04162000E1
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 10:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625473535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KQFvfTY7RoudeKkh000UC662r5SQ2WzNGjVkfGBOT7k=;
 b=Mrkga/zW0K7kHt3//SfA68P5Xegymx7tLSELCmYWoHpblVnoV4UMqgdYyo23hFSyE919VK
 3oRCgX2Se1+cLXIcEG2ymoLk1R7a5Bzm7jCl83bNlfJEMqe2tTQTeq10ojsYycA/IoJZLI
 mflK73VWplgKTiKHrdZ4aSdAIHFVGVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-fhTfgl8uMn-W8jxX3Ngchw-1; Mon, 05 Jul 2021 04:25:31 -0400
X-MC-Unique: fhTfgl8uMn-W8jxX3Ngchw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA98518D6A30;
 Mon,  5 Jul 2021 08:25:30 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com
 (dhcp-66-81-187.nay.redhat.com [10.66.81.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D538E1970E;
 Mon,  5 Jul 2021 08:25:29 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  5 Jul 2021 16:25:26 +0800
Message-Id: <20210705082527.855688-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: limit the size of tmpfs in LTP
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

Notes:
    V1 --> V2
        * state limit_tmpfs_mount_size as a static function
        * make use of the loop device size directly since
          it already gets a proper size in tst_acquire_device_
        * do NOT modify the tst_test->mnt_data

 lib/tst_test.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 55449c80b..93761868e 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -882,8 +882,35 @@ static void prepare_and_mount_dev_fs(const char *mntpoint)
 	}
 }
 
+static char *limit_tmpfs_mount_size(const char *mnt_data,
+			char *buf, size_t buf_size, const char *fs_type)
+{
+	int fd;
+	uint64_t dev_size;
+
+	if (strcmp(fs_type, "tmpfs"))
+		return mnt_data;
+
+	fd = SAFE_OPEN(tdev.dev, O_RDONLY);
+	SAFE_IOCTL(fd, BLKGETSIZE64, &dev_size);
+	SAFE_CLOSE(fd);
+
+	dev_size = dev_size/1024/1024;
+
+	if (mnt_data)
+		snprintf(buf, buf_size, "%s,size=%luM", mnt_data, dev_size);
+	else
+		snprintf(buf, buf_size, "size=%luM", dev_size);
+
+	tst_res(TINFO, "Limiting tmpfs size to %luMB", dev_size);
+
+	return buf;
+}
+
 static void prepare_device(void)
 {
+	char *mnt_data, buf[1024];
+
 	if (tst_test->format_device) {
 		SAFE_MKFS(tdev.dev, tdev.fs_type, tst_test->dev_fs_opts,
 			  tst_test->dev_extra_opts);
@@ -896,8 +923,11 @@ static void prepare_device(void)
 	}
 
 	if (tst_test->mount_device) {
+		mnt_data = limit_tmpfs_mount_size(tst_test->mnt_data,
+				buf, sizeof(buf), tdev.fs_type);
+
 		SAFE_MOUNT(tdev.dev, tst_test->mntpoint, tdev.fs_type,
-			   tst_test->mnt_flags, tst_test->mnt_data);
+			   tst_test->mnt_flags, mnt_data);
 		mntpoint_mounted = 1;
 	}
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
