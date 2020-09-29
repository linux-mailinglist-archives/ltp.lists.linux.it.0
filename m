Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD127CE44
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:57:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1097E3C2AA9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:57:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 02F903C298F
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 04:12:03 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 48293200358
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 04:12:01 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601345520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bwZYXDI4dffRtSWGCx1TtyyTYQgdzwbTKHvGLyC+Hk8=;
 b=BWjJQKq02hTdCUe3vzCQ4GihLLzLPHEY6fXQaIflQuodJrh8fjLe1ucId+yzZXL4276vJD
 nCT8J13Mh+y6UY1ijvF7Z+PYky5YpQIHL+XGBdgr+qvXrdVR7BySGJeVio/XDS+uf3YFvs
 inROKXoXCJgYjq379J6mSNffDHpLukw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-Rlvw2W_4MGqFiDV6Q6-K7g-1; Mon, 28 Sep 2020 22:11:56 -0400
X-MC-Unique: Rlvw2W_4MGqFiDV6Q6-K7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673D2185A0FC;
 Tue, 29 Sep 2020 02:11:53 +0000 (UTC)
Received: from ovpn-66-6.rdu2.redhat.com (ovpn-66-6.rdu2.redhat.com
 [10.10.66.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2D155C1C4;
 Tue, 29 Sep 2020 02:11:50 +0000 (UTC)
Message-ID: <766e56497d9e5e10bf676422f6cfe63c9bd1590d.camel@redhat.com>
From: Qian Cai <cai@redhat.com>
To: Mike Frysinger <vapier@gentoo.org>, Cyril Hrubis <chrubis@suse.cz>, 
 Wanlong Gao <wanlong.gao@gmail.com>, Jan Stancek <jstancek@redhat.com>,
 Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>, Alexey Kodanev
 <alexey.kodanev@oracle.com>
Date: Mon, 28 Sep 2020 22:11:50 -0400
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cai@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 29 Sep 2020 14:57:08 +0200
Subject: [LTP] [PATCH] diotest4: Fix false postives on FUSE
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
Cc: Vivek Goyal <vgoyal@redhat.com>, ltp@lists.linux.it,
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
 include/tst_fs.h                         | 45 ++++++++++++------------
 lib/tst_fs_type.c                        |  2 ++
 testcases/kernel/io/direct_io/diotest4.c |  2 ++
 3 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index fc0390582..a44d5e3b2 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -6,29 +6,30 @@
 #define TST_FS_H__
 
 /* man 2 statfs or kernel-source/include/linux/magic.h */
-#define TST_BTRFS_MAGIC    0x9123683E
-#define TST_NFS_MAGIC      0x6969
-#define TST_RAMFS_MAGIC    0x858458f6
-#define TST_TMPFS_MAGIC    0x01021994
-#define TST_V9FS_MAGIC     0x01021997
-#define TST_XFS_MAGIC      0x58465342
-#define TST_EXT2_OLD_MAGIC 0xEF51
+#define TST_BTRFS_MAGIC      0x9123683E
+#define TST_NFS_MAGIC        0x6969
+#define TST_RAMFS_MAGIC      0x858458f6
+#define TST_TMPFS_MAGIC      0x01021994
+#define TST_V9FS_MAGIC       0x01021997
+#define TST_XFS_MAGIC        0x58465342
+#define TST_EXT2_OLD_MAGIC   0xEF51
 /* ext2, ext3, ext4 have the same magic number */
-#define TST_EXT234_MAGIC   0xEF53
-#define TST_MINIX_MAGIC    0x137F
-#define TST_MINIX_MAGIC2   0x138F
-#define TST_MINIX2_MAGIC   0x2468
-#define TST_MINIX2_MAGIC2  0x2478
-#define TST_MINIX3_MAGIC   0x4D5A
-#define TST_UDF_MAGIC      0x15013346
-#define TST_SYSV2_MAGIC    0x012FF7B6
-#define TST_SYSV4_MAGIC    0x012FF7B5
-#define TST_UFS_MAGIC      0x00011954
-#define TST_UFS2_MAGIC     0x19540119
-#define TST_F2FS_MAGIC     0xF2F52010
-#define TST_NILFS_MAGIC    0x3434
-#define TST_EXOFS_MAGIC    0x5DF5
-#define TST_OVERLAYFS_MAGIC 0x794c7630
+#define TST_EXT234_MAGIC     0xEF53
+#define TST_MINIX_MAGIC      0x137F
+#define TST_MINIX_MAGIC2     0x138F
+#define TST_MINIX2_MAGIC     0x2468
+#define TST_MINIX2_MAGIC2    0x2478
+#define TST_MINIX3_MAGIC     0x4D5A
+#define TST_UDF_MAGIC        0x15013346
+#define TST_SYSV2_MAGIC      0x012FF7B6
+#define TST_SYSV4_MAGIC      0x012FF7B5
+#define TST_UFS_MAGIC        0x00011954
+#define TST_UFS2_MAGIC       0x19540119
+#define TST_F2FS_MAGIC       0xF2F52010
+#define TST_NILFS_MAGIC      0x3434
+#define TST_EXOFS_MAGIC      0x5DF5
+#define TST_OVERLAYFS_MAGIC  0x794c7630
+#define TST_FUSE_SUPER_MAGIC 0x65735546
 
 enum {
 	TST_BYTES = 1,
diff --git a/lib/tst_fs_type.c b/lib/tst_fs_type.c
index 1d0ac9669..21eb58a78 100644
--- a/lib/tst_fs_type.c
+++ b/lib/tst_fs_type.c
@@ -84,6 +84,8 @@ const char *tst_fs_type_name(long f_type)
 		return "EXOFS";
 	case TST_OVERLAYFS_MAGIC:
 		return "OVERLAYFS";
+	case TST_FUSE_SUPER_MAGIC:
+		return "FUSE"
 	default:
 		return "Unknown";
 	}
diff --git a/testcases/kernel/io/direct_io/diotest4.c
b/testcases/kernel/io/direct_io/diotest4.c
index bf200cd41..5f866bd93 100644
--- a/testcases/kernel/io/direct_io/diotest4.c
+++ b/testcases/kernel/io/direct_io/diotest4.c
@@ -270,6 +270,7 @@ int main(int argc, char *argv[])
 	switch (fs_type) {
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
+	case TST_FUSE_SUPER_MAGIC:
 		tst_resm(TCONF, "%s supports odd count IO",
 			 tst_fs_type_name(fs_type));
 	break;
@@ -442,6 +443,7 @@ int main(int argc, char *argv[])
 	switch (fs_type) {
 	case TST_NFS_MAGIC:
 	case TST_BTRFS_MAGIC:
+	case TST_FUSE_SUPER_MAGIC:
 		tst_resm(TCONF, "%s supports non-aligned buffer",
 			 tst_fs_type_name(fs_type));
 	break;


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
