Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8861DE17A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:03:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C03B03C4CE3
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:03:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6AB8B3C005E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:03:11 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C861E1A01555
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:03:10 +0200 (CEST)
Received: from mail-qv1-f47.google.com ([209.85.219.47]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3sRi-1iu0jO0Z9c-00zqIJ for <ltp@lists.linux.it>; Fri, 22 May 2020
 10:03:10 +0200
Received: by mail-qv1-f47.google.com with SMTP id z5so4353312qvw.4
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:03:09 -0700 (PDT)
X-Gm-Message-State: AOAM533KGYGPSSWFl5qMwmwUXVbRWWZ54lKi5A7hN5ZlOa9DEGQWAbTp
 bdpVaysP8qpiQhRXINIdrFX3bW/xOyZyCPJecKE=
X-Google-Smtp-Source: ABdhPJxJqF2Ocj9pnpe6sx7R+f6a0aBNSNZAzdTRYuhM3FZ5DabwkZDq+6MYfATZSmAcKKU9glQnfoOzf4SETa5v4lw=
X-Received: by 2002:ad4:58cb:: with SMTP id dh11mr2335893qvb.211.1590134588913; 
 Fri, 22 May 2020 01:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590130423.git.viresh.kumar@linaro.org>
 <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
In-Reply-To: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 May 2020 10:02:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
Message-ID: <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:nV6GqWyTf2eJ5AKDCIgCAjFQx/XGSFdutwQaJ6SnSZTmhmRQ9Q+
 zvis4tBtrp5p38c899KtxYtIvYggqw5Wssa72LV4HZfVw2M99jBhklGrOWycnGab3QyQ1Zd
 VxgHwzf0uf/XFsjXHTgURyXe/zC5jiL0eD4skvVSuQ8zF78XPNITVTGteNwd41bKnp1Em0k
 l+VDCUiCHCCje36cAOGmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x3aV3gB8Xsc=:z/jovMC22Qiex8dv5rJnQn
 pTkzqCOnLmfe2SuVK5yrb94FsIzM/Ytqxhe4NazY4cqi1VIL30UVrKW9thoIZQHiXrTANsDLg
 lBmZ+3v01zvwCevxmi5+D82366cCVPFhKQBQPSjfhJOAme6A3/CACfW2Uymoz7nu5PASfWOB2
 8p573Yobh2in2k3BmNxMwMRed3WZtty+lXkQgItaIt/KLz19vuAkuBEUphlMYSJI/2Hq4nWzw
 6nJGK4DWWPivVfRShXwP1p0CbJaIKTTojs//bkZooGa0gdtdw6lfbdu6EyO5JtLLtZ1K1zd8H
 KsZ5PpN8ouhrf1ew7uQ/WSslI9viEc1DwU6WB9ApiJ++1S42b4DxexqH8Pyzkog0ulAB+F6rW
 4ktkcASFDemVbn7Uo+MOMGERvtase1CP6u54IrvwkgkpfsZuc4RJ5LdEseVMnsfAUmkIF0NGb
 YS4yExX70rtXLVmwoZcdmNYH5YWtGEyY3pN0s6jfYCPjawIa1xiqeWPCX6zQUgqZsd1el9jcc
 Zn5RS/P7TIEyDlhoJcp+D4DqyS7h6kbz3p+rjbIE8d5izsOVRVJxPJSlseDrreqnVdO8PGVCG
 mEV2/6dwIlvr7rcXOFoHbS5hbeJNBlf5ct8wht9p4SUoEtK3ShcuNhjZMysMzhyMBoodL9hpp
 THuRY+z1LfcE+Rx9MBMGqL52ONIHzz27T3M2pf5T999ymW54IkVGOzY0KLgEOA46k/BlEBdsP
 T9WGl4gHbqzZ/CmW6gzunRRrjRWkvidYce08xVGL1rQHCxEfKhxdejlQxc7QxXoDuYgZT0WeP
 7G8ucnJbZmv9FXFnV9QE5Fz1gQZPWyluzl7RwrUn9V5F1fHAEo=
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 5/6] syscalls: Don't pass struct timespec to
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

On Fri, May 22, 2020 at 8:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

>
>  int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>  {
> -       return tst_syscall(__NR_clock_getres, clk_id, res);
> +       int (*func)(clockid_t clk_id, void *ts);
> +       struct tst_ts tts = { 0, };
> +       int ret;
> +
> +#if defined(__NR_clock_getres_time64)
> +       tts.type = TST_KERN_TIMESPEC;
> +       func = sys_clock_getres64;
> +#elif defined(__NR_clock_getres)
> +       tts.type = TST_KERN_OLD_TIMESPEC;
> +       func = sys_clock_getres;
> +#else
> +       tts.type = TST_LIBC_TIMESPEC;
> +       func = libc_clock_getres;
> +#endif
> +
> +       ret = func(clk_id, tst_ts_get(&tts));

This is not enough to run on old kernels that have __NR_clock_getres
but don't have __NR_clock_getres_time64, you need a runtime fallback
instead of a compile-time fallback.

As Cyril mentioned though, you don't need the libc fallback in
the end, since all kernels we would test can be expected to
have at least one of the other two.

       Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
