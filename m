Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094F6432B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:57:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 029543C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:57:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C61053C02C2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:57:54 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B94101A014CC
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:57:53 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id z63so514124ywz.9
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpksycQmi93Sz+7Mg/bSrc8M3zH1J/YVVUfLj/KKTnI=;
 b=eElkclsvSQsnmKkAwcIe/7BurjIIM7Iq+sDfGsjNn9ZvArvl6FfWN3NYWy8eOXug9m
 9yHoOjmJ+G48YTuIUWFOSw1PByTipcNWVHVofNST4MkTp2R/B27v8RWhV61sA3mMRsxs
 hXONbhx18ML1vTD69CVuSrEYz6tFWdeByjqmpBuyyMRkH5spHFDXk9aM4qoCnwtqePG7
 H5XFiqW6T3owzlgWq1bjF5prJVlxPhsdJS4FFS2eqCRm6IoraEwlA/SsOyhWWBw1OBCR
 14plDO7AJMkGmBU2RfuJsaqABGdQGGODefzQ8It/oT5OFbbP86YAwmLmMCUynQep/4L+
 RifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpksycQmi93Sz+7Mg/bSrc8M3zH1J/YVVUfLj/KKTnI=;
 b=RobFqCxRM3snXJ1CYQQXD7QZhL9FDCK8mRfIP9UCiyqfD+IAzArkujrKREN0UQQLEF
 zD/KQ7GOkYkXOFs/gxB6HB6TUI1DjzRO5TZxsSbHp71csd4AxeSt84/bSwNNKo5wa4Xj
 c7dPgwigDeAnNTompvDpSmuE8eMBkmb3RPdYXhX5s4LYGmqErSpTG4cMlpq/1KkPfaYr
 ZScDE27vFNbybOlPfrwB9c/IOkc2NNYlGBgQS35U2Jh19xL3or19b6mmxOuIAEbVXIUk
 dAkpcegy3Mz3lZXiuzEp4Pefb2avBy03kDnxZkNrXlYxAywPhIaFmSLHIrCWryILh2P2
 PKQw==
X-Gm-Message-State: APjAAAWi3iA5zO1e/Gvg3CduZ+oOV/IPb+XdQSXrCkYUm0dwOZIEd7JO
 sQ1bp0LDwm48SykJI9Zz8QW0QOllZgzbI6moI84Iy248
X-Google-Smtp-Source: APXvYqxy3pr6szxJshcy/G8CPCwpMymvQ2wTkcB+mPI65YEbmssAiwC1AtlJUsbUHLB5Xc35jg69ieSkV3hskdIBsls=
X-Received: by 2002:a81:31c3:: with SMTP id x186mr13019507ywx.25.1562745472525; 
 Wed, 10 Jul 2019 00:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxhjbaszcCL0=QAncBT3PzqJR_7oyR+_0-zNa-pt6JNQSA@mail.gmail.com>
 <1562743104-2705-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1562743104-2705-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1562743104-2705-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 10 Jul 2019 10:57:41 +0300
Message-ID: <CAOQ4uxhGnVxYyNFmqiJUxfQesnWGhqwdLB88CyiCUFMJx8ybFA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/copy_file_range02: increase
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jul 10, 2019 at 10:18 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Since Amir patch[1] for copy_file_range has been merged into linux-xfs for
> next branch, I want to add test for swapfile, immutable file, bounds in ltp.
> Also, add test for block,char,pipe dev and remove EXDEV test(5.3 will relax
> the cross-device constraint[2]).  I follow xfstests code[3][4][5].
>
> [1]https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&id=96e6e8f
> [2]https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&id=5dae222
> [3]https://patchwork.kernel.org/patch/10971759/
> [4]https://patchwork.kernel.org/patch/10971747/
> [5]https://patchwork.kernel.org/patch/10961421/
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

A few documentation nits below, otherwise you may add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../copy_file_range/copy_file_range.h         |  20 ++-
>  .../copy_file_range/copy_file_range02.c       | 142 +++++++++++++++---
>  2 files changed, 141 insertions(+), 21 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> index b6d132978..2a9eec75d 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> @@ -9,6 +9,8 @@
>
>  #include <stdbool.h>
>  #include <unistd.h>
> +#include <sys/sysmacros.h>
> +#include <limits.h>
>  #include "lapi/syscalls.h"
>
>  #define TEST_VARIANTS  2
> @@ -18,11 +20,27 @@
>  #define FILE_DEST_PATH  "file_dest"
>  #define FILE_RDONL_PATH "file_rdonl"
>  #define FILE_DIR_PATH  "file_dir"
> -#define FILE_MNTED_PATH        MNTPOINT"/file_mnted"
> +#define FILE_MNTED_PATH  MNTPOINT"/file_mnted"
> +#define FILE_IMMUTABLE_PATH "file_immutable"
> +#define FILE_SWAP_PATH "file_swap"
> +#define FILE_BLKDEV    "file_blk"
> +#define FILE_CHRDEV    "/dev/null"
> +#define FILE_FIFO      "file_fifo"
> +#define FILE_COPY_PATH  "file_copy"
>
>  #define CONTENT                "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
>  #define CONTSIZE       (sizeof(CONTENT) - 1)
>

Worth a comment where of file this was copied from
and might be better to put it in some common header file

> +#if __WORDSIZE == 64
> +       #define MAX_LFS_FILESIZE        ((loff_t)LLONG_MAX)
> +#else
> +       #define MAX_LFS_FILESIZE        ((loff_t)ULONG_MAX << PAGE_SHIFT)
> +#endif
> +
> +#define MAX_LEN   MAX_LFS_FILESIZE
> +#define MIN_OFF   65537
> +#define MAX_OFF   (MAX_LEN - MIN_OFF)
> +
>  static void syscall_info(void)
>  {
>         switch (tst_variant) {
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 07c0207c2..abe6d5751 100644
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

Rephrase for description to be correct also on 32bit
BTW, I don't think current definition of 2*MAX_LEN
actually overflows on 32bit?

> + * 13) Try to copy contents to a file with target file range
> + *     beyond 8EiB ->EFBIG

Rephrase: beyond maximum supported file size

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
>         int     *copy_to_fd;
>         int     flags;
>         int     exp_err;
> +       loff_t  dst;
> +       loff_t     len;
>  } tcases[] = {
> -       {&fd_rdonly,    0,      EBADF},
> -       {&fd_mnted,     0,      EXDEV},
> -       {&fd_dir,       0,      EISDIR},
> -       {&fd_append,    0,      EBADF},
> -       {&fd_closed,    0,      EBADF},
> -       {&fd_dest,      -1,     EINVAL},
> +       {&fd_rdonly,    0,   EBADF,      0,     CONTSIZE},
> +       {&fd_dir,       0,   EISDIR,     0,     CONTSIZE},
> +       {&fd_append,    0,   EBADF,      0,     CONTSIZE},
> +       {&fd_closed,    0,   EBADF,      0,     CONTSIZE},
> +       {&fd_dest,      -1,  EINVAL,     0,     CONTSIZE},
> +       {&fd_immutable, 0,   EPERM,      0,     CONTSIZE},
> +       {&fd_swapfile,  0,   ETXTBSY,    0,     CONTSIZE},
> +       {&fd_dup,       0,   EINVAL,     0,     CONTSIZE/2},
> +       {&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE},
> +       {&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE},
> +       {&fd_fifo,      0,   EINVAL,     0,     CONTSIZE},
> +       {&fd_copy,      0,   EOVERFLOW,  MAX_OFF, 2*MAX_LEN},
> +       {&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF},
>  };
>
> +static int run_command(char *command, char *option, char *file)
> +{
> +       const char *const cmd[] = {command, option, file, NULL};
> +       int ret;
> +
> +       ret = tst_run_cmd(cmd, NULL, NULL, 1);
> +       switch (ret) {
> +       case 0:
> +       return 0;
> +       case 255:
> +               tst_res(TCONF, "%s binary not installed", command);
> +       return 1;
> +       default:
> +               tst_res(TCONF, "%s exited with %i", command, ret);
> +       return 2;
> +       }
> +}
> +
>  static void verify_copy_file_range(unsigned int n)
>  {
>         struct tcase *tc = &tcases[n];
> -
> +       if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
> +               tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
> +               return;
> +       }
> +       if (tc->copy_to_fd == &fd_swapfile && swap_nsup) {
> +               tst_res(TCONF, "filesystem doesn't support swapfile, skip it");
> +               return;
> +       }
> +       if (tc->copy_to_fd == &fd_blkdev && loop_devn == -1) {
> +               tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
> +               return;
> +       }
>         TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> -                               0, CONTSIZE, tc->flags));
> +                               &tc->dst, tc->len, tc->flags));
>
>         if (TST_RET == -1) {
>                 if (tc->exp_err == TST_ERR) {
> @@ -76,14 +134,27 @@ static void cleanup(void)
>                 SAFE_CLOSE(fd_append);
>         if (fd_dir > 0)
>                 SAFE_CLOSE(fd_dir);
> -       if (fd_mnted > 0)
> -               SAFE_CLOSE(fd_mnted);
>         if (fd_rdonly > 0)
>                 SAFE_CLOSE(fd_rdonly);
>         if (fd_dest > 0)
>                 SAFE_CLOSE(fd_dest);
>         if (fd_src > 0)
>                 SAFE_CLOSE(fd_src);
> +       if (fd_immutable > 0) {
> +               run_command("chattr", "-i", FILE_IMMUTABLE_PATH);
> +               SAFE_CLOSE(fd_immutable);
> +       }
> +       if (fd_swapfile > 0) {
> +               run_command("swapoff", FILE_SWAP_PATH, NULL);
> +               SAFE_CLOSE(fd_swapfile);
> +       }
> +       if (fd_dup > 0)
> +               SAFE_CLOSE(fd_dup);
> +       if (loop_devn >= 0)
> +               SAFE_UNLINK(FILE_BLKDEV);
> +       if (fd_copy > 0)
> +               SAFE_CLOSE(fd_copy);
> +       SAFE_UNLINK(FILE_FIFO);
>  }
>
>  static void setup(void)
> @@ -93,16 +164,47 @@ static void setup(void)
>         if (access(FILE_DIR_PATH, F_OK) == -1)
>                 SAFE_MKDIR(FILE_DIR_PATH, 0777);
>
> +       loop_devn = find_free_loopdev();
> +       if (loop_devn >= 0)
> +               SAFE_MKNOD(FILE_BLKDEV, S_IFBLK | 0777, makedev(7, loop_devn));
> +

This can raise eyebrows - worth a comment that we want to create a
non-instantiated loop device

> +       SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
> +
>         fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>         fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
>         fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
> -       fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>         fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
>         fd_closed = -1;
>         fd_append = SAFE_OPEN(FILE_DEST_PATH,
>                         O_RDWR | O_CREAT | O_APPEND, 0664);
> +       fd_immutable = SAFE_OPEN(FILE_IMMUTABLE_PATH, O_RDWR | O_CREAT, 0664);
> +       fd_swapfile = SAFE_OPEN(FILE_SWAP_PATH, O_RDWR | O_CREAT, 0600);
> +       fd_blkdev = SAFE_OPEN(FILE_BLKDEV, O_RDWR, 0600);
> +       fd_chrdev = SAFE_OPEN(FILE_CHRDEV, O_RDWR, 0600);
> +       fd_fifo = SAFE_OPEN(FILE_FIFO, O_RDWR, 0600);
> +
> +       SAFE_WRITE(1, fd_src, CONTENT, CONTSIZE);
> +       close(fd_src);
> +       fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY, 0664);
> +       fd_dup = SAFE_OPEN(FILE_SRC_PATH, O_WRONLY|O_CREAT, 0666);
> +
> +       fd_copy = SAFE_OPEN(FILE_COPY_PATH, O_RDWR | O_CREAT | O_TRUNC, 0664);
> +       chattr_i_nsup = run_command("chattr", "+i", FILE_IMMUTABLE_PATH);
> +
> +       if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES)) {
> +               tst_res(TCONF, "Insufficient disk space to create swap file");
> +               swap_nsup = 3;
> +               return;
> +       }
> +
> +       if (tst_fill_file(FILE_SWAP_PATH, 0, sysconf(_SC_PAGESIZE), 10) != 0) {
> +               tst_res(TCONF, "Failed to create swapfile");
> +               swap_nsup = 4;
> +               return;
> +       }
>
> -       SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> +       swap_nsup = run_command("mkswap", FILE_SWAP_PATH, NULL);
> +       swap_nsup = run_command("swapon", FILE_SWAP_PATH, NULL);
>  }
>
>  static struct tst_test test = {
> @@ -113,6 +215,6 @@ static struct tst_test test = {
>         .needs_root = 1,
>         .mount_device = 1,
>         .mntpoint = MNTPOINT,
> -       .dev_fs_type = "ext4",
> +       .all_filesystems = 1,
>         .test_variants = TEST_VARIANTS,
>  };
> --
> 2.18.1
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
