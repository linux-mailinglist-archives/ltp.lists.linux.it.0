Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A62641A0DC6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 14:36:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52A093C2D89
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 14:36:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1BDC93C061B
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 14:36:55 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3E76E14016E0
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 14:36:54 +0200 (CEST)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N1x6X-1jB76a0a1R-012GlS for <ltp@lists.linux.it>; Tue, 07 Apr 2020
 14:36:53 +0200
Received: by mail-qt1-f170.google.com with SMTP id x16so2431501qts.11
 for <ltp@lists.linux.it>; Tue, 07 Apr 2020 05:36:52 -0700 (PDT)
X-Gm-Message-State: AGi0PubiMclWuY6B3oHnau6DkLTO1W4i4YaVVALHJWw7Bv2Porwo2h81
 axV63mkwkG5OE1C63s1Vt8NTbRYNElykX8HS2TI=
X-Google-Smtp-Source: APiQypKE12ETQFgADB+Dvav2a72EK8uJTqurYC1IJa4Lkn8mwO2joWgTZp6R8Q6rClUAlESUQzgicsLgHDB62/6JdzE=
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr1961460qte.18.1586263011913; 
 Tue, 07 Apr 2020 05:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
In-Reply-To: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Apr 2020 14:36:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
Message-ID: <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:v8H5lNeebwwS0OiLGSctPGB6mxmt33N/JCvY/fx/4qtMnd3hokb
 DVwikSrNuedumgEwb7OYd59B9tv5GsvLnGZ6LrRVnB2qkHnq65RGNU6/SrYZldOAz6XKQ2a
 RNpZfD2ja6wL3xiI+Dmfw2MwJuTHvadD/ed3nVgg9EVkd/+LfktGc/0EJijXyT0XUVRTdvI
 5Yvg+yGk7krr9wwMJAo1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HR5PR/NKLqw=:9WbgKdoF/lj5qMLnOfDPNN
 iFzw95yqCTYVzzo4BRe0mA1/ugZSsPTop9d7wjLd12jnN8tK9vZIRltVdauqsdK33nK5hBkk0
 ywFekQtsmGzXRsX2cYTCML3Inh7fuFqup+14ZkOvoe5kkXmRLwBDN7/PMwX16B0gRtzDHjUTE
 dpa6QkdgnazDaS8otiJ9OCR/DCPqUPZkDPXMQnbIJ/TENlHd2YLZ1qqPF5q5p2LxcdBWNbbzO
 B1oOlqo/2asf+VMSZ35RWTgCEXCPjVT2aVB1aYDjQ41pakqnRSTOa4oRvpLQrhj/58pMRcgkZ
 77hw+npXtCfsySSBGmuHHuCN+Gh36UoulLooMZGeDKnUoyBgEKSXHd5fa9On26KxtRkZ1ThIK
 3EQ+dipxuSQu8ysUh+FnEccd6vsAeY/VzJMWRVhxGkMt02NmOnaxdusfum6t02oSAlQo9404R
 Cjj8hpYCkzTCEwpASs8sQiP2/+cxN+ZC4thlqTutJ8PCONSZ993c9wr7q4xYobMoL/O+oIFAr
 uOaeAmm/8OZ1+E+XPVp1zP/toi/pK3isdz2Ae0RmwF2JcFJHbgYm1wJqh9iQ4o7t87KjKwQOy
 E1Vykd3077WLRo3aSTLZ9zDLM+6bTjTxtNKffosWxlIWuzqn/RKp0/9Gfkikdzgjpv23GWAPg
 BmO8PMF1UHMCMO9votmyWp7tnQVnA/75Kfb7Hh9U6hyhhGpqAw0Ir2E0xqyZ/7EtTW+MABdhO
 8deG+Ibg/shkc0nh6ILNYbBiTeby7cz4sjY7kkPAsUHVv50ElQqYrerN//0ArC7+whgV1Czeg
 Tt1h7QTmb8ioiMTeORcJe1eXgIzgO4zHPm2dMYQKvY/3S0qWSI=
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Tue, Apr 7, 2020 at 1:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi Guys,
>
> I wanted to get some inputs/confirmations from everyone before going
> full fledged on implementing time64 changes and so here is an RFC.
>
> This extends the clock_gettime01.c tests to support time64 variants for
> both 32bit and 64bit architectures.
>
> Are there some other tests you guys want me to include ?
>
> @Arnd: I still wasn't able to understand how can I incorporate
> D_TIME_BITS thing here and so left it :(
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/tst_timer.h                           |  31 +++++
>  .../syscalls/clock_gettime/clock_gettime01.c  | 115 +++++++++---------
>  2 files changed, 89 insertions(+), 57 deletions(-)
>
> diff --git a/include/tst_timer.h b/include/tst_timer.h
> index cdb8de7987d9..282514abac08 100644
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -15,6 +15,37 @@
>  #include <sys/time.h>
>  #include <time.h>
>
> +#ifndef __kernel_timespec
> +typedef long __kernel_long_t;

Minor bug: __kernel_long_t is 'long long' on x32 (we might not care
here, but it's best to define the type to match the kernel)

> +typedef __kernel_long_t        __kernel_old_time_t;
> +
> +struct __kernel_old_timespec {
> +       __kernel_old_time_t     tv_sec;         /* seconds */
> +       long                    tv_nsec;        /* nanoseconds */
> +};

"__kernel_long_t tv_nsec;", also because of x32.

>
> -static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
> +struct __kernel_timespec kspec64;
> +
> +#ifdef TST_ABI32
> +struct timespec spec32;
> +struct __kernel_old_timespec kspec32;
> +
> +static int _clock_gettime(clockid_t clk_id, void *tp)
>  {
> -       return tst_syscall(__NR_clock_gettime, clk_id, tp);
> +       return clock_gettime(clk_id, tp);
>  }

On new architectures, notably 32-bit risc-v, there is no __NR_clock_gettime,
as it only supports the 64-bit interface.

> -static int check_spec(struct timespec *spec)
> +static int sys_clock_gettime64(clockid_t clk_id, void *tp)
>  {
> -       return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
> +       return tst_syscall(__NR_clock_gettime64, clk_id, tp);
>  }
> +#endif

And when building against old kernel headers or on 64-bit
architectures, this one is not available.

> +struct tmpfunc {
> +       int (*func)(clockid_t clk_id, void *tp);
> +       int (*check)(void *spec);
> +       void *spec;
> +       int spec_size;
> +       char *desc;
> +} variants[] = {
> +#ifdef TST_ABI32
> +       { .func = _clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "vDSO or syscall (32)"},
> +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "syscall (32) with libc spec"},
> +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &kspec32, .spec_size = sizeof(kspec32), .desc = "syscall (32) with kernel spec"},
> +       { .func = sys_clock_gettime64, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> +#else
> +       { .func = sys_clock_gettime, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> +#endif
> +};

I think instead of an #if / #else, this should have separate #if statements for
whichever versions are available on the given combination of architecture,
libc and kernel header.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
