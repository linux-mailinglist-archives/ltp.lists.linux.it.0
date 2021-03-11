Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E033708B
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 11:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6E063C692B
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 11:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8E46D3C3367
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 11:53:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 523C7601AC9
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 11:53:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6357AC16
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 10:53:25 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 11 Mar 2021 11:55:07 +0100
Message-Id: <20210311105509.2701-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311105509.2701-1-chrubis@suse.cz>
References: <20210311105509.2701-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] lib: tst_fs_type change fs names to lowercase
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

To make it consistent with the rest of the library.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_fs_type.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/tst_fs_type.c b/lib/tst_fs_type.c
index d661d5b2a..8475f4c78 100644
--- a/lib/tst_fs_type.c
+++ b/lib/tst_fs_type.c
@@ -47,46 +47,46 @@ const char *tst_fs_type_name(long f_type)
 {
 	switch (f_type) {
 	case TST_TMPFS_MAGIC:
-		return "TMPFS";
+		return "tmpfs";
 	case TST_NFS_MAGIC:
-		return "NFS";
+		return "nfs";
 	case TST_V9FS_MAGIC:
-		return "9P";
+		return "9p";
 	case TST_RAMFS_MAGIC:
-		return "RAMFS";
+		return "ramfs";
 	case TST_BTRFS_MAGIC:
-		return "BTRFS";
+		return "btrfs";
 	case TST_XFS_MAGIC:
-		return "XFS";
+		return "xfs";
 	case TST_EXT2_OLD_MAGIC:
-		return "EXT2";
+		return "ext2";
 	case TST_EXT234_MAGIC:
-		return "EXT2/EXT3/EXT4";
+		return "ext2/ext3/ext4";
 	case TST_MINIX_MAGIC:
 	case TST_MINIX_MAGIC2:
 	case TST_MINIX2_MAGIC:
 	case TST_MINIX2_MAGIC2:
 	case TST_MINIX3_MAGIC:
-		return "MINIX";
+		return "minix";
 	case TST_UDF_MAGIC:
-		return "UDF";
+		return "udf";
 	case TST_SYSV2_MAGIC:
 	case TST_SYSV4_MAGIC:
-		return "SYSV";
+		return "sysv";
 	case TST_UFS_MAGIC:
 	case TST_UFS2_MAGIC:
-		return "UFS";
+		return "ufs";
 	case TST_F2FS_MAGIC:
-		return "F2FS";
+		return "f2fs";
 	case TST_NILFS_MAGIC:
-		return "NILFS";
+		return "nilfs";
 	case TST_EXOFS_MAGIC:
-		return "EXOFS";
+		return "exofs";
 	case TST_OVERLAYFS_MAGIC:
-		return "OVERLAYFS";
+		return "overlayfs";
 	case TST_FUSE_MAGIC:
-		return "FUSE";
+		return "fuse";
 	default:
-		return "Unknown";
+		return "unknown";
 	}
 }
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
