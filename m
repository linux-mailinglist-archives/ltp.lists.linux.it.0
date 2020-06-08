Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B25101F1B6C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:51:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DECA3C2EAF
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 16:51:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 15F083C2E91
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:51:28 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4C765600953
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 16:51:27 +0200 (CEST)
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mqagw-1jDfGI2Op6-00makr for <ltp@lists.linux.it>; Mon, 08 Jun 2020
 16:51:26 +0200
Received: by mail-qk1-f175.google.com with SMTP id 205so17483005qkg.3
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 07:51:26 -0700 (PDT)
X-Gm-Message-State: AOAM531+atAWhLtoRJw68Hy4EFejXGwO6BTz4Zd52rw/6f81LdJDvxbO
 bq52uzaQLhAZ0afQeitSRdT1U5g+ZynGVabGJbQ=
X-Google-Smtp-Source: ABdhPJzGp9Cn2i0Jpay+66gxT6Hnhb/DOeXcCZBXUcap3Af0/Di6DIBLGZYN1W5POeJdf+XUxdPF5D0ssX/xOpgBKnw=
X-Received: by 2002:ae9:de85:: with SMTP id
 s127mr24091151qkf.352.1591627885344; 
 Mon, 08 Jun 2020 07:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
 <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
 <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
In-Reply-To: <20200608112000.sjrbvmqjciifgyub@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jun 2020 16:51:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
Message-ID: <CAK8P3a0PqtFWTZr9hvSy5Y0ZZOSNgfzw0x1DTTyuzfsfROpAvw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:yBoBMWe2+M2sJ22UgYf3HDWDE6fI4Ds1MVwIEeCkuHnQDvtsGQb
 l1w8FzrVwjLms2w2ll8Q1bwcc+H2NJv0hxqCEcqVT5QnITe9OCbVQTxfMnRYdj/9ZqtfqlD
 oMvtw9cvmDsbF2Whv1/mD3eqgXVj0c/EftPo0AhaIkV+0er58sqIjeB5qK+wovac4W87cWo
 JQ4ACDmrLCOYagUHgrA/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9xI9XdYUuWE=:A6ioKKiE89rN3VBDAmDdYX
 I6IsP8+itwqpZ/DUCjGeiwlforSyF78mHdD2oOoDgBH4IWoLFUyG2CW0SVPFU7TnGCwOTsmjj
 nBUtZOyaaipeRHyZfXEmvjyssoUUq8GUuSq879WUgvAYlOddocLZKI9woGIzltTOX6xFpVDqn
 gMgIvGXIGCm9/6QDY8AZztvZC++okjEOlVQJNq/1LDjmJISfrP6UnGGzwtgXAWJDikC5LTtZa
 UVvwQkWxbPITrQZnty1y+Ps+qKBr9t5Vdfsr72EzSfnxoMVxmjFfSkgJJRgcf36bSJz6B6Sr2
 Yj/Fp7nDUKi0uk2CAJDJ1gnS+AqOizQK+oR0tP7b+vwekkOnn4x9I3r6WUGoz2stHTvTjUPpw
 KXY7W0DwHX1WtwILB9I0PktfKVfJqAhq2f7BORcyHnDL9u+jHWhhMT2FYvKxMnrGc2+wtMhd8
 BLFfZMC4MaMq+yvWQVuDi2xmOCgP0jpPh2AiwQWkmcdyE7dtOSQUycTH82fVf0/2u2+JgatnZ
 TbK0RsdDOn2t2w5/wpLvZI8AxWCalMRrWoN4xESzwHIxKPJdc/ztvgWW6FnVFvu6QvpPMFobo
 1PW1wVJltcisE5BIYSfATBMz17TYcpInv4Y+0r/m/7qOggkiVJPTwJQqRgeLifgtKqD+riZFz
 Aiz/fULBvSn2DDevIQI98i/yXq7r73/6GjbpbCMf1Dw1M08+Fjcd2KIKy/Xu8eXCNzltMwoVd
 xpvVHglb5CjZ2Lf90MJwIKYY6vYzGj6E+XR4qBQ9gB+qFxDQhm9vJE6Emjfyod44k2NVgWQdG
 ndyf8fBWq+NTRv/EY9DYhnykdSNpZctfOV5HXvIpFOICmDw2jc=
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug
 during successive readings
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

On Mon, Jun 8, 2020 at 1:20 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 08-06-20, 12:21, Arnd Bergmann wrote:
> > So now you only call gettimeofday() once instead of in each loop, right?
> > This won't test for spurious failures any more, but I suppose it would catch
> > any case where gettimeofday() and clock_gettime() are out of sync by
> > a lot. The only case you don't catch is where clock_gettime() sometimes
> > returns a value that is slightly earlier than gettimeofday().
>
> Okay, I missed the fact that we need to call gettimeofday() for every iteration
> and here is the new diff which has tried to simplify the overall code. But this
> has a problem now as it always reports this error:
>
> clock_gettime04.c:88: FAIL: CLOCK_REALTIME: Time travelled backwards (2): -148 ns
>
> I guess the problem is that gettimeofday() gets the value in usec resolution and
> clock_gettime() gets it in nsec and so some nsec always get lost with
> gettimeofday() and so the errors ? How should we take care of this ? Take diff
> in usec instead of nsec ?

You already have a special case for gettimeofday(), so just round down
the 'start' value to the previous microsecond when you are in that
case. For all other cases, I think we want to check the exact nanoseconds,
in particular to ensure that the calculation is done the same way in the
vdso vs the kernel.

> +static void run(unsigned int i)
> +{
> +       struct tst_ts ts;
> +       long long start, end = 0, diff;
> +       struct test_variants *tv;
> +       int count = 10000;
> +       unsigned int j;
> +
> +       do {
> +               for (j = 0; j < ARRAY_SIZE(variants); j++) {
> +                       /* Refresh time in start */
> +                       start = end;
> +
> +                       tv = &variants[j];
> +                       ts.type = tv->type;
> +
> +                       /* Do gettimeofday() test only for CLOCK_REALTIME */
> +                       if (tv->gettime == my_gettimeofday && clks[i] != CLOCK_REALTIME)
> +                               continue;
> +
> +                       tv->gettime(clks[i], tst_ts_get(&ts));
> +                       end = tst_ts_to_ns(ts);
> +
> +                       /* Skip comparison on first traversal */
> +                       if (count == 10000 && !j)
> +                               continue;
> +
> +                       diff = end - start;

I think on the first iteration, 'start' is wrong here as well, and needs to
be initialized once, as you did in the earlier versions.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
