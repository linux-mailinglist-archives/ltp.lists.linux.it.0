Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B11DAEE5
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:35:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1E263C4E2B
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:35:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 861953C4DF3
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:35:42 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D08C21A017B1
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:35:41 +0200 (CEST)
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M6VRf-1jiBhF2usr-006ulI for <ltp@lists.linux.it>; Wed, 20 May 2020
 11:35:40 +0200
Received: by mail-qt1-f176.google.com with SMTP id c24so1992765qtw.7
 for <ltp@lists.linux.it>; Wed, 20 May 2020 02:35:40 -0700 (PDT)
X-Gm-Message-State: AOAM533ucdOxr7lEWqU9Z6vKZ+Ugv2TbRkpvjmdIDShZEgq+dGfcASt6
 KjT/KBw6d//lbJ78NoekWgizS2RpLVld2qevJnU=
X-Google-Smtp-Source: ABdhPJwPt0As3x9e6L4b+TkjOfwt/fSxMskYdeGobEfwsgV0ZPaYPZSd8a8hmgBxN8e7o/hMbC0OSH+LzchYaelwXOA=
X-Received: by 2002:ac8:6a09:: with SMTP id t9mr4273915qtr.7.1589967339533;
 Wed, 20 May 2020 02:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan> <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
 <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
 <20200520090530.eabgbtpxlmnwbrpm@vireshk-i7>
In-Reply-To: <20200520090530.eabgbtpxlmnwbrpm@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 11:35:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0DHENYhT3R6Xuygf2DiS8LLCCCfL025ESxqf6Rvth7ZA@mail.gmail.com>
Message-ID: <CAK8P3a0DHENYhT3R6Xuygf2DiS8LLCCCfL025ESxqf6Rvth7ZA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:aXSnmYPPhZwxsNj57p5ABoKLRI5rDBk9pGFfoYjCAMHg2+Ck6HI
 9tNXhFqtrSV0mRUiZIh6IAx+ZuWDLwerJAw/IVzhREosYEBnZvl9ytw+I5daRE+w+IY/J4i
 cyO6hJogeE2m5DOutfkszE8wRw/3HUhTlYxLaDbrLZvyqVyXFvlLzfly3JmbeP7w0kUlHTZ
 wR5aHMhY0PQZ/zBYMEBPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/1QiQPaycyI=:iQNuoPva+U/sAX1ermCZNc
 l1EayDYHmIgvr6Y8YMoJ2buL5to54+Rmlra2mv3eclHvKeXLWufNjfcU4FqytubaKyThJSlyb
 r29BVElQTEhI7ukjbD3HXfoPLfQv/bNJrXmVDannT6dnX0h2BSyvrahmhhQu5k13BwXyXgfKx
 CCTh4Rmuz41h+896u7w9o5z/GxC/QsjP7vtYfbhCZrPeP0jE/ji2OKU/9P7LUQw9v61SmEDAV
 fWneQoqM6mEyxLwIZVOSrxucKFIM1ZdA39oSVkPp2AwJMkUBqgX0/oheM//FNaB5IAdV4tANQ
 8/6GsCdQAhxwqVtru/0fPuS8YNDiEMycu3mXgmSIjuOYncX7sMqJmYmTOrnsGWSVp0g0QhOrC
 nBC2JhvnNjX3Z4KOVZqLHUOS8+3KC8BCgwPcgMJzeE7NhbbhcVka753o13vwrGN/p3iqocbTW
 0msIU4UhNogVW+XbcIE5Blro89AbCw2hzn2H3N0Y7zZBuLNHiQJtx1EFgGIsxBFqJFVRuRn2d
 Cg+sT+a/Ny+G5ObZpIFZoWH6DulfEWZgJ5/g8FOufXNsp2ralIYK0rjMLf23uRVHhGKEcPzC0
 3vy0B5eI4mj4IBI/UYwiHmH77j4EhOGpt42OLQGDoT6xIVxx1n63QMYXGBv2a2xEWUKVaJpsb
 wpA1F7e4kox6ipvh2Wq8FXgRLEr26f/z+c2qgsc7vQY/0LSemP1r4aTLcYy6Mf+JeepsBf2a2
 OIRkJ1/MHznG5R+GSIavKyDdh12KG2lUaqWxOx6d6l3SFYyw/lty9kK0OF0y13s9rmlQIGIsf
 DTIkpLLkk2R2TYEbqs1g3ins0hwOgJ/wcxMsaLS4Efr3ix+yRQ=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 20, 2020 at 11:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 20-05-20, 10:47, Arnd Bergmann wrote:
> > On Wed, May 20, 2020 at 9:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> > int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> >  {
> >        int ret;
> >
> > #ifdef(__NR_clock_gettime64)
> >         struct __kernel_timespec newts;
> >         ret = tst_syscall(__NR_clock_gettime64, clk_id, &newts);
> >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_nsec =
> > newts.tv_nsec };
> >         if (ret != -ENOSYS)
> >               return ret;
> > #endif
> >
> > #ifdef __NR_clock_gettime
> >         struct __kernel_old_timespec oldts;
> >         ret = tst_syscall(__NR_clock_gettime, clk_id, &oldts);
> >         *ts = (struct timespec) { .tv_sec = oldts.tv_sec, .tv_nsec =
> > oldts.tv_nsec };
> >         if (ret != -ENOSYS)
> >               return ret;
> > #endif
> >
> >        /* fallback for prehistoric linux */
> >         struct timeval tv;
> >         ret = gettimeofday(&tv, NULL);
> >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_usec =
> > newts.tv_nsec / 1000};
> >
> >         return ret;
> > }
>
> This is used only for the internal working of the library and so we may not need
> to support all these timespec types TBH and make it complex.

Well, the point here is that you need the function to reliably return the
current time in the right format, and I don't think a simpler implementation
would be correct. In fact, I just realized that your patch version cannot work
on riscv32 since it only has __NR_clock_gettime64 but not __NR_clock_gettime.

         Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
