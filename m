Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FAD0E8D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:19:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D9803C2271
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:19:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 82E0E3C2074
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:19:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 00777601F73
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:19:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AE74AC32;
 Wed,  9 Oct 2019 12:19:07 +0000 (UTC)
Date: Wed, 9 Oct 2019 14:19:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191009121906.GA7677@rei.lan>
References: <1570618285-25200-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570618285-25200-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl08: New test for prctl() with
 PR_{SET, GET}_TIMERSLACK
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> -----
> v2->v3:
> 1.add some check
> 2.compare time should not expire early before sleep
>  I want to take more samples, but .sample and .test have conflict and I
> don't konw how to slove it.

Well, you can't have a single test that implements both timer sampling
tests and, at the same time, regular test function. You have to split
these into two separate testcases. I guess that the best would be
splitting the test into two, one that just sets arnd reads back the
slack values and one that samples a timer.

> -----
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/lapi/prctl.h                       |   5 +
>  runtest/syscalls                           |   1 +
>  testcases/kernel/syscalls/prctl/.gitignore |   1 +
>  testcases/kernel/syscalls/prctl/Makefile   |   1 +
>  testcases/kernel/syscalls/prctl/prctl08.c  | 129 +++++++++++++++++++++
>  5 files changed, 137 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/prctl/prctl08.c
> 
> diff --git a/include/lapi/prctl.h b/include/lapi/prctl.h
> index 8ee492259..0b4e196c3 100644
> --- a/include/lapi/prctl.h
> +++ b/include/lapi/prctl.h
> @@ -19,6 +19,11 @@
>  # define PR_SET_SECCOMP  22
>  #endif
>  
> +#ifndef PR_SET_TIMERSLACK
> +# define PR_SET_TIMERSLACK 29
> +# define PR_GET_TIMERSLACK 30
> +#endif
> +
>  #ifndef PR_SET_CHILD_SUBREAPER
>  # define PR_SET_CHILD_SUBREAPER	36
>  # define PR_GET_CHILD_SUBREAPER	37
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 4e6310193..76961a684 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -878,6 +878,7 @@ prctl04 prctl04
>  prctl05 prctl05
>  prctl06 prctl06
>  prctl07 prctl07
> +prctl08 prctl08
>  
>  pread01 pread01
>  pread01_64 pread01_64
> diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
> index 2178db366..fe36a8e0f 100644
> --- a/testcases/kernel/syscalls/prctl/.gitignore
> +++ b/testcases/kernel/syscalls/prctl/.gitignore
> @@ -6,3 +6,4 @@
>  /prctl06
>  /prctl06_execve
>  /prctl07
> +/prctl08
> diff --git a/testcases/kernel/syscalls/prctl/Makefile b/testcases/kernel/syscalls/prctl/Makefile
> index cf19507c0..f0adc6fae 100644
> --- a/testcases/kernel/syscalls/prctl/Makefile
> +++ b/testcases/kernel/syscalls/prctl/Makefile
> @@ -21,5 +21,6 @@ top_srcdir		?= ../../../..
>  include $(top_srcdir)/include/mk/testcases.mk
>  
>  prctl07: LDLIBS += $(CAP_LIBS)
> +prctl08: LDLIBS += -lrt
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/prctl/prctl08.c b/testcases/kernel/syscalls/prctl/prctl08.c
> new file mode 100644
> index 000000000..d0384c95c
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl08.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * Test PR_GET_TIMERSLACK and PR_SET_TIMERSLACK of prctl(2).
> + * 1)Each thread has two associated timer slack values: a "default"
> + *   value, and a "current" value. PR_SET_TIMERSLACK sets the "current"
> + *   timer slack value for the calling thread.
> + * 2)When a new thread is created, the two timer slack values are made
> + *   the same as the "current" value of the creating thread.
> + * 3)The maximum timer slack value is ULONG_MAX. On 32bit machines, it
> + *   is a valid value(about 4s). On 64bit machines, it is about 500 years
> + *   and no person will set this over 4s.  prctl return value is int, so
> + *   we test themaximum value is INT_MAX.
> + * 4)we also check current value via /proc/self/timerslack_ns if it is
> + *  supported.
> + */
> +
> +#include <sys/prctl.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <linux/limits.h>
> +#include "lapi/syscalls.h"
> +#include "lapi/prctl.h"
> +#include "tst_timer_test.h"
> +#include "tst_test.h"
> +
> +#define PROC_NS_PATH "/proc/self/timerslack_ns"
> +
> +static struct tcase {
> +	unsigned long setvalue;
> +	unsigned long cmptime;
> +} tcases[] = {
> +	{1, 50000},
> +	{70000, 50000},
> +	{INT_MAX, 50000},
> +};
> +
> +static int proc_flag = 1;
> +
> +static void check_proc_ns(char *message, unsigned long value)
> +{
> +	unsigned long proc_value;
> +
> +	SAFE_FILE_SCANF(PROC_NS_PATH, "%lu", &proc_value);
> +	if (proc_value == value)
> +		tst_res(TPASS, "%s %s  got %lu expectedly",
> +				message, PROC_NS_PATH, proc_value);
> +	else
> +		tst_res(TFAIL, "%s %s expected %lu got %lu",
> +				message, PROC_NS_PATH, value, proc_value);
> +}
> +
> +static void check_get_timerslack(char *message, unsigned long value)
> +{
> +	TEST(prctl(PR_GET_TIMERSLACK));
> +	if ((unsigned long)TST_RET == value)
> +		tst_res(TPASS, "%s prctl(PR_GET_TIMERSLACK) got %lu expectedly",
> +				message, value);
> +	else
> +		tst_res(TFAIL, "%s prctl(PR_GET_TIMERSLACK) expected %lu got %lu",
> +				message, value, TST_RET);
> +
> +	if (proc_flag)
> +		check_proc_ns(message, value);
> +
> +}
> +
> +static void verify_prctl(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +	int pid;
> +
> +	struct timespec timereq = { .tv_sec = 0, .tv_nsec = 50000 };
> +	struct timespec timecmp = { .tv_sec = 0, .tv_nsec = tc->cmptime};
> +
> +	TEST(prctl(PR_SET_TIMERSLACK, tc->setvalue));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_TIMERSLACK, %lu) failed",
> +					  tc->setvalue);
> +		return;
> +	}
> +
> +	tst_res(TPASS, "prctl(PR_SET_TIMERSLACK, %lu) succeed", tc->setvalue);
> +	check_get_timerslack("Parent process", tc->setvalue);
> +
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
> +		/*check the current value of child process*/
> +		check_get_timerslack("Child process", tc->setvalue);
> +		prctl(PR_SET_TIMERSLACK, 0);
> +		/*check the default value of child process*/
> +		check_get_timerslack("After reset to 0, child process", tc->setvalue);
> +		tst_timer_start(CLOCK_MONOTONIC);
> +		TEST(nanosleep(&timereq, NULL));
> +		tst_timer_stop();
> +
> +		if (tst_timespec_lt(tst_timer_elapsed(), timecmp))
> +			tst_brk(TFAIL, "nanosleep() slept less than timecmp");
> +
> +		tst_res(TPASS, "nanosleep() slept more than timecmp, %llius",
> +				tst_timer_elapsed_us());
> +		exit(0);
> +	}
> +}
> +
> +static void setup(void)
> +{
> +	if (access(PROC_NS_PATH, F_OK) == -1) {
> +		tst_res(TCONF, "proc doesn't support timerslack_ns interface");
> +		proc_flag = 0;
> +	}
> +
> +	TEST(prctl(PR_GET_TIMERSLACK));
> +	if (TST_RET == 50000)
> +		tst_res(TINFO, "current timerslack value is 50000");
> +	else
> +		tst_brk(TCONF,
> +			"current environment doesn't meet test, please set timerslack to 50us");
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = verify_prctl,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.forks_child = 1,
> +};
> -- 
> 2.18.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
