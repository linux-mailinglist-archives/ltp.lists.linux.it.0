Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD192C67BF
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 15:22:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 000663C5DDE
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 15:22:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9A7863C4E16
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 15:22:46 +0100 (CET)
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 29ED4601703
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 15:22:46 +0100 (CET)
Received: by mail-io1-xd43.google.com with SMTP id o8so4984587ioh.0
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 06:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YcPWjBtjo8xI3sTVI2nIXaKUP4qtin40Q48cktPCdZI=;
 b=fAmW9ogmm1WwRIT7uDjBZrcwWslyMtBFOvSeRKR3oqp0PQgzRefSibMY8NuhjAh9rO
 wduK3zD9jgnI/tp6RtOaW5EhiB4fy55gejR1zKG8gsEEBeLvgwha4mzVvvFjQdMdSzYM
 HVrPajPCiqZJbuABhWxQ6uQY2dCr63IIYjKkvSPs6AEdwXU+7ZSfy4HTKafmLa0APoSf
 zaeK0+NZxgs5Cbm2+lK76ObwKtRUOYSjYTFwFw2B8UzhEBRqp8yND9QFQ0wYFAO7uinW
 vl3ALednWHJEJdqVtP+deXx+Ns+cy8/z2o0qwo33M486BcCqeh3nNAmXNCQB5tqiqlrn
 fzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YcPWjBtjo8xI3sTVI2nIXaKUP4qtin40Q48cktPCdZI=;
 b=GPvqIL69gDY/XtaCHKB10RWG6QJX+oxp6rkBvQpJ++hQiUKBwRTvRVXKMG5bdYOLII
 Hw6msi45wXDHNYFkTnEMyJLLME+iTUV+r63bQay89SXrQdGkgl2W20dXf5IK75vIZ/iL
 XZ9fjSa9ejebc/SB+9tvdXoe9Mx1Td/LvQU2qJDeTyhBfPk7yYllUfeqkhQOUzMcarTg
 LkRZl1AFD64pzlliqb8Dca5pk5LPBCDTiQO7YWqlPa91zToH9sjcLNw6HZ4UoIBVYl+J
 h8mzTdA3X3LgOdYm744GjgbBz3eLR7PhApJY5NCj1qWBsBQuK6NKDPxg/bNPuPeBIXSz
 MGfg==
X-Gm-Message-State: AOAM530gGhv8guwn2UFRdGqgu3/W45A2CotyyH5xU45aVACv7FmVHRs8
 Jhmx7ZobcBpWZxLJhD29bHr9VYDVw64sbWCsI4QtMDRvVgU=
X-Google-Smtp-Source: ABdhPJxKZX2k1D2W1jg5O2Rz0INWmv8cYU4TE/oN/pD6QOTeQffOZeo/go5JPidcpyuWuPSOo0eeA6nRhE+CDvXxMqc=
X-Received: by 2002:a5d:964a:: with SMTP id d10mr6337992ios.5.1606486964878;
 Fri, 27 Nov 2020 06:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20201126214121.6836-1-pvorel@suse.cz>
 <20201126214121.6836-6-pvorel@suse.cz>
In-Reply-To: <20201126214121.6836-6-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2020 16:22:33 +0200
Message-ID: <CAOQ4uxjKjDxUgJQFYn8QcHATziLHDpQxkn7FtExuW1DeyBC9+g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 5/6] fanotify: Check FAN_REPORT_{FID,
 NAME} support
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
> in safe_fanotify_init()
>
> That require to move the definition after flags.
>
> Also use tst_res_()/tst_brk_() instead of tst_res()/tst_brk() in
> safe_fanotify_init() (synchronize with safe_fanotify_mark()).
>
> Make use of this simplification in fanotify15.c.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v3->v4:
> * use tst_res_() and tst_brk_() for safe_*() functions
>
>  testcases/kernel/syscalls/fanotify/fanotify.h | 64 +++++++++++--------
>  .../kernel/syscalls/fanotify/fanotify01.c     | 13 +---
>  .../kernel/syscalls/fanotify/fanotify13.c     | 12 +---
>  .../kernel/syscalls/fanotify/fanotify15.c     |  9 +--
>  4 files changed, 41 insertions(+), 57 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 2a5280636..4b725f334 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -38,32 +38,6 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
>
>  #endif /* HAVE_SYS_FANOTIFY_H */
>
> -int safe_fanotify_init(const char *file, const int lineno,
> -       unsigned int flags, unsigned int event_f_flags)
> -{
> -       int rval;
> -
> -#ifdef HAVE_SYS_FANOTIFY_H
> -       rval = fanotify_init(flags, event_f_flags);
> -
> -       if (rval == -1) {
> -               if (errno == ENOSYS) {
> -                       tst_brk(TCONF,
> -                               "fanotify is not configured in this kernel.");
> -               }
> -               tst_brk(TBROK | TERRNO,
> -                       "%s:%d: fanotify_init() failed", file, lineno);
> -       }
> -#else
> -       tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
> -#endif /* HAVE_SYS_FANOTIFY_H */
> -
> -       return rval;
> -}
> -
> -#define SAFE_FANOTIFY_INIT(fan, mode)  \
> -       safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
> -
>  #ifndef FAN_REPORT_TID
>  #define FAN_REPORT_TID         0x00000100
>  #endif
> @@ -190,6 +164,44 @@ struct fanotify_event_info_fid {
>  #define MAX_HANDLE_SZ          128
>  #endif
>
> +int safe_fanotify_init(const char *file, const int lineno,
> +       unsigned int flags, unsigned int event_f_flags)
> +{
> +       int rval;
> +
> +#ifdef HAVE_SYS_FANOTIFY_H
> +       rval = fanotify_init(flags, event_f_flags);
> +
> +       if (rval == -1) {
> +               if (errno == ENOSYS) {
> +                       tst_brk_(file, lineno, TCONF,
> +                                "fanotify not configured in kernel");
> +               }
> +
> +               if (errno == EINVAL) {
> +                       if (flags & FAN_REPORT_FID) {
> +                               tst_brk_(file, lineno, TCONF,
> +                                        "FAN_REPORT_FID not supported in kernel?");
> +                       }

Unless I am missing something, this would make
fanotify_fan_report_fid_supported_on_fs()
break on old kernel in the start of fanotify01. That was not the intention...

The FAN_REPORT_FID test case in fanotify01 should be skipped if either
kernel has no support for FAN_REPORT_FID (checked on fanotify_init) or
filesystem has no support for  FAN_REPORT_FID (checked on fanotify_mark).

I guess you can leave SAFE_FANOTIFY_INIT as is and change the helper
fanotify_fan_report_fid_supported() to return a different value for
unsupported by kernel
and unsupported by fs and then pass that value of
fan_report_fid_unsupported to another
helper to decide if test case should be skipped and print the proper
TCONF message.

> +
> +                       if (flags & FAN_REPORT_NAME) {
> +                               tst_brk_(file, lineno, TCONF,
> +                                        "FAN_REPORT_NAME not supported in kernel?");
> +                       }

This check should be before the check for FAN_REPORT_FID, because
a kernel that does not support FAN_REPORT_FID also does not support
FAN_REPORT_NAME, but not the other way around.

I think that also solves the problem you mentioned in the cover letter
about fanotify16, but if not you can leave that problem to me.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
