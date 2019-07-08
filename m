Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A83086218A
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jul 2019 17:17:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64E2C3C1C70
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jul 2019 17:17:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 961533C0309
 for <ltp@lists.linux.it>; Mon,  8 Jul 2019 17:17:17 +0200 (CEST)
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BDCCA60198D
 for <ltp@lists.linux.it>; Mon,  8 Jul 2019 17:17:16 +0200 (CEST)
Received: by mail-yw1-xc41.google.com with SMTP id i138so4517267ywg.8
 for <ltp@lists.linux.it>; Mon, 08 Jul 2019 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUgWaUd2kQ87Ntl3q8chTi1fNd4SMwqIes/0mVX0h2s=;
 b=Ur8YG9clfHPl9Brmt9K62/qTeKFVmC30cZ/+w1iS01Sepe5HUemE0OypJUe4eMHWSC
 IN69K3r34d2sRq7pIPRwWplXqykSiIe/yePP9/S2U1W2Sv/Y8QGNsIe0/5Fsgixt0IwP
 deiUK23tMYzo/7p0cq4usY/o2tqxj8OiLB1+r5YeQtlDnuA7O/kbhqwNucOFT24WgTYJ
 9gC1TGnoDCrxfeckSVNwMdyTrJhfnDDI8R0u24LM1kAzc8UHXcOuRoK+UN/bRfQqqzEp
 pXFvXdcPA3sOGr2219HDEpGOUO61uTucAtWXvlzsmtfATHVVHmCXdrhlrPda0DRUOLyQ
 DnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUgWaUd2kQ87Ntl3q8chTi1fNd4SMwqIes/0mVX0h2s=;
 b=U7Skqs8xv9e28X924Hqcr2tUco9fzmP9PbbmsbydOxKrHNCK3CmY3zGIuXNYWcU1NS
 QZ3J145N8E+ZjHlNeJL8tmZ8ZiYeaJLkuDv+eA2Yy811HwCOmbjoDy6lbhoNlmmJ40CU
 HQD/XrI05brE8zfH3iDbXSzos2D3+h64UZIX82B8F6ri56pMc3aMyrAxS7cXdE66zSod
 2RRciXlHTaJaA8LgU31ijdQswmusDmlE0vsCFMO8LZd1+KFgynmO8BXMAIDPr67V38Kt
 XKQF2VXgMVFbLpjzg/nvGpfKle/37k7hjMXMu7KPph1711ogUmZqRX/Hi1ng+WZtFSjU
 flZA==
X-Gm-Message-State: APjAAAUkULqSpKdAPLSdO5Ht3d59eJ77uNDIc+Sn6DCRhp+cB5hgFQPx
 4Xdm0d2bULwdoe9Tmj5uiRhqxoo1Kfhvdelblys=
X-Google-Smtp-Source: APXvYqwhuyz8AdVEkNnrZJHN2uo5eL1/t8k5pZsa5GrPZAxai6wRIk8KstpDhSVQ3LIIMkgkH+cBa+ksK3y37z+d8hI=
X-Received: by 2002:a0d:ce84:: with SMTP id q126mr10971253ywd.88.1562599035526; 
 Mon, 08 Jul 2019 08:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxgUfhDL3kE_2xFKTnfs+Pgn5UJ38n2aFxz4XndfUeFX8A@mail.gmail.com>
 <1562359357-24526-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1562359357-24526-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 8 Jul 2019 18:17:03 +0300
Message-ID: <CAOQ4uxhHOCb2fB_wSbBz8ekvm4S9_PsAXKD45=+MZNgt+Y-2gQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/copy_file_range02: increase coverage
 and remove EXDEV test
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

On Mon, Jul 8, 2019 at 1:46 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Since Amir path for copy_file_range has been merged into linux-xfs,
> I add test for swapfile, immutable file, bounds in ltp.  Also, add test
> for block char pipe dev and remove EXDEV test(5.3 will relax the cross-device
> constraint[2]).  I follow xfstests code[3][4][5] and increase it .
>
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?h=for-next-5.3&id=5dae222a5ff0c269730393018a5539cc970a4726
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?h=for-next-5.3&id=96e6e8f4a68df2d94800311163faa67124df24e5
> [3]https://patchwork.kernel.org/patch/10971759/
> [4]https://patchwork.kernel.org/patch/10971747/
> [5]https://patchwork.kernel.org/patch/10961421/
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../copy_file_range/copy_file_range.h         |  11 +-
>  .../copy_file_range/copy_file_range02.c       | 139 +++++++++++++++---
>  2 files changed, 130 insertions(+), 20 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> index b6d132978..f9e2565d9 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> @@ -9,6 +9,7 @@
>
>  #include <stdbool.h>
>  #include <unistd.h>
> +#include <sys/sysmacros.h>
>  #include "lapi/syscalls.h"
>
>  #define TEST_VARIANTS  2
> @@ -18,10 +19,18 @@
>  #define FILE_DEST_PATH  "file_dest"
>  #define FILE_RDONL_PATH "file_rdonl"
>  #define FILE_DIR_PATH  "file_dir"
> -#define FILE_MNTED_PATH        MNTPOINT"/file_mnted"
> +#define FILE_IMMUTABLE_PATH "file_immutable"
> +#define FILE_SWAP_PATH "file_swap"
> +#define FILE_BLKDEV    "file_blk"
> +#define FILE_CHRDEV    "file_chr"
> +#define FILE_FIFO      "file_fifo"
> +#define FILE_COPY_PATH  "file_copy"
>
>  #define CONTENT                "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
>  #define CONTSIZE       (sizeof(CONTENT) - 1)
> +#define MAX_LEN   ((long long)(~0ULL >> 1))
> +#define MIN_OFF   65537
> +#define MAX_OFF   (MAX_LEN - MIN_OFF)

In the xfstest the value of MAX_OFF is ((1ULL << 63) - MIN_OFF)
Not sure why it was changed here?

>
[...]
> +
>  static void verify_copy_file_range(unsigned int n)
>  {
>         struct tcase *tc = &tcases[n];
> +       if (tc->exp_err == ETXTBSY && chattr_i_nsup) {

if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup)

Would have made much more sense to code readers.

> +               tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
> +               return;
> +       }
> +       if (tc->exp_err == EPERM && swap_nsup) {

Same here.

> +               tst_res(TCONF, "filesystem doesn't support swapfile, skip it");
> +               return;
> +       }
>
>         TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> -                               0, CONTSIZE, tc->flags));
> +                               &tc->dst, tc->len, tc->flags));
>
[...]

>
>  static void setup(void)
>  {
>         syscall_info();
> +       dev_t dev[2];
> +
> +       dev[1] = makedev(7, 127);

As I wrote before, while it is probable the loop127 is free it is not safe
programming to assume it is free, especially not if you are trying to overwrite
its content!
I suggest that you alter  find_free_loopdev() to return the free loopdev minor
(and -1 for no free loopdev) and then you can safely use the minor number
that find_free_loopdev() returned in this test.
If there is no free loopdev you can return TCONF.

> +       dev[2] = makedev(1, 3);

What I meant was
#define FILE_CHRDEV "/dev/null"

Obviously, no need to mknod nor unlink it on cleanup...

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
