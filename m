Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B161F74BE
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 09:40:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F6513C2DC7
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jun 2020 09:40:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 585A63C22D8
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 09:40:14 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFE6B6009ED
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 09:39:30 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id ga6so3326413pjb.1
 for <ltp@lists.linux.it>; Fri, 12 Jun 2020 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dFlC2+RmilHPHolWYg/wMm15w1DnD16gAriYYZ3HNVQ=;
 b=YxIXzYo2qtlOEYhV6zE4c/Vk1bVnNWK+Sd7phHduyKeHUVFLvsR2a05egSt3ozGQn7
 QBpaooPKFPeQz99ElsqARabfFamtM/adl4ctbFtlNFIpI0V6L/CwuUkUTqbm0R14XsvR
 ugFFVouc2Zd8AyDdRiW124cigPhvaL80KLXl8Ee1b5Dpn4ocqsGv9ML8LYEzts3qlHoQ
 N/IAHYevI99xHVb6Hi317KKJR/tUyArJ80mmXWsABXG92PqM+qTemKkBzMuDoik1fnNS
 n/T8I4cTr2jvMld2L+2ku1yN1R0wTSk9OupssudpjCDX57+efVFXK/FCu2gctaqgxpdt
 pvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dFlC2+RmilHPHolWYg/wMm15w1DnD16gAriYYZ3HNVQ=;
 b=lWxzhqOEH6Ac2D2+BLj2xW5rUj6HOKvo4MRMxGw+ckZgYWw+noQDLNXxO9xg2B3whx
 HzpmkZgQn+gENGB/wMKvNqfPZ4hRQsJ9RdAkbGQyCh3px8yuCCbRDoZ5lBWMz4kYzp3D
 HmP9YknvnIxBHGVdKdqe8Dt3xnY2B70Q7wdl8BlFrZETsH7xmWe0sjRhg2fXaUgsIs7T
 ityTWXlM2etHiUXQihvduF5gn8U1/dHV7/DAI5IYezHcn3Q3G3DAy7GWqsDHCDrQVCzX
 /2gxq5vrYEmbEi7OljUdFgKPHSY/FchbUJil48emp6dikG6JoWadG9XCSzNdz4LCbDhJ
 N5Jw==
X-Gm-Message-State: AOAM531Eianlw2tuTUwNxzmmvPciVOZmxasRJBKJjOxRRk0xzqNvyObE
 1e3pDa3AcXKOWG2RAiX2QOAkLg==
X-Google-Smtp-Source: ABdhPJyHkDA4raT47f6shTJJ6uQXFuqmEW8LOWgFcXX92z2tuu3tV9Ts1yXPBngVHhznCwveuTiWhg==
X-Received: by 2002:a17:90a:a616:: with SMTP id
 c22mr11140051pjq.14.1591947612424; 
 Fri, 12 Jun 2020 00:40:12 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id g84sm4385911pfb.113.2020.06.12.00.40.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 00:40:11 -0700 (PDT)
Date: Fri, 12 Jun 2020 13:10:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200612074009.t5ccj36nf7pd25sz@vireshk-i7>
References: <0f1cc05d6d79238ed94b93417f300e9a026a2063.1591864369.git.viresh.kumar@linaro.org>
 <cc75beb4074b62e94b8ac92cba17af41b8f5fbdc.1591864369.git.viresh.kumar@linaro.org>
 <CAK8P3a1VEj=QhvmeSpzA1GKLhg9isM106yW1trntNVTqP5UZQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1VEj=QhvmeSpzA1GKLhg9isM106yW1trntNVTqP5UZQw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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

On 11-06-20, 15:05, Arnd Bergmann wrote:
> On Thu, Jun 11, 2020 at 10:34 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +static void find_vdso_helpers(void)
> > +{
> > +       /*
> > +        * Some vDSO exports its clock_gettime() implementation with a different
> > +        * name and version from other architectures, so we need to handle it as
> > +        * a special case.
> > +        */
> > +#if defined(__powerpc__) || defined(__powerpc64__)
> > +       const char *version = "LINUX_2.6.15";
> > +       const char *name = "__kernel_clock_gettime";
> > +#elif defined(__aarch64__)
> > +       const char *version = "LINUX_2.6.39";
> > +       const char *name = "__kernel_clock_gettime";
> > +#elif defined(__s390__)
> > +       const char *version = "LINUX_2.6.29";
> > +       const char *name = "__kernel_clock_gettime";
> > +#else
> > +       const char *version = "LINUX_2.6";
> > +       const char *name = "__vdso_clock_gettime";
> > +#endif
> 
> I see that risc-v uses version="LINUX_4.15", and nds32 uses "LINUX_4",
> the other ones look correct.

My bad, I only looked at man page of vdso for clock_gettime(), while I
looked at kernel source for clock_gettime64() :(

> > +                       ret = tv->gettime(clks[i], tst_ts_get(&ts));
> > +                       if (ret) {
> > +                               if (errno != ENOSYS) {
> > +                                       tst_res(TFAIL | TERRNO, "%s: clock_gettime() failed (%d)",
> > +                                               tst_clock_name(clks[i]), j);
> > +                               }
> > +                               continue;
> > +                       }
> 
> Is this a test case failure, or does it still succeed after skipping a call?

"continue" takes us to the next variant for the current test loop (out
of 10000 loops). So we don't exit here, though this reports a failure
and that will be visible in the output. But because we continue here,
we will also see a TPASS at the end for the same clock. So if the
test was running for CLOCK_REALTIME, then we will see both FAIL and
PASS in output. I didn't wanted to abandon the test in such a case and
so kept it like that.

> When any of the variants (in particular vdso_clock_gettime64) don't
> exist, I think you just need to continue without printing anything.

That is exactly why we are looking for ENOSYS here. The other code
(which you removed) explicitly sets the error to ENOSYS if
clock_gettime64() or clock_gettime() vdso isn't available. And so we
won't print an error here. Though the setup routine will print only
once if the vdso wasn't available, as general information.

> Note that older kernels before v5.1 don't have the clock_gettime64
> syscall, while riscv and future architectures as well as kernels with
> CONFIG_COMPAT_32BIT_TIME=n don't have clock_gettime(),
> and some architectures don't have a vdso, or only the time32 version
> of it.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
