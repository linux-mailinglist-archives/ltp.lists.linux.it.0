Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF6B547
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Apr 2019 06:59:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC26C3EAAF5
	for <lists+linux-ltp@lfdr.de>; Sun, 28 Apr 2019 06:59:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3C7603EAAEA
 for <ltp@lists.linux.it>; Sun, 28 Apr 2019 06:59:12 +0200 (CEST)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E59B2000D0
 for <ltp@lists.linux.it>; Sun, 28 Apr 2019 06:59:07 +0200 (CEST)
Received: by mail-ua1-f65.google.com with SMTP id u34so636119uau.7
 for <ltp@lists.linux.it>; Sat, 27 Apr 2019 21:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=farTkZEgLCiSCX7JWbdIIdKLB/iQfCT/Z4tbHLOd9Ws=;
 b=LhKXIuk90TXs0sYZ0G2Zh06d4fR/9i8NrYI4m/5Q6YBYEwZ+W8HanD3Pb+DyMiuqPJ
 dJS2cs2xQxmmYU88Yl7TE7fOKKYdpqFkU6BUfd5DR0wsw/158K0cagPkR2LwZMIBd8TT
 6ad2geARPAe2YD5tCp0b+hupzAef9BZgqUIK5dRz25qMrJZ72PKqkjwYKFSUDL2ppSvV
 YHVNSMfNpFhn7Xr3IhdYMrIAbRt218GywisBEkFlegnzPYfAmdG1XT/qr/Qzh49XHJ6u
 jzQmTeAV2ZTf8oh5uCxdg7MwOPYRg7RWLixNr+5Ba9gPFlx0ArxiM/C0GKtSRZ0/2oVE
 LtkA==
X-Gm-Message-State: APjAAAVVFz2uuYsyaHjgw3/2ffwOpzJ9dcLhU6++BZsqdHozHePBF4nV
 aKNUVWcAqkQFP5ZX3zxT4tsnKcCprhsobczsnhsiO6Qpiuo=
X-Google-Smtp-Source: APXvYqwUur+AwyDeNYTZE92dEPBlVWXZoEDqMnt484R6bDlXPyp+6YFk2FNKV/wDUrivC0ulKiXLiGHp6HlGZDSYqxw=
X-Received: by 2002:ab0:6983:: with SMTP id t3mr13801990uaq.142.1556427546602; 
 Sat, 27 Apr 2019 21:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190425131239.7252-1-camann@suse.com>
 <b21026fa-5f22-ce74-b22d-494cb376e9c4@suse.com>
In-Reply-To: <b21026fa-5f22-ce74-b22d-494cb376e9c4@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 28 Apr 2019 12:58:54 +0800
Message-ID: <CAEemH2f8acndAJhF_xAwBKb5N3Com7jrecGBa-QShF+dFjivbQ@mail.gmail.com>
To: Christian Amann <camann@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/copy_file_range: add/restructured
	tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0907005598=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0907005598==
Content-Type: multipart/alternative; boundary="00000000000008d93305879007ec"

--00000000000008d93305879007ec
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Thu, Apr 25, 2019 at 9:20 PM Christian Amann <camann@suse.com> wrote:

> @ Li Wang
>
> Thanks for the review. I removed the testing of the basic
> functionalities in copy_file_range02 entirely because this is already
> done in great detail in the first test file. What's left is the error
> handling.
>

Nice work! V3 looks good except some extra suggests in below.


> I also did not stumble upon the failure you found, but I think i have
> found the problem and corrected it:
>
> If the syscall is presented with a directory it returns EISDIR, if it is
> supposed to write in a read-only file it returns EBADF. I accidentally
> opened the directory as read-only and so both errors would by valid.
>
> In my case I always got EISDIR but that cannot be guaranteed to be the
> case on every system.
>

Your test case is good.

I have confirmed that it's because my kernel doesn't has this commit:

commit 11cbfb10775aa2a01cee966d118049ede9d0bdf2
Author: Amir Goldstein <amir73il@gmail.com>
Date:   Tue Jan 31 10:34:56 2017 +0200

    vfs: deny copy_file_range() for non regular files

    There is no in-tree file system that implements copy_file_range()
    for non regular files.

    Deny an attempt to copy_file_range() a directory with EISDIR
    and any other non regualr file with EINVAL to conform with
    behavior of vfs_{clone,dedup}_file_range().

    This change is needed prior to converting sb_start_write()
    to  file_start_write() in the vfs helper.



>
> The read-only flag is now removed.
>
>
> Kind regards,
>
> Christian
>
>
> On 25/04/2019 15:12, Christian Amann wrote:
> > The following tests are run for the syscall itself,
> > as well as the glibc implementation.
> >
> > copy_file_range01:
> >       restructured testcase, removed unnecessary code,
> >       improved readability and shortened output (only
> >       failures get printed now). This tests the basic
> >       functionality of the syscall.
> >
> > copy_file_range02:
> >       add testcases which test basic error handling
> >       of the syscall.
> >
> > copy_file_range03:
> >       add testcase to check if this operation updates
> >       timestamps accordingly.
> >
> > Signed-off-by: Christian Amann <camann@suse.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>


> > ---
> >  configure.ac                                       |   1 +
> >  m4/ltp-copy_file_range.m4                          |   7 +
> >  runtest/syscalls                                   |   2 +
> >  .../kernel/syscalls/copy_file_range/.gitignore     |   2 +
> >  .../syscalls/copy_file_range/copy_file_range.h     |  57 +++++
> >  .../syscalls/copy_file_range/copy_file_range01.c   | 239
> +++++++++++----------
> >  .../syscalls/copy_file_range/copy_file_range02.c   | 105 +++++++++
> >  .../syscalls/copy_file_range/copy_file_range03.c   |  80 +++++++
> >  8 files changed, 377 insertions(+), 116 deletions(-)
> >  create mode 100644 m4/ltp-copy_file_range.m4
> >  create mode 100644
> testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> >  create mode 100644
> testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> >  create mode 100644
> testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> >
> > diff --git a/configure.ac b/configure.ac
> > index fad8f8396..3fec68ede 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -197,6 +197,7 @@ LTP_CHECK_BUILTIN_CLEAR_CACHE
> >  LTP_CHECK_CAPABILITY_SUPPORT
> >  LTP_CHECK_CC_WARN_OLDSTYLE
> >  LTP_CHECK_CLONE_SUPPORTS_7_ARGS
> > +LTP_CHECK_COPY_FILE_RANGE
> >  LTP_CHECK_CRYPTO
> >  LTP_CHECK_FIDEDUPE
> >  LTP_CHECK_FORTIFY_SOURCE
> > diff --git a/m4/ltp-copy_file_range.m4 b/m4/ltp-copy_file_range.m4
> > new file mode 100644
> > index 000000000..2d87e8900
> > --- /dev/null
> > +++ b/m4/ltp-copy_file_range.m4
> > @@ -0,0 +1,7 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (c) 2019 SUSE LLC
> > +dnl Author: Christian Amann <camann@suse.com>
> > +
> > +AC_DEFUN([LTP_CHECK_COPY_FILE_RANGE],[
> > +AC_CHECK_FUNCS(copy_file_range,,)
> > +])
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index 2b8ca719b..33a70ee17 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -1561,6 +1561,8 @@ memfd_create03 memfd_create03
> >  memfd_create04 memfd_create04
> >
> >  copy_file_range01 copy_file_range01
> > +copy_file_range02 copy_file_range02
> > +copy_file_range03 copy_file_range03
> >
> >  statx01 statx01
> >  statx02 statx02
> > diff --git a/testcases/kernel/syscalls/copy_file_range/.gitignore
> b/testcases/kernel/syscalls/copy_file_range/.gitignore
> > index 6807420ef..e9e35f60f 100644
> > --- a/testcases/kernel/syscalls/copy_file_range/.gitignore
> > +++ b/testcases/kernel/syscalls/copy_file_range/.gitignore
> > @@ -1 +1,3 @@
> >  /copy_file_range01
> > +/copy_file_range02
> > +/copy_file_range03
> > diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> > new file mode 100644
> > index 000000000..d2ef1348b
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 SUSE LLC
> > + * Author: Christian Amann <camann@suse.com>
> > + */
> > +
> > +#ifndef __COPY_FILE_RANGE_H__
> > +#define __COPY_FILE_RANGE_H__
> > +
> > +#include <stdbool.h>
> > +#include <unistd.h>
> > +#include "lapi/syscalls.h"
> > +
> > +#define TEST_VARIANTS        2
> > +
> > +#define MNTPOINT     "mnt_point"
> > +#define FILE_SRC_PATH   "file_src"
> > +#define FILE_DEST_PATH  "file_dest"
> > +#define FILE_RDONL_PATH "file_rdonl"
> > +#define FILE_DIR_PATH        "file_dir"
> > +#define FILE_MNTED_PATH      MNTPOINT"/file_mnted"
> > +
> > +#define CONTENT              "ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
> > +#define CONTSIZE     (sizeof(CONTENT) - 1)
> > +
> > +static void syscall_info(void)
> > +{
> > +     switch (tst_variant) {
> > +     case 0:
> > +             tst_res(TINFO, "Testing libc copy_file_range()");
> > +             break;
> > +     case 1:
> > +             tst_res(TINFO, "Testing tst copy_file_range()");
> > +     }
> > +}
> > +
> > +static int sys_copy_file_range(int fd_in, loff_t *off_in,
> > +             int fd_out, loff_t *off_out, size_t len, unsigned int
> flags)
> > +{
> > +     switch (tst_variant) {
> > +
> > +     case 0:
> > +#ifdef HAVE_COPY_FILE_RANGE
> > +             return copy_file_range(fd_in, off_in,
> > +                             fd_out, off_out, len, flags);
> > +#else
> > +             tst_brk(TCONF, "libc copy_file_range() not supported!");
> > +#endif
> > +             break;
> > +     case 1:
> > +             return tst_syscall(__NR_copy_file_range, fd_in, off_in,
> fd_out,
> > +                             off_out, len, flags);
> > +     }
> > +     return -1;
> > +}
> > +
> > +#endif /* __COPY_FILE_RANGE_H__ */
> > diff --git
> a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> > index 61a6042d9..e2000cf5a 100644
> > --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> > +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> > @@ -1,66 +1,30 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> >  /*
> > - * Copyright (c) Linux Test Project, 2017
> > - *
> > - * This program is free software;  you can redistribute it and/or modify
> > - * it under the terms of the GNU General Public License as published by
> > - * the Free Software Foundation; either version 2 of the License, or
> > - * (at your option) any later version.
> > + * Copyright (c) Linux Test Project, 2019
> > + */
> > +
> > +/*
> > + * This tests the fundamental functionalities of the copy_file_range
> > + * syscall. It does so by copying the contents of one file into
> > + * another using various different combinations for length and
> > + * input/output offsets.
> >   *
> > - * This program is distributed in the hope that it will be useful,
> > - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> > - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> > - * the GNU General Public License for more details.
> > + * After a copy is done this test checks if the contents of both files
> > + * are equal at the given offsets. It is also inspected if the offsets
> > + * of the file descriptors are advanced correctly.
> >   */
> >
> >  #define _GNU_SOURCE
> > +
> >  #include <stdio.h>
> > -#include <errno.h>
> >  #include <stdlib.h>
> >  #include "tst_test.h"
> >  #include "tst_safe_stdio.h"
> > -#include "lapi/syscalls.h"
> > -
> > -#define TEST_FILE_1 "copy_file_range_ltp01.txt"
> > -#define TEST_FILE_2 "copy_file_range_ltp02.txt"
> > -#define STR "abcdefghijklmnopqrstuvwxyz12345\n"
> > -
> > -#define verbose 0
> > -
> > -static size_t *len_arr;
> > -static loff_t **off_arr;
> > -static int len_sz, off_sz;
> > +#include "copy_file_range.h"
> >
> > -static void setup(void)
> > -{
> > -     int i, fd, page_size;
> > -
> > -     page_size = getpagesize();
> > -
> > -     fd = SAFE_OPEN(TEST_FILE_1, O_RDWR | O_CREAT, 0664);
> > -     /* Writing page_size * 4 of data into test file */
> > -     for (i = 0; i < (int)(page_size * 4); i++)
> > -             SAFE_WRITE(1, fd, STR, strlen(STR));
> > -     SAFE_CLOSE(fd);
> > -
> > -     len_sz = 4;
> > -     len_arr = malloc(sizeof(size_t) * len_sz);
> > -     len_arr[0] = 11;
> > -     len_arr[1] = page_size - 1;
> > -     len_arr[2] = page_size;
> > -     len_arr[3] = page_size + 1;
> > -
> > -     off_sz = 6;
> > -     off_arr = malloc(sizeof(loff_t *) * off_sz);
> > -     for (i = 1; i < off_sz; i++)
> > -             off_arr[i] = malloc(sizeof(loff_t));
> > -
> > -     off_arr[0] = NULL;
> > -     *off_arr[1] = 0;
> > -     *off_arr[2] = 17;
> > -     *off_arr[3] = page_size - 1;
> > -     *off_arr[4] = page_size;
> > -     *off_arr[5] = page_size + 1;
> > -}
> > +static int page_size;
> > +static int errcount, numcopies;
> > +static int fd_in, fd_out;
> >
> >  static int check_file_content(const char *fname1, const char *fname2,
> >       loff_t *off1, loff_t *off2, size_t len)
> > @@ -90,52 +54,37 @@ static int check_file_content(const char *fname1,
> const char *fname2,
> >  }
> >
> >  static int check_file_offset(const char *m, int fd, loff_t len,
> > -     loff_t *off_ori, loff_t *off_after)
> > +             loff_t *off_before, loff_t *off_after)
> >  {
> > +     loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
> >       int ret = 0;
> >
> > -     if (off_ori) {
> > -             /* FD should stay untouched, and off_in/out is updated */
> > -             loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
> > -
> > -             if (fd_off == 0) {
> > -                     if (verbose)
> > -                             tst_res(TPASS, "%s FD offset unchanged",
> m);
> > -             } else {
> > -                     tst_res(TFAIL, "%s FD offset changed: %ld",
> > +     if (off_before) {
> > +             /*
> > +              * copy_file_range offset is given:
> > +              * - fd offset should stay 0,
> > +              * - copy_file_range offset is updated
> > +              */
> > +             if (fd_off != 0) {
> > +                     tst_res(TFAIL,
> > +                             "%s fd offset unexpectedly changed: %ld",
> >                               m, (long)fd_off);
> >                       ret = 1;
> > -             }
> >
> > -             if (!off_after) {
> > -                     tst_res(TFAIL, "%s offset is NULL", m);
> > -                     ret = 1;
> > -             }
> > -
> > -             if ((off_after) && (*off_ori + len == *off_after)) {
> > -                     if (verbose) {
> > -                             tst_res(TPASS, "%s offset advanced as"
> > -                                     " expected: %ld", m,
> (long)*off_after);
> > -                     }
> > -             } else {
> > +             } else if (*off_before + len != *off_after) {
> >                       tst_res(TFAIL, "%s offset unexpected value: %ld",
> >                               m, (long)*off_after);
> >                       ret = 1;
> >               }
> > -     } else {
> > -             /* FD offset is advanced by len */
> > -             loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
> > -
> > -             if (fd_off == len) {
> > -                     if (verbose) {
> > -                             tst_res(TPASS, "%s FD offset changed as"
> > -                                     " expected: %ld", m, (long)fd_off);
> > -                     }
> > -             } else {
> > -                     tst_res(TFAIL, "%s FD offset unexpected value:
> %ld",
> > +     }
> > +     /*
> > +      * no copy_file_range offset given:
> > +      * - fd offset advanced by length
> > +      */
> > +     else if (fd_off != len) {
> > +             tst_res(TFAIL, "%s fd offset unexpected value: %ld",
> >                               m, (long)fd_off);
> > -                     ret = 1;
> > -             }
> > +             ret = 1;
> >       }
> >
> >       return ret;
> > @@ -143,77 +92,135 @@ static int check_file_offset(const char *m, int
> fd, loff_t len,
> >
> >  static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
> >  {
> > +     int ret;
> >       size_t to_copy = len;
> > -     int fd_in, fd_out, ret;
> > -     loff_t *off_in_ori = off_in;
> > -     loff_t *off_out_ori = off_out;
> > -     loff_t off_in_copy;
> > -     loff_t off_out_copy;
> > +     loff_t off_in_value_copy, off_out_value_copy;
> > +     loff_t *off_new_in  = &off_in_value_copy;
> > +     loff_t *off_new_out = &off_out_value_copy;
> >       char str_off_in[32], str_off_out[32];
> >
> >       if (off_in) {
> > -             off_in_copy = *off_in;
> > -             off_in = &off_in_copy;
> > +             off_in_value_copy = *off_in;
> >               sprintf(str_off_in, "%ld", (long)*off_in);
> >       } else {
> > +             off_new_in = NULL;
> >               strcpy(str_off_in, "NULL");
> >       }
> >
> >       if (off_out) {
> > -             off_out_copy = *off_out;
> > -             off_out = &off_out_copy;
> > +             off_out_value_copy = *off_out;
> >               sprintf(str_off_out, "%ld", (long)*off_out);
> >       } else {
> > +             off_new_out = NULL;
> >               strcpy(str_off_out, "NULL");
> >       }
> >
> > -     fd_in = SAFE_OPEN(TEST_FILE_1, O_RDONLY);
> > -     fd_out = SAFE_OPEN(TEST_FILE_2, O_CREAT | O_WRONLY | O_TRUNC,
> 0644);
> > -
> >       /*
> >        * copy_file_range() will return the number of bytes copied between
> >        * files. This could be less than the length originally requested.
> >        */
> >       do {
> > -             TEST(tst_syscall(__NR_copy_file_range, fd_in, off_in,
> fd_out,
> > -                     off_out, to_copy, 0));
> > +             TEST(sys_copy_file_range(fd_in, off_new_in, fd_out,
> > +                             off_new_out, to_copy, 0));
> >               if (TST_RET == -1) {
> >                       tst_res(TFAIL | TTERRNO, "copy_file_range()
> failed");
> > -                     SAFE_CLOSE(fd_in);
> > -                     SAFE_CLOSE(fd_out);
> > +                     errcount++;
> >                       return;
> >               }
> >
> >               to_copy -= TST_RET;
> >       } while (to_copy > 0);
> >
> > -     ret = check_file_content(TEST_FILE_1, TEST_FILE_2,
> > -             off_in_ori, off_out_ori, len);
> > -     if (ret)
> > +     ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
> > +             off_in, off_out, len);
> > +     if (ret) {
> >               tst_res(TFAIL, "file contents do not match");
> > +             errcount++;
> > +             return;
> > +     }
> >
> > -     ret |= check_file_offset("(in)", fd_in, len, off_in_ori, off_in);
> > -     ret |= check_file_offset("(out)", fd_out, len, off_out_ori,
> off_out);
> > +     ret |= check_file_offset("(in)", fd_in, len, off_in, off_new_in);
> > +     ret |= check_file_offset("(out)", fd_out, len, off_out,
> off_new_out);
> > +
> > +     if (ret != 0) {
> > +             tst_res(TFAIL, "off_in: %s, off_out: %s, len: %ld",
> > +                             str_off_in, str_off_out, (long)len);
> > +             errcount++;
> > +     }
> > +}
> >
> > -     tst_res(ret == 0 ? TPASS : TFAIL, "off_in: %s, off_out: %s, len:
> %ld",
> > -                     str_off_in, str_off_out, (long)len);
> > +static void open_files(void)
> > +{
> > +     fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> > +     fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC,
> 0644);
> > +}
> >
> > -     SAFE_CLOSE(fd_in);
> > -     SAFE_CLOSE(fd_out);
> > +static void close_files(void)
> > +{
> > +     if (fd_out > 0)
> > +             SAFE_CLOSE(fd_out);
> > +     if (fd_in  > 0)
> > +             SAFE_CLOSE(fd_in);
> >  }
> >
> >  static void copy_file_range_verify(void)
> >  {
> >       int i, j, k;
> >
> > -     for (i = 0; i < len_sz; i++)
> > -             for (j = 0; j < off_sz; j++)
> > -                     for (k = 0; k < off_sz; k++)
> > +     errcount = numcopies = 0;
> > +     size_t len_arr[]        = {11, page_size-1, page_size,
> page_size+1};
> > +     loff_t off_arr_values[] = {0, 17, page_size-1, page_size,
> page_size+1};
> > +
> > +     int num_offsets = ARRAY_SIZE(off_arr_values) + 1;
> > +     loff_t *off_arr[num_offsets];
> > +
> > +     off_arr[0] = NULL;
> > +     for (i = 1; i < num_offsets; i++)
> > +             off_arr[i] = &off_arr_values[i-1];
> > +
> > +     /* Test all possible cobinations of given lengths and offsets */
> > +     for (i = 0; i < (int)ARRAY_SIZE(len_arr); i++)
> > +             for (j = 0; j < num_offsets; j++)
> > +                     for (k = 0; k < num_offsets; k++) {
> > +                             open_files();
> >                               test_one(len_arr[i], off_arr[j],
> off_arr[k]);
> > +                             close_files();
> > +                             numcopies++;
> > +                     }
> > +
> > +     if (errcount == 0)
> > +             tst_res(TPASS,
> > +                     "copy_file_range completed all %d copy jobs
> successfully!",
> > +                     numcopies);
> > +     else
> > +             tst_res(TINFO, "copy_file_range failed %d of %d copy
> jobs.",
> > +                             errcount, numcopies);
>

we should use TFAIL but not TINFO for the failure report.
https://github.com/linux-test-project/ltp/blob/master/doc/test-writing-guidelines.txt#L414

> +}
> > +
> > +static void setup(void)
> > +{
> > +     int i, fd;
> > +
> > +     syscall_info();
> > +
> > +     page_size = getpagesize();
> > +
> > +     fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
> > +     /* Writing page_size * 4 of data into test file */
> > +     for (i = 0; i < (int)(page_size * 4); i++)
> > +             SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
> > +     SAFE_CLOSE(fd);
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +     close_files();
> >  }
> >
> >  static struct tst_test test = {
> >       .setup = setup,
> > +     .cleanup = cleanup,
> >       .needs_tmpdir = 1,
> >       .test_all = copy_file_range_verify,
> > +     .test_variants = TEST_VARIANTS,
> >  };
> > diff --git
> a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> > new file mode 100644
> > index 000000000..a9fd713aa
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 SUSE LLC
> > + * Author: Christian Amann <camann@suse.com>
> > + */
> > +
> > +/*
> > + * Tests basic error handling of the
> > + * copy_file_range syscall
> > + *
> > + * 1) Try to copy contents to file open as readonly
> > + *    -> EBADF
> > + * 2) Try to copy contents to file on different mounted
> > + *    filesystem -> EXDEV
> > + * 3) Try to copy contents to directory -> EISDIR
> > + * 4) Try to copy contents to a file opened with the
> > + *    O_APPEND flag -> EBADF
> > + */
> > +
> > +#define _GNU_SOURCE
> > +
> > +#include "tst_test.h"
> > +#include "copy_file_range.h"
> > +
> > +static int fd_src;
> > +static int fd_rdonly;
> > +static int fd_mnted;
> > +static int fd_dir;
> > +static int fd_append;
> > +
> > +static struct tcase {
> > +     int     *copy_to_fd;
> > +     int     exp_err;
> > +} tcases[] = {
> > +     {&fd_rdonly, EBADF},
> > +     {&fd_mnted,  EXDEV},
> > +     {&fd_dir,    EISDIR},
> > +     {&fd_append, EBADF},
> > +};
>

I'm thinking maybe we can try test some more invalid argurments(e.g flags)
here?

static struct tcase {
int *copy_to_fd;
int flags;
int exp_err;
} tcases[] = {
{&fd_rdonly, 0, EBADF},
{&fd_mnted,  0, EXDEV},
{&fd_dir,    0, EISDIR},
{&fd_append, 0, EBADF},
{&fd_append, -1, EINVAL},
};

> +
> > +static void verify_copy_file_range(unsigned int n)
> > +{
> > +     struct tcase *tc = &tcases[n];
> > +
> > +     TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd, 0, CONTSIZE,
> 0));
> > +
>

I would like change the error handler logic as below to make something
easier to understand:

if (TST_RET == -1) {
        if (tc->exp_err == TST_ERR) {
                tst_res(TPASS | TTERRNO, "copy_file_range failed as
expected");
        } else {
                tst_res(TFAIL | TTERRNO,
                        "copy_file_range failed unexpectedly; expected %s,
but got",
                        tst_strerrno(tc->exp_err));
        }
} else {
        tst_res(TFAIL,
                "copy_file_range returned wrong value: %ld", TST_RET);
}


> +     if (tc->exp_err != TST_ERR) {
> > +             tst_res(TFAIL,
> > +                     "copy_file_range failed with %s, expected %s",
> > +                     tst_strerrno(TST_ERR), tst_strerrno(tc->exp_err));
> > +             return;
> > +     }
> > +
> > +     if (TST_RET != -1) {
> > +             tst_res(TFAIL,
> > +                     "copy_file_range returned wrong value: %ld",
> TST_RET);
> > +             return;
> > +     }
> > +
> > +     tst_res(TPASS, "copy_file_range ended with %s as expected",
> > +                     tst_strerrno(tc->exp_err));
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +     if (fd_append > 0)
> > +             SAFE_CLOSE(fd_append);
> > +     if (fd_dir > 0)
> > +             SAFE_CLOSE(fd_dir);
> > +     if (fd_mnted > 0)
> > +             SAFE_CLOSE(fd_mnted);
> > +     if (fd_rdonly > 0)
> > +             SAFE_CLOSE(fd_rdonly);
> > +     if (fd_src > 0)
> > +             SAFE_CLOSE(fd_src);
> > +}
> > +
> > +static void setup(void)
> > +{
> > +     syscall_info();
> > +
> > +     if (access(FILE_DIR_PATH, F_OK) == -1)
> > +             SAFE_MKDIR(FILE_DIR_PATH, 0777);
> > +
> > +     fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
> > +     fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
> > +     fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> > +     fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
> > +     fd_append = SAFE_OPEN(
> > +                     FILE_DEST_PATH, O_RDWR | O_CREAT | O_APPEND, 0664);
> > +
> > +     SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> > +}
> > +
> > +static struct tst_test test = {
> > +     .test = verify_copy_file_range,
> > +     .tcnt = ARRAY_SIZE(tcases),
> > +     .setup = setup,
> > +     .cleanup = cleanup,
> > +     .needs_root = 1,
> > +     .mount_device = 1,
> > +     .mntpoint = MNTPOINT,
> > +     .dev_fs_type = "ext4",
> > +     .test_variants = TEST_VARIANTS,
> > +};
> > diff --git
> a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> > new file mode 100644
> > index 000000000..d2c51632b
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2019 SUSE LLC
> > + * Author: Christian Amann <camann@suse.com>
> > + */
> > +
> > +/*
> > + * Copies the contents of one file into another and
> > + * checks if the timestamp gets updated in the process.
> > + */
> > +
> > +#define _GNU_SOURCE
> > +
> > +#include "tst_test.h"
> > +#include "copy_file_range.h"
> > +
> > +static int fd_src;
> > +static int fd_dest;
> > +
> > +unsigned long getTimestamp(int fd)
>

To avoid camelcase naming in LTP, how about get_timestamp() ?

> +{
> > +     struct stat filestat;
> > +
> > +     fstat(fd, &filestat);
> > +     return filestat.st_mtime;
> > +}
> > +
> > +static void verify_copy_file_range_timestamp(void)
> > +{
> > +     loff_t offset;
> > +     unsigned long timestamp, updated_timestamp;
> > +
> > +     timestamp = getTimestamp(fd_dest);
> > +     usleep(1000000);
> > +
> > +     offset = 0;
> > +     TEST(sys_copy_file_range(fd_src, &offset,
> > +                     fd_dest, 0, CONTSIZE, 0));
> > +     if (TST_RET == -1) {
> > +             tst_res(TFAIL, "copy_file_range unexpectedly failed!");
>

Seems tst_brk(TBROK | TTERRNO, ...) is better here, then we can remove the
return sentence.

> +             return;
> > +     }
> > +
> > +     updated_timestamp = getTimestamp(fd_dest);
> > +
> > +     if (timestamp == updated_timestamp) {
> > +             tst_res(TFAIL, "copy_file_range did not update
> timestamp!");
> > +             return;

> +     }
> > +
> > +     tst_res(TPASS, "copy_file_range sucessfully updated the
> timestamp.");
> > +}
> > +
> > +static void cleanup(void)
> > +{
> > +     if (fd_dest > 0)
> > +             SAFE_CLOSE(fd_dest);
> > +     if (fd_src  > 0)
> > +             SAFE_CLOSE(fd_src);
> > +}
> > +
> > +static void setup(void)
> > +{
> > +     syscall_info();
> > +
> > +     fd_dest = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
> > +     fd_src  = SAFE_OPEN(FILE_SRC_PATH,  O_RDWR | O_CREAT, 0664);
> > +     SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> > +     SAFE_CLOSE(fd_src);
> > +     fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> > +}
> > +
> > +
> > +static struct tst_test test = {
> > +     .test_all = verify_copy_file_range_timestamp,
> > +     .setup = setup,
> > +     .cleanup = cleanup,
> > +     .needs_tmpdir = 1,
> > +     .test_variants = TEST_VARIANTS,
> > +};
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--00000000000008d93305879007ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_d=
efault" style=3D"font-size:small">Hi Christian,</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 25, 2019=
 at 9:20 PM Christian Amann &lt;<a href=3D"mailto:camann@suse.com" target=
=3D"_blank">camann@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">@ Li Wang<br>
<br>
Thanks for the review. I removed the testing of the basic<br>
functionalities in copy_file_range02 entirely because this is already<br>
done in great detail in the first test file. What&#39;s left is the error<b=
r>
handling.<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Nice work! V3 looks good except some extra suggests in=
 below.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
I also did not stumble upon the failure you found, but I think i have<br>
found the problem and corrected it:<br>
<br>
If the syscall is presented with a directory it returns EISDIR, if it is<br=
>
supposed to write in a read-only file it returns EBADF. I accidentally<br>
opened the directory as read-only and so both errors would by valid.<br>
<br>
In my case I always got EISDIR but that cannot be guaranteed to be the<br>
case on every system.<br></blockquote><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">Your test case is good.</div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">I have confir=
med that it&#39;s because my kernel doesn&#39;t has this commit:</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default">commit 11cbfb10775aa2a01cee966d118049ede9d0bdf2</div><div cla=
ss=3D"gmail_default">Author: Amir Goldstein &lt;<a href=3D"mailto:amir73il@=
gmail.com" target=3D"_blank">amir73il@gmail.com</a>&gt;</div><div class=3D"=
gmail_default">Date:=C2=A0 =C2=A0Tue Jan 31 10:34:56 2017 +0200</div><div c=
lass=3D"gmail_default"><br></div><div class=3D"gmail_default">=C2=A0 =C2=A0=
 vfs: deny copy_file_range() for non regular files</div><div class=3D"gmail=
_default">=C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 There is no in-tree file system that implements copy_file_range()</div>=
<div class=3D"gmail_default">=C2=A0 =C2=A0 for non regular files.</div><div=
 class=3D"gmail_default">=C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_defau=
lt">=C2=A0 =C2=A0 Deny an attempt to copy_file_range() a directory with EIS=
DIR</div><div class=3D"gmail_default">=C2=A0 =C2=A0 and any other non regua=
lr file with EINVAL to conform with</div><div class=3D"gmail_default">=C2=
=A0 =C2=A0 behavior of vfs_{clone,dedup}_file_range().</div><div class=3D"g=
mail_default">=C2=A0 =C2=A0=C2=A0</div><div class=3D"gmail_default">=C2=A0 =
=C2=A0 This change is needed prior to converting sb_start_write()</div><div=
 class=3D"gmail_default">=C2=A0 =C2=A0 to=C2=A0 file_start_write() in the v=
fs helper.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
The read-only flag is now removed.<br>
<br>
<br>
Kind regards,<br>
<br>
Christian<br>
<br>
<br>
On 25/04/2019 15:12, Christian Amann wrote:<br>
&gt; The following tests are run for the syscall itself,<br>
&gt; as well as the glibc implementation.<br>
&gt;<br>
&gt; copy_file_range01:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0restructured testcase, removed unnecessary c=
ode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0improved readability and shortened output (o=
nly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0failures get printed now). This tests the ba=
sic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0functionality of the syscall.<br>
&gt;<br>
&gt; copy_file_range02:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0add testcases which test basic error handlin=
g<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0of the syscall.<br>
&gt;<br>
&gt; copy_file_range03:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0add testcase to check if this operation upda=
tes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0timestamps accordingly.<br>
&gt;<br>
&gt; Signed-off-by: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" =
target=3D"_blank">camann@suse.com</a>&gt;<br></blockquote><div>=C2=A0</div>=
<div><span class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: L=
i Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</=
span></div><div><span class=3D"gmail_default" style=3D"font-size:small"></s=
pan>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 m4/ltp-copy_file_range.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../kernel/syscalls/copy_file_range/.gitignore=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range.h=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 57 +++++<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range01.c=C2=A0 =C2=A0| 2=
39 +++++++++++----------<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range02.c=C2=A0 =C2=A0| 1=
05 +++++++++<br>
&gt;=C2=A0 .../syscalls/copy_file_range/copy_file_range03.c=C2=A0 =C2=A0|=
=C2=A0 80 +++++++<br>
&gt;=C2=A0 8 files changed, 377 insertions(+), 116 deletions(-)<br>
&gt;=C2=A0 create mode 100644 m4/ltp-copy_file_range.m4<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/copy_file_range/cop=
y_file_range.h<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/copy_file_range/cop=
y_file_range02.c<br>
&gt;=C2=A0 create mode 100644 testcases/kernel/syscalls/copy_file_range/cop=
y_file_range03.c<br>
&gt;<br>
&gt; diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noref=
errer" target=3D"_blank">configure.ac</a><br>
&gt; index fad8f8396..3fec68ede 100644<br>
&gt; --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_bl=
ank">configure.ac</a><br>
&gt; @@ -197,6 +197,7 @@ LTP_CHECK_BUILTIN_CLEAR_CACHE<br>
&gt;=C2=A0 LTP_CHECK_CAPABILITY_SUPPORT<br>
&gt;=C2=A0 LTP_CHECK_CC_WARN_OLDSTYLE<br>
&gt;=C2=A0 LTP_CHECK_CLONE_SUPPORTS_7_ARGS<br>
&gt; +LTP_CHECK_COPY_FILE_RANGE<br>
&gt;=C2=A0 LTP_CHECK_CRYPTO<br>
&gt;=C2=A0 LTP_CHECK_FIDEDUPE<br>
&gt;=C2=A0 LTP_CHECK_FORTIFY_SOURCE<br>
&gt; diff --git a/m4/ltp-copy_file_range.m4 b/m4/ltp-copy_file_range.m4<br>
&gt; new file mode 100644<br>
&gt; index 000000000..2d87e8900<br>
&gt; --- /dev/null<br>
&gt; +++ b/m4/ltp-copy_file_range.m4<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +dnl SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +dnl Copyright (c) 2019 SUSE LLC<br>
&gt; +dnl Author: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" ta=
rget=3D"_blank">camann@suse.com</a>&gt;<br>
&gt; +<br>
&gt; +AC_DEFUN([LTP_CHECK_COPY_FILE_RANGE],[<br>
&gt; +AC_CHECK_FUNCS(copy_file_range,,)<br>
&gt; +])<br>
&gt; diff --git a/runtest/syscalls b/runtest/syscalls<br>
&gt; index 2b8ca719b..33a70ee17 100644<br>
&gt; --- a/runtest/syscalls<br>
&gt; +++ b/runtest/syscalls<br>
&gt; @@ -1561,6 +1561,8 @@ memfd_create03 memfd_create03<br>
&gt;=C2=A0 memfd_create04 memfd_create04<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 copy_file_range01 copy_file_range01<br>
&gt; +copy_file_range02 copy_file_range02<br>
&gt; +copy_file_range03 copy_file_range03<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 statx01 statx01<br>
&gt;=C2=A0 statx02 statx02<br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/.gitignore b/te=
stcases/kernel/syscalls/copy_file_range/.gitignore<br>
&gt; index 6807420ef..e9e35f60f 100644<br>
&gt; --- a/testcases/kernel/syscalls/copy_file_range/.gitignore<br>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/.gitignore<br>
&gt; @@ -1 +1,3 @@<br>
&gt;=C2=A0 /copy_file_range01<br>
&gt; +/copy_file_range02<br>
&gt; +/copy_file_range03<br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range=
.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d2ef1348b<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h<br>
&gt; @@ -0,0 +1,57 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 SUSE LLC<br>
&gt; + * Author: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" tar=
get=3D"_blank">camann@suse.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __COPY_FILE_RANGE_H__<br>
&gt; +#define __COPY_FILE_RANGE_H__<br>
&gt; +<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +#include &quot;lapi/syscalls.h&quot;<br>
&gt; +<br>
&gt; +#define TEST_VARIANTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +<br>
&gt; +#define MNTPOINT=C2=A0 =C2=A0 =C2=A0&quot;mnt_point&quot;<br>
&gt; +#define FILE_SRC_PATH=C2=A0 =C2=A0&quot;file_src&quot;<br>
&gt; +#define FILE_DEST_PATH=C2=A0 &quot;file_dest&quot;<br>
&gt; +#define FILE_RDONL_PATH &quot;file_rdonl&quot;<br>
&gt; +#define FILE_DIR_PATH=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;file_dir&quot;=
<br>
&gt; +#define FILE_MNTED_PATH=C2=A0 =C2=A0 =C2=A0 MNTPOINT&quot;/file_mnted=
&quot;<br>
&gt; +<br>
&gt; +#define CONTENT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n&quot;<br>
&gt; +#define CONTSIZE=C2=A0 =C2=A0 =C2=A0(sizeof(CONTENT) - 1)<br>
&gt; +<br>
&gt; +static void syscall_info(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (tst_variant) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Testing libc copy_file_range()&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Testing tst copy_file_range()&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sys_copy_file_range(int fd_in, loff_t *off_in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd_out, loff_t *o=
ff_out, size_t len, unsigned int flags)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (tst_variant) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +#ifdef HAVE_COPY_FILE_RANGE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return copy_file_rang=
e(fd_in, off_in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd_out, off_out, len, flags);<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quot;=
libc copy_file_range() not supported!&quot;);<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_syscall(__=
NR_copy_file_range, fd_in, off_in, fd_out,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_out, len, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#endif /* __COPY_FILE_RANGE_H__ */<br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range=
01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c<br>
&gt; index 61a6042d9..e2000cf5a 100644<br>
&gt; --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c<br=
>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c<br=
>
&gt; @@ -1,66 +1,30 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt;=C2=A0 /*<br>
&gt; - * Copyright (c) Linux Test Project, 2017<br>
&gt; - *<br>
&gt; - * This program is free software;=C2=A0 you can redistribute it and/o=
r modify<br>
&gt; - * it under the terms of the GNU General Public License as published =
by<br>
&gt; - * the Free Software Foundation; either version 2 of the License, or<=
br>
&gt; - * (at your option) any later version.<br>
&gt; + * Copyright (c) Linux Test Project, 2019<br>
&gt; + */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This tests the fundamental functionalities of the copy_file_range<=
br>
&gt; + * syscall. It does so by copying the contents of one file into<br>
&gt; + * another using various different combinations for length and<br>
&gt; + * input/output offsets.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; - * This program is distributed in the hope that it will be useful,<br=
>
&gt; - * but WITHOUT ANY WARRANTY;=C2=A0 without even the implied warranty =
of<br>
&gt; - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See<br>
&gt; - * the GNU General Public License for more details.<br>
&gt; + * After a copy is done this test checks if the contents of both file=
s<br>
&gt; + * are equal at the given offsets. It is also inspected if the offset=
s<br>
&gt; + * of the file descriptors are advanced correctly.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define _GNU_SOURCE<br>
&gt; +<br>
&gt;=C2=A0 #include &lt;stdio.h&gt;<br>
&gt; -#include &lt;errno.h&gt;<br>
&gt;=C2=A0 #include &lt;stdlib.h&gt;<br>
&gt;=C2=A0 #include &quot;tst_test.h&quot;<br>
&gt;=C2=A0 #include &quot;tst_safe_stdio.h&quot;<br>
&gt; -#include &quot;lapi/syscalls.h&quot;<br>
&gt; -<br>
&gt; -#define TEST_FILE_1 &quot;copy_file_range_ltp01.txt&quot;<br>
&gt; -#define TEST_FILE_2 &quot;copy_file_range_ltp02.txt&quot;<br>
&gt; -#define STR &quot;abcdefghijklmnopqrstuvwxyz12345\n&quot;<br>
&gt; -<br>
&gt; -#define verbose 0<br>
&gt; -<br>
&gt; -static size_t *len_arr;<br>
&gt; -static loff_t **off_arr;<br>
&gt; -static int len_sz, off_sz;<br>
&gt; +#include &quot;copy_file_range.h&quot;<br>
&gt;=C2=A0 <br>
&gt; -static void setup(void)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int i, fd, page_size;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0page_size =3D getpagesize();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(TEST_FILE_1, O_RDWR | O_CREAT, 0=
664);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0/* Writing page_size * 4 of data into test file *=
/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; (int)(page_size * 4); i++)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fd, STR=
, strlen(STR));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_sz =3D 4;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_arr =3D malloc(sizeof(size_t) * len_sz);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_arr[0] =3D 11;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_arr[1] =3D page_size - 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_arr[2] =3D page_size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0len_arr[3] =3D page_size + 1;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0off_sz =3D 6;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0off_arr =3D malloc(sizeof(loff_t *) * off_sz);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; off_sz; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_arr[i] =3D malloc=
(sizeof(loff_t));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0off_arr[0] =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*off_arr[1] =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*off_arr[2] =3D 17;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*off_arr[3] =3D page_size - 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*off_arr[4] =3D page_size;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*off_arr[5] =3D page_size + 1;<br>
&gt; -}<br>
&gt; +static int page_size;<br>
&gt; +static int errcount, numcopies;<br>
&gt; +static int fd_in, fd_out;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int check_file_content(const char *fname1, const char *fn=
ame2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0loff_t *off1, loff_t *off2, size_t len)<br>
&gt; @@ -90,52 +54,37 @@ static int check_file_content(const char *fname1, =
const char *fname2,<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int check_file_offset(const char *m, int fd, loff_t len,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0loff_t *off_ori, loff_t *off_after)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loff_t *off_before, l=
off_t *off_after)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t fd_off =3D SAFE_LSEEK(fd, 0, SEEK_CUR);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (off_ori) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FD should stay unt=
ouched, and off_in/out is updated */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loff_t fd_off =3D SAF=
E_LSEEK(fd, 0, SEEK_CUR);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_off =3D=3D 0) =
{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (verbose)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;%s FD offset unchan=
ged&quot;, m);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL, &quot;%s FD offset changed: %ld&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (off_before) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * copy_file_range of=
fset is given:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * - fd offset should=
 stay 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * - copy_file_range =
offset is updated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_off !=3D 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s fd offset unexpectedly changed:=
 %ld&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m, (long)fd_off);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!off_after) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL, &quot;%s offset is NULL&quot;, m);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((off_after) &amp;=
&amp; (*off_ori + len =3D=3D *off_after)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (verbose) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;%s offset advanced =
as&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; expec=
ted: %ld&quot;, m, (long)*off_after);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (*off_befor=
e + len !=3D *off_after) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tst_res(TFAIL, &quot;%s offset unexpected value: %ld&quot;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m, (long)*off_after);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FD offset is advan=
ced by len */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loff_t fd_off =3D SAF=
E_LSEEK(fd, 0, SEEK_CUR);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd_off =3D=3D len=
) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (verbose) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;%s FD offset change=
d as&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; expec=
ted: %ld&quot;, m, (long)fd_off);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_res(TFAIL, &quot;%s FD offset unexpected value: %ld&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * no copy_file_range offset given:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * - fd offset advanced by length<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (fd_off !=3D len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
%s fd offset unexpected value: %ld&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m, (long)fd_off);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D 1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; @@ -143,77 +92,135 @@ static int check_file_offset(const char *m, int =
fd, loff_t len,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void test_one(size_t len, loff_t *off_in, loff_t *off_out=
)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t to_copy =3D len;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int fd_in, fd_out, ret;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0loff_t *off_in_ori =3D off_in;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0loff_t *off_out_ori =3D off_out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0loff_t off_in_copy;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0loff_t off_out_copy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t off_in_value_copy, off_out_value_copy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t *off_new_in=C2=A0 =3D &amp;off_in_value_co=
py;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t *off_new_out =3D &amp;off_out_value_copy;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char str_off_in[32], str_off_out[32];<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (off_in) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_in_copy =3D *off_=
in;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_in =3D &amp;off_i=
n_copy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_in_value_copy =3D=
 *off_in;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(str_off_=
in, &quot;%ld&quot;, (long)*off_in);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_new_in =3D NULL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(str_off_i=
n, &quot;NULL&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (off_out) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_out_copy =3D *off=
_out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_out =3D &amp;off_=
out_copy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_out_value_copy =
=3D *off_out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(str_off_=
out, &quot;%ld&quot;, (long)*off_out);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_new_out =3D NULL;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(str_off_o=
ut, &quot;NULL&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0fd_in =3D SAFE_OPEN(TEST_FILE_1, O_RDONLY);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0fd_out =3D SAFE_OPEN(TEST_FILE_2, O_CREAT | O_WRO=
NLY | O_TRUNC, 0644);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * copy_file_range() will return the number =
of bytes copied between<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * files. This could be less than the length=
 originally requested.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(tst_syscall(__NR=
_copy_file_range, fd_in, off_in, fd_out,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0off_out, to_copy, 0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sys_copy_file_ra=
nge(fd_in, off_new_in, fd_out,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_new_out, to_copy, 0));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=
=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tst_res(TFAIL | TTERRNO, &quot;copy_file_range() failed&quot;)=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SAFE_CLOSE(fd_in);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SAFE_CLOSE(fd_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0errcount++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_copy -=3D TST=
_RET;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (to_copy &gt; 0);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D check_file_content(TEST_FILE_1, TEST_FILE=
_2,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_in_ori, off_out_o=
ri, len);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D check_file_content(FILE_SRC_PATH, FILE_DE=
ST_PATH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_in, off_out, len)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &=
quot;file contents do not match&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errcount++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret |=3D check_file_offset(&quot;(in)&quot;, fd_i=
n, len, off_in_ori, off_in);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret |=3D check_file_offset(&quot;(out)&quot;, fd_=
out, len, off_out_ori, off_out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret |=3D check_file_offset(&quot;(in)&quot;, fd_i=
n, len, off_in, off_new_in);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret |=3D check_file_offset(&quot;(out)&quot;, fd_=
out, len, off_out, off_new_out);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
off_in: %s, off_out: %s, len: %ld&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str_off_in, str_off_out, (long)len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errcount++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0tst_res(ret =3D=3D 0 ? TPASS : TFAIL, &quot;off_i=
n: %s, off_out: %s, len: %ld&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0str_off_in, str_off_out, (long)len);<br>
&gt; +static void open_files(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_in=C2=A0 =3D SAFE_OPEN(FILE_SRC_PATH, O_RDONLY=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_out =3D SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_=
WRONLY | O_TRUNC, 0644);<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_in);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_out);<br>
&gt; +static void close_files(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_out &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_out);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_in=C2=A0 &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_in);<br=
>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void copy_file_range_verify(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j, k;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; len_sz; i++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; =
off_sz; j++)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (k =3D 0; k &lt; off_sz; k++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0errcount =3D numcopies =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t len_arr[]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {=
11, page_size-1, page_size, page_size+1};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t off_arr_values[] =3D {0, 17, page_size-1, =
page_size, page_size+1};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int num_offsets =3D ARRAY_SIZE(off_arr_values) + =
1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t *off_arr[num_offsets];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0off_arr[0] =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; num_offsets; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0off_arr[i] =3D &amp;o=
ff_arr_values[i-1];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Test all possible cobinations of given lengths=
 and offsets */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; (int)ARRAY_SIZE(len_arr); i+=
+)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; =
num_offsets; j++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0for (k =3D 0; k &lt; num_offsets; k++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0open_files();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_one(len_arr[i], off_arr[j], o=
ff_arr[k]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close_files();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0numcopies++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (errcount =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range completed all %d copy jobs successfully!&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0numcopies);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
copy_file_range failed %d of %d copy jobs.&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errcount, numcopies);<br></blockquote><d=
iv><br></div><div class=3D"gmail_default" style=3D"font-size:small">we shou=
ld use TFAIL but not TINFO for the failure report.</div><div class=3D"gmail=
_default"><a href=3D"https://github.com/linux-test-project/ltp/blob/master/=
doc/test-writing-guidelines.txt#L414">https://github.com/linux-test-project=
/ltp/blob/master/doc/test-writing-guidelines.txt#L414</a><br></div><div cla=
ss=3D"gmail_default"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +}<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0syscall_info();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0page_size =3D getpagesize();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT,=
 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Writing page_size * 4 of data into test file *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; (int)(page_size * 4); i++)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fd, CON=
TENT, CONTSIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0close_files();<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct tst_test test =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D copy_file_range_verify,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_variants =3D TEST_VARIANTS,<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range=
02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a9fd713aa<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br=
>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 SUSE LLC<br>
&gt; + * Author: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" tar=
get=3D"_blank">camann@suse.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Tests basic error handling of the<br>
&gt; + * copy_file_range syscall<br>
&gt; + *<br>
&gt; + * 1) Try to copy contents to file open as readonly<br>
&gt; + *=C2=A0 =C2=A0 -&gt; EBADF<br>
&gt; + * 2) Try to copy contents to file on different mounted<br>
&gt; + *=C2=A0 =C2=A0 filesystem -&gt; EXDEV<br>
&gt; + * 3) Try to copy contents to directory -&gt; EISDIR<br>
&gt; + * 4) Try to copy contents to a file opened with the<br>
&gt; + *=C2=A0 =C2=A0 O_APPEND flag -&gt; EBADF<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define _GNU_SOURCE<br>
&gt; +<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;copy_file_range.h&quot;<br>
&gt; +<br>
&gt; +static int fd_src;<br>
&gt; +static int fd_rdonly;<br>
&gt; +static int fd_mnted;<br>
&gt; +static int fd_dir;<br>
&gt; +static int fd_append;<br>
&gt; +<br>
&gt; +static struct tcase {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0*copy_to_fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0exp_err;<br>
&gt; +} tcases[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&amp;fd_rdonly, EBADF},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&amp;fd_mnted,=C2=A0 EXDEV},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&amp;fd_dir,=C2=A0 =C2=A0 EISDIR},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{&amp;fd_append, EBADF},<br>
&gt; +};<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I&#39;m thinking maybe we can try test some more inval=
id argurments(e.g flags) here?</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default">static struct tcase =
{</div><div class=3D"gmail_default"><span style=3D"white-space:pre">	</span=
>int<span style=3D"white-space:pre">	</span>*copy_to_fd;</div><div class=3D=
"gmail_default"><span style=3D"white-space:pre">	</span>int<span style=3D"w=
hite-space:pre">	</span>flags;</div><div class=3D"gmail_default"><span styl=
e=3D"white-space:pre">	</span>int<span style=3D"white-space:pre">	</span>ex=
p_err;</div><div class=3D"gmail_default">} tcases[] =3D {</div><div class=
=3D"gmail_default"><span style=3D"white-space:pre">	</span>{&amp;fd_rdonly,=
 0, EBADF},</div><div class=3D"gmail_default"><span style=3D"white-space:pr=
e">	</span>{&amp;fd_mnted,=C2=A0 0, EXDEV},</div><div class=3D"gmail_defaul=
t"><span style=3D"white-space:pre">	</span>{&amp;fd_dir,=C2=A0 =C2=A0 0, EI=
SDIR},</div><div class=3D"gmail_default"><span style=3D"white-space:pre">	<=
/span>{&amp;fd_append, 0, EBADF},</div><div class=3D"gmail_default"><span s=
tyle=3D"white-space:pre">	</span>{&amp;fd_append, -1, EINVAL},</div><div cl=
ass=3D"gmail_default">};</div><div class=3D"gmail_default"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; +<br>
&gt; +static void verify_copy_file_range(unsigned int n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tcase *tc =3D &amp;tcases[n];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;copy_=
to_fd, 0, CONTSIZE, 0));<br>
&gt; +<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">I would like change the error handler logic as below to m=
ake something easier to understand:</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><div class=3D"gmail_default">if (TST_RET =3D=3D -1) {</div><div =
class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tc-&gt;exp_err =3D=
=3D TST_ERR) {</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS | TTERRNO, &quot;copy_file_ra=
nge failed as expected&quot;);</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 } else {</div><div class=3D"gmail_default">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL | TTERRNO,</div><di=
v class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;copy_file_range failed unexpectedl=
y; expected %s, but got&quot;,</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
st_strerrno(tc-&gt;exp_err));</div><div class=3D"gmail_default">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }</div><div class=3D"gmail_default">} else {</div><div cl=
ass=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL,</div><div =
class=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);</di=
v><div class=3D"gmail_default">}</div></div><div class=3D"gmail_default"><s=
pan style=3D"white-space:pre-wrap"><br></span></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; +=C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err !=3D TST_ERR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range failed with %s, expected %s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_strerrno(TST_ERR), tst_strerrno(tc-&gt;exp_err));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;copy_file_range ended with %=
s as expected&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_strerrno(tc-&gt;exp_err));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_append &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_append)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_dir &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_dir);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_mnted &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_mnted);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_rdonly &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_rdonly)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_src &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_src);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0syscall_info();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(FILE_DIR_PATH, F_OK) =3D=3D -1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_MKDIR(FILE_DIR_P=
ATH, 0777);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_src=C2=A0 =C2=A0 =3D SAFE_OPEN(FILE_SRC_PATH, =
O_RDWR | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_rdonly =3D SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY=
 | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_mnted=C2=A0 =3D SAFE_OPEN(FILE_MNTED_PATH, O_R=
DWR | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_dir=C2=A0 =C2=A0 =3D SAFE_OPEN(FILE_DIR_PATH, =
O_DIRECTORY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_append =3D SAFE_OPEN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0FILE_DEST_PATH, O_RDWR | O_CREAT | O_APPEND, 0664);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fd_src,=C2=A0 CONTENT,=C2=A0 CONTSI=
ZE);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test =3D verify_copy_file_range,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(tcases),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mount_device =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mntpoint =3D MNTPOINT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dev_fs_type =3D &quot;ext4&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_variants =3D TEST_VARIANTS,<br>
&gt; +};<br>
&gt; diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range=
03.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d2c51632b<br>
&gt; --- /dev/null<br>
&gt; +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c<br=
>
&gt; @@ -0,0 +1,80 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 SUSE LLC<br>
&gt; + * Author: Christian Amann &lt;<a href=3D"mailto:camann@suse.com" tar=
get=3D"_blank">camann@suse.com</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Copies the contents of one file into another and<br>
&gt; + * checks if the timestamp gets updated in the process.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define _GNU_SOURCE<br>
&gt; +<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;copy_file_range.h&quot;<br>
&gt; +<br>
&gt; +static int fd_src;<br>
&gt; +static int fd_dest;<br>
&gt; +<br>
&gt; +unsigned long getTimestamp(int fd)<br></blockquote><div><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">To avoid camelcase nami=
ng in LTP, how about get_timestamp() ?</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct stat filestat;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fstat(fd, &amp;filestat);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return filestat.st_mtime;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void verify_copy_file_range_timestamp(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0loff_t offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long timestamp, updated_timestamp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0timestamp =3D getTimestamp(fd_dest);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep(1000000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TEST(sys_copy_file_range(fd_src, &amp;offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fd_dest, 0, CONTSIZE, 0));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
copy_file_range unexpectedly failed!&quot;);<br></blockquote><div><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">Seems tst_brk(TBROK=
 | TTERRNO, ...) is better here, then we can remove the return=C2=A0sentenc=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0updated_timestamp =3D getTimestamp(fd_dest);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (timestamp =3D=3D updated_timestamp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;=
copy_file_range did not update timestamp!&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;</blockquote><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;copy_file_range sucessfully =
updated the timestamp.&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_dest &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_dest);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fd_src=C2=A0 &gt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_src);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0syscall_info();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_dest =3D SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_=
CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_src=C2=A0 =3D SAFE_OPEN(FILE_SRC_PATH,=C2=A0 O=
_RDWR | O_CREAT, 0664);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fd_src,=C2=A0 CONTENT,=C2=A0 CONTSI=
ZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd_src);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd_src =3D SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);<br=
>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_all =3D verify_copy_file_range_timestamp,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test_variants =3D TEST_VARIANTS,<br>
&gt; +};<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail-m_-839912634004947555gmail-m_589771061953689425gmail_signat=
ure"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--00000000000008d93305879007ec--

--===============0907005598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0907005598==--
