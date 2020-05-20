Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEEE1DAEF1
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:39:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CF9D3C4E2D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 11:39:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A5CCE3C4DFA
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:39:52 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AC1171A013AF
 for <ltp@lists.linux.it>; Wed, 20 May 2020 11:39:51 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id e11so323306pfn.3
 for <ltp@lists.linux.it>; Wed, 20 May 2020 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HDqBBeU+z3HyqI/TVvf/4mzHlmTsiYAfP3n4m878taE=;
 b=sTeqHEuuG6CzZMoDkiQYcHtF3/Ya68E8itdIlyKCQXxpJ0e1A6MxHzWPvjOjDeDS6J
 /CVblySyomhJUpBUEo0VXAFWDftZEp6AkLRVAbmrhA4j1oVqfEdomk5IlgHMueeDQ7Ja
 +Cq4Xf+vM8hUj/oxjWcTsKL4DrjYkVjIxZjJUu5NU6ymz+tN6jzIDbuQfhSCRhJjJRbF
 z29LdTrivGrxAdp8+fetxUbZ6jenmly+82H0V4I1LGN9CYH/9vgGF216r1I5WEUn/MWL
 h92jRkQNLkTZIiktsZmyd9T7e06gbDNQ1JSwrvBVQxL8HADjrVM7xUBIuyVWio0UzA58
 r9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HDqBBeU+z3HyqI/TVvf/4mzHlmTsiYAfP3n4m878taE=;
 b=VAPJKjnYlw7+k9tyrhoPzvmsI5o8KO2eBLFUTvXJz52x+xnG9SreS6wKsjQZm0JADD
 efYmOxkFWviioCLVgnzh8RTM7rjEp/dZfwVPdC+o5W/7Qto9T4OqRJU7FoR8R1wqNPuN
 9MoohuVF/uAqe2AG8+9CvlvbQXZTV1UJ+m0vWZ9y7bcN77r4thl8xzTfCwqbefvLGKbQ
 3t04U9lgyhGMcLDsuIvTsIMrzZu51PFglTBqf9gE0QPB8hTWHHNLb/fQDsfNysfUtl84
 a6p2bBDK/3UItYy4CMdOzgp6+SO10DbvPLh+q58o44GK+HqBwcLwp6ocl532OACerolN
 UzYg==
X-Gm-Message-State: AOAM533U+BuyKDuS7cqOAEsoTMd8kuTd8x0IqGPF6kqzT3rAaaJS+9dZ
 RXnCTIL3U/RGzZH/GgqrOplmrQ==
X-Google-Smtp-Source: ABdhPJzN0z17I7bKsujaI3HfXomCzKBtWTxefXNpLOjyFUDk3RkGvbo/vfNYu+JAP9I30nvy37jLHg==
X-Received: by 2002:a63:33c6:: with SMTP id z189mr3422895pgz.426.1589967590102; 
 Wed, 20 May 2020 02:39:50 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q16sm1546281pgm.91.2020.05.20.02.39.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 02:39:49 -0700 (PDT)
Date: Wed, 20 May 2020 15:09:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200520093947.4vwmc4jdyqte67ua@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
 <20200519122155.GB16008@yuki.lan>
 <20200520073151.y5xttqnqeqe4jmka@vireshk-i7>
 <CAK8P3a3kS-_ZynTR=o9FVAXEyr9VcAaigOcnG-_Se+wA_+jQoA@mail.gmail.com>
 <20200520090530.eabgbtpxlmnwbrpm@vireshk-i7>
 <CAK8P3a0DHENYhT3R6Xuygf2DiS8LLCCCfL025ESxqf6Rvth7ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0DHENYhT3R6Xuygf2DiS8LLCCCfL025ESxqf6Rvth7ZA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

On 20-05-20, 11:35, Arnd Bergmann wrote:
> On Wed, May 20, 2020 at 11:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 20-05-20, 10:47, Arnd Bergmann wrote:
> > > On Wed, May 20, 2020 at 9:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > > int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> > >  {
> > >        int ret;
> > >
> > > #ifdef(__NR_clock_gettime64)
> > >         struct __kernel_timespec newts;
> > >         ret = tst_syscall(__NR_clock_gettime64, clk_id, &newts);
> > >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_nsec =
> > > newts.tv_nsec };
> > >         if (ret != -ENOSYS)
> > >               return ret;
> > > #endif
> > >
> > > #ifdef __NR_clock_gettime
> > >         struct __kernel_old_timespec oldts;
> > >         ret = tst_syscall(__NR_clock_gettime, clk_id, &oldts);
> > >         *ts = (struct timespec) { .tv_sec = oldts.tv_sec, .tv_nsec =
> > > oldts.tv_nsec };
> > >         if (ret != -ENOSYS)
> > >               return ret;
> > > #endif
> > >
> > >        /* fallback for prehistoric linux */
> > >         struct timeval tv;
> > >         ret = gettimeofday(&tv, NULL);
> > >         *ts = (struct timespec) { .tv_sec = newts.tv_sec, .tv_usec =
> > > newts.tv_nsec / 1000};
> > >
> > >         return ret;
> > > }
> >
> > This is used only for the internal working of the library and so we may not need
> > to support all these timespec types TBH and make it complex.
> 
> Well, the point here is that you need the function to reliably return the
> current time in the right format, and I don't think a simpler implementation
> would be correct. In fact, I just realized that your patch version cannot work
> on riscv32 since it only has __NR_clock_gettime64 but not __NR_clock_gettime.

I am wondering that there would be lots of such issues across LTP, all existing
ones btw, and should we try to fix them or not ? No one ever ran it on Risk I
believe, otherwise they would have seen it.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
