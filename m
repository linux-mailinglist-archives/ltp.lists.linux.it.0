Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F7633EB
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 12:06:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B95223C1CFD
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 12:06:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A625D3C176C
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 12:06:50 +0200 (CEST)
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 162211000457
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 12:06:45 +0200 (CEST)
Received: by mail-yb1-xb43.google.com with SMTP id 13so1972773ybx.8
 for <ltp@lists.linux.it>; Tue, 09 Jul 2019 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJqAWnEFUsFopJN+R3yC83dmhjT965SS1H0uOaMRsJo=;
 b=OLKsnY6bzpEfOVpog6JnXWlurm5k9SjaVR8ex5tx0tgAzdvuy9YanNgGoWLUc2Uc0U
 /L04BNldCDVEoVov87pvyOmt0IULIuxHSS8MyI/Xbq1lTM2EFuXMO7yuJanF98EZVxH+
 b2Th/dc+0vEPs2lJWhpdNcSOUSygTeRPuWVMIJMPESeRvxErD+VAop9P07em3LBV67sA
 7fEPrCdO+9tndu/6U5K4mfGdaz23RVUjPMcNuPJo84MjnHMUjhQXK7neSmUc08B9T+9L
 tKPdbnwWKH8m/zv7Mf5zPhUQwPahdqOIfZORKXZx0dMzOAJhPZCbnBjPqNjUAjdqt7gQ
 d/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJqAWnEFUsFopJN+R3yC83dmhjT965SS1H0uOaMRsJo=;
 b=ZwfhlVnNb9sXggggNX8TPr1sVQSTajYnv1MV2wuYBrnYxU3khTQAIixB8BHOY5DjiH
 LcJzI38TeOo6UUnJcd+i/KQeW1HVNEK2PKUei3Hk0oc/u/xNnfKHePEfgrhByFG866s4
 5MgPIbZhDE5gy0OyCUETfOCCTUgpGph+fDAn4a1SI/B6k9HlKrAPzcUXFVKIfon32LHE
 2GwAPAkLHwUAlw1WhTvdWMm+FTJlkHc8mVyWKdEjCsG3b1sH8WyFv3kGU8QLl+YN9sf8
 mOs+sWuJ27slx9p5Gz+1yBFZZ/1Hvh6ziUyZmyRH/b5Rp6ZO5K7jH22BhNp/h64PC6DL
 XvVQ==
X-Gm-Message-State: APjAAAU++Keck+EGxvkYJzR2H2pCTgTzUUezxoOLx2yg7SWzWpkI81Q+
 MXbFmg1RfIz2Lvr7mVQzw61clWi+mz8I7b1LUSs=
X-Google-Smtp-Source: APXvYqwy4sVQAPO9pz+GUmqcnZ2+5fXlK0qEvpUdUSJhEXnKD1KCVhVywcDTPzPc1vvjn5W0TUQC40JjHnEAEQA/5uc=
X-Received: by 2002:a25:8109:: with SMTP id o9mr11936909ybk.132.1562666808489; 
 Tue, 09 Jul 2019 03:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxgUfhDL3kE_2xFKTnfs+Pgn5UJ38n2aFxz4XndfUeFX8A@mail.gmail.com>
 <1562359357-24526-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxhHOCb2fB_wSbBz8ekvm4S9_PsAXKD45=+MZNgt+Y-2gQ@mail.gmail.com>
 <5D243AD7.10401@cn.fujitsu.com>
In-Reply-To: <5D243AD7.10401@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 9 Jul 2019 13:06:37 +0300
Message-ID: <CAOQ4uxhjbaszcCL0=QAncBT3PzqJR_7oyR+_0-zNa-pt6JNQSA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Tue, Jul 9, 2019 at 9:57 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> on 2019/07/08 23:17, Amir Goldstein wrote:
>
> > On Mon, Jul 8, 2019 at 1:46 PM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
> >> Since Amir path for copy_file_range has been merged into linux-xfs,
> >> I add test for swapfile, immutable file, bounds in ltp.  Also, add test
> >> for block char pipe dev and remove EXDEV test(5.3 will relax the cross-device
> >> constraint[2]).  I follow xfstests code[3][4][5] and increase it .
> >>
> >> [1]https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?h=for-next-5.3&id=5dae222a5ff0c269730393018a5539cc970a4726
> >> [2]https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?h=for-next-5.3&id=96e6e8f4a68df2d94800311163faa67124df24e5
> >> [3]https://patchwork.kernel.org/patch/10971759/
> >> [4]https://patchwork.kernel.org/patch/10971747/
> >> [5]https://patchwork.kernel.org/patch/10961421/
> >>
> >> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> >> ---
> >>   .../copy_file_range/copy_file_range.h         |  11 +-
> >>   .../copy_file_range/copy_file_range02.c       | 139 +++++++++++++++---
> >>   2 files changed, 130 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> >> index b6d132978..f9e2565d9 100644
> >> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> >> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> >> @@ -9,6 +9,7 @@
> >>
> >>   #include<stdbool.h>
> >>   #include<unistd.h>
> >> +#include<sys/sysmacros.h>
> >>   #include "lapi/syscalls.h"
> >>
> >>   #define TEST_VARIANTS  2
> >> @@ -18,10 +19,18 @@
> >>   #define FILE_DEST_PATH  "file_dest"
> >>   #define FILE_RDONL_PATH "file_rdonl"
> >>   #define FILE_DIR_PATH  "file_dir"
> >> -#define FILE_MNTED_PATH        MNTPOINT"/file_mnted"
> >> +#define FILE_IMMUTABLE_PATH "file_immutable"
> >> +#define FILE_SWAP_PATH "file_swap"
> >> +#define FILE_BLKDEV    "file_blk"
> >> +#define FILE_CHRDEV    "file_chr"
> >> +#define FILE_FIFO      "file_fifo"
> >> +#define FILE_COPY_PATH  "file_copy"
> >>
> >>   #define CONTENT                "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
> >>   #define CONTSIZE       (sizeof(CONTENT) - 1)
> >> +#define MAX_LEN   ((long long)(~0ULL>>  1))
> >> +#define MIN_OFF   65537
> >> +#define MAX_OFF   (MAX_LEN - MIN_OFF)
> > In the xfstest the value of MAX_OFF is ((1ULL<<  63) - MIN_OFF)
> > Not sure why it was changed here?
> Because the LONG LONG max value in kernel linux/limit.h is defined as" #define LLONG_MAX  ((long long)(~0ULL>>  1))".
> I think it is a common usage.   If you don't like this way, I will use the xfstests vaule.

No it makes sense. VFS max size is larger than XFS max size and
I think btrfs is limited for the VFS max.

Maybe it is better to define MAX_LFS_FILESIZE if it is not defined
in some ltp header file and #define MAX_LEN MAX_LFS_FILESIZE
leaving comments where due.

Also, I now wonder if running this test on 32bit kernel and with test
compiled for 32bit will yield the expected errors?

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
