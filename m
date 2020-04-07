Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 218291A15E7
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 21:24:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B08493C2D99
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Apr 2020 21:24:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DFC213C2D90
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 21:23:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5E2661A0080F
 for <ltp@lists.linux.it>; Tue,  7 Apr 2020 21:23:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E86EACFE;
 Tue,  7 Apr 2020 19:23:57 +0000 (UTC)
Date: Tue, 7 Apr 2020 21:23:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200407192356.GA9828@dell5510>
References: <bff0fc8e8777a744d35bca86c83158efb90b0ff8.1586257574.git.viresh.kumar@linaro.org>
 <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2tbLZxyA-a=w7GZDwa0POwETaHQ73DqAU=FnB7zEnT2Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Arnd,

thanks for a review!

...
> > +#ifndef __kernel_timespec
> > +typedef long __kernel_long_t;

> Minor bug: __kernel_long_t is 'long long' on x32 (we might not care
> here, but it's best to define the type to match the kernel)
+1 (defined in arch/x86/include/uapi/asm/posix_types_x32.h


> > +typedef __kernel_long_t        __kernel_old_time_t;
> > +
> > +struct __kernel_old_timespec {
> > +       __kernel_old_time_t     tv_sec;         /* seconds */
> > +       long                    tv_nsec;        /* nanoseconds */
> > +};

> "__kernel_long_t tv_nsec;", also because of x32.


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

> On new architectures, notably 32-bit risc-v, there is no __NR_clock_gettime,
> as it only supports the 64-bit interface.
That should be ok (tst_syscall() checks for ENOSYS and resulting with TCONF).

> > -static int check_spec(struct timespec *spec)
> > +static int sys_clock_gettime64(clockid_t clk_id, void *tp)
> >  {
> > -       return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
> > +       return tst_syscall(__NR_clock_gettime64, clk_id, tp);
> >  }
> > +#endif

> And when building against old kernel headers or on 64-bit
> architectures, this one is not available.
I guess that's the reason Viresh used it just for 32-bit.

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

> I think instead of an #if / #else, this should have separate #if statements for
> whichever versions are available on the given combination of architecture,
> libc and kernel header.

>        Arnd

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
