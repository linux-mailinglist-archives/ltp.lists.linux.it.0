Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A0248212
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:41:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BF0B3C2FEA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 11:41:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CF29E3C26C8
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:41:12 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 83AD41401623
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 11:41:12 +0200 (CEST)
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7y7D-0006K5-OY
 for ltp@lists.linux.it; Tue, 18 Aug 2020 09:41:11 +0000
Received: by mail-lf1-f71.google.com with SMTP id m13so4286537lfr.18
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 02:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSyFQY2wPG6FpnsHIVkFyShigM+7kaRPujqv0DSKPAA=;
 b=fmpFxtEcdScvQ48h9i4Sl6vcJGoH6VQz+85deldYRGEsHV9NM8rden6fMoZdzxgGRd
 QZ0jcXjf7nD3wJAqCd4LbjF8jcV1gDZvgW0yWyVdNwvuKzHoo7G0SN0uwOAFj8M6M0EK
 xfOwdkA6LLbGksN/h/B/Ygg99JNccsLNn2trnerOws6JOdTfnRKnYTEKqKtrY04VWDIC
 Y2/5cfVbQn0kO6wUOF2qLwDnOFdo06vsaJ7ICSRBYk6NNRf/7DuSGAT7pvSp5uhQMQR1
 fe3dJKOVUTvpqP+Ns3e1UEQuqELGPkdAO13pjj19CeREfIhc0IJcsLQ3SjHIwJVY3MMW
 E1WA==
X-Gm-Message-State: AOAM531Em5n176d+ppNeAEWFcJE9QGu69a5ofpYDa02Ve0qXLJ2mV/4D
 MF+0XtmlGNFXRXjODQEkrXTjaKjRPIRfBdrvTbhjmNUSfzuT/w+t03GnSFif4ldmaqPHLVbVeLb
 ck9ccZNAikY+mBoU2gJeNZ+WgSqKJrfiDAGFHGbpYGt8=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr9161164ljp.145.1597743670871; 
 Tue, 18 Aug 2020 02:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6A//gmY+5zEVn2Fmoyd6+FQqZRQ2J9SztFwJSDZ19DAhyJMlb/fuiNpzzkm4DDtsWjba7MrqnJd2rwTwgDes=
X-Received: by 2002:a05:651c:543:: with SMTP id
 q3mr9161159ljp.145.1597743670613; 
 Tue, 18 Aug 2020 02:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
 <20200817120644.9401-3-po-hsu.lin@canonical.com>
 <20200817124202.GB8445@yuki.lan>
In-Reply-To: <20200817124202.GB8445@yuki.lan>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 18 Aug 2020 17:40:59 +0800
Message-ID: <CAMy_GT8Tn1t8YasYtTwhjGBSYGh1J37KSALXEJ4Pf87+Jf6-eQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/utimensat01: add exception for
 Ubuntu 4.4 kernel
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Aug 17, 2020 at 8:41 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> > ---
> >  testcases/kernel/syscalls/utimensat/utimensat01.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
> > index 7dabfed6d..469cb61c5 100644
> > --- a/testcases/kernel/syscalls/utimensat/utimensat01.c
> > +++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
> > @@ -158,6 +158,10 @@ static void tst_multi_set_time(enum tst_ts_type type, struct mytime *mytime)
> >
> >  static void update_error(struct test_case *tc)
> >  {
> > +     static struct tst_kern_exv kvers[] = {
> > +             { "UBUNTU", "4.4.0-48.69" },
> > +     };
> > +
> >       if (tc->exp_err != -1)
> >               return;
> >
> > @@ -167,9 +171,12 @@ static void update_error(struct test_case *tc)
> >        * This patch has also been merged to stable 4.4 with
> >        * b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
> >        */
> > -     if (tst_kvercmp(4, 4, 27) < 0)
> > +     if (tst_kvercmp(4, 4, 27) < 0) {
> >               tc->exp_err = EACCES;
> > -     else
> > +             // Special case for Ubuntu kernel, which got this patch since 4.4.0-48.69
> > +             if (tst_kvercmp2(4, 4, 0, kvers))
> > +                     tc->exp_err = EPERM;
> > +     } else
> >               tc->exp_err = EPERM;
>
> This whole thing looks broken, this is not how the tst_kvercmp2() is
> supposed to work. The generic kernel version is supposed to be passed in
> the first parameters and the kvers overrides that option.
>
> So this should be something like:
>
>         if (tst_kvercmp2(4, 4, 27, kvers) < 0)
>                 tc->exp_err = EACCESS;
>         else
>                 tc->exp_err = EPERM;
>
>
> And in a case that the distro matches to UBUNTU the kernel version is
> compared against the "4.4.0-48.69" instead of the generic one.
>
Ah!
I think I can update the doc/test-writing-guidelines.txt with this later.

I will send V2 for this patch.
Thanks for your detailed explanation.

> >  }
> >
> > --
> > 2.17.1
> >
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
