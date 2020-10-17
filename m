Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60381291185
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Oct 2020 12:57:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAEA23C320A
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Oct 2020 12:57:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id ED2793C2411
 for <ltp@lists.linux.it>; Sat, 17 Oct 2020 12:56:58 +0200 (CEST)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2BB521001573
 for <ltp@lists.linux.it>; Sat, 17 Oct 2020 12:56:58 +0200 (CEST)
Received: by mail-io1-xd44.google.com with SMTP id m17so7153456ioo.1
 for <ltp@lists.linux.it>; Sat, 17 Oct 2020 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TFFEIHlvgky2YrPr5q8jKZGRByFt9fCayaxzbJmmx+8=;
 b=oNzgxN1NcKuDvJndaRNmnTJr2dj+jL3eFYIc5fNufFQgMxUG4lCa4fUoSDobiYpj8z
 deSwUF6fVEpg8qchEugXxGmIgenv8GIx948yTPEVJo/k+1Je8DTb8Iwa2gGezvmdIPmp
 iv87wvBJEeHYRrj+KwS80FkuRorGF+iaVv7P4Ogy5scMBfYzWGu3jVaiPIMQ4n3Ff04d
 W0dFjqV2HVUXV3nzijMO2qUGbJqK3DfyBGF0hEw9xi2I6nuMlCevnDjI4Yu6JYfS7PdM
 HcJkQT1J54C7fH0ewXEXRzuc9d0bnHR5c7Iu3nmm/qOHoYtfzYoam8OoAVL/pqVX3ZdH
 8oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFFEIHlvgky2YrPr5q8jKZGRByFt9fCayaxzbJmmx+8=;
 b=hYc/VvT/M1CCbYg8eaZ5HWW0UCwzvUrHoilF4eDipoANVkiZ81UaE3a/K0EVhPXl04
 l8rudi3wXObbELfrtrxH+7tYa6Zb+obgnSC0qOANASLBAug+eBzRHRcsaDT0OiYyiF92
 2FpxGQh2dxZ+dgE5zsNDSyhbkahg+Je6lrDHcXlhFlAVUVEQpCYKNuXp3TW9df/YLXNP
 wRdZxpXsN0mC1h1PL1dXQAvC/QB499GPeklEYSVpTjfHOCgcDu+liM8hbaSR2AHq3PIw
 9NQ7lNDsX2n6gm2qEEDL8BzaM4I2q+DoKeqkLyUNyRjvXe2xNRn1S85q6D5x8Ffo0EfW
 K5/g==
X-Gm-Message-State: AOAM531pNgpdAfRHGUOJ8DAgLQXvKiPgY1sU6jNz3EiB9iWTz+illCR9
 vL5hwJ1yu4HASZphzY6EaDtOiMN0qFMpAZTnQaI=
X-Google-Smtp-Source: ABdhPJx+zFuzSVbVY8RLmM+UZjrh9ceqwX8ZZtlXIPo47/1cRoHwjgUUpp09xEktJ7X1Ekl4jfepurLaXBB1ivCKtfI=
X-Received: by 2002:a02:9f12:: with SMTP id z18mr5614394jal.123.1602932216499; 
 Sat, 17 Oct 2020 03:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201016112441.4838-1-pvorel@suse.cz>
In-Reply-To: <20201016112441.4838-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 17 Oct 2020 13:56:45 +0300
Message-ID: <CAOQ4uxixzOtXjyVTUNR03ffJHgTQCm5+L46zNNgdxvB0n9ZuhA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify16: Introduce SAFE_FANOTIFY_MARK()
 macro
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 16, 2020 at 2:24 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> fanotify_mark() checks for unsupported filesystem were missing
> least for exfat on fanotify16. But because unsupported filesystem can be
> set via LTP_DEV_FS_TYPE environment variable on tests which don't tests
> all filesystems, introduce universal check and use it in all suitable
> places.
>
> Checks for masks and flags uses tst_ret() instead of usual tst_brk(),
> therefore caller needs to check the return value.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Amir,
>

Hi Petr,

Excellent cleanup!

> to be honest, I'd prefer to be more strict and use tst_brk()
> it could be used on more places (fanotify07.c) and return could be avoided.

Sure, we should do that.

There is a subtlety with fanotify03 that made the checks a bit more complex than
they should have been.

I think your cleanup caused losing some of the information in fanotify03.
I will explain below.

Once we sort this out, there should be no problem to test_brk() in more cases.

>
> But some checks:
> fanotify13.c:161: TINFO: Test #0: FAN_REPORT_FID with mark flag: FAN_MARK_INODE
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #1: FAN_REPORT_FID with mark flag: FAN_MARK_INODE
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #2: FAN_REPORT_FID with mark flag: FAN_MARK_MOUNT
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #3: FAN_REPORT_FID with mark flag: FAN_MARK_MOUNT
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #4: FAN_REPORT_FID with mark flag: FAN_MARK_FILESYSTEM
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #5: FAN_REPORT_FID with mark flag: FAN_MARK_FILESYSTEM
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
>
> ... would be stopped on the first error:
> fanotify13.c:141: TINFO: Test #0: FAN_REPORT_FID with mark flag: FAN_MARK_INODE
> fanotify.h:82: TCONF: fanotify13.c:119: fanotify_mark(): flag not supported on ntfs filesystem

It's a plain test bug. Should have been tst_brk() to begin with,
because all the test cases
use FAN_REPORT_FID in fanotify_init(), there is no reason to continue.

Similarly in fanotify13, can use tst_brk() after fanotify_init() for the case of
"FAN_REPORT_FID not supported by kernel".

>
> Also on some places it lost some info, for this reason not used in fanotify15.c and only once in fanotify01.c.

Please explain. Which information was lost and what wasn't used in
fanotify15 and fanotify01?

>
> Kind regards,
> Petr
>
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 43 ++++++++++++++++
>  .../kernel/syscalls/fanotify/fanotify01.c     | 16 ++----
>  .../kernel/syscalls/fanotify/fanotify02.c     | 24 +++------
>  .../kernel/syscalls/fanotify/fanotify03.c     | 45 ++++-------------
>  .../kernel/syscalls/fanotify/fanotify04.c     |  9 +---
>  .../kernel/syscalls/fanotify/fanotify05.c     | 10 ++--
>  .../kernel/syscalls/fanotify/fanotify06.c     | 23 +++------
>  .../kernel/syscalls/fanotify/fanotify09.c     | 29 +++++------
>  .../kernel/syscalls/fanotify/fanotify10.c     | 39 +++------------
>  .../kernel/syscalls/fanotify/fanotify11.c     |  4 +-
>  .../kernel/syscalls/fanotify/fanotify12.c     | 50 +++----------------
>  .../kernel/syscalls/fanotify/fanotify13.c     | 23 +--------
>  .../kernel/syscalls/fanotify/fanotify15.c     | 16 ++----
>  .../kernel/syscalls/fanotify/fanotify16.c     | 21 +++-----
>  14 files changed, 113 insertions(+), 239 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 0afbc02aa..952bd8031 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -60,9 +60,13 @@ int safe_fanotify_init(const char *file, const int lineno,
>
>         return rval;
>  }
> +
>  #define SAFE_FANOTIFY_INIT(fan, mode)  \
>         safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
>
> +#define SAFE_FANOTIFY_MARK(fd, flags, mask, dfd, pathname)  \
> +       safe_fanotify_mark(__FILE__, __LINE__, (fd), (flags), (mask), (dfd), (pathname))
> +
>  #ifndef FAN_REPORT_TID
>  #define FAN_REPORT_TID         0x00000100
>  #endif
> @@ -242,4 +246,43 @@ static inline void fanotify_save_fid(const char *path,
>  #define INIT_FANOTIFY_MARK_TYPE(t) \
>         { FAN_MARK_ ## t, "FAN_MARK_" #t }
>
> +#define FANOTIFY_CHECK(flag, flags) \
> +       ({ \
> +               if (errno == EINVAL && (flags & flag) == flag) { \
> +                       tst_res(TCONF, "%s:%d: "#flag" not supported by kernel?", \
> +                               file, lineno); \
> +                       return -1; \
> +               } \
> +       })
> +
> +static inline long safe_fanotify_mark(const char *file, const int lineno,
> +                       int fd, unsigned int flags, uint64_t mask,
> +                       int dfd, const char *pathname)
> +{
> +       long rval;
> +
> +       rval = fanotify_mark(fd, flags, mask, dfd, pathname);
> +
> +       if (rval < 0) {
> +               if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV)
> +                       tst_brk(TCONF,
> +                               "%s:%d: fanotify_mark(): flag not supported on %s filesystem",
> +                               file, lineno, tst_device->fs_type);

It should say "FAN_REPORT_FID not supported on ntfs filesystem".
"flag not supported" is too vague.

> +
> +               FANOTIFY_CHECK(FAN_OPEN_EXEC_PERM, mask);
> +               FANOTIFY_CHECK(FAN_OPEN_EXEC, mask);
> +               FANOTIFY_CHECK(FAN_MARK_FILESYSTEM, flags);

This logic is fine for fanotify12 (only FAN_OPEN_EXEC relevant)

For fanotify03 and fanotify10, test cases can have both FAN_OPEN_EXEC and
FAN_MARK_FILESYSTEM or only one of them.

If removing the CONFIG_FANOTIFY_ACCESS_PERMISSIONS case from
fanotify03 (see below), then the logic of fanotify03 and fanotify10 should be
the same, so I will comment only on fanotify03 below, but changes should
apply to both.

> +
> +               if (errno == EINVAL)
> +                               tst_brk(TCONF | TERRNO,
> +                                       "CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
> +                                       "not configured in kernel?");

Checking this condition during the test case is an over complication,
because all the tests that check permission events check them in
all the test cases, so this check should be done in setup(), just like:

2b37d8405 syscalls/fanotify11.c: check fanotify kernel support

For all the tests that currently have the above TCONF message:
fanotify03 - all test cases use permission events so check in setup()
fanotify07- setup_instance() could be made into a generic helper that
                  can be used by fanotify03 in setup()
fanotify12 - no permission events at all the TCONF message is wrong

> +
> +               tst_brk(TBROK | TERRNO,
> +                       "%s:%d: fanotify_mark() failed", file, lineno);
> +       }
> +
> +       return rval;
> +}
> +

[...]

> --- a/testcases/kernel/syscalls/fanotify/fanotify03.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> @@ -215,41 +215,16 @@ static int setup_mark(unsigned int n)
>         fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
>
>         for (; i < ARRAY_SIZE(files); i++) {
> -               if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> -                                 tc->mask, AT_FDCWD, files[i]) < 0) {
> -                       if (errno == EINVAL &&
> -                               (tc->mask & FAN_OPEN_EXEC_PERM &&
> -                                !support_exec_events)) {
> -                               tst_res(TCONF,
> -                                       "FAN_OPEN_EXEC_PERM not supported in "
> -                                       "kernel?");
> -                               return -1;
> -                       } else if (errno == EINVAL &&
> -                                       mark->flag == FAN_MARK_FILESYSTEM) {
> -                               tst_res(TCONF,
> -                                       "FAN_MARK_FILESYSTEM not supported in "
> -                                       "kernel?");
> -                               return -1;
> -                       } else if (errno == EINVAL) {
> -                               tst_brk(TCONF | TERRNO,
> -                                       "CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
> -                                       "not configured in kernel?");
> -                       } else {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                                       "FAN_ACCESS_PERM | FAN_OPEN_PERM, "
> -                                       "AT_FDCWD, %s) failed.",
> -                                       fd_notify, mark->name, fname);
> -                       }
> -               } else {
> -                       /*
> -                        * To distinguish between perm not supported, exec
> -                        * events not supported and filesystem mark not
> -                        * supported.
> -                        */
> -                       if (tc->mask & FAN_OPEN_EXEC_PERM)
> -                               support_exec_events = 1;
> -               }

This comment above tcases array is the root of all evil:

/*
 * Ensure to keep the first FAN_OPEN_EXEC_PERM test case before the first
 * MARK_TYPE(FILESYSTEM) in order to allow for correct detection between
 * exec events not supported and filesystem marks not supported.
 */

I am responsible for this hacky design. Matthew was just the executor.

The reason that FAN_OPEN_EXEC is checked first is because
FAN_OPEN_EXEC support was merged after FAN_MARK_FILESYSTEM,
so it is likely that if kernel does not support FAN_MARK_FILESYSTEM
that it does not support FAN_OPEN_EXEC either, but that is a hacky
assumption to make.

The correct way would be to check for FAN_OPEN_EXEC support in
setup() after checking for permission events support and set
support_exec_events. Do the same for fanotify10.

Then, test cases with FAN_OPEN_EXEC (fanotify10) and with
FAN_OPEN_EXEC_PERM (fanotify03) should be skipped without even
calling fanotify_mark() and the only check that remains relevant in
SAFE_FANOTIFY_MARK() in those tests in the check for
FAN_MARK_FILESYSTEM support.

In summary, all your changes look fine, but logic should be simplified
with a few more pre-condition checks in setup() and one plain bug
needs to be fixed to address your report about fanotify13 and ntfs.

Please let me know if anything is not clear.

Thanks,
Amir.


> --- a/testcases/kernel/syscalls/fanotify/fanotify12.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
> @@ -139,55 +139,17 @@ static int setup_mark(unsigned int n)
>
>         for (; i < ARRAY_SIZE(files); i++) {
>                 /* Setup normal mark on object */
> -               if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> -                                       tc->mask, AT_FDCWD, files[i]) < 0) {
> -                       if (errno == EINVAL && tc->mask & FAN_OPEN_EXEC) {
> -                               tst_res(TCONF,
> -                                       "FAN_OPEN_EXEC not supported in "
> -                                       "kernel?");
> -                               return -1;
> -                       } else if (errno == EINVAL) {
> -                               tst_brk(TCONF | TERRNO,
> -                                       "CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
> -                                       "not configured in kernel?");
> -                       }else {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                                       "%llx, AT_FDCWD, %s) failed",
> -                                       fd_notify,
> -                                       mark->name,
> -                                       tc->mask,
> -                                       files[i]);
> -                       }
> -               }
> +               if (SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD | mark->flag,
> +                                       tc->mask, AT_FDCWD, files[i]) < 0)
> +                       return -1;
>
>                 /* Setup ignore mark on object */
>                 if (tc->ignore_mask) {
> -                       if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag
> +                       if (SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD | mark->flag
>                                                 | FAN_MARK_IGNORED_MASK,
>                                                 tc->ignore_mask, AT_FDCWD,
> -                                               files[i]) < 0) {
> -                               if (errno == EINVAL &&
> -                                       tc->ignore_mask & FAN_OPEN_EXEC) {
> -                                       tst_res(TCONF,
> -                                               "FAN_OPEN_EXEC not supported "
> -                                               "in kernel?");
> -                                       return -1;
> -                               } else if (errno == EINVAL) {
> -                                       tst_brk(TCONF | TERRNO,
> -                                               "CONFIG_FANOTIFY_ACCESS_"
> -                                               "PERMISSIONS not configured in "
> -                                               "kernel?");
> -                               } else {
> -                                       tst_brk(TBROK | TERRNO,
> -                                               "fanotify_mark (%d, "
> -                                               "FAN_MARK_ADD | %s "
> -                                               "| FAN_MARK_IGNORED_MASK, "
> -                                               "%llx, AT_FDCWD, %s) failed",
> -                                               fd_notify, mark->name,
> -                                               tc->ignore_mask, files[i]);
> -                               }
> -                       }
> +                                               files[i]) < 0)
> +                       return -1;
>                 }
>         }
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
