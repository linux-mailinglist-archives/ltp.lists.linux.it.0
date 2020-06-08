Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7741F1698
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:21:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 993CD3C2E80
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:21:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 27A513C176C
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:21:32 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EC191600A54
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:20:51 +0200 (CEST)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N1xdf-1iyZAA0U1p-012KHU for <ltp@lists.linux.it>; Mon, 08 Jun 2020
 12:21:31 +0200
Received: by mail-qt1-f170.google.com with SMTP id c12so14136993qtq.11
 for <ltp@lists.linux.it>; Mon, 08 Jun 2020 03:21:30 -0700 (PDT)
X-Gm-Message-State: AOAM530OcPsQTKIOeeZha0TpayQoX5igz0wC1Tj6o2zx0D93mrJVfsRG
 vJG9R2Mj9cC22BaCr6ilaE6hkE+GCMAySJzzz7Q=
X-Google-Smtp-Source: ABdhPJw/9UL/zKGHMhIlnwVbQLxNImmblrXg8xDlB2AbNTb9Htt5q+DgQ8CHDP3fPh2WkksM47rAdcIkS9/nyWbFx2w=
X-Received: by 2002:ac8:4742:: with SMTP id k2mr22744310qtp.304.1591611689986; 
 Mon, 08 Jun 2020 03:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
 <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
 <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
In-Reply-To: <20200608100900.c4fi7pw7euie6tnt@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 8 Jun 2020 12:21:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
Message-ID: <CAK8P3a004cavRhyWx+uXYYteBi1LviahAv11+9JyGadN-vo8og@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:Y1abvt1B5E20lgCnrf/CVCx6aOk7+1iZTAjbJzzxQo6IA5g0yUt
 1SluJXFQMs3E1Kcsat6WbVr3/uCTPIPvMJtqgb+vh01EgeFduEb80/iNk2lEhTf4et+aexu
 MzyTKeAfHnZYseYNPbHlrkHcJvp8BW61rMHoFhpzKsjRoy64bZgQK5C/DsxHHrrDx74EdLr
 UQffUIW/w4I2avHwlU5eA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3/cX3CwTMIw=:rnRfftIPpfdhjaSjm+qjY8
 8ePVBuCxor/xqHLASY+yQwG4qWpDo7H2cyW1jPW8iLGT/qk1sOxTUDnDMLUbf6EC///Ihpc1T
 p2Hj6YpCc0u13fAiD6EGF9S68nJFfIWcEqynJS4DyqqfHJNCT8CN7S8lqt/HKjjYvBzDLGzZy
 +2kZsNqbTb7ekzx3QFLGuFaQH0mB1l/A419mHDEVW11j9MqpKD1HZnqF7JCLMjxplfO4N/1/O
 p+E9YTKyWnCxwdWtkNzMy4MCU2N+KvwQ9Dzcoa9B+d0BpbB0Nw65Mus6B/jzHXhfEeM6fUp8F
 AwhmewPL2z3uUfCAyRQwqH4unOHqWgNOwjrV9qsXxH7Eyjs19zUFJsIKVw48WtizKQMw5n45S
 lxYaaiJgADH42Fj7ji1fG36x24lYaIveKm9QSWQ2r+NoZLCMsUlktHeiVqcIAgEazhpKENHl/
 VD22U1gmZtcqvwG87QMVHe3SXRidc4CDTg/RGw7DHpEdiNZYPTbQqj+YMhUAk3AwV1gP1IqsL
 +abgx/7ByiCXCgQ6rqpnyRF13GRJxeXuE7XOsgSY73dE97JI2damsJYextJNmNjztEw+rjRpo
 8WRPe0y7FfkqNWaFN2oXDLXi28G/NUpJDj2N165wJfLokW8b96rRmZO7ft068dRRc63zygDz/
 noObiZM5Y9WtOMBSx6oaqcZ0ri2PcZorUt8xiJElWTdC/GBOC+ajJYdgwU4DOE8wnOrZwlACp
 IDQ+SzQNfQ4yVkHcmMD0qGNm+tFG+FJu/H8ELXWZipAScHzjhY2NdZqW7lSlZFGmiIRY9DIwm
 IMUZDkfIpuA8ULgG6YIiwk7cFXYoeEn/yLt5YI3/N5VWKJOVHw=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On Mon, Jun 8, 2020 at 12:09 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-06-20, 14:19, Arnd Bergmann wrote:
> > On Fri, Jun 5, 2020 at 9:48 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > > +static struct test_variants {
> > > +       int (*gettime)(clockid_t clk_id, void *ts);
> > > +       enum tst_ts_type type;
> > > +       char *desc;
> > > +} variants[] = {
> > > +       { .gettime = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
> > > +
> > > +#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
> > > +       { .gettime = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> > > +#endif
> > > +
> > > +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> > > +       { .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> > > +#endif
> > > +};
> >
> > Would it be possible to add a direct call to the two vdso
> > implementations here as well?
>
> Which two vdso calls are you talking about here ?

I mean clock_gettime() and clock_gettime() as implemented in the vdso,
see https://github.com/nlynch-mentor/vdsotest/tree/master/src for how
to call them.

>  static void run(unsigned int i)
>  {
> -       struct tst_ts ts_start, ts_end;
> +       struct tst_ts ts;
>         long long start, end, diff;
>         struct test_variants *tv;
>         int count = 10000;
>         unsigned int j;
>
> -       while (--count) {
> -               /* Store reference time in start */
> -               if (clks[i] == CLOCK_REALTIME) {
> -                       struct timeval tval;
> -
> -                       /* Compare CLOCK_REALTIME with gettimeofday() as well */
> -                       if (gettimeofday(&tval, NULL) < 0)
> -                               tst_brk(TBROK | TERRNO, "gettimeofday() failed");
> -
> -                       start = tst_timeval_to_ms(tval);
> -               } else {
> -                       tv = &variants[0];
> -                       ts_start.type = tv->type;
> -                       tv->gettime(clks[i], tst_ts_get(&ts_start));
> -                       start = tst_ts_to_ms(ts_start);
> -               }
> +       /* Store reference time in start */
> +       if (clks[i] == CLOCK_REALTIME) {
> +               struct timeval tval;
>
> +               /* Compare CLOCK_REALTIME with gettimeofday() as well */
> +               if (gettimeofday(&tval, NULL) < 0)
> +                       tst_brk(TBROK | TERRNO, "gettimeofday() failed");
> +
> +               start = tst_timeval_to_us(tval) * 1000;
> +       } else {
> +               tv = &variants[0];
> +               ts.type = tv->type;
> +               tv->gettime(clks[i], tst_ts_get(&ts));
> +               start = tst_ts_to_ns(ts);
> +       }

So now you only call gettimeofday() once instead of in each loop, right?
This won't test for spurious failures any more, but I suppose it would catch
any case where gettimeofday() and clock_gettime() are out of sync by
a lot. The only case you don't catch is where clock_gettime() sometimes
returns a value that is slightly earlier than gettimeofday().

> +       while (--count) {
>                 for (j = 0; j < ARRAY_SIZE(variants); j++) {
>                         tv = &variants[j];
> -                       ts_end.type = tv->type;
> +                       ts.type = tv->type;
>
> -                       tv->gettime(clks[i], tst_ts_get(&ts_end));
> -                       end = tst_ts_to_ms(ts_end);
> +                       tv->gettime(clks[i], tst_ts_get(&ts));
> +                       end = tst_ts_to_ns(ts);
>
>                         diff = end - start;
>                         if (diff < 0) {
> -                               tst_res(TFAIL, "%s: Time travelled backwards: %lld",
> -                                               tst_clock_name(clks[i]), diff);
> +                               tst_res(TFAIL, "%s: Time travelled backwards: %lld ns",
> +                                       tst_clock_name(clks[i]), diff);
>                                 return;
>                         }
>
> +                       diff /= 1000000;
> +

Right, this seems reasonable. I noticed that tst_ts_to_ns() might overflow
for bad timestamp values, but those would also likely cause jumps, so
you don't have to add an extra check.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
