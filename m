Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2C1F6898
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 15:06:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49AD83C6152
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 15:06:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0590C3C1813
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 15:06:11 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9AB786014A0
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 15:05:28 +0200 (CEST)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MQeIA-1jWnq80rIc-00NmAn for <ltp@lists.linux.it>; Thu, 11 Jun 2020
 15:06:10 +0200
Received: by mail-qt1-f173.google.com with SMTP id i16so4444591qtr.7
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 06:06:10 -0700 (PDT)
X-Gm-Message-State: AOAM5316ZcfoKGO3LFDoI9fvz2U5ROT3yV+me7ZzOfppUOd1VSmPaON+
 74Y4cknWCsD2cSexirLB8to8NnWdG3KjmE7HBKg=
X-Google-Smtp-Source: ABdhPJy11bdBpdKexISdburKyjH31Pxcp25D531aii33vsXxvx9sNuaW9VWmLqXbscuWj76tcau0IX1Rm+kJkdjQx5s=
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr8379191qtm.7.1591880769000;
 Thu, 11 Jun 2020 06:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
 <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
In-Reply-To: <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 11 Jun 2020 15:05:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VEj=QhvmeSpzA1GKLhg9isM106yW1trntNVTqP5UZQw@mail.gmail.com>
Message-ID: <CAK8P3a1VEj=QhvmeSpzA1GKLhg9isM106yW1trntNVTqP5UZQw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:Tw4Ut3eUjP88FihP3V3qBPJ1ye8k+EcjzTMebMvllams1jZSyg2
 U+Pa5sCxaNotqRJ3FFy1b8fRMNEZ0NTeYfuv0hDnYkIhscv2cwbPkn/ce4v77j6gRlJsRXt
 xq3z/CcnNe/2HyJBoINCZsNWKkTTuqPP1qFuYDYajF7wV010XQpYEy1ZbYpfvfafoR2e0B2
 O4h1Hj7RExjY1rDzkHRAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/BrPta81rWA=:O3kuoZWr88tMGki6nVkWXn
 ubBoOk5trs07Fz4Rcju8x1ktn0w80Jxkbul5iJwOJnGb07JxG+FkvzgMYylKkb+wagoKZ6crK
 YkbppLQk0biRSwUhisOnCoKIfXbFQykmq4ly4T+MClyOoEvEUdXWcSMU2XGHUnY9J0j1iZUwP
 mT+HP0OQUXPSfV9z/hQo0suPOmWFqjIb7+cE/5WRwKq441lMzGu3QIDOgmXghk8Bw2cRGYDBe
 8foRxBPdVJrAWyiPZaiX/qnJsuDqHj7yEtYiq8zGJppMm1Fyp2BUKFxz/hkgVsXcJ9e5LMhtm
 5R1cxpelCxQshoVUh5zen2chTTfgaYyy7z3730dwaBQsE1Qeb7yx8/+7u57vYpUbI4+O41DEM
 uV3vB/mpLQjpxowbS9WVTUeKF9zBFtGeFVI9nq8HkXhzDUhxnVRfRH7Pn6SanVMZqiHk5Oi/n
 KMvmfANFxb/KK1P2mnfuLyYGR3NlMAG9NUtvP2zkb54JbPhBeLKnvhdMwnvWdA/Xo8j6v5hOq
 zxOMgNwsg1KfWhIaw9og+OJ/ApMsW6CbLgLkelE41zn/hFXtLjKKjASb2WtxNo/XEPYtMGGtF
 7MH28bbtNm7CuflKZkJKlZYrnHiK5+aqYub39NRDRRWKNQVtCvCkkdj/eaZh3VcVxkzQHjghb
 zh2Z4iT7Py1MvWgx3zzQTURnqsiKCXFojrNcZa/0FbhRTZivKjjAKLOEmAIy0Vzeb2ej2H2rx
 j68J431/cQYI42w5ECZinevdkZ0V1FRRjTBu+qPnhBxMQkLhb3ZdCOFIXpc4pzhxPqipdprM+
 prNBgXGHFWR6n4g+85OuXrGT/+Q/jy2gx8AS87mYMQp0yxveJo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clock_gettime: Add test to check
 bug during successive readings
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

On Thu, Jun 11, 2020 at 10:34 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> +static void find_vdso_helpers(void)
> +{
> +       /*
> +        * Some vDSO exports its clock_gettime() implementation with a different
> +        * name and version from other architectures, so we need to handle it as
> +        * a special case.
> +        */
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +       const char *version = "LINUX_2.6.15";
> +       const char *name = "__kernel_clock_gettime";
> +#elif defined(__aarch64__)
> +       const char *version = "LINUX_2.6.39";
> +       const char *name = "__kernel_clock_gettime";
> +#elif defined(__s390__)
> +       const char *version = "LINUX_2.6.29";
> +       const char *name = "__kernel_clock_gettime";
> +#else
> +       const char *version = "LINUX_2.6";
> +       const char *name = "__vdso_clock_gettime";
> +#endif

I see that risc-v uses version="LINUX_4.15", and nds32 uses "LINUX_4",
the other ones look correct.

> +                       ret = tv->gettime(clks[i], tst_ts_get(&ts));
> +                       if (ret) {
> +                               if (errno != ENOSYS) {
> +                                       tst_res(TFAIL | TERRNO, "%s: clock_gettime() failed (%d)",
> +                                               tst_clock_name(clks[i]), j);
> +                               }
> +                               continue;
> +                       }

Is this a test case failure, or does it still succeed after skipping a call?
When any of the variants (in particular vdso_clock_gettime64) don't
exist, I think you just need to continue without printing anything.
Note that older kernels before v5.1 don't have the clock_gettime64
syscall, while riscv and future architectures as well as kernels with
CONFIG_COMPAT_32BIT_TIME=n don't have clock_gettime(),
and some architectures don't have a vdso, or only the time32 version
of it.

        Arnd

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
