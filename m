Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953C1D967B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:41:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9D283C4E66
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:41:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D165A3C1F2A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:41:48 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2BB381A0111C
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:41:48 +0200 (CEST)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N5FQJ-1itg5e1Lhl-0119BX for <ltp@lists.linux.it>; Tue, 19 May 2020
 14:41:47 +0200
Received: by mail-qt1-f174.google.com with SMTP id m44so10915735qtm.8
 for <ltp@lists.linux.it>; Tue, 19 May 2020 05:41:47 -0700 (PDT)
X-Gm-Message-State: AOAM531FdCBRGXhrl5pgAJmSoQ4V95k5L1XOWFZnn3rUmOHlaCZ39jtX
 0ofI34uzBVYN0RfDWKsVgwILy0TTAPvi0KObTnQ=
X-Google-Smtp-Source: ABdhPJw1rJEVKlzZJWPWqEAxto/y3Ezx4STDt3SnIDetfnBRzcY7Jy9s80Wh2WkofTb7yVSFcsmKrkPs0oVLOPSU688=
X-Received: by 2002:ac8:691:: with SMTP id f17mr10164429qth.204.1589892106023; 
 Tue, 19 May 2020 05:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <20200519122347.GC16008@yuki.lan>
In-Reply-To: <20200519122347.GC16008@yuki.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 14:41:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
Message-ID: <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Provags-ID: V03:K1:rdS1itSn5v+itaG06EfDu2qbFUl+K1pJebXLxjq13eNxCCwCYJR
 mg1UAPoM8jetU1rdn6LmGKJpTTgqZrTv4OJ1wS5PLE4s8hBlziEE7/0XYcPDMus/7oQ6aJG
 jjZqxt3vZMRe2HsNyJaO18QIFGgEnbU/9FHXenFu8p5d4dfu9tzXGae/TASglg6uYGolagk
 yVpgk9iqmXStlcep9Scog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:me2J4B8Uqho=:hwkzq8j8i4Xu5L3u7+M7oQ
 S3CO9WaYuWrW7Ik1msiWC2tjUlxDggBHw4mu/016di00l2MU0pUh4OveyarFp3pZLzNONkyWU
 gnkiV760B9QMbJLvCu8OolGWEwHvzXDpbGIcCytHBYgvJkqIu8Hlt6RYwUx4tynEE03MO65e2
 mFg1uhfM9tJPZRmp85tjaEVLPnKOr5kZkI462YC8fx6C5L3J9nlKjA7CR5YZdGM5lHHM3wY2W
 iDj5d4dUU6eliMH/WwThK5CbyAwsyyD5u8gj4eLKjoP4UvUx8P3G8fvYWjmRoq22+ybJ2OHyG
 IWLLDQSk0ECXvEmYzyQ0aYgGn4VruftAhvMSl4ANzrudOATvAm7P4c9C4R/uUbb0Mu2r0ksTw
 hNOExNTz8a+/LW/FQqMh/EjZZOK+2D7ohCX5mXgLeTL0QSHyrI1TiF8Lj6O1wwl2ofxdbnzoi
 UIMq9+07BF0r7DAJ6WqtsBOj4p4RqKpCs5mrwQO0IL2sLawEGZRgAB2LpB/e1Xj/JCrUorjbb
 6f4D1cdptRgNM9FwGQKpofEpNU2gwWgUhydeiNsun080808wLA7QMUfrQBMc5yqvJo7TreJcX
 MCt+b+e2RWGK1hFrSOZ7mVCV4jjMLLNuaULlZEMRR2Zq9mqUDOHMasmEowNVWKJsOt7+DzGpO
 yXrbYvCFxQlGaGkyjIoQJb9OIAmX+CD8/egt5FrggkUMFe12QJkhnvau1iYAi0odHQWegobZF
 YPq2Z5bdq4Emr4LpgdPQDs9V7F4fnXv75iqk3CvsqO5zH9MfF0JIeX0Ii5wV4Tj4ZbDmzBWuS
 y6pLLjfX3s7T7mihA9r62jVM10QEgvE3rPjhDYAj96fqpVeECQ=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 19, 2020 at 2:23 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> > These syscall are old enough and must have support in libc for everyone.
> > Don't use tst_syscall() for them unnecessarily.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  lib/parse_opts.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/lib/parse_opts.c b/lib/parse_opts.c
> > index a9d50589a3f9..b3ab69c0a539 100644
> > --- a/lib/parse_opts.c
> > +++ b/lib/parse_opts.c
> > @@ -45,7 +45,6 @@
> >  #include "test.h"
> >  #include "ltp_priv.h"
> >  #include "usctest.h"
> > -#include "tst_clocks.h"
> >
> >  #ifndef UNIT_TEST
> >  #define UNIT_TEST    0
> > @@ -472,7 +471,7 @@ static uint64_t get_current_time(void)
> >  {
> >       struct timespec ts;
> >
> > -     tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> > +     clock_gettime(CLOCK_MONOTONIC, &ts);
>
> I guess that this will reintroduce LTP compilation failures on older
> glibc, which was the primary reason we used the tst_clock_gettime()
> instead of clock_gettime().

I see that clock_gettime was first added in glibc-2.1.3 back in 1999.
Can that actually run LTP any more? If it can and this is considered
important, I fear the tst_clock_gettime() call needs to be extended
to call the clock_gettime()/clock_gettime64()/gettimeofday() syscalls,
whichever is the first to work, and convert the formats from the
native kernel format to the glibc format.

         Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
