Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D29589E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 09:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BF123C1D39
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 09:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 83D483C13D8
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 09:38:42 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E3EBC1400188
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 09:38:41 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id x3so3364877lfc.0
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rhku+I6RtWOPi4LZHJ+7R8XrPOFnuDl8FYRJJR1vhog=;
 b=B1g5lmnGP2mL8zSkYhvP4L53FxYs+vzYUkLNw/7dxlqBe/B/1FlJbK5UfInTMYh3SW
 VaYDwjpJ/nkTgWHQ9T7UO6LIjwhPLRUhiaqeQ/VtLmrOKFAZHcdQAgk7dQ8RtC9VptBY
 e3p11ur/NW+DCJ8HJ9v++ftdKps9OORtK1UXp5p1YLYfTLxvCt8poQSHNpa5O7ktDqJg
 QFA9IooqKWHsIgo+K4vlAx35Eh7VFYFSX+K5+LQ+E7Va5Xw8G7fRpQ2/nvDAdbgvfJlv
 XRqNBhcPrjp5XNYm7E5i93NvTrSSoOk+uGkwYWxs5tAM0DDusCFBa7RgyuT6kp+FRmvl
 ov6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rhku+I6RtWOPi4LZHJ+7R8XrPOFnuDl8FYRJJR1vhog=;
 b=fe0bHwH8rjPaIhRINzWH8fMP4gXU6pIVQZRh1plo2Vn2OC6PhLc2l8nobm2XpaFjb2
 qDlREGZ+8Jw4+NXjn9Juuzc08Y8NWKsl0inQRJWL2kVLKMuI6JPuPPiJhCQvt8/Phn87
 vwGuk/ezJPLhgQ4beP+2CftDEMiaNaleX5EIKoUcxwGZijxhZvU9jFJMR2qWg1O3t0t9
 bAKKaedr9OYdvOmVxJxxtX3SRyDNoHSeJs21N9ItBURZJmfIUGoGtWMV9GFCpBu/TvIz
 FJmCHZPn449dT/XhtzSNQOFmNu+VUpG1+YAoUsizIHHAd2P25Dy5ucVgMJdXYoRZT0dN
 HHpQ==
X-Gm-Message-State: APjAAAWm9wJCKLbPQ0bg0SKROYIB4exsZJssq/OL7eh3Ov6LsR4lG28O
 EOoDhZfOarEFeMmAtpBNeZ/Snp3uLrtEMDKUfZ8=
X-Google-Smtp-Source: APXvYqxEV0EVGuPpbmnwXsLbQAZWT30dqcDnDjBKOJOCpOAFdoROPJ5UNsz+jnModpuUIVKLCmaPwPlkEM178HMRLTY=
X-Received: by 2002:ac2:46f8:: with SMTP id q24mr14774574lfo.89.1566286721318; 
 Tue, 20 Aug 2019 00:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190819133618.7538-1-rpalethorpe@suse.com>
In-Reply-To: <20190819133618.7538-1-rpalethorpe@suse.com>
From: Li Wang <wangli.ahau@gmail.com>
Date: Tue, 20 Aug 2019 15:38:30 +0800
Message-ID: <CAE1O6mj=XSBmjV2rfu7o0rcRi0ZNcfQehJsrjxRJy5um=uyWeA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_res: Print errno number in addition to error
 name
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

I think this patch makes sense. Only have tiny comments in below.

  Acked-by: Li Wang <liwang@redhat.com>

On Mon, 19 Aug 2019 at 21:36, Richard Palethorpe <rpalethorpe@suse.com> wrote:
>
> Occasionally new error numbers are added to the kernel (maybe by
> accident). Currently if we do not know the name of them then we just print
> ???.
>
> This commit simply always prints the error number to aid with debugging.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>
> It appears we are atleast missing ENOTSUPP (524) which is probably returned by
> create_timer for some alarm clocks on none x86 arches. This isn't entirely
> clear, but what is clear is that it would help to know what the error number
> is without using strace.
>
>  lib/tst_test.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 245e287fa..46481ca3f 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -177,7 +177,7 @@ static void print_result(const char *file, const int lineno, int ttype,
>  {
>         char buf[1024];
>         char *str = buf;
> -       int ret, size = sizeof(buf), ssize;
> +       int ret, size = sizeof(buf), ssize, int_errno;
>         const char *str_errno = NULL;
>         const char *res;
>
> @@ -205,15 +205,19 @@ static void print_result(const char *file, const int lineno, int ttype,
>                 abort();
>         }
>
> -       if (ttype & TERRNO)
> +       if (ttype & TERRNO) {
>                 str_errno = tst_strerrno(errno);
> +               int_errno = errno;

Can we just reverse the order of these two statements for better typesetting?

> +       }
>
> -       if (ttype & TTERRNO)
> +       if (ttype & TTERRNO) {
>                 str_errno = tst_strerrno(TST_ERR);
> +               int_errno = TST_ERR;

And this two.

> +       }
>
>         if (ttype & TRERRNO) {
> -               ret = TST_RET < 0 ? -(int)TST_RET : (int)TST_RET;
> -               str_errno = tst_strerrno(ret);
> +               int_errno = TST_RET < 0 ? -(int)TST_RET : (int)TST_RET;
> +               str_errno = tst_strerrno(int_errno);
>         }
>
>         ret = snprintf(str, size, "%s:%i: ", file, lineno);
> @@ -237,7 +241,7 @@ static void print_result(const char *file, const int lineno, int ttype,
>                                 "Next message is too long and truncated:");
>         } else if (str_errno) {
>                 ssize = size - 2;
> -               ret = snprintf(str, size, ": %s", str_errno);
> +               ret = snprintf(str, size, ": %s (%d)", str_errno, int_errno);
>                 str += MIN(ret, ssize);
>                 size -= MIN(ret, ssize);
>                 if (ret >= ssize)
> --
> 2.22.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp



-- 
Regards,
Li Wang
Email: wangli.ahau@gmail.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
