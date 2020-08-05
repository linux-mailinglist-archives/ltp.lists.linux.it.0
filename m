Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75223CBA5
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 17:11:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5F0C3C325C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 17:11:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B194E3C2244
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 17:11:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D12CD1A017DC
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 17:11:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA2A8AF99;
 Wed,  5 Aug 2020 15:11:42 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:11:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200805151145.GA631@yuki.lan>
References: <96ce72a605e365a040b258db9323d3962ab80e29.1596545279.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96ce72a605e365a040b258db9323d3962ab80e29.1596545279.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8] syscalls: clock_settime: Add test around y2038
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This adds a test around the y2038 vulnerability, it sets the system time
> to just before y2038 time (i.e. max value that can be stored in s32),
> and adds a timer to expire just after crossing it.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V8:
> - Check compatibility issues for TST_KERN_OLD_TIMESPEC and not the new
>   timespec.
> - s/TFAIL/TCONF/ in setup()
> - Use kernel_timer_t
> - rearrange code and don't expect timer to fire before.
> 
>  runtest/syscalls                                   |   1 +
>  testcases/kernel/syscalls/clock_settime/.gitignore |   1 +
>  .../syscalls/clock_settime/clock_settime03.c       | 123 +++++++++++++++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/clock_settime/clock_settime03.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 3c6e78a4c6d0..3c2f5f6c0b37 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -99,6 +99,7 @@ leapsec01 leapsec01
>  
>  clock_settime01 clock_settime01
>  clock_settime02 clock_settime02
> +clock_settime03 clock_settime03
>  
>  clone01 clone01
>  clone02 clone02
> diff --git a/testcases/kernel/syscalls/clock_settime/.gitignore b/testcases/kernel/syscalls/clock_settime/.gitignore
> index 28121755006b..b66169b3eb7b 100644
> --- a/testcases/kernel/syscalls/clock_settime/.gitignore
> +++ b/testcases/kernel/syscalls/clock_settime/.gitignore
> @@ -1,2 +1,3 @@
>  clock_settime01
>  clock_settime02
> +clock_settime03
> diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> new file mode 100644
> index 000000000000..da062a8d0333
> --- /dev/null
> +++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Linaro Limited. All rights reserved.
> + * Author: Viresh Kumar<viresh.kumar@linaro.org>
> + *
> + * Check Year 2038 related vulnerabilities.
> + */
> +
> +#include <signal.h>
> +#include "config.h"
> +#include "tst_timer.h"
> +#include "tst_safe_clocks.h"
> +
> +#define TIMER_DELTA	3
> +#define ALLOWED_DELTA	(50 * 1000) /* 50 ms */
> +
> +static struct tst_ts start, end;
> +static struct tst_its its;
> +
> +static struct test_variants {
> +	int (*clock_gettime)(clockid_t clk_id, void *ts);
> +	int (*clock_settime)(clockid_t clk_id, void *ts);
> +	int (*timer_settime)(kernel_timer_t timerid, int flags, void *its,
> +			     void *old_its);
> +	enum tst_ts_type type;
> +	char *desc;
> +} variants[] = {
> +#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
> +	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> +#endif
> +
> +#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> +	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> +#endif
> +};
> +
> +static void setup(void)
> +{
> +	struct test_variants *tv = &variants[tst_variant];
> +
> +	tst_res(TINFO, "Testing variant: %s", tv->desc);
> +	start.type = end.type = its.type = tv->type;
> +
> +	/* Check if the kernel is y2038 safe */
> +	if (tv->type == TST_KERN_OLD_TIMESPEC &&
> +	    sizeof(start.ts.kern_old_ts) == 8)
> +		tst_brk(TCONF, "Not Y2038 safe to run test");

Thinking of this again, it may be safer to assert the size of the
kernel_old_ts.tv_sec, since the compiler is technically allowed to padd
the structure. So what about sizeof(start.ts.kernel_old_ts.tv_sec) == 4?

> +}
> +
> +static void run(void)
> +{
> +	struct test_variants *tv = &variants[tst_variant];
> +	unsigned long long time = 0x7FFFFFFE; /* Time just before y2038 */
> +	struct sigevent ev = {
> +		.sigev_notify = SIGEV_SIGNAL,
> +		.sigev_signo = SIGABRT,
> +	};
> +	long long diff;
> +	kernel_timer_t timer;
> +	sigset_t set;
> +	int sig, ret;
> +
> +	if (sigemptyset(&set) == -1)
> +		tst_brk(TBROK, "sigemptyset() failed");
> +
> +	if (sigaddset(&set, SIGABRT) == -1)
> +		tst_brk(TBROK, "sigaddset() failed");

We do have a safe macros for these two now.


Other than that these the code looks good. I can fix these two before
applying if you agree.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
