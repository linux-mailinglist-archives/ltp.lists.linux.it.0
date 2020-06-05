Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798B1EF728
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 14:20:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A30713C2F64
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 14:20:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 76F833C201F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 14:20:15 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A676C141CE6A
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 14:20:14 +0200 (CEST)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mgek6-1j2bJJ38dY-00h8QE for <ltp@lists.linux.it>; Fri, 05 Jun 2020
 14:20:13 +0200
Received: by mail-qv1-f51.google.com with SMTP id e20so4567643qvu.0
 for <ltp@lists.linux.it>; Fri, 05 Jun 2020 05:20:13 -0700 (PDT)
X-Gm-Message-State: AOAM532zcMTQZSktldlQCc+170/n1xaCxDkayrfQRpYwQNTInqOWhE0g
 1Fth/1dKp8hMSDQaHEmbNYMsIP7dVNhN2s44Res=
X-Google-Smtp-Source: ABdhPJwZtq6fGxeC9ph1McSAcOQKEvBK6MrAejzEVWn0TsioYGqEgIPj7s0X0ugAnEmJ+hs4u+BTe6tQB0U0Aq3ZrnI=
X-Received: by 2002:ad4:4b33:: with SMTP id s19mr8664475qvw.211.1591359612597; 
 Fri, 05 Jun 2020 05:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
In-Reply-To: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 5 Jun 2020 14:19:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
Message-ID: <CAK8P3a0b2BbZq_yYBKJHUfZgzCYUtdidpzJEj-HzuBKf1Q_nnQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:9MK3KfMkiLEzbWLv6NNh07nMI8UbQRQOUGB3mdgR52Tf3TP9viy
 JPGiI6s7LgLZIpDYOyOVfHViOlUKm6tIzQuFFVqTYC0/uNY16yLaBQHA7iQpyHPVPKuPc/2
 DBjghgPLPwhfSmZKeIOrYGJ5n+Q7Z3gyzqCUsl8cp7ftq7M/5erYLteN7RO+wboH4+E71Q5
 2wZLV9ItqP3quqrvazgWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q+sjsIdi7hA=:kPbzcgVkiAHt48MolftD6Q
 xSJF3k+EhXi6At0ba0faWp59KjGwXkQUKOTgTLqvMPBcUK0ys1dcMRkNzxO/GYa1zYg2FU820
 4IlgZhrPN9T/lfaFjIMGWp0MmyIzrknF+F/rdoH6IH9BahxoKlNQ/iinprcG2sp12Y9QYmWdv
 vnlFIYbqB8IpDr7emSbog0cJqlD+u3XvuPWJpSf4/FxfVG28fOX4kjINX6NVhAND2wec0ABzJ
 m9UQYEw6Yc+/xiLVaufhfYknjz5H/ZMibwr8/HtWYWPZ8BrVWVc4UtiIXJt/NqeblmgV+n7GQ
 nTTxWv6Fl7YHQSdWhqiz93LoAoz5byUiK9XIzRRXXotGC1xhPXqbbP7itbZ8dnsuvmgRweRNx
 d3sFrabE7xOMuJ+J7noTGU0iuTPCwGSc49aTxO1BpvcE7Mvf+g2ahd7uYyc6gAzPhf1HFyKJq
 RFlFzAYNwXZnrgZeAuV6+O0NTFbegzdh9Py/htWQUxZUZGiCAdVbsaFYYAEVgpJyKP4bqb7Ho
 w4nIUT+cyy/z8Iru5XRHybLVGxZtc36kfHlC66SKFWPsfkcHFBAQsFVj/aZ4RihsXtC+YgWvm
 7YLHt4yGjhTI+WWmHezwHIaDBvRDJTlZD7AzTTjW+wzDbtFtj9LODo37zUXde4xKFEBWtAu9A
 2s0dpjC/yo2qu3HDg4MH3wOP9yjyCGeyM/Q+XPC+PYu91ufpgTm0Mx8tfKS0yj8nbmqpSnBgk
 4woTb9CHKpKV4AucruMd8Y5h037iH59bWCypjh5QaRiF7aNVQq0sXb2FGdz+DR6uTdHbHenNA
 sBy9hBrI2DZjJ1bkWpISXZQSNi4gQyahdYv89SgwvwQ1u+pLGs=
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Fri, Jun 5, 2020 at 9:48 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> +static struct test_variants {
> +       int (*gettime)(clockid_t clk_id, void *ts);
> +       enum tst_ts_type type;
> +       char *desc;
> +} variants[] = {
> +       { .gettime = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
> +
> +#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
> +       { .gettime = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> +#endif
> +
> +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> +       { .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> +#endif
> +};

Would it be possible to add a direct call to the two vdso
implementations here as well?
This test would not catch the bug that we had because only the
clock_gettime64 vdso
implementation was affected, but on most systems the libc clock_gettime calls
the clock_gettime vdso functions, not clock_gettime64.

> +static void run(unsigned int i)
> +{
> +       struct tst_ts ts_start, ts_end;
> +       long long start, end, diff;
> +       struct test_variants *tv;
> +       int count = 10000;
> +       unsigned int j;
> +
> +       while (--count) {
> +               /* Store reference time in start */
> +               if (clks[i] == CLOCK_REALTIME) {
> +                       struct timeval tval;
> +
> +                       /* Compare CLOCK_REALTIME with gettimeofday() as well */
> +                       if (gettimeofday(&tval, NULL) < 0)
> +                               tst_brk(TBROK | TERRNO, "gettimeofday() failed");
> +
> +                       start = tst_timeval_to_ms(tval);
> +               } else {
> +                       tv = &variants[0];
> +                       ts_start.type = tv->type;
> +                       tv->gettime(clks[i], tst_ts_get(&ts_start));
> +                       start = tst_ts_to_ms(ts_start);
> +               }
> +
> +               for (j = 0; j < ARRAY_SIZE(variants); j++) {
> +                       tv = &variants[j];
> +                       ts_end.type = tv->type;
> +
> +                       tv->gettime(clks[i], tst_ts_get(&ts_end));
> +                       end = tst_ts_to_ms(ts_end);
> +
> +                       diff = end - start;
> +                       if (diff < 0) {
> +                               tst_res(TFAIL, "%s: Time travelled backwards: %lld",
> +                                               tst_clock_name(clks[i]), diff);
> +                               return;
> +                       }

I think this check should be done on the nanoseconds, not after the
conversion to milliseconds -- otherwise you miss when time goes
backwards by less than a millisecond.

> +
> +                       if (diff >= 5) {
> +                               tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms: %lld",
> +                                               tst_clock_name(clks[i]), diff);
> +                               return;
> +                       }
> +
> +                       /* Refresh time in start */
> +                       start = end;

resetting start here seems like the right choice in order to check for
backward jumps between loop iterations, but I see that the start of
the loop invalidates that by overwriting it again.

One way to solve this would be by having the gettimeofday() call
as part of the loop but skip it for !CLOCK_REALTIME, and adding
a special case for the lower resolution.

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
