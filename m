Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 983622C6894
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 16:18:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48B643C5DF3
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 16:18:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 556D03C4E06
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:18:00 +0100 (CET)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 09217200FEC
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:17:59 +0100 (CET)
Received: by mail-il1-x141.google.com with SMTP id p5so4904358iln.8
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idy36dgdB1M05L3HUW+U0qWRv9QAVw9eh0UOkvXdX1E=;
 b=ZPMKybpz6uAsMm4kDIk3eTnsttMHFga4uAt1E2jB59uegnDDkv7ltQjIXMHj5ol4em
 YxsbxUTyNNP4nmPtSkrKUYsgWcrQkKTQVbry41LBXR1S9I8BnxcXjtY+xrsJjVwFz/Dt
 tnzFCwfB7DkRHijCxtUX7eIo0y0XQ77wW3SESbeAt56H7YA1X/H4epyJIsXC5CIWwOua
 hAm8Fta1Aj73CZK5alAT8Sx7lYEjdF0psyBxdWzYBZ5ZBmj4KXO11xMpXqywPMhWH79r
 yHwgUz28GvSau+BQYE8ydOqVmwjRtghZRq+u16qC+suYL0vPEuqUt3pvFzLQrv5YzR1W
 dFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idy36dgdB1M05L3HUW+U0qWRv9QAVw9eh0UOkvXdX1E=;
 b=ihV6g3nSNlpxpN0zDzL8Nnns8XxYz7kOKwdiIoNc28bJ8IRskvIYA6ZGQWEO/1gaqQ
 BSmalGDbwVW/pWp7XgEWi5Y1H3CLqEOGRxjJWQ7iVsWIeu+ZO735urYzUKMe3Zu9UA+J
 BXgxWQKF6k1Ce9Nn1p6Zjvhgty7JxKrTkcyn89n5SSy24Kg5QcMLik3rVQpNxgNtz6ta
 HQxFZTEVuaM9mRuQla9qmCvIC/5gU1TyqCqFVZ8lqLlE0CmVXOvKEUtWS6bK0kgRVHi/
 6s8d7Q38yt0YNbZeSiD1iqDgQP/2BaSMSQ/6p02qXV0wIFK9W6eR+2i0zfZhGKfEG+DS
 cRpg==
X-Gm-Message-State: AOAM532OAbscr6JdQKWFvqiMn1H2s6Vl5Muobq/zW2qsYR9DKww2k0f6
 NHKQ/+Z/xY3FUocZ/aIaJ/ZtvRPbS66UmSgd6Pg=
X-Google-Smtp-Source: ABdhPJzDMrKF//2PHbdDGtwkRAQt1wna97AsaOEgxDqqYTsdR/phylL49yj292N2+ZVAmTI5aUKYWGKq5367zODPuIc=
X-Received: by 2002:a92:8541:: with SMTP id f62mr7580069ilh.9.1606490277506;
 Fri, 27 Nov 2020 07:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20201126214121.6836-1-pvorel@suse.cz>
 <20201126214121.6836-5-pvorel@suse.cz>
In-Reply-To: <20201126214121.6836-5-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2020 17:17:46 +0200
Message-ID: <CAOQ4uxgtTEhVNP_jTjRQdHgNRsjmVPQ3UEQkTmoYcQ=3rNfBww@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/6] fanotify: Introduce SAFE_FANOTIFY_MARK()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 26, 2020 at 11:41 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> and function and use it in all tests which use fanotify_mark().
>
> Motivation was not only to simplify the code but also check for
> unsupported filesystems which was missing least for exfat on fanotify16,
> because filesystem can be set via LTP_DEV_FS_TYPE environment variable
> on tests which don't tests all filesystems.
>
> Previous commit added check for FAN_ACCESS_PERM enablement (caused by
> disabled CONFIG_FANOTIFY_ACCESS_PERMISSIONS) or FAN_OPEN_EXEC and
> FAN_OPEN_EXEC_PERM support in kernel, which are tested in setup
> functions for relevant tests, thus only FAN_MARK_FILESYSTEM is needed to
> check in safe_fanotify_mark().
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v3->v4:
> * use tst_res_() and tst_brk_() for safe_*() functions
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 34 ++++++++++++
>  .../kernel/syscalls/fanotify/fanotify01.c     | 53 ++++---------------
>  .../kernel/syscalls/fanotify/fanotify02.c     | 22 ++------
>  .../kernel/syscalls/fanotify/fanotify03.c     | 18 +------
>  .../kernel/syscalls/fanotify/fanotify04.c     | 32 +++--------
>  .../kernel/syscalls/fanotify/fanotify05.c     |  9 +---
>  .../kernel/syscalls/fanotify/fanotify06.c     | 21 ++------
>  .../kernel/syscalls/fanotify/fanotify07.c     |  9 +---
>  .../kernel/syscalls/fanotify/fanotify09.c     | 19 ++-----
>  .../kernel/syscalls/fanotify/fanotify10.c     | 36 ++-----------
>  .../kernel/syscalls/fanotify/fanotify11.c     |  5 +-
>  .../kernel/syscalls/fanotify/fanotify12.c     | 24 ++-------
>  .../kernel/syscalls/fanotify/fanotify13.c     | 33 ++----------
>  .../kernel/syscalls/fanotify/fanotify15.c     | 20 ++-----
>  .../kernel/syscalls/fanotify/fanotify16.c     | 20 ++-----
>  15 files changed, 88 insertions(+), 267 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index c690b82d3..2a5280636 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -190,6 +190,40 @@ struct fanotify_event_info_fid {
>  #define MAX_HANDLE_SZ          128
>  #endif
>
> +static inline int safe_fanotify_mark(const char *file, const int lineno,
> +                       int fd, unsigned int flags, uint64_t mask,
> +                       int dfd, const char *pathname)
> +{
> +       int rval;
> +
> +       rval = fanotify_mark(fd, flags, mask, dfd, pathname);
> +
> +       if (rval == -1) {
> +               if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV) {
> +                       tst_brk_(file, lineno, TCONF,
> +                               "some FAN_REPORT_* flag not supported on %s filesystem",
> +                               tst_device->fs_type);
> +               }

This is not needed here.
It was already tested by fanotify_fan_report_fid_supported_on_fs()

> +
> +               if (errno == EINVAL && (flags & FAN_MARK_FILESYSTEM)) {
> +                               tst_brk_(file, lineno, TCONF,
> +                                       "FAN_MARK_FILESYSTEM not supported in kernel?");
> +               }

This turns test_res to test_brk in all the tests where FAN_MARK_FILESYSTEM
test cases should be skipped. What am I missing?
I guess we need another helper to check fanotify_filesystem_mark_support.

For example, in fanotify03:

       require_fanotify_access_permissions_supported_by_kernel();
       filesystem_mark_unsupported =
fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
       exec_events_unsupported =
fanotify_events_supported_by_kernel(FAN_OPEN_EXEC_PERM);

Note that there is no need for fanotify_mark_supported_by_kernel() for tests
where all test cases use FAN_REPORT_FID (fanotify15, fanotify16),
because all kernels that support FAN_REPORT_FID support FAN_MARK_FILESYSTEM.

[...]

> diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
> index ccb9a4799..5e5104fe5 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify03.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> @@ -216,22 +216,8 @@ static int setup_mark(unsigned int n)
>         fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
>
>         for (; i < ARRAY_SIZE(files); i++) {
> -               if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> -                                 tc->mask, AT_FDCWD, files[i]) < 0) {
> -                       if (errno == EINVAL &&
> -                                       mark->flag == FAN_MARK_FILESYSTEM) {
> -                               tst_res(TCONF,
> -                                       "FAN_MARK_FILESYSTEM not supported in "
> -                                       "kernel?");

All these should be removed by a previous patch that adds
fanotify_mark_supported_by_kernel() and skips test cases in advance.

> -                               return -1;
> -                       } else {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                                       "FAN_ACCESS_PERM | FAN_OPEN_PERM, "
> -                                       "AT_FDCWD, %s) failed.",
> -                                       fd_notify, mark->name, fname);
> -                       }
> -               }
> +               SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD | mark->flag,
> +                                 tc->mask, AT_FDCWD, files[i]);
>         }
>
>         return 0;
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify04.c b/testcases/kernel/syscalls/fanotify/fanotify04.c
> index 722ad5d41..a24e7f7c3 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify04.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify04.c
> @@ -77,13 +77,8 @@ static void check_mark(char *file, unsigned long long flag, char *flagstr,
>                 if (test_event)
>                         test_event(file);
>
> -               if (fanotify_mark(fd_notify, FAN_MARK_REMOVE | flag,
> -                                 FAN_OPEN, AT_FDCWD, file) < 0) {
> -                       tst_brk(TBROK | TERRNO,
> -                               "fanotify_mark (%d, FAN_MARK_REMOVE | %s, "
> -                               "FAN_OPEN, AT_FDCWD, '%s') failed",
> -                               fd_notify, flagstr, file);
> -               }
> +               SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_REMOVE | flag,
> +                                 FAN_OPEN, AT_FDCWD, file);
>         }
>  }
>
> @@ -191,29 +186,14 @@ void test01(void)
>         CHECK_MARK(sname, 0, 0, test_open_file);
>
>         /* Verify FAN_MARK_FLUSH destroys all inode marks */
> -       if (fanotify_mark(fd_notify, FAN_MARK_ADD,
> -                         FAN_OPEN, AT_FDCWD, fname) < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "fanotify_mark (%d, FAN_MARK_ADD, FAN_OPEN, "
> -                       "AT_FDCWD, '%s') failed", fd_notify, fname);
> -       }
> -       if (fanotify_mark(fd_notify, FAN_MARK_ADD,
> -                         FAN_OPEN | FAN_ONDIR, AT_FDCWD, dir) < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "fanotify_mark (%d, FAN_MARK_ADD, FAN_OPEN | "
> -                       "FAN_ONDIR, AT_FDCWD, '%s') failed", fd_notify,
> -                       dir);
> -       }
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD, FAN_OPEN, AT_FDCWD, fname);
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD, FAN_OPEN | FAN_ONDIR,
> +                          AT_FDCWD, dir);
>         open_file(fname);
>         verify_event(S_IFREG);
>         open_dir(dir);
>         verify_event(S_IFDIR);
> -       if (fanotify_mark(fd_notify, FAN_MARK_FLUSH,
> -                         0, AT_FDCWD, ".") < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "fanotify_mark (%d, FAN_MARK_FLUSH, 0, "
> -                       "AT_FDCWD, '.') failed", fd_notify);
> -       }
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_FLUSH, 0, AT_FDCWD, ".");
>
>         open_dir(dir);
>         verify_no_event();
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
> index e53cc333a..c13b9ad7b 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify05.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
> @@ -107,13 +107,8 @@ static void setup(void)
>         fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | FAN_NONBLOCK,
>                         O_RDONLY);
>
> -       if (fanotify_mark(fd_notify, FAN_MARK_MOUNT | FAN_MARK_ADD, FAN_OPEN,
> -                         AT_FDCWD, MOUNT_PATH) < 0) {
> -               tst_brk(TBROK | TERRNO,
> -                       "fanotify_mark (%d, FAN_MARK_MOUNT | FAN_MARK_ADD, "
> -                       "FAN_OPEN, AT_FDCWD, \".\") failed",
> -                       fd_notify);
> -       }
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_MOUNT | FAN_MARK_ADD, FAN_OPEN,
> +                         AT_FDCWD, MOUNT_PATH);
>  }
>
>  static void cleanup(void)
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify06.c b/testcases/kernel/syscalls/fanotify/fanotify06.c
> index 99e312a4f..ac4901f6f 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify06.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify06.c
> @@ -78,7 +78,6 @@ static struct tcase {
>  static void create_fanotify_groups(void)
>  {
>         unsigned int p, i;
> -       int ret;
>
>         for (p = 0; p < FANOTIFY_PRIORITIES; p++) {
>                 for (i = 0; i < GROUPS_PER_PRIO; i++) {
> @@ -87,32 +86,20 @@ static void create_fanotify_groups(void)
>                                                              O_RDONLY);
>
>                         /* Add mount mark for each group */
> -                       ret = fanotify_mark(fd_notify[p][i],
> +                       SAFE_FANOTIFY_MARK(fd_notify[p][i],
>                                             FAN_MARK_ADD | FAN_MARK_MOUNT,
>                                             FAN_MODIFY,
>                                             AT_FDCWD, fname);
> -                       if (ret < 0) {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | "
> -                                       "FAN_MARK_MOUNT, FAN_MODIFY, AT_FDCWD,"
> -                                       " %s) failed", fd_notify[p][i], fname);
> -                       }
> +
>                         /* Add ignore mark for groups with higher priority */
>                         if (p == 0)
>                                 continue;
> -                       ret = fanotify_mark(fd_notify[p][i],
> +
> +                       SAFE_FANOTIFY_MARK(fd_notify[p][i],
>                                             FAN_MARK_ADD |
>                                             FAN_MARK_IGNORED_MASK |
>                                             FAN_MARK_IGNORED_SURV_MODIFY,
>                                             FAN_MODIFY, AT_FDCWD, fname);
> -                       if (ret < 0) {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | "
> -                                       "FAN_MARK_IGNORED_MASK | "
> -                                       "FAN_MARK_IGNORED_SURV_MODIFY, "
> -                                       "FAN_MODIFY, AT_FDCWD, %s) failed",
> -                                       fd_notify[p][i], fname);
> -                       }
>                 }
>         }
>  }
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify07.c b/testcases/kernel/syscalls/fanotify/fanotify07.c
> index 533c880d0..4bf17661a 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify07.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
> @@ -102,14 +102,7 @@ static int setup_instance(void)
>         int fd;
>
>         fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> -
> -       if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD,
> -                         fname) < 0) {
> -               close(fd);
> -               tst_brk(TBROK | TERRNO,
> -                       "fanotify_mark (%d, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD, %s) failed.",
> -                       fd, fname);
> -       }
> +       SAFE_FANOTIFY_MARK(fd, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD, fname);
>
>         return fd;
>  }
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index 83210bc1c..9c9938619 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -99,7 +99,6 @@ static void create_fanotify_groups(struct tcase *tc)
>  {
>         struct fanotify_mark_type *mark = &tc->mark;
>         unsigned int i, onchild, ondir = tc->ondir;
> -       int ret;
>
>         for (i = 0; i < NUM_GROUPS; i++) {
>                 fd_notify[i] = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF |
> @@ -111,17 +110,11 @@ static void create_fanotify_groups(struct tcase *tc)
>                  * but only the first group requests events on dir.
>                  */
>                 onchild = (i == 0) ? FAN_EVENT_ON_CHILD | ondir : 0;
> -               ret = fanotify_mark(fd_notify[i],
> +               SAFE_FANOTIFY_MARK(fd_notify[i],
>                                     FAN_MARK_ADD | mark->flag,
>                                     FAN_CLOSE_NOWRITE | onchild,
>                                     AT_FDCWD, tc->testdir);
> -               if (ret < 0) {
> -                       tst_brk(TBROK | TERRNO,
> -                               "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                               "%x, AT_FDCWD, '%s') failed",
> -                               fd_notify[i], mark->name,
> -                               FAN_CLOSE_NOWRITE | ondir, tc->testdir);
> -               }
> +
>                 /*
>                  * Add inode mark on parent for each group with MODIFY event,
>                  * but only the first group requests events on child.
> @@ -129,15 +122,9 @@ static void create_fanotify_groups(struct tcase *tc)
>                  * setting the DCACHE_FSNOTIFY_PARENT_WATCHED dentry
>                  * flag.
>                  */
> -               ret = fanotify_mark(fd_notify[i], FAN_MARK_ADD,
> +               SAFE_FANOTIFY_MARK(fd_notify[i], FAN_MARK_ADD,
>                                     FAN_MODIFY | ondir | onchild,
>                                     AT_FDCWD, ".");
> -               if (ret < 0) {
> -                       tst_brk(TBROK | TERRNO,
> -                               "fanotify_mark(%d, FAN_MARK_ADD, "
> -                               "%x, AT_FDCWD, '.') failed",
> -                               fd_notify[i], FAN_MODIFY | ondir | onchild);
> -               }
>         }
>  }
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 82f8a7774..7794c2f04 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -288,7 +288,6 @@ static int create_fanotify_groups(unsigned int n)
>         struct fanotify_mark_type *mark, *ignore_mark;
>         unsigned int mark_ignored, mask;
>         unsigned int p, i;
> -       int ret;
>
>         mark = &fanotify_mark_types[tc->mark_type];
>         ignore_mark = &fanotify_mark_types[tc->ignore_mark_type];
> @@ -317,32 +316,12 @@ static int create_fanotify_groups(unsigned int n)
>                          * FAN_EVENT_ON_CHILD has no effect on filesystem/mount
>                          * or inode mark on non-directory.
>                          */
> -                       ret = fanotify_mark(fd_notify[p][i],
> +                       SAFE_FANOTIFY_MARK(fd_notify[p][i],
>                                             FAN_MARK_ADD | mark->flag,
>                                             tc->expected_mask_without_ignore |
>                                             FAN_EVENT_ON_CHILD,
>                                             AT_FDCWD, tc->mark_path);
> -                       if (ret < 0) {
> -                               if (errno == EINVAL &&
> -                                   tc->expected_mask_without_ignore &
> -                                   FAN_OPEN_EXEC) {
> -                                       tst_res(TCONF,
> -                                               "FAN_OPEN_EXEC not supported "
> -                                               "by kernel?");
> -                                       return -1;

This should not have been here.
Should have been removed by exec_events_unsupported patch just like you did
with fanotify03 and fanotify07.

> -                               } else if (errno == EINVAL &&
> -                                       tc->mark_type == FANOTIFY_FILESYSTEM) {
> -                                       tst_res(TCONF,
> -                                               "FAN_MARK_FILESYSTEM not "
> -                                               "supported in kernel?");
> -                                       return -1;
> -                               }
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s,"
> -                                       "FAN_OPEN, AT_FDCWD, %s) failed",
> -                                       fd_notify[p][i], mark->name,
> -                                       tc->mark_path);
> -                       }
> +
>                         /* Add ignore mark for groups with higher priority */
>                         if (p == 0)
>                                 continue;
> @@ -351,18 +330,9 @@ static int create_fanotify_groups(unsigned int n)
>                         mark_ignored = FAN_MARK_IGNORED_MASK |
>                                         FAN_MARK_IGNORED_SURV_MODIFY;
>  add_mark:
> -                       ret = fanotify_mark(fd_notify[p][i],
> +                       SAFE_FANOTIFY_MARK(fd_notify[p][i],
>                                             FAN_MARK_ADD | ignore_mark->flag | mark_ignored,
>                                             mask, AT_FDCWD, tc->ignore_path);
> -                       if (ret < 0) {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark(%d, FAN_MARK_ADD | %s | %s, "
> -                                       "%x, AT_FDCWD, %s) failed",
> -                                       fd_notify[p][i], ignore_mark->name,
> -                                       mark_ignored ? "FAN_MARK_IGNORED_MASK | "
> -                                       "FAN_MARK_IGNORED_SURV_MODIFY" : "",
> -                                       mask, tc->ignore_path);
> -                       }
>
>                         /*
>                          * If ignored mask is on a parent watching children,
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify11.c b/testcases/kernel/syscalls/fanotify/fanotify11.c
> index 9e8606c72..56b7153f8 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify11.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify11.c
> @@ -55,7 +55,6 @@ static unsigned int tcases[] = {
>
>  void test01(unsigned int i)
>  {
> -       int ret;
>         pthread_t p_id;
>         struct fanotify_event_metadata event;
>         int fd_notify;
> @@ -76,10 +75,8 @@ void test01(unsigned int i)
>                                 tcases[i]);
>         }
>
> -       ret = fanotify_mark(fd_notify, FAN_MARK_ADD,
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD,
>                         FAN_ALL_EVENTS | FAN_EVENT_ON_CHILD, AT_FDCWD, ".");
> -       if (ret != 0)
> -               tst_brk(TBROK, "fanotify_mark FAN_MARK_ADD fail ret=%d", ret);
>
>         SAFE_PTHREAD_CREATE(&p_id, NULL, thread_create_file, NULL);
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
> index dde1a3aea..1111ffb0b 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify12.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
> @@ -146,31 +146,15 @@ static int setup_mark(unsigned int n)
>
>         for (; i < ARRAY_SIZE(files); i++) {
>                 /* Setup normal mark on object */
> -               if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> -                                       tc->mask, AT_FDCWD, files[i]) < 0) {
> -                       tst_brk(TBROK | TERRNO,
> -                               "fanotify_mark(%d, FAN_MARK_ADD | %s, "
> -                               "%llx, AT_FDCWD, %s) failed",
> -                               fd_notify,
> -                               mark->name,
> -                               tc->mask,
> -                               files[i]);
> -               }
> +               SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD | mark->flag,
> +                                       tc->mask, AT_FDCWD, files[i]);
>
>                 /* Setup ignore mark on object */
>                 if (tc->ignore_mask) {
> -                       if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag
> +                       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD | mark->flag
>                                                 | FAN_MARK_IGNORED_MASK,
>                                                 tc->ignore_mask, AT_FDCWD,
> -                                               files[i]) < 0) {
> -                               tst_brk(TBROK | TERRNO,
> -                                       "fanotify_mark (%d, "
> -                                       "FAN_MARK_ADD | %s "
> -                                       "| FAN_MARK_IGNORED_MASK, "
> -                                       "%llx, AT_FDCWD, %s) failed",
> -                                       fd_notify, mark->name,
> -                                       tc->ignore_mask, files[i]);
> -                       }
> +                                               files[i]);
>                 }
>         }
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
> index 39caea41e..2c1dc4624 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify13.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
> @@ -116,28 +116,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
>         struct fanotify_mark_type *mark = &tc->mark;
>
>         for (i = 0; i < ARRAY_SIZE(objects); i++) {
> -               if (fanotify_mark(fd, FAN_MARK_ADD | mark->flag, tc->mask,
> -                                       AT_FDCWD, objects[i].path) == -1) {
> -                       if (errno == EINVAL &&
> -                               mark->flag & FAN_MARK_FILESYSTEM) {
> -                               tst_res(TCONF,
> -                                       "FAN_MARK_FILESYSTEM not supported by "
> -                                       "kernel");
> -                               return 1;
> -                       } else if (errno == ENODEV &&
> -                                  !objects[i].fid.fsid.val[0] &&
> -                                  !objects[i].fid.fsid.val[1]) {
> -                               tst_res(TCONF,
> -                                       "FAN_REPORT_FID not supported on "
> -                                       "filesystem type %s",
> -                                       tst_device->fs_type);
> -                               return 1;
> -                       }

This should not have been here.
Should here been removed by the patch that added
fanotify_report_fid_supported_on_fs().

But I understand the confusion.
FAN_REPORT_FID support on fs can only be tested by fanotify_init followed
by fanotify_mark, even though FAN_REPORT_FID is a fanotify_init flag.
Nevertheless, fanotify_report_fid_supported_on_fs() has already verified
that we can add a mark on filesystem with FAN_REPORT_FID group, so
this check here is not needed anymore.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
