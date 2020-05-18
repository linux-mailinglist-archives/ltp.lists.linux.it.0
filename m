Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02F1D73D4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:21:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99AC43C4F0B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 11:21:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EE0C83C0331
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:21:28 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4290E20016E
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:21:28 +0200 (CEST)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3sRi-1isiWN2cUK-00zqNu for <ltp@lists.linux.it>; Mon, 18 May 2020
 11:21:27 +0200
Received: by mail-qt1-f177.google.com with SMTP id x12so7458843qts.9
 for <ltp@lists.linux.it>; Mon, 18 May 2020 02:21:27 -0700 (PDT)
X-Gm-Message-State: AOAM530+96Ak24HgxN1EKS9XttfqEbRf02iz5vStKh8fSNrZ98Oz/CQS
 EcMWn5i9LhJpJfBZ62AyV39Tya3YmmLPxKhrP+E=
X-Google-Smtp-Source: ABdhPJxwPnNt6/z2v5xiXoMbTWE3vuFgaalAGvI8AXDlFiwfWZUe6BkjsoY07brH43hnQmseQcQDZ3JTSwylvvDhyNY=
X-Received: by 2002:ac8:691:: with SMTP id f17mr3794018qth.204.1589793686530; 
 Mon, 18 May 2020 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589789487.git.viresh.kumar@linaro.org>
 <CAK8P3a3aP5S_w_FFv=UvJRSRTjcoNVy_W6ycm4OTct-7Q_5_xg@mail.gmail.com>
 <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
In-Reply-To: <20200518091253.qmvqo7xub7hpeovm@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 May 2020 11:21:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
Message-ID: <CAK8P3a3_dGzoGPckBByySvLYGC3FyiCSwCdfzxG8xjJsY0oXrg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:AoizYg6yGxgGBJRrgF+GfSm01mtkF8CxFJKQ2nn8oKTYu3Oj2p+
 0MFFzVe1Z50TJYUNkceB4BNElq8V0C8LZu+6GO1VtIEXPuofmU9dBmXtQP6T4eBf1Fgr0xL
 KNxzozx3gp4Iyb8ud5PaQ1ydkuzYBPucW677fmwecMUyC0AA4qK832QfExzFZuejGWP8Aw2
 7EJw9WyZdK2HZ0jMQWiHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZQT0LA2M1/U=:vwFcbBeQNgHBKPzFLhE4gP
 WEG/vgTgdnJrS79Fn4lbFEBmauY5pGceIGrt7xugpTjt1s7/itAMQzWcwCPKT7c0KCVj8UrCE
 YP8SPKt0rxlKJI60I9P6EqHhaDLe7p21SDkEmHZxbwQr512ph+9RYjsXL6wHxdGoyEkgHRvFB
 njUTsjgkS5+Q0xRLjdh92UcqcWgsO7CAOMjuED56XtWg3DrtbhrmDu1RhpsZKqPLy/JayHg0V
 /r9giEo9bk+OaDnbqt5NeeKeHTdA/Sv5BkbDRRid9eojAchOzvqzsDxob9Z6LFV6EU1e0hU7s
 1V8ZwezXE9vZOwU2Z62pjwwfU7evmXUDWvMGqRbw2RTOFNQGt48LQ5c8vuxxu7T0L5AwarzAC
 h8S0JygYiMQKuK2AamUgU1Atc862pUs3+ysQY4nEgnfzeCORwF92EMrTVdtuQwdSPN+9dv67B
 zJhfKK4la5y77psg9inJ3YA+V4Pzok34sz63dbEJBcCZXmgFJWvAE5EEFMWtrzheACf7LOQl4
 agvX3TocoIaC80KNes/jI+ZyFrL7nanGzscrdoxHWocjlumiQCYol8uv+89L9/M5UasHafyI+
 smlHvkyS1nllrihiltyx1coEoTMb31oImckV4R8MDo6DcU2iNMEd/VyoGt+P17Mm1u6zNU6dF
 /ZKg3RDy/Evc3BLnK5FON4ZSzIo0+2MrTCJC8yrLxFQrx5bzM9v1v9i05MBX1SnYaQBo/Tica
 9G6VY+QbUhxazHUQffNrdAU3pCwKraoD+mYZEZus51VBIoPuL9z4jrTc3FJo0+XZtQPdE38CG
 kZnHhM6ZSn72wc1s/ucDWyUbPmiqRBoPJPZSa6rBa0K1Ebp09+msRX6TMcMA2y8lCOPLZytJ5
 IEIXhWnXl/ruzku8VUfobAq/enziDO6ih/JcDGqiknqpd5aT3oMwv0ITer66NL0qnaxpVNjNm
 sWjukinfYlg==
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On Mon, May 18, 2020 at 11:12 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 18-05-20, 11:02, Arnd Bergmann wrote:
> > These all look good to me.
> >
> > I cross-referenced it with my list of syscall changes, and found that this
> > set of patches does not contain
> > clock_{gettime,settime,adjtime,getres,nanosleep},
>
> These are already already merged.
>
> > waitid, statx and msgctl/semctl/shmctl
>
> Hmm, I didn't see them in the list of time64 calls somehow. Nor is
> there a _time64 syscall number available for them. What did I miss ?
> Or the original syscalls only support the 64bit timespec and there is
> no separate time64 variant ?

I was mistaken about waitid, we never added a time64 syscall
for that since the arguments do not overflow and it takes a
timeval rather than a timespec. In this case you just have to make
sure to pass the correct rusage structure based on __kernel_old_timeval
instead of the glibc timeval.

For msgctl/semctl/shmctl, the existing syscalls were extended in a
compatible way, using an extended 'high' field for each 32-bit
seconds value. I later learned that on some architectures, the
'compat' version of that failed to zero-initialize those fields, so I
guess all we need is a test that ensures this was fixed correctly,
by initializing the '*_high' to something nonzero before calling
the syscall, and checking that it gets zero-filled by the syscall.

Ideally one would also check that they contain the correct values
after y2038 (same as we'd like for sys_clock_gettime and the
syscall wrappers based on that), but I don't know if that can
easily be done in ltp now because setting the system time may
have undesired side-effects.

> > There is also a list of syscalls that may need to get updates to their tests
> > because passing a timeval/timespec into them is now broken and they need
> > to receive the __kernel_old_* variants:
>
> Ahh, if I understand correct you are only talking about the cases
> where the syscall is called directly without the libc wrapper, right ?
> We can't use timeval/timespec there anymore.

Exactly. There are probably also ioctls with the same problem, but
I don't know which ioctl commands are actually tested by ltp.

I would guess that the socket timestamps (both ioctl and
setsockopt based ones) do have some tests that need to be
updated.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
