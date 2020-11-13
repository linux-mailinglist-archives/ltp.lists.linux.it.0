Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4FC2B2444
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 20:08:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DB3A3C657A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 20:08:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 133B63C2EB9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 20:08:51 +0100 (CET)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 98D4A2009D9
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 20:08:50 +0100 (CET)
Received: by mail-il1-x142.google.com with SMTP id e17so9420931ili.5
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/zMu3YaC6UJP4vZyr0UCogibeba6Zwofhgan1R+5UI=;
 b=kxXmUiuBSUPX1peOL68FZ+pNKm2wkGW1V/vQ/R7M3C68PGDEtwN7/Qyuj83gK5yk/b
 O0ysJ29wy9SXfIHRoK/0mRDW3xGsYDNiv7p+nBQG5tygbSMFCzCBjLU2hRDvMUkE9sc7
 i5z3HXPWBXxQVkCLNSwcQ8PStkzPZ3R2WYBerw6kXA/8heu5sSBHAVZZaDLEx9EBLke2
 8iwe2V0i9uAs708+u3tDhiwD+u5SbVlCXMSs2BT94oluE1ZNsmYnWKujH1NgRII975Fa
 49zithoeQnL3nHmqEUqft0kWHkrztZy7gpjVUSDaDyLJu4fSBZUn+e+s1O/8CiqANX6X
 dh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/zMu3YaC6UJP4vZyr0UCogibeba6Zwofhgan1R+5UI=;
 b=N5olVDxNWJnYPYUOr1ldXny7LRi3X6hI0ulwCdAu7FoFSN2yB1k3a8cta14VJh0UwU
 ZVKxHNZIU6XJ5smOu551e7YHHlKHi9l//jTV9eWo3MOtvFa6mE4FYMIf6xomeA+xNVKB
 rlb9GIiaeIkEe+wAaIuPkCP7njspl13Kit5z5yhj5uGtmqAa5d2OyU1sEOeyGlotx6FN
 CaLDY0xBwoVpPU/7cf/eGoTCBzkfRZKuErHVl4fb2Asf426rJVK9bZqqDddeVnj75nw6
 VWMi8lKe1gGKA4He/7fldvGnxgVPekxViwsGUK66aMBVtbxseoFmVJQQfpjLqt9Fh1H0
 7bxA==
X-Gm-Message-State: AOAM531WeBU2ZViau7rWIVEnVdJZE+3brm3B9I4yv4nQLhrPTBefB3sn
 deLlXxGB5jR/mGN2rpsWuC1w3EzzAOIVQFpbBX3ukCehKlI=
X-Google-Smtp-Source: ABdhPJzXbiPbzcjAU+FGa5I8C+SVlP/d/34A58hCE1A8Q6rv0epl8cU5uV6zTbFKtXGhj68DxmLWLRV10oWmmgktVlE=
X-Received: by 2002:a92:6403:: with SMTP id y3mr1048334ilb.72.1605294529264;
 Fri, 13 Nov 2020 11:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20201113155123.5959-1-pvorel@suse.cz>
 <20201113155123.5959-4-pvorel@suse.cz>
In-Reply-To: <20201113155123.5959-4-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 13 Nov 2020 21:08:37 +0200
Message-ID: <CAOQ4uxgrLSPcoTHY_yjr7XbUDpzQ4-O7sadiNzG0mB6Qx2D=Lg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/5] fanotify: Introduce SAFE_FANOTIFY_MARK()
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

On Fri, Nov 13, 2020 at 5:51 PM Petr Vorel <pvorel@suse.cz> wrote:
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

So previous commit should have removed the check for exec event support
on failure instead of including this change in this commit.
IOW, the paragraph above should not have been needed.

>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Amir,
>
> to be honest, I'm not sure if it's worth to remove
> FAN_ACCESS_PERM (CONFIG_FANOTIFY_ACCESS_PERMISSIONS) check from
> safe_fanotify_mark(). The downside of
> fanotify_access_permissions_supported_by_kernel() is that you have to
> remember to add it to the relevant test.

It's a problem.
If anotify_mark() has FAN_MARK_FILESYSTEM in flags and
FAN_ACCESS_PERM and FAN_OPEN_EXEC in mask you
cannot know what the reason of failure was, but see suggestion below.

>
> Kind regards,
> Petr
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 37 ++++++++++++-
>  .../kernel/syscalls/fanotify/fanotify01.c     | 53 ++++---------------
>  .../kernel/syscalls/fanotify/fanotify02.c     | 22 ++------
>  .../kernel/syscalls/fanotify/fanotify03.c     | 18 +------
>  .../kernel/syscalls/fanotify/fanotify04.c     | 32 +++--------
>  .../kernel/syscalls/fanotify/fanotify05.c     |  9 +---
>  .../kernel/syscalls/fanotify/fanotify06.c     | 21 ++------
>  .../kernel/syscalls/fanotify/fanotify07.c     | 15 +-----
>  .../kernel/syscalls/fanotify/fanotify09.c     | 19 ++-----
>  .../kernel/syscalls/fanotify/fanotify10.c     | 36 ++-----------
>  .../kernel/syscalls/fanotify/fanotify11.c     |  5 +-
>  .../kernel/syscalls/fanotify/fanotify12.c     | 24 ++-------
>  .../kernel/syscalls/fanotify/fanotify13.c     | 33 ++----------
>  .../kernel/syscalls/fanotify/fanotify15.c     | 24 ++-------
>  .../kernel/syscalls/fanotify/fanotify16.c     | 20 ++-----
>  15 files changed, 90 insertions(+), 278 deletions(-)

I like that diffstat :-)

>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 0c61f8ab7..8452f983a 100644
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
> @@ -242,7 +246,6 @@ static inline void fanotify_save_fid(const char *path,
>  #define INIT_FANOTIFY_MARK_TYPE(t) \
>         { FAN_MARK_ ## t, "FAN_MARK_" #t }
>
> -
>  static inline void fanotify_access_permissions_supported_by_kernel(void)
>  {
>         int fd;
> @@ -289,4 +292,36 @@ static inline int fanotify_exec_events_supported_by_kernel(uint64_t mask,
>  #define FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(mask) \
>         fanotify_exec_events_supported_by_kernel(mask, #mask)
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
> +               if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV)
> +                       tst_brk(TCONF,
> +                               "%s:%d: FAN_REPORT_FID not supported on %s filesystem",

It would be better to check that flags actually have FAN_REPORT_FID
before emitting this error




> +                               file, lineno, tst_device->fs_type);
> +
> +               if (errno == EINVAL && (flags & FAN_MARK_FILESYSTEM) == FAN_MARK_FILESYSTEM) {
> +                               tst_brk(TCONF,
> +                                       "%s:%d: FAN_MARK_FILESYSTEM not supported by kernel?",
> +                                       file, lineno);
> +               }
> +

I find it weird to give the wrong hint, if there could be more than one
reason for EINVAL, but if you like you could give all the hints, i.e.:
  "FAN_MARK_FILESYSTEM not supported by kernel?"
and
  "permission events not supported by kernel?"
per every possible reason found in flags and mask.

You could also make the support_exec_events variable from fanotify03
global, which fanotify_exec_events_supported_by_kernel() will set
and work that knowledge into safe_fanotify_mark(). You could do
the same with fanotify_access_permissions_supported_by_kernel().

So in case test setup() does have those checks, there will be no
wrong hints in safe_fanotify_mark().

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
