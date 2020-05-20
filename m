Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB851DAE51
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:05:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A61AC3C4E19
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:05:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9125D3C4DF9
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:05:35 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 875E260CB84
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:05:10 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id j21so1129233pgb.7
 for <ltp@lists.linux.it>; Wed, 20 May 2020 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V/kO3xhbz3EB39DRheZAfCwGelQdti5F6DWYwcGulW0=;
 b=NLCgOYwkWsKJCyqZolzH2PQHM+vKI3qZKSK9IoyEDZ+TUt6qaU9FyKSergcPgeK/cI
 GUjoZnevNYrH982rnt3t6z1+3JmV3Q2kbKHGblxPG60fjhywW5+B+CmSg4RjiLkSKhHC
 COWRMCwdteG1YdWObogow2TPDpYMHtc+HAzXPF3ttxZ5V5e/26TBXehL9/jXbe0w7p8O
 WVVkwZitaj7/9ooqv/f1sqtGrD8/FeH7flSZOnUPfbv6yeKFvkzBJvnV+I1VjmRdmLXR
 EwKEke8TbuYAwgVz2Ea2+g3N5MvVQqmNrr2PZtCASvJNCbk5hlvEqGVHN0BN4zvaGCPU
 5DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V/kO3xhbz3EB39DRheZAfCwGelQdti5F6DWYwcGulW0=;
 b=i5GLHaPSqqcYVZfaz8qVEqYlRn8mH2fNLOsCM+Cc+m6ST6Ya4mgkAikG8MqQePHBE/
 47IkkqCRrKZNxcuOovJM8r2gyfYbew+RUIoqyxneInoq9lkZ4AameRbJ2MHXlOe8docw
 +0VlzRDljYchRGmQ5eWB6BDRuI4In/wZ9dgNQmMQx8/V469wUVSZgylD72gIBmpEGagB
 thNbHy074egKLoat1tA506h8If/xxvti2Zktx3oiWANehr78WCOMyUjEBMNrjrXUFAR5
 x2kv8ddC3DI+NmmaYq841R+sYyqECT9lJeW4hQGMVZueH68sTNVRpKweoWFTp42DNfy1
 wUAw==
X-Gm-Message-State: AOAM532EcYoS3WfatHYuHg9+scYaTDCdfzWD7QaXpaR2airjsn8uu+TV
 W4ayznlpuY0QkIyno+cxCG8vGg==
X-Google-Smtp-Source: ABdhPJyJQoT6/3DUN8adhGZhrQM18v/ytjbd2ITy5XfpXM42JPSCon2yr67rs8Rzb6IABHjAt+wTdg==
X-Received: by 2002:a63:503:: with SMTP id 3mr3248294pgf.15.1589965533233;
 Wed, 20 May 2020 02:05:33 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id y22sm1686124pfc.132.2020.05.20.02.05.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 02:05:32 -0700 (PDT)
Date: Wed, 20 May 2020 14:35:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200520090530.eabgbtpxlmnwbrpm@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan>
 <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
 <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
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

On 20-05-20, 10:47, Arnd Bergmann wrote:
> On Wed, May 20, 2020 at 9:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 19-05-20, 14:21, Cyril Hrubis wrote:
> > > So we can as well so that they take the tst_ts structure, then we are
> > > also free to change the way the timestamp is acquired without the need
> > > to change all the callers.
> >
> > I am not sure I understood it all. What do you mean by "also free to change the
> > way the timestamp is acquired"?
> 
> The bug in the current implementation is that the tst_clock_gettime() takes
> the libc type but the argument to the kernel that may expect a different
> type.
> 
> Your patch solves the problem by using the kernel type consistently,
> but the other way to solve it is to keep passing the glibc type and
> instead make tst_clock_gettime() get a timestamp through the low
> level kernel interface using the kernel type and then convert it, like

That can be one way of doing it, but Cyril wasn't suggesting this I believe. He
talked about passing struct tst_ts instead (which is a union of all timespec
types).

> int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>  {
>        int ret;
> 
> #ifdef(__NR_clock_gettime64)
>         struct __kernel_timespec newts;
>         ret = tst_syscall(__NR_clock_gettime64, clk_id, &newts);
>         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_nsec =
> newts.tv_nsec };
>         if (ret != -ENOSYS)
>               return ret;
> #endif
> 
> #ifdef __NR_clock_gettime
>         struct __kernel_old_timespec oldts;
>         ret = tst_syscall(__NR_clock_gettime, clk_id, &oldts);
>         *ts = (struct timespec) { .tv_sec = oldts.tv_sec, .tv_nsec =
> oldts.tv_nsec };
>         if (ret != -ENOSYS)
>               return ret;
> #endif
> 
>        /* fallback for prehistoric linux */
>         struct timeval tv;
>         ret = gettimeofday(&tv, NULL);
>         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_usec =
> newts.tv_nsec / 1000};
> 
>         return ret;
> }

This is used only for the internal working of the library and so we may not need
to support all these timespec types TBH and make it complex.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
