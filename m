Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFCF2ED2
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:05:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E5D73C2033
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:05:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3CB693C0B88
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:05:47 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C49BE2016B0
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:05:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9ED7B2FB;
 Thu,  7 Nov 2019 13:05:44 +0000 (UTC)
Date: Thu, 7 Nov 2019 14:05:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191107130543.GD22352@rei.lan>
References: <20191009121906.GA7677@rei.lan>
 <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] syscalls/prctl08: New test for prctl()
 with PR_{SET, GET}_TIMERSLACK
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
> ------
> v3->v4:
> split it into two cases, prctl08 test read/set timer slack value and
> prctl09 is a timer samle test.
> Also, in prctl08, I split into 5 point(0,1,middle,max and inherit).
> -----
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/lapi/prctl.h                       |   5 +
>  runtest/syscalls                           |   1 +
>  testcases/kernel/syscalls/prctl/.gitignore |   1 +
>  testcases/kernel/syscalls/prctl/prctl08.c  | 135 +++++++++++++++++++++
>  4 files changed, 142 insertions(+)
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
> diff --git a/testcases/kernel/syscalls/prctl/prctl08.c b/testcases/kernel/syscalls/prctl/prctl08.c
> new file mode 100644
> index 000000000..9aa15b06d
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl08.c
> @@ -0,0 +1,135 @@
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
> +#include "tst_test.h"
> +
> +#define PROC_TIMERSLACK_PATH "/proc/self/timerslack_ns"
> +
> +static void check_get_timerslack(char *message, unsigned long value);
> +static void check_inherit_timerslack(char *message, unsigned long value);
> +
> +static struct tcase {
> +	void (*func_check)();
> +	unsigned long setvalue;
> +	unsigned long expvalue;
> +	char message[50];
> +} tcases[] = {
> +	{check_get_timerslack, 0, 50000, "Reset"},
> +	{check_get_timerslack, 1, 1, "Min"},
> +	{check_get_timerslack, 70000, 70000, "Middle"},
> +	{check_get_timerslack, INT_MAX, INT_MAX, "Max"},
> +	{check_inherit_timerslack, 70000, 70000, "Child process"},
> +};
> +
> +static int proc_flag = 1;
> +
> +static void check_proc_timerslack(char *message, unsigned long value)
> +{
> +	unsigned long proc_value;
> +
> +	SAFE_FILE_SCANF(PROC_TIMERSLACK_PATH, "%lu", &proc_value);
> +	if (proc_value == value)
> +		tst_res(TPASS, "%s %s  got %lu expectedly",
> +				message, PROC_TIMERSLACK_PATH, proc_value);
> +	else
> +		tst_res(TFAIL, "%s %s expected %lu got %lu",
> +				message, PROC_TIMERSLACK_PATH, value, proc_value);
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
> +		check_proc_timerslack(message, value);
> +
> +}
> +
> +static void check_inherit_timerslack(char *message, unsigned long value)
> +{
> +	int pid;
> +	unsigned long current_value;
> +	unsigned long default_value;
> +
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
> +		current_value = prctl(PR_GET_TIMERSLACK);
> +		prctl(PR_SET_TIMERSLACK, 0);
> +		default_value = prctl(PR_GET_TIMERSLACK);
> +		if (current_value == value && default_value == value)
> +			tst_res(TPASS,
> +				"%s two timer slack values are made the same as the current value(%lu) of the creating thread.",
> +				message, value);
> +		else
> +			tst_res(TFAIL,
> +				"%s current_value is %lu, default value is %lu, the parent current value is %lu",
> +				message, current_value, default_value, value);
> +	}
> +
> +}
> +
> +static void verify_prctl(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	TEST(prctl(PR_SET_TIMERSLACK, tc->setvalue));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_TIMERSLACK, %lu) failed",
> +					  tc->setvalue);
> +		return;
> +	}
> +
> +	tst_res(TPASS, "prctl(PR_SET_TIMERSLACK, %lu) succeed", tc->setvalue);
> +	tc->func_check(tc->message, tc->expvalue);
> +}
> +
> +static void setup(void)
> +{
> +	if (access(PROC_TIMERSLACK_PATH, F_OK) == -1) {
> +		tst_res(TCONF, "proc doesn't support timerslack_ns interface");
> +		proc_flag = 0;
> +	}
> +
> +	TEST(prctl(PR_GET_TIMERSLACK));
> +	if (TST_RET == 50000)
> +		tst_res(TINFO, "current timerslack value is 50us");
> +	else
> +		tst_brk(TCONF,
> +			"current environment doesn't meet test, please set timerslack to 50us");

Why can't we just store the result here into a global and use it later
on in the reset case?

Given that we have check function already all we need to do is to add
one more function that passes the global to the check_get_timerslack()
instead of the expected value.

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

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
