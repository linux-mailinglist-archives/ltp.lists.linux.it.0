Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB627E4F2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 11:19:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E9753C2A13
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 11:19:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 798453C27DE
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 11:19:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 015E0601236
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 11:19:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70A6AB016;
 Wed, 30 Sep 2020 09:19:22 +0000 (UTC)
Date: Wed, 30 Sep 2020 11:19:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Qian Cai <cai@redhat.com>
Message-ID: <20200930091948.GB6611@yuki.lan>
References: <766e56497d9e5e10bf676422f6cfe63c9bd1590d.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <766e56497d9e5e10bf676422f6cfe63c9bd1590d.camel@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] diotest4: Fix false postives on FUSE
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
Cc: Mike Frysinger <vapier@gentoo.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Vivek Goyal <vgoyal@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> It looks like FUSE does not support the unaligned IO, because it does
> not directly backed by a block device. Therefore, in fuse_direct_IO(),
> there is no checking of unaligned IO to return -EINVAL like other
> filesystems from iomap_dio_bio_actor().
> 
> diotest4    3  TFAIL  :  diotest4.c:114: read allows odd count. returns 1: Success
> diotest4    4  TFAIL  :  diotest4.c:129: write allows odd count.returns 1: Success
> diotest4    5  TFAIL  :  diotest4.c:180: Odd count of read and write
> ...
> diotest4   16  TFAIL  :  diotest4.c:114: read allows  nonaligned buf. returns 4096: Success
> diotest4   17  TFAIL  :  diotest4.c:129: write allows  nonaligned buf.returns 4096: Success
> diotest4   18  TFAIL  :  diotest4.c:180: read, write with non-aligned buffer
> 
> Signed-off-by: Qian Cai <cai@redhat.com>
> ---
>  include/tst_fs.h                         | 45 ++++++++++++------------
>  lib/tst_fs_type.c                        |  2 ++
>  testcases/kernel/io/direct_io/diotest4.c |  2 ++
>  3 files changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/include/tst_fs.h b/include/tst_fs.h
> index fc0390582..a44d5e3b2 100644
> --- a/include/tst_fs.h
> +++ b/include/tst_fs.h
> @@ -6,29 +6,30 @@
>  #define TST_FS_H__
>  
>  /* man 2 statfs or kernel-source/include/linux/magic.h */
> -#define TST_BTRFS_MAGIC    0x9123683E
> -#define TST_NFS_MAGIC      0x6969
> -#define TST_RAMFS_MAGIC    0x858458f6
> -#define TST_TMPFS_MAGIC    0x01021994
> -#define TST_V9FS_MAGIC     0x01021997
> -#define TST_XFS_MAGIC      0x58465342
> -#define TST_EXT2_OLD_MAGIC 0xEF51
> +#define TST_BTRFS_MAGIC      0x9123683E
> +#define TST_NFS_MAGIC        0x6969
> +#define TST_RAMFS_MAGIC      0x858458f6
> +#define TST_TMPFS_MAGIC      0x01021994
> +#define TST_V9FS_MAGIC       0x01021997
> +#define TST_XFS_MAGIC        0x58465342
> +#define TST_EXT2_OLD_MAGIC   0xEF51
>  /* ext2, ext3, ext4 have the same magic number */
> -#define TST_EXT234_MAGIC   0xEF53
> -#define TST_MINIX_MAGIC    0x137F
> -#define TST_MINIX_MAGIC2   0x138F
> -#define TST_MINIX2_MAGIC   0x2468
> -#define TST_MINIX2_MAGIC2  0x2478
> -#define TST_MINIX3_MAGIC   0x4D5A
> -#define TST_UDF_MAGIC      0x15013346
> -#define TST_SYSV2_MAGIC    0x012FF7B6
> -#define TST_SYSV4_MAGIC    0x012FF7B5
> -#define TST_UFS_MAGIC      0x00011954
> -#define TST_UFS2_MAGIC     0x19540119
> -#define TST_F2FS_MAGIC     0xF2F52010
> -#define TST_NILFS_MAGIC    0x3434
> -#define TST_EXOFS_MAGIC    0x5DF5
> -#define TST_OVERLAYFS_MAGIC 0x794c7630
> +#define TST_EXT234_MAGIC     0xEF53
> +#define TST_MINIX_MAGIC      0x137F
> +#define TST_MINIX_MAGIC2     0x138F
> +#define TST_MINIX2_MAGIC     0x2468
> +#define TST_MINIX2_MAGIC2    0x2478
> +#define TST_MINIX3_MAGIC     0x4D5A
> +#define TST_UDF_MAGIC        0x15013346
> +#define TST_SYSV2_MAGIC      0x012FF7B6
> +#define TST_SYSV4_MAGIC      0x012FF7B5
> +#define TST_UFS_MAGIC        0x00011954
> +#define TST_UFS2_MAGIC       0x19540119
> +#define TST_F2FS_MAGIC       0xF2F52010
> +#define TST_NILFS_MAGIC      0x3434
> +#define TST_EXOFS_MAGIC      0x5DF5
> +#define TST_OVERLAYFS_MAGIC  0x794c7630
> +#define TST_FUSE_SUPER_MAGIC 0x65735546

The rest of the constants here does not include the SUPER string, please
make it just TST_FUSE_MAGIC.

>  enum {
>  	TST_BYTES = 1,
> diff --git a/lib/tst_fs_type.c b/lib/tst_fs_type.c
> index 1d0ac9669..21eb58a78 100644
> --- a/lib/tst_fs_type.c
> +++ b/lib/tst_fs_type.c
> @@ -84,6 +84,8 @@ const char *tst_fs_type_name(long f_type)
>  		return "EXOFS";
>  	case TST_OVERLAYFS_MAGIC:
>  		return "OVERLAYFS";
> +	case TST_FUSE_SUPER_MAGIC:
> +		return "FUSE"

This does not even compile.

>  	default:
>  		return "Unknown";
>  	}
> diff --git a/testcases/kernel/io/direct_io/diotest4.c
> b/testcases/kernel/io/direct_io/diotest4.c

This part of the patch has been line wrapped by your email client.
Please configure it properly so that it does not mangle patches.

> index bf200cd41..5f866bd93 100644
> --- a/testcases/kernel/io/direct_io/diotest4.c
> +++ b/testcases/kernel/io/direct_io/diotest4.c
> @@ -270,6 +270,7 @@ int main(int argc, char *argv[])
>  	switch (fs_type) {
>  	case TST_NFS_MAGIC:
>  	case TST_BTRFS_MAGIC:
> +	case TST_FUSE_SUPER_MAGIC:
>  		tst_resm(TCONF, "%s supports odd count IO",
>  			 tst_fs_type_name(fs_type));
>  	break;
> @@ -442,6 +443,7 @@ int main(int argc, char *argv[])
>  	switch (fs_type) {
>  	case TST_NFS_MAGIC:
>  	case TST_BTRFS_MAGIC:
> +	case TST_FUSE_SUPER_MAGIC:
>  		tst_resm(TCONF, "%s supports non-aligned buffer",
>  			 tst_fs_type_name(fs_type));
>  	break;

Other than that the patch looks fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
