Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C857A8129F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 08:58:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B09D3C2033
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Aug 2019 08:58:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4C6A13C1DA9
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 08:58:43 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CF667600715
 for <ltp@lists.linux.it>; Mon,  5 Aug 2019 08:58:44 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id az7so36057537plb.5
 for <ltp@lists.linux.it>; Sun, 04 Aug 2019 23:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l2wRMkR94M7YO8mJEFvpIyyUbfdDKhA6RM62iGy9BVI=;
 b=FXS5lAA+1M86aAHGTKP6/JVoO4YaKBMt6rHX6rwVbw8m8mCvFRzEexMoazQ7GzjtZ1
 IzmjhK4OEHhQrvrIxSsl6S0sNuRnoAbzHA8SP5YkiVCfM0hEDnbKOKFhqE3CBGkXtTvR
 5LXGzZ8nnIscgygBm2WqtGbDSjgmt0B4qSJ3qumb+HIgBs9ht2XlPjXx/7gEE2Bl2imG
 Vr9FnuKXKxrxc/BGGAv1mQO60V6XDRjoVPGQJ7B3sn5A3NTDYwj2xdQrc6OJ2QN+wKjn
 PzZlsTABlvtjYa0E582ulkuD/LPv//trFPqA6f3CFzT05sqb+IU/8UIiN4qxYA2Xk5b7
 w4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l2wRMkR94M7YO8mJEFvpIyyUbfdDKhA6RM62iGy9BVI=;
 b=TvxMmIjdYAC68Mkyyk2cV6n3fPviSg4rg4OdQ+GiS3u5UkQzadiC8JSR1kKevCdOBA
 nNvobOIHpxYXNva9FboXia1zuVhSMgmRwfADD1UzCdDpDOdeciQuxfkQiFIC65gJNCOc
 irvZxW04muy0Czz1DGlGsPceD6cyRshnYK0SMmC8x1aBXZmQS7jJVQFMbmbtbuVtZHCz
 Yul74JX6l3snNxcVy1I6H17tCGW+ldF+nf1NUSrfO6rqidpVm78/zWVU6TiQIS7UEz9L
 FlPCdvCqgkpaiVzXkqo71jzlF1QHkXZIRleFnKtzU43g5V5cFVtW7f0TSb8L2QsHNN/K
 X56w==
X-Gm-Message-State: APjAAAXDzz2/KEvYB0rmclTqZ8b8gD79q6k2v7L7GmnUCmkf1tfViF2J
 zSvtDE1xBGW9XyIYxtI6va0=
X-Google-Smtp-Source: APXvYqxH6xNOf9ETWlG5Y+4z2G4xlr9tqPsnXG9TUEeHhcdX5+ye4q0s+TRBOmk3UDsZCrfiYpHijw==
X-Received: by 2002:a17:902:1a7:: with SMTP id
 b36mr8855336plb.115.1564988320853; 
 Sun, 04 Aug 2019 23:58:40 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p27sm124695249pfq.136.2019.08.04.23.58.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Aug 2019 23:58:40 -0700 (PDT)
Date: Mon, 5 Aug 2019 14:58:32 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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

Hi,

On Wed, Jul 31, 2019 at 06:40:29PM +0800, Yang Xu wrote:
> Since Amir patch[1] for copy_file_range has been merged into upstream
> kernel, we should add swapfile, immutable file, bounds tests in ltp.
> Also, add block,char,pipe dev tests and remove EXDEV test(the cross-device
> constraint has been relaxed since[2]). I follow xfstests code[3].
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96e6e8f4a
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5
> [3]https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/(553,554,564,565}
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> 
> ----
> v5->v6:
>    1)directly use the tst_find_free_loopdev filling dev_path
>    2)use TST_ABI64 instead of __WORDSIZE == 64
> v6->v7:
>     fix undefined PAGE_SHIFT build error
> ---
> ---
>  include/lapi/fs.h                             |   9 ++
>  .../copy_file_range/copy_file_range.h         |  13 +-
>  .../copy_file_range/copy_file_range02.c       | 145 +++++++++++++++---
>  3 files changed, 146 insertions(+), 21 deletions(-)
> 
> diff --git a/include/lapi/fs.h b/include/lapi/fs.h
> index 42cb4f9b2..1af55628c 100644
> --- a/include/lapi/fs.h
> +++ b/include/lapi/fs.h
> @@ -7,6 +7,8 @@
>  #ifdef HAVE_LINUX_FS_H
>  # include <linux/fs.h>
>  #endif
> +# include <sys/user.h>
> +# include "lapi/abisize.h"
>  
>  #ifndef LAPI_FS_H
>  #define LAPI_FS_H
> @@ -35,4 +37,11 @@
>  #define FS_NODUMP_FL	   0x00000040 /* do not dump file */
>  #endif
>  
> +/* Referred form linux kernel include/linux/fs.h */
> +#ifdef TST_ABI64
> + #define MAX_LFS_FILESIZE   ((loff_t)LLONG_MAX)
> +#else
> + #define MAX_LFS_FILESIZE   ((loff_t)ULONG_MAX << PAGE_SHIFT)
> +#endif
> +
>  #endif
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> index b6d132978..c7f423e45 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> @@ -9,7 +9,10 @@
>  
>  #include <stdbool.h>
>  #include <unistd.h>
> +#include <sys/sysmacros.h>
> +#include <limits.h>
>  #include "lapi/syscalls.h"
> +#include "lapi/fs.h"
>  
>  #define TEST_VARIANTS	2
>  
> @@ -18,10 +21,18 @@
>  #define FILE_DEST_PATH  "file_dest"
>  #define FILE_RDONL_PATH "file_rdonl"
>  #define FILE_DIR_PATH	"file_dir"
> -#define FILE_MNTED_PATH	MNTPOINT"/file_mnted"
> +#define FILE_MNTED_PATH  MNTPOINT"/file_mnted"
> +#define FILE_IMMUTABLE_PATH "file_immutable"
> +#define FILE_SWAP_PATH "file_swap"
> +#define FILE_CHRDEV    "/dev/null"
> +#define FILE_FIFO      "file_fifo"
> +#define FILE_COPY_PATH  "file_copy"
>  
>  #define CONTENT		"ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
>  #define CONTSIZE	(sizeof(CONTENT) - 1)
> +#define MAX_LEN   MAX_LFS_FILESIZE
> +#define MIN_OFF   65537
> +#define MAX_OFF   (MAX_LEN - MIN_OFF)
>  
>  static void syscall_info(void)
>  {
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 07c0207c2..36976156e 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -10,15 +10,25 @@
>   *
>   * 1) Try to copy contents to file open as readonly
>   *    -> EBADF
> - * 2) Try to copy contents to file on different mounted
> - *    filesystem -> EXDEV
> - * 3) Try to copy contents to directory -> EISDIR
> - * 4) Try to copy contents to a file opened with the
> + * 2) Try to copy contents to directory -> EISDIR
> + * 3) Try to copy contents to a file opened with the
>   *    O_APPEND flag -> EBADF
> - * 5) Try to copy contents to closed filedescriptor
> + * 4) Try to copy contents to closed filedescriptor
>   *    -> EBADF
> - * 6) Try to copy contents with invalid 'flags' value
> + * 5) Try to copy contents with invalid 'flags' value
>   *    -> EINVAL
> + * 6) Try to copy contents to a file chattred with +i
> + *    flag -> EPERM
> + * 7) Try to copy contents to a swapfile ->ETXTBSY
> + * 8) Try to copy contents to the samefile with overlapping
> + *    ->EINVAL
> + * 9) Try to copy contents to a blkdev ->EINVAL
> + * 10) Try to copy contents to a chardev ->EINVAL
> + * 11) Try to copy contents to a FIFO ->EINVAL
> + * 12) Try to copy contents to a file with length beyond
> + *     16EiB wraps around 0 -> EOVERFLOW
> + * 13) Try to copy contents to a file with target file range
> + *     beyond maximum supported file size ->EFBIG

Test 13) fails on latest Linus tree. Is there any report or working on this?

Thanks!
M

>   */
>  
>  #define _GNU_SOURCE
> @@ -29,30 +39,78 @@
>  static int fd_src;
>  static int fd_dest;
>  static int fd_rdonly;
> -static int fd_mnted;
>  static int fd_dir;
>  static int fd_closed;
>  static int fd_append;
> +static int fd_immutable;
> +static int fd_swapfile;
> +static int fd_dup;
> +static int fd_blkdev;
> +static int fd_chrdev;
> +static int fd_fifo;
> +static int fd_copy;
> +
> +static int chattr_i_nsup;
> +static int swap_nsup;
> +static int loop_devn;
>  
>  static struct tcase {
>  	int	*copy_to_fd;
>  	int	flags;
>  	int	exp_err;
> +	loff_t  dst;
> +	loff_t     len;
>  } tcases[] = {
> -	{&fd_rdonly,	0,	EBADF},
> -	{&fd_mnted,	0,	EXDEV},
> -	{&fd_dir,	0,	EISDIR},
> -	{&fd_append,	0,	EBADF},
> -	{&fd_closed,	0,	EBADF},
> -	{&fd_dest,	-1,	EINVAL},
> +	{&fd_rdonly,	0,   EBADF,      0,     CONTSIZE},
> +	{&fd_dir,	0,   EISDIR,     0,     CONTSIZE},
> +	{&fd_append,	0,   EBADF,      0,     CONTSIZE},
> +	{&fd_closed,	0,   EBADF,      0,     CONTSIZE},
> +	{&fd_dest,	-1,  EINVAL,     0,     CONTSIZE},
> +	{&fd_immutable, 0,   EPERM,      0,     CONTSIZE},
> +	{&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE},
> +	{&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2},
> +	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE},
> +	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
> +	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
> +	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX},
> +	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
>  };
>  
> +static int run_command(char *command, char *option, char *file)
> +{
> +	const char *const cmd[] = {command, option, file, NULL};
> +	int ret;
> +
> +	ret = tst_run_cmd(cmd, NULL, NULL, 1);
> +	switch (ret) {
> +	case 0:
> +	return 0;
> +	case 255:
> +		tst_res(TCONF, "%s binary not installed", command);
> +	return 1;
> +	default:
> +		tst_res(TCONF, "%s exited with %i", command, ret);
> +	return 2;
> +	}
> +}
> +
>  static void verify_copy_file_range(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
> -
> +	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
> +		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
> +		return;
> +	}
> +	if (tc->copy_to_fd == &fd_swapfile && swap_nsup) {
> +		tst_res(TCONF, "filesystem doesn't support swapfile, skip it");
> +		return;
> +	}
> +	if (tc->copy_to_fd == &fd_blkdev && loop_devn == -1) {
> +		tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
> +		return;
> +	}
>  	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> -				0, CONTSIZE, tc->flags));
> +				&tc->dst, tc->len, tc->flags));
>  
>  	if (TST_RET == -1) {
>  		if (tc->exp_err == TST_ERR) {
> @@ -76,33 +134,80 @@ static void cleanup(void)
>  		SAFE_CLOSE(fd_append);
>  	if (fd_dir > 0)
>  		SAFE_CLOSE(fd_dir);
> -	if (fd_mnted > 0)
> -		SAFE_CLOSE(fd_mnted);
>  	if (fd_rdonly > 0)
>  		SAFE_CLOSE(fd_rdonly);
>  	if (fd_dest > 0)
>  		SAFE_CLOSE(fd_dest);
>  	if (fd_src > 0)
>  		SAFE_CLOSE(fd_src);
> +	if (fd_immutable > 0) {
> +		run_command("chattr", "-i", FILE_IMMUTABLE_PATH);
> +		SAFE_CLOSE(fd_immutable);
> +	}
> +	if (fd_swapfile > 0) {
> +		run_command("swapoff", FILE_SWAP_PATH, NULL);
> +		SAFE_CLOSE(fd_swapfile);
> +	}
> +	if (fd_dup > 0)
> +		SAFE_CLOSE(fd_dup);
> +	if (fd_copy > 0)
> +		SAFE_CLOSE(fd_copy);
> +	SAFE_UNLINK(FILE_FIFO);
>  }
>  
>  static void setup(void)
>  {
>  	syscall_info();
> +	char dev_path[1024];
>  
>  	if (access(FILE_DIR_PATH, F_OK) == -1)
>  		SAFE_MKDIR(FILE_DIR_PATH, 0777);
> +	/*
> +	 * call tst_find_free_loopdev(), avoid overwriting its
> +	 * content on used loopdev.
> +	 */
> +	loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> +
> +	SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
>  
>  	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>  	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
>  	fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
> -	fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>  	fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
>  	fd_closed = -1;
>  	fd_append = SAFE_OPEN(FILE_DEST_PATH,
>  			O_RDWR | O_CREAT | O_APPEND, 0664);
> +	fd_immutable = SAFE_OPEN(FILE_IMMUTABLE_PATH, O_RDWR | O_CREAT, 0664);
> +	fd_swapfile = SAFE_OPEN(FILE_SWAP_PATH, O_RDWR | O_CREAT, 0600);
> +
> +	if (loop_devn == -1)
> +		fd_blkdev = SAFE_OPEN(dev_path, O_RDWR, 0600);
> +
> +	fd_chrdev = SAFE_OPEN(FILE_CHRDEV, O_RDWR, 0600);
> +	fd_fifo = SAFE_OPEN(FILE_FIFO, O_RDWR, 0600);
> +
> +	SAFE_WRITE(1, fd_src, CONTENT, CONTSIZE);
> +	close(fd_src);
> +	fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY, 0664);
> +	fd_dup = SAFE_OPEN(FILE_SRC_PATH, O_WRONLY|O_CREAT, 0666);
> +
> +	fd_copy = SAFE_OPEN(FILE_COPY_PATH, O_RDWR | O_CREAT | O_TRUNC, 0664);
> +	chattr_i_nsup = run_command("chattr", "+i", FILE_IMMUTABLE_PATH);
> +
> +	if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES)) {
> +		tst_res(TCONF, "Insufficient disk space to create swap file");
> +		swap_nsup = 3;
> +		return;
> +	}
> +
> +	if (tst_fill_file(FILE_SWAP_PATH, 0, sysconf(_SC_PAGESIZE), 10) != 0) {
> +		tst_res(TCONF, "Failed to create swapfile");
> +		swap_nsup = 4;
> +		return;
> +	}
>  
> -	SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> +	swap_nsup = run_command("mkswap", FILE_SWAP_PATH, NULL);
> +	swap_nsup = run_command("swapon", FILE_SWAP_PATH, NULL);
>  }
>  
>  static struct tst_test test = {
> @@ -113,6 +218,6 @@ static struct tst_test test = {
>  	.needs_root = 1,
>  	.mount_device = 1,
>  	.mntpoint = MNTPOINT,
> -	.dev_fs_type = "ext4",
> +	.all_filesystems = 1,
>  	.test_variants = TEST_VARIANTS,
>  };
> -- 
> 2.18.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
