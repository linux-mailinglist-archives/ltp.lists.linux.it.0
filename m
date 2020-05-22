Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 028691DE25C
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:42:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB9003C4CE2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 10:42:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EB2453C4CC1
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:42:10 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 23DEC200B86
 for <ltp@lists.linux.it>; Fri, 22 May 2020 10:42:10 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id y198so4921631pfb.4
 for <ltp@lists.linux.it>; Fri, 22 May 2020 01:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tz7/+9Z9TIiEulp5XgjDrgMGb1O9dk8OvCXwi5S3qIM=;
 b=i8XAW2558RZhocWC2cePaL/k150QUxDjbBgYzjVNugFnB9UMJUJa0tJXBH8toVlOE/
 bKVu3ykrB4mptUDcuFbbwX1mj55PJ6/Cf9hKarLBCBhttoOtDySN0u9sqFAZ+a17yVo8
 2Cip/tMOjEodH2Ii1ZRUmet8w8rlzCgy7B5WCbIDDLDgFAOiQiD9j9wGXKSV8mPVe1Dq
 0vF3pRmP/txw3cwuez8rj/+YoBgH4c1+BZqxOcMvRUd82Nc4t7xeXwFwiee614ZpJ2qJ
 PVOVDvAqBagYziCcWqHRHijtSBflk6+QORyaeFSJviP1BliaG9HZVYN+eqLhf0u0phf/
 cGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tz7/+9Z9TIiEulp5XgjDrgMGb1O9dk8OvCXwi5S3qIM=;
 b=a0omnIWZoLdYWnCzggskYD1K9moQzEF7XeqU80C0V/WWcGHi4N5q4p++t0XHaZ1Gc3
 gss352W9/uKPRIUwqa0v2eGwcsKv+7XXzug1eQaE2DdS7n2z0Pu+jBx19IOUVG3DNoER
 j7rwT6aFlGIrbEYa+vFh9NHOkXuDkHLlo92Zckap/6WifXBdgT+R4NochGOe1Oz7XX34
 Z5BjdrEhVM11MKQl25ScZhUm1bFJpxsOuGYqz5ulh5rWrs8sQX1gzEhpcyj6XvbRPnrK
 Br2xv5bxdR1uQgovAMkUOb93mLmSGqSG1BH1IMkG2aKFySVdD+8YTJJYxcQHQ96nuq5s
 WxzQ==
X-Gm-Message-State: AOAM5313m6r8AU7r8daOtsOcywXnpC02g01c9Jls9gpmo0XQ/DVxYfj+
 AS4SOToSd4CvSvUBpCi6n/D2tQ==
X-Google-Smtp-Source: ABdhPJwOx82V711+gKUNTR/eXMLh3PBw98T2WHzwFikPasccSe20KUROZnKQmeYgOGBm+kfjNgg18w==
X-Received: by 2002:a63:78b:: with SMTP id 133mr13497043pgh.161.1590136928626; 
 Fri, 22 May 2020 01:42:08 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id p8sm5871059pgm.73.2020.05.22.01.42.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 01:42:07 -0700 (PDT)
Date: Fri, 22 May 2020 14:12:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200522084205.hvkx4maxujzb2s2y@vireshk-i7>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
 <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
 <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2B35hUF3rSdJpS=M-Wekm+wUx-skekgw3CiQR=wodqXw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 22-05-20, 10:02, Arnd Bergmann wrote:
> On Fri, May 22, 2020 at 8:54 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> >
> >  int tst_clock_getres(clockid_t clk_id, struct timespec *res)
> >  {
> > -       return tst_syscall(__NR_clock_getres, clk_id, res);
> > +       int (*func)(clockid_t clk_id, void *ts);
> > +       struct tst_ts tts = { 0, };
> > +       int ret;
> > +
> > +#if defined(__NR_clock_getres_time64)
> > +       tts.type = TST_KERN_TIMESPEC;
> > +       func = sys_clock_getres64;
> > +#elif defined(__NR_clock_getres)
> > +       tts.type = TST_KERN_OLD_TIMESPEC;
> > +       func = sys_clock_getres;
> > +#else
> > +       tts.type = TST_LIBC_TIMESPEC;
> > +       func = libc_clock_getres;
> > +#endif
> > +
> > +       ret = func(clk_id, tst_ts_get(&tts));
> 
> This is not enough to run on old kernels that have __NR_clock_getres
> but don't have __NR_clock_getres_time64,

What about reversing the order of the two ? Check __NR_clock_getres
first ?

> you need a runtime fallback
> instead of a compile-time fallback.

Why so ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
