Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 861AC27EAB2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:11:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C3403C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:11:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4074F3C297B
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:11:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BA5661000CC1
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:11:51 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601475110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t7h+dVMilMNV1VheG6/kZqPP3e+BFtEroi8yDggsd4k=;
 b=ZOJt0P4cEoR40KyOzQ6SJXnyeOrEGll+VAxezygFgfnccu1sWSURbe3HV/JMb2yF0Ekhdz
 X4LdgiPX8CgQtIbnQ57mFqsJmpb7zfxQMBNefE6DBgZcDvUZLR9KfnsLUg1bXwU3Cq2qaC
 B1h1/PoPPx+3Y3F1t17sf4rRc09EKWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-6vEbz0idNEmQ0SC4J1tf0g-1; Wed, 30 Sep 2020 10:11:48 -0400
X-MC-Unique: 6vEbz0idNEmQ0SC4J1tf0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61108802B5D;
 Wed, 30 Sep 2020 14:11:46 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-71.rdu2.redhat.com
 [10.10.115.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367075D9D3;
 Wed, 30 Sep 2020 14:11:45 +0000 (UTC)
From: Qian Cai <cai@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Mike Frysinger <vapier@gentoo.org>,
 Wanlong Gao <wanlong.gao@gmail.com>, Jan Stancek <jstancek@redhat.com>,
 Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>,
 Alexey Kodanev <alexey.kodanev@oracle.com>
Date: Wed, 30 Sep 2020 10:11:30 -0400
Message-Id: <20200930141130.13100-1-cai@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cai@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] diotest4: Fix false postives on FUSE
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
Cc: ltp@lists.linux.it, Vivek Goyal <vgoyal@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It looks like FUSE does not support the unaligned IO, because it does
not directly backed by a block device. Therefore, in fuse_direct_IO(),
there is no checking of unaligned IO to return -EINVAL like other
filesystems from iomap_dio_bio_actor().

diotest4    3  TFAIL  :  diotest4.c:114: read allows odd count. returns 1: Success
diotest4    4  TFAIL  :  diotest4.c:129: write allows odd count.returns 1: Success
diotest4    5  TFAIL  :  diotest4.c:180: Odd count of read and write
...
diotest4   16  TFAIL  :  diotest4.c:114: read allows  nonaligned buf. returns 4096: Success
diotest4   17  TFAIL  :  diotest4.c:129: write allows  nonaligned buf.returns 4096: Success
diotest4   18  TFAIL  :  diotest4.c:180: read, write with non-aligned buffer

Signed-off-by: Qian Cai <cai@redhat.com>
---
 include/tst_fs.h                         | 1 +
 lib/tst_fs_type.c                        | 2 ++
 testcases/kernel/io/direct_io/diotest4.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index fc0390582..4f7dd68d2 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -29,6 +29,7 @@
 #define TST_NILFS_MAGIC    0x3434
 #define TST_EXOFS_MAGIC    0x5DF5
 #define TST_OVERLAYFS_MAGIC 0x794c7630
+#define TST_FUSE_MAGIC     0x65735546
 
 enum {
 	TST_BYTES = 1,
diff --git a/lib/tst_fs_type.c b/lib/tst_fs_type.c
index 1d0ac9669..d661d5b2a 100644
--- a/lib/tst_fs_type.c
+++ b/lib/tst_fs_type.c
@@ -84,6 +84,8 @@ const char *tst_fs_type_name(long f_type)
 		return "EXOFS";
 	case TST_OVERLAYFS_MAGIC:
 		return "OVERLAYFS";
+	case TST_FUSE_MAGIC:
+		return "FUSE";
 	default:
 		return "Unknown";
 	}
diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
index bf200cd41..f3c9c19d7 100644
--- a/testcases/kernel/io/direct_io/diotest4.c
+++ b/testcases/kernel/io/direct_io/diotest4.c
@@ -270,6 +270,7 @@ int main(int argc, char *argv[])
 	switch (fs_type) {
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
+	case TST_FUSE_MAGIC:
 		tst_resm(TCONF, "%s supports odd count IO",
 			 tst_fs_type_name(fs_type));
 	break;
@@ -442,6 +443,7 @@ int main(int argc, char *argv[])
 	switch (fs_type) {
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
+	case TST_FUSE_MAGIC:
 		tst_resm(TCONF, "%s supports non-aligned buffer",
 			 tst_fs_type_name(fs_type));
 	break;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
