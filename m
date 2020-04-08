Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE11A2AC7
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:07:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE90E3C2D16
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:07:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 23A2E3C0428
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:06:55 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F273A1A00ECE
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:06:54 +0200 (CEST)
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Md6hP-1imxI63eOh-00aFBv for <ltp@lists.linux.it>; Wed, 08 Apr 2020
 23:06:54 +0200
Received: by mail-qv1-f48.google.com with SMTP id bu9so4436586qvb.13
 for <ltp@lists.linux.it>; Wed, 08 Apr 2020 14:06:53 -0700 (PDT)
X-Gm-Message-State: AGi0PubUjet9/8rjichxcsD5guuTWikR5U7dILjL33ZMlQylkfPam9In
 hYmvEbEUD7fbBSY9CcskRBSjZFZ84n2Kt31jEm0=
X-Google-Smtp-Source: APiQypLf1SV1xh1TcVhY1P4WSSJESnYW9n2phasM2LZCdoVdRlrms7mqcDxbm+oWdpJe7aBZhD6hH7RrgjrpUcI1dGU=
X-Received: by 2002:a0c:a602:: with SMTP id s2mr9769687qva.222.1586380012702; 
 Wed, 08 Apr 2020 14:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
 <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
 <20200408065720.p2tkny6icrqa7o25@vireshk-i7>
In-Reply-To: <20200408065720.p2tkny6icrqa7o25@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Apr 2020 23:06:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a23RqzSMasitwbrmc5+HpH8zKPk-Xx5rSF75qsnDMDRCg@mail.gmail.com>
Message-ID: <CAK8P3a23RqzSMasitwbrmc5+HpH8zKPk-Xx5rSF75qsnDMDRCg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:nK56uemzpeeHn8xe8bOCDJ4KQzdgj9hQVXjmatOhzUEh4vrh2u5
 wrb4/U08aQ8D5KR932c7oz/5AvzlYKWY+YH0pfHU3h0dVWG7Wzhf4QifStPpM9sR0pn7V2V
 bxneW2SyBHnj3jJjz5st9GZPrfreadiSGK+aKNjxsge1QkZgFwvdlfNSzcvIr2IDAIZ/SYU
 TNpfK6RWyklMrDZ9myi7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ocB6EzXIhT4=:/Jm61S7Y7fFb90Pc/GwwWM
 /wvOhSZ1rnO61QX9KERtbbgukNqZYvTa09xkduObiE6Aj9E1SQMVtXGisGDNC8x2cP2iADvnd
 Dt2aD0zwsnAObCF7ihNBXAOUxOyawkOXPXaOeu3z3OwWjJpLb+ShJcbejPyTi/6ib430shynH
 DMx4f/wNKJFub9zoTQd52Wyzivj9pfG33b/sBfTFn2faZPXtnCA6KfiWVAzce1tz7l/q1eQUN
 6RPPOYtsSmPbuIHu+XZgtQ3+n8YEzNqHTJjpMC4/lR/p7Zwi3/NpeYX9kELK+1qXdtFSQYHh0
 eE8IohCTkbLDogipgwHJwiixyMFDauGWL9yGdgD++mH/qNk2w+o9DPXdWqw+1GGSjOFRY9HsE
 mqHV8Y3iK7yezGBWBiHxRCd4rHpFlWWfwWV79ycx2RLhNIa4zabU7lQ6OXu22/N1MIEsYnTaX
 ByktwL0T8srW7WBFZCaeqTaDe/IeJK5EQiZqTMbYLXK9cqmdH/JXImSXqzBd2pqTVkKmwfBgd
 ewb+zpyEQKKh8M1g65hqcaoopVeQ64CbjJxf0SRqPPnvJPz26cWdWqpUXCYrcBKVFb+VWHT4a
 s5cZ/p34FZMdP2+gzxCCrmB4tz/C06ZdV7gWdYCZW9NCW7vZ0ue7V7SvFQSb55dY5Y5WXDf47
 uJfieJpGKfb+kV4dCc+0Hc4lEha/do3BMmmdaWWjYLdpX3Bd7beXwvCkD9pwzJJfSfR/6XrNi
 Yj2aIPkv3r9OyTRrN3E3TJm1hTSQvexG8cDf6W9xK+WDV5gk+IcW2KAxAMc7X1QHnl5uwvv1h
 RxG2OP61hDkzN1093YErAxNkFMHmRW9zUjkDsrHa8dl57SmDGU=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC] syscalls/clock_gettime: Support time64 variants
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

On Wed, Apr 8, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 07-04-20, 14:36, Arnd Bergmann wrote:
> > On Tue, Apr 7, 2020 at 1:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -16,12 +16,17 @@
>  #include <time.h>
>
>  #ifndef __kernel_timespec
> +#ifdef __x86_x32__
> +typedef long long __kernel_long_t;
> +#else
>  typedef long __kernel_long_t;
> +#endif

The correct portable way to check is

#if defined(__x86_64__) && defined(__ILP32__)

> > > -static int check_spec(struct timespec *spec)
> > > +static int sys_clock_gettime64(clockid_t clk_id, void *tp)
> > >  {
> > > -       return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
> > > +       return tst_syscall(__NR_clock_gettime64, clk_id, tp);
> > >  }
> > > +#endif
> >
> > And when building against old kernel headers or on 64-bit
> > architectures, this one is not available.
>
> As Petr said, even if these get called on the architecture we don't support, we
> will get something like this in output only once for the tests..
>
> clock_gettime01.c:74: CONF: syscall(-1) __NR_clock_gettime64 not supported

Ok, if that is desired, it seems fine.

> > > +struct tmpfunc {
> > > +       int (*func)(clockid_t clk_id, void *tp);
> > > +       int (*check)(void *spec);
> > > +       void *spec;
> > > +       int spec_size;
> > > +       char *desc;
> > > +} variants[] = {
> > > +#ifdef TST_ABI32
> > > +       { .func = _clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "vDSO or syscall (32)"},
> > > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "syscall (32) with libc spec"},
> > > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &kspec32, .spec_size = sizeof(kspec32), .desc = "syscall (32) with kernel spec"},
> > > +       { .func = sys_clock_gettime64, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> > > +#else
> > > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> > > +#endif
> > > +};
> >
> > I think instead of an #if / #else, this should have separate #if statements for
> > whichever versions are available on the given combination of architecture,
> > libc and kernel header.
>
> Can you give an example on how you would write it ?

For the direct syscalls, I would just provide the "old" and the
"time64" versions,
based on the idea that any architecture that defines the syscall numbers
with the _time64 suffix has the time64 structures, and any architecture
that has the old macros uses the old structures.

You can have a shortcut to skip the time64 version on 64-bit architectures
that will never implement those.

> Also any other tests I should have included here ?

Aside from duplicating all the tests for old+time64, I would suggest explicitly
testing for correct behavior of the time64 syscalls regarding the upper half of
the tv_nsec field in syscalls passing a timespec structure:

When passing a __kernel_timespec into the kernel from a 32-bit process,
the kernel must ignore any garbage in the upper bits, so e.g.
".tv_nsec = 0x1234567800100000" must be interpreted by the 32-bit
syscall to be the same as 0x1000000, while the 64-bit syscall must
return -EINVAL since .tv_nsec is larger than 999999999.

When passing a timespec from the kernel to user space, any
garbage in the upper half of .tv_nsec must be zeroed by the kernel.
Note that 'glibc's timespec uses a 32-bit tv_nsec plus padding,
but the kernel ABI requires that padding to be cleared by the
kernel both ways.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
