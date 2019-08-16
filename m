Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D468FE8B
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 10:53:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B11E53C1D6B
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Aug 2019 10:53:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 13A5F3C1CFF
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 10:53:20 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6C5341A0173D
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 10:53:19 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id t14so2176806plr.11
 for <ltp@lists.linux.it>; Fri, 16 Aug 2019 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=POcVhmI0Etiz1agvc6ON6fYPHMWucUwgxCvSrm9x9sw=;
 b=i3SnKqwf13LJ1KQxjPdGgbJbEMLOroeRhvBzFvbDEQ3Tp5lTuIwzA9cZw0zWWfWjC9
 xGcDr0hol26QNVAmzrTn/mxLoYsXHGlKNg7tz/9itY9O1wgCRmEixi9jfjvIvgRFen3l
 L2rRHvcVA8D+S3rH/9iYTy5L4VPPxqneshrvhVYMCzeM8gOMxf57bcvjyznSx5R/nYx+
 uSytSK9Gh8xxl9aIQB/hODZhsupHjb2shF93sN9IqOSQlKSIdKiidxTlesGNmWPhFnAE
 ycho9oRlVL5uMuYChs3MzDvTrVwSDeE8wDL3QGpJJtcCpfPswArmPDConLEOQU1cuy3n
 GL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=POcVhmI0Etiz1agvc6ON6fYPHMWucUwgxCvSrm9x9sw=;
 b=OhcMb2RZdQ0X5NLx8+8N/FMQ7bpp0RfTo+VDgcKyo2RhaUdg03fpaGR+ikzDJWoW5x
 lHgscis59Of/AWLqNQrjUYnDpLFF366Z41myQ6q5URSta0B5aUURlVK4ALzGUB2R7q3c
 FT4LBhKv4AobDu0FgsdAfBjNH0LizQlK7fYt8E8AWGwVVRn/cm0v9Ig2K07h8bATvnol
 xN3Z+7sMgfaFvaojfFKHRWlKlbarqFGRTXKF5bPWHdRpr4jGvEBlnzHWE/48A001xv9z
 yMvp5/oX8djDXOfgA4M0+X5saeJCXR0Mn3Cn/2kqH+XuV7vyXoWIq5UXF68buCj3K7kH
 PY4A==
X-Gm-Message-State: APjAAAUy2VMNBCVgOtTTfOXApzijU8vNQc3e7N4z1X0ZH577j4uR/zCD
 E5slTiQGGwQhQIv6+Fh67WY=
X-Google-Smtp-Source: APXvYqzJH7cJRG68Pm/s4bmiN2T+AofrrEiWx7baCLThMLvOf3YCarCQ6GOs/lvN9nldYpNZ3oryUA==
X-Received: by 2002:a17:902:e60c:: with SMTP id
 cm12mr6725425plb.304.1565945597628; 
 Fri, 16 Aug 2019 01:53:17 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y11sm5193441pfb.119.2019.08.16.01.53.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 01:53:17 -0700 (PDT)
Date: Fri, 16 Aug 2019 16:53:09 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
References: <20190815083630.26975-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815083630.26975-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/fs.h: Replace MAX_LFS_FILESIZE constant with
 own implementation
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Aug 15, 2019 at 10:36:30AM +0200, Petr Vorel wrote:
> Some libc implementations on arm (at least AArch32 target with hard
> float (arm-linux-gnueabihf)) or some libc (musl, bionic) does not
> export PAGE_SHIFT. Replace it with own inline function.
> 
> This required to replace MAX_LFS_FILESIZE constant with function
> tst_max_lfs_filesize(). Given that we must use MAX_OFF in a function,
> move dst from tcase struct to verify_copy_file_range().
> 
> Credits for 32 bit MAX_LFS_FILESIZE algorithm: Cyril Hrubis.

I got the same results:

copy_file_range02.c:120: INFO: dst 9223372036854710270 len 65537
copy_file_range02.c:136: FAIL: copy_file_range returned wrong value: 32

THanks,
M

> 
> + replace spaces with tabs in struct tcase.
> 
> Fixes: bc514b224 ("syscalls/copy_file_range02: increase coverage and remove EXDEV test")
> Fixes: #555
> 
> Reported-by: alexchu-cpe
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  include/lapi/fs.h                             | 31 ++++++++++++----
>  .../copy_file_range/copy_file_range.h         |  3 --
>  .../copy_file_range/copy_file_range02.c       | 35 +++++++++++--------
>  3 files changed, 45 insertions(+), 24 deletions(-)
> 
> diff --git a/include/lapi/fs.h b/include/lapi/fs.h
> index 1af55628c..430d21f27 100644
> --- a/include/lapi/fs.h
> +++ b/include/lapi/fs.h
> @@ -1,14 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Referred from linux kernel -github/torvalds/linux/include/uapi/linux/fs.h
> + * Referred from linux kernel include/uapi/linux/fs.h
> + * Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
>   * Copyright (c) Zilogic Systems Pvt. Ltd., 2018
>   * Email: code@zilogic.com
>   */
> +
>  #ifdef HAVE_LINUX_FS_H
>  # include <linux/fs.h>
>  #endif
> -# include <sys/user.h>
> -# include "lapi/abisize.h"
> +
> +#include <sys/user.h>
> +#include <limits.h>
> +#include "lapi/abisize.h"
>  
>  #ifndef LAPI_FS_H
>  #define LAPI_FS_H
> @@ -37,11 +41,26 @@
>  #define FS_NODUMP_FL	   0x00000040 /* do not dump file */
>  #endif
>  
> -/* Referred form linux kernel include/linux/fs.h */
> +/*
> + * Helper function to get MAX_LFS_FILESIZE.
> + * Missing PAGE_SHIFT on some libc prevents defining MAX_LFS_FILESIZE.
> + *
> + * 64 bit: macro taken from kernel from include/linux/fs.h
> + * 32 bit: own implementation
> + */
> +static inline loff_t tst_max_lfs_filesize(void)
> +{
>  #ifdef TST_ABI64
> - #define MAX_LFS_FILESIZE   ((loff_t)LLONG_MAX)
> +	return (loff_t)LLONG_MAX;
>  #else
> - #define MAX_LFS_FILESIZE   ((loff_t)ULONG_MAX << PAGE_SHIFT)
> +        long page_size = getpagesize();
> +        loff_t ret = ULONG_MAX;
> +
> +        while (page_size >>= 1)
> +                ret <<= 1;
> +
> +        return ret;
>  #endif
> +}
>  
>  #endif
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> index 24e08e390..40d05d653 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> @@ -10,7 +10,6 @@
>  #include <stdbool.h>
>  #include <unistd.h>
>  #include <sys/sysmacros.h>
> -#include <limits.h>
>  #include "lapi/syscalls.h"
>  #include "lapi/fs.h"
>  
> @@ -30,9 +29,7 @@
>  
>  #define CONTENT		"ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
>  #define CONTSIZE	(sizeof(CONTENT) - 1)
> -#define MAX_LEN   MAX_LFS_FILESIZE
>  #define MIN_OFF   65537
> -#define MAX_OFF   (MAX_LEN - MIN_OFF)
>  
>  static void syscall_info(void)
>  {
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 9004c4a40..a08df9bdb 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -58,23 +58,22 @@ static struct tcase {
>  	int	*copy_to_fd;
>  	int	flags;
>  	int	exp_err;
> -	loff_t  dst;
>  	loff_t     len;
>  	const char *tname;
>  } tcases[] = {
> -	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE, "readonly file"},
> -	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE, "directory"},
> -	{&fd_append,	0,   EBADF,      0,     CONTSIZE, "append to file"},
> -	{&fd_closed,	0,   EBADF,      0,     CONTSIZE, "closed file descriptor"},
> -	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE, "invalid flags"},
> -	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE, "immutable file"},
> -	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE, "swap file"},
> -	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2, "overlaping range"},
> -	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
> -	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "char device"},
> -	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
> -	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
> -	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
> +	{&fd_rdonly,	0,	EBADF,		CONTSIZE,	"readonly file"},
> +	{&fd_dir,	0,	EISDIR,		CONTSIZE,	"directory"},
> +	{&fd_append,	0,	EBADF,		CONTSIZE,	"append to file"},
> +	{&fd_closed,	0,	EBADF,		CONTSIZE,	"closed file descriptor"},
> +	{&fd_dest,	-1,	EINVAL,		CONTSIZE,	"invalid flags"},
> +	{&fd_immutable,	0,	EPERM,		CONTSIZE,	"immutable file"},
> +	{&fd_swapfile,	0,	ETXTBSY,	CONTSIZE,	"swap file"},
> +	{&fd_dup,	0,	EINVAL,		CONTSIZE/2,	"overlaping range"},
> +	{&fd_blkdev,	0,	EINVAL,		CONTSIZE,	"block device"},
> +	{&fd_chrdev,	0,	EINVAL,		CONTSIZE,	"char device"},
> +	{&fd_fifo,	0,	EINVAL,		CONTSIZE,	"fifo"},
> +	{&fd_copy,	0,	EOVERFLOW,	ULLONG_MAX,	"max length lenght"},
> +	{&fd_copy,	0,	EFBIG,		MIN_OFF,	"max file size"},
>  };
>  
>  static int run_command(char *command, char *option, char *file)
> @@ -98,6 +97,8 @@ static int run_command(char *command, char *option, char *file)
>  static void verify_copy_file_range(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
> +	loff_t dst = 0;
> +
>  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>  
>  	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
> @@ -112,8 +113,12 @@ static void verify_copy_file_range(unsigned int n)
>  		tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
>  		return;
>  	}
> +
> +	if (tc->copy_to_fd == &fd_copy)
> +		dst = tst_max_lfs_filesize() - MIN_OFF;
> +
>  	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> -				&tc->dst, tc->len, tc->flags));
> +				&dst, tc->len, tc->flags));
>  
>  	if (TST_RET == -1) {
>  		if (tc->exp_err == TST_ERR) {
> -- 
> 2.22.0
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
