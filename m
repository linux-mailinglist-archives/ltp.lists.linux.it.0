Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 419081A1C12
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 08:57:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA1AE3C2D1C
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 08:57:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2F2323C03CC
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 08:57:25 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1F35E1000D06
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 08:57:25 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id n4so793483pjp.1
 for <ltp@lists.linux.it>; Tue, 07 Apr 2020 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=riSeDDF+Qm335+qmp/qL1hFKHFDtxj/6d6vEZqUbv00=;
 b=JdZUQtYp+XCFdXdITzN7F+QwUWa8RFA89WRPN3+wXEobU+XiSf6py8TH1/AIoOOEZ/
 zU4wsljF8l8El1/35NT/pZmamWZHyFf5nwOJd97CF4sO8ce+wsJV2wUjT+Q2mltnwYuf
 62cOxNt/nanbxbiG+rcuJX1W393l6CW+ICxmI9QhL7H5R5R41KORF6JE6BvVbZFy5pa6
 gPwTlmO27xUVaUhxzuuFCJdSf8YFAB6YmSqdLPUuJb7PC2ZxUZ/rr7pDchf2U+PqQHCi
 2VVc7axwuV0/DySeGmCZZk3BOZwb6ANu9EVCgCIh0TMHJPopOV2aMFBWuOY0H/2LERKV
 tIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=riSeDDF+Qm335+qmp/qL1hFKHFDtxj/6d6vEZqUbv00=;
 b=IKPPaTzxAUZw42C40WUQVHYh+Xo40gqVWGvDu8GQEUDTMnSYryTh+C4UI+FTYYLj8J
 QSn06ET26tz2oZsLkQdGiNArsZ37Uwk8R1MON3+3Xu/NTrZHfob41lf/c4O8wemSBCEV
 bHhQ/fSUpKFHvf1X+TQNQHsQHHvoziGxG8mp/aswdo2u6XPWNbYeo6pYA0fOLoxCY79o
 GgE/dDJ2aK+2D39j/Mzpt+JGL2N+cyojrky2sLJKNotV+Q6c977CxEFtszR/5MY+MdFZ
 0ZQFaH0DU8S//5tm61W0ZGN3DARI3fcS/0qUz+OVuc8mDtkJi9u/s3bzvQwEMoefikdl
 O74A==
X-Gm-Message-State: AGi0PuYlsAdVzEhtv6azonIbhTVfJASKu5x80QmXhT/sxxBq7geNNiSo
 20NIfpsSO+itfX1Yc0g0vW2KvzOfo38=
X-Google-Smtp-Source: APiQypLaCk9tkdDtRB14Uwz0xAGwmxHw9xJ37z0l+psncOjzTe3WPTuDd+24MuGeuhQncVCnwrQMag==
X-Received: by 2002:a17:90a:80ca:: with SMTP id
 k10mr3715736pjw.45.1586329043413; 
 Tue, 07 Apr 2020 23:57:23 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id bt19sm3456552pjb.3.2020.04.07.23.57.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 23:57:22 -0700 (PDT)
Date: Wed, 8 Apr 2020 12:27:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200408065720.p2tkny6icrqa7o25@vireshk-i7>
References: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
 <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On 07-04-20, 14:36, Arnd Bergmann wrote:
> On Tue, Apr 7, 2020 at 1:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hi Guys,
> >
> > I wanted to get some inputs/confirmations from everyone before going
> > full fledged on implementing time64 changes and so here is an RFC.
> >
> > This extends the clock_gettime01.c tests to support time64 variants for
> > both 32bit and 64bit architectures.
> >
> > Are there some other tests you guys want me to include ?
> >
> > @Arnd: I still wasn't able to understand how can I incorporate
> > D_TIME_BITS thing here and so left it :(
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  include/tst_timer.h                           |  31 +++++
> >  .../syscalls/clock_gettime/clock_gettime01.c  | 115 +++++++++---------
> >  2 files changed, 89 insertions(+), 57 deletions(-)
> >
> > diff --git a/include/tst_timer.h b/include/tst_timer.h
> > index cdb8de7987d9..282514abac08 100644
> > --- a/include/tst_timer.h
> > +++ b/include/tst_timer.h
> > @@ -15,6 +15,37 @@
> >  #include <sys/time.h>
> >  #include <time.h>
> >
> > +#ifndef __kernel_timespec
> > +typedef long __kernel_long_t;
> 
> Minor bug: __kernel_long_t is 'long long' on x32 (we might not care
> here, but it's best to define the type to match the kernel)
> 
> > +typedef __kernel_long_t        __kernel_old_time_t;
> > +
> > +struct __kernel_old_timespec {
> > +       __kernel_old_time_t     tv_sec;         /* seconds */
> > +       long                    tv_nsec;        /* nanoseconds */
> > +};
> 
> "__kernel_long_t tv_nsec;", also because of x32.

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 282514abac08..23ba9c2c6707 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -16,12 +16,17 @@
 #include <time.h>
 
 #ifndef __kernel_timespec
+#ifdef __x86_x32__
+typedef long long __kernel_long_t;
+#else
 typedef long __kernel_long_t;
+#endif
+
 typedef __kernel_long_t        __kernel_old_time_t;
 
 struct __kernel_old_timespec {
        __kernel_old_time_t     tv_sec;         /* seconds */
-       long                    tv_nsec;        /* nanoseconds */
+       __kernel_old_time_t     tv_nsec;        /* nanoseconds */
 };
 
 typedef long long __kernel_time64_t;

-------------------------8<-------------------------

I hope above diff fixes both the issues you pointed ? TBH, I am not sure if the
macro I must be checking for is __x86_x32__ or something else :)

> > -static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
> > +struct __kernel_timespec kspec64;
> > +
> > +#ifdef TST_ABI32
> > +struct timespec spec32;
> > +struct __kernel_old_timespec kspec32;
> > +
> > +static int _clock_gettime(clockid_t clk_id, void *tp)
> >  {
> > -       return tst_syscall(__NR_clock_gettime, clk_id, tp);
> > +       return clock_gettime(clk_id, tp);
> >  }
> 
> On new architectures, notably 32-bit risc-v, there is no __NR_clock_gettime,
> as it only supports the 64-bit interface.
> 
> > -static int check_spec(struct timespec *spec)
> > +static int sys_clock_gettime64(clockid_t clk_id, void *tp)
> >  {
> > -       return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
> > +       return tst_syscall(__NR_clock_gettime64, clk_id, tp);
> >  }
> > +#endif
> 
> And when building against old kernel headers or on 64-bit
> architectures, this one is not available.

As Petr said, even if these get called on the architecture we don't support, we
will get something like this in output only once for the tests..

clock_gettime01.c:74: CONF: syscall(-1) __NR_clock_gettime64 not supported

> > +struct tmpfunc {
> > +       int (*func)(clockid_t clk_id, void *tp);
> > +       int (*check)(void *spec);
> > +       void *spec;
> > +       int spec_size;
> > +       char *desc;
> > +} variants[] = {
> > +#ifdef TST_ABI32
> > +       { .func = _clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "vDSO or syscall (32)"},
> > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "syscall (32) with libc spec"},
> > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &kspec32, .spec_size = sizeof(kspec32), .desc = "syscall (32) with kernel spec"},
> > +       { .func = sys_clock_gettime64, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> > +#else
> > +       { .func = sys_clock_gettime, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "syscall (64) with kernel spec"},
> > +#endif
> > +};
> 
> I think instead of an #if / #else, this should have separate #if statements for
> whichever versions are available on the given combination of architecture,
> libc and kernel header.

Can you give an example on how you would write it ?

Also any other tests I should have included here ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
