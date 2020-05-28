Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E071E5AC4
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 10:27:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41E283C31CA
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 10:27:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E6E003C31BD
 for <ltp@lists.linux.it>; Thu, 28 May 2020 10:27:28 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 610156181CB
 for <ltp@lists.linux.it>; Thu, 28 May 2020 10:26:57 +0200 (CEST)
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MHXSD-1jr5uo21Tt-00DVtd for <ltp@lists.linux.it>; Thu, 28 May 2020
 10:27:27 +0200
Received: by mail-qk1-f177.google.com with SMTP id v79so2293228qkb.10
 for <ltp@lists.linux.it>; Thu, 28 May 2020 01:27:27 -0700 (PDT)
X-Gm-Message-State: AOAM533BYoIFz8xqTQmSa4qCReKBUHyjSBpF6UnsPlR9g4bb8P6VsGFU
 GPyS3gDvaLWooEM+7HZazXDv9WtWoDUuYs/d+ZE=
X-Google-Smtp-Source: ABdhPJylrev0TwvnRq9db3dVScKVh/catmPdBN8oQ1OMqfPkFuGCk+kY/wO10ocflm0AazVq12TUIWx6wvM+7r6+Dfw=
X-Received: by 2002:ae9:de85:: with SMTP id s127mr419482qkf.352.1590654446370; 
 Thu, 28 May 2020 01:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
In-Reply-To: <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 May 2020 10:27:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
Message-ID: <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:FyUy52Y+YCMmI43Vsy2f5N0fgGBGFefP1lM3Bh55tYcsoJG6pLa
 StwYSZ0kTwOGpTcpix/8EU2+bLORE5R7OhgDg/eD6GTtLPZ+RO2NQ54S+EneKDz7BdAG5uP
 vvdwKOZS1zqBaZAjXzRK69P2BgNgyIqU6s6W5vxa6oqTg9Q+2fFW+9ROH+RCvSalPl3PwqF
 EtMt8KuoWCWtbs9I1U4dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dN/WF/nIiWg=:dg/uB5eVGzBRBkHh2tPGnG
 AolfLv6Z9QnIrC0kvyobKIFVD1abvbvDDyp1tnUQCRkBLely6HPDzKArOr/65aQeBPJOpRbts
 GbdFQZm1wyLcBiEEUcTsVky28r6jDLWMrL9X+nlaQlaMLtSruSm+JRYVTaQ/ePNigjVFLx70T
 mCKUb3ZNmWEtVlcksRdZv2xmQApZnI18fJr0pYWrvo/XmaIGQBqGT7WRuqJLp6DobensGiMwx
 5R+iCPlZyVJOen0oyJYgI7wqmPFOy5GHZlk3L5akJIYAL7oV4KyA4nLlEXzCnz06Dpyatik+S
 BcD2XRhkhylzsVHg4hmEmjVcdxeeMPhMsv+sQAepa8/qBK6l34+Rr5XX4dVttllXodVRJxqoZ
 ZajTIJHrXrdJB/xE5h5W/qI5+WBGPj2WzIqZvLaD1Frxjh1gs4h+Y9lFI8F1mnZ+s/8JZvuju
 l0E6NVFtgKW0CCJknR7tadIAPqIvLcSM3WlF+0epcAQbTBnjAFEnv7DXk5MKqX25hBQsayg6Z
 fx50ptBJMIv5t+MDy+xSIoHBpztH5t1SUogfZYNnlkmbzfZM8VCrtr3/FA57ZIGVk+wgYML4E
 mjXYr6Rzs3B+WAUZQ0IrbLmeZZEb4syRzBgHmyS/L3WCC5x6HaqFnizT3xgKGo50S3erF52ae
 f7OH+xEFuB6CEG4OU/qLftD/MzSHTp9S+oOIMtxBvvVcNbIYrP6bGUjzK8cEWNaqFCeMr4+Gm
 XADAz2oKlm61HGM1tVTMcZVo3mzeZWZuD9qNRVeHdtpDak4AS3brI/GzMLUbFt+FL7CH0U4iM
 tgltQ6ySgExJ4JJLaTEUGbXYk5k3+fdTCEjBst8msEZ3tJGhGs=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: clock_settime: Add test around y2038
 vulnerability
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

On Thu, May 28, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This adds a test around the y2038 vulnerability, it sets the system time
> to just before y2038 time (i.e. max value that can be stored in s32),
> and adds a timer to expire just after crossing it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2:
> - Fix the y2038 bug in the test itself, changes in the setup() routine.
>   :)

So I assume this version works as expected?
I don't see any more problems with it.

> +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> +       if (ret == -1)
> +               tst_brk(TBROK | TERRNO, "clock_settime() failed");
> +
> +       tst_its_set_time(&its, time + EXPIREDELTA, 0, 0, 0);
> +
> +       TEST(tv->timer_settime(timer, TIMER_ABSTIME, tst_its_get(&its), NULL));
> +       if (TST_RET == -1)
> +               tst_brk(TBROK | TTERRNO, "timer_settime() failed");
> +
> +       if (sigwait(&set, &sig) == -1)
> +               tst_brk(TBROK, "sigwait() failed");

Should you maybe check the time after the expiration to ensure the
timer ran for the expected length?

I suppose you can read the time in CLOCK_MONOTONIC to check
for the elapsed time regardless of what the kernel might think the
CLOCK_REALTIME is after this.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
