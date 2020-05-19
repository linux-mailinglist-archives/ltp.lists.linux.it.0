Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC21D9307
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:14:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F8A03C4E92
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 11:14:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F39743C04F0
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:14:22 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B467B600C96
 for <ltp@lists.linux.it>; Tue, 19 May 2020 11:13:58 +0200 (CEST)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKbXu-1jMkpF2FLA-00L1zC for <ltp@lists.linux.it>; Tue, 19 May 2020
 11:14:21 +0200
Received: by mail-qk1-f170.google.com with SMTP id g185so13966293qke.7
 for <ltp@lists.linux.it>; Tue, 19 May 2020 02:14:21 -0700 (PDT)
X-Gm-Message-State: AOAM531XI5+DhYcInY4rYWzM2jOnEaPQXS02W29V2IKD3+56ES8Ff+m9
 euJp3Jd4pdD1lXcmhe5OtmlLfctF6TqfsRd0afk=
X-Google-Smtp-Source: ABdhPJySJ5+hCWXUe6jp93fWmtou3VUramhTCJ/E3+zwepKQ2S/4Rp2a10gC2BWF9BIgc9nCEsF1c9eJ5l6abRTup7s=
X-Received: by 2002:ae9:ed95:: with SMTP id
 c143mr19915846qkg.394.1589879660393; 
 Tue, 19 May 2020 02:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
 <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
 <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
 <20200519085425.vajbfnt7uj7yjq5k@vireshk-i7>
In-Reply-To: <20200519085425.vajbfnt7uj7yjq5k@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 May 2020 11:14:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=VY7fw3NZuo_koRKDiOe1wsUpqBmhy6oJqLvOhtbBEA@mail.gmail.com>
Message-ID: <CAK8P3a1=VY7fw3NZuo_koRKDiOe1wsUpqBmhy6oJqLvOhtbBEA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:I/OI4DJVogwQc+gRo/bBys8zJY24ymc+JpbYgCy4OcULZPCZAq5
 BZvq2IvJXh0ECWqvolkyMIoLJUg4BZMm9v0n1RtDZddt1t447E8ipbUZg9p1aide7sBMHbL
 PcMfuEJVcrgVXsOswd8KoOAkAEsNEca20ohZUDYKkwGrVldY/2IRQooBmRRV8pcLNA133PN
 ekWzAfwW+uSjqR48XuXPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/yrITld9COI=:dD0cSXLSw/wYgKp/tUg2Ri
 z/j8jAKUW/n6PIzrm/PkCwYa49uaIWo8Fp0GL8L2NFzjQwr6JNnhxke9i5ZeSW0ocAo/iOXmZ
 SUQoGUGhyCL7sQieNe9JWnuwDTA4c/FWtrEEI39wTB4Bo3a+OXEuFfHBbAUBM6T8zKLjaFmMn
 skEg4UAHWfXvj4Wdev3ktepjx1hxDr+9WYR43r+K8bQrcTyKQiy1X5crgsBGK71yKVi1slTp3
 awQhVUBKTgnpjYzif7QukGHUKUbVjOv/6gSkH+9rYl6QOfC1D4GvAs6v92dBeKef7Tl3zICLr
 aFCQ4V2R62gINeumH6Br9Ow3NynEPXAb9MyamhpP35Ps0gsBT7YkeC5+xV6uKF1YOgvNhRXsp
 KWXDrCVHH8ckE5hys++K1lhCeCMWIrSu2wLlBZF/0syAcXDwQsNKgZzcg/kJVyFwqd3B+Pa4Z
 g4D076rRGyGELoarwrooILBwd8Rao1BPR3LX7AgXD2Fva3dbTkDY7pXZjz7MPTzN0bSz9f7Ko
 L4+ciSYWbeDSYysZISjHLPbg5YmvJ9cdb2udiNar9ID302lDnTd02Kwbbg74pcmBQotC/vgyM
 MwMs9WxlgcUArcYrb9i0jDhdX92QXvdpX2aaHBF1YVolrrk7a65K8wGBMnqW1e5VjQsP8wBnO
 tp+1kQxz2LzWHC27rOr2s3R44xODt7SZ1+H/ZWpC9qmsqPjj5K9mzxHLvEvbxHZnDVhlvKXZH
 4NpBwLS+c7GHr8v8HwHy2YXckSTHvcOM7ks+fmRRdqvEfIQrV47Levx6JuogzUb/ovOHmHave
 vZw3ZzUHobfj5tOCWiIEDoE/Vy8RgX4mrpgeMzJA2ec1n/yvyg=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 00/17] Syscalls: Add support for time64 variants
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

On Tue, May 19, 2020 at 10:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-05-20, 11:21, Arnd Bergmann wrote:
> > On Mon, May 18, 2020 at 11:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > Ahh, if I understand correct you are only talking about the cases
> > > where the syscall is called directly without the libc wrapper, right ?
> > > We can't use timeval/timespec there anymore.
> >
> > Exactly.
>
> There weren't a lot of offenders I believe. I have fixed them and sent a
> patchset for that.
>
> > There are probably also ioctls with the same problem, but
> > I don't know which ioctl commands are actually tested by ltp.
> >
> > I would guess that the socket timestamps (both ioctl and
> > setsockopt based ones) do have some tests that need to be
> > updated.
>
> I tried to do some search based on:
>
> git grep "ioctl" `git grep -l tst_syscall`
> git grep "setsockopt" `git grep -l tst_syscall`
>
> but found nothing :(
>
> Do I need to look for something else ?

I just tried looking for socket timestamps using

git grep 'SO_TIMESTAMP\|SIOCGSTAMP\|SO_.*TIMEO'

but that also did not find any tests. I guess those interfaces are
currently not tested as part of LTP at all. Testing for setsockopt
only covers a very small subset of the system call.

Same for the SNDDRV_, PPP, PP?ETTIME, ioctls, which are
somewhat device specific. It might be good to test the snddrv
interfaces, but they probably have a separate testsuite somewhere
outside of LTP already.

I did find something for v4l2 (VIDIOC_QUERYBUF, VIDIOC_QBUF,
VIDIOC_DQBUF, VIDIOC_DQEVENT), but haven't looked at
what the tests do.

I also see tests for input_event in testcases/kernel/input/. These
seem fine as they include the kernel header for 'struct input_event',
which is the correct approach.

One other interface affected by the time64 changes is elf_prstatus
for core dumps. This is not a system call though, and it does
not have a test case either.

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
