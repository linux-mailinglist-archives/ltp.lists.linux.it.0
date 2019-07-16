Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE786AC3A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 17:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86FFF3C1D10
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 17:53:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 50B883C104A
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 17:53:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DC62B601ABB
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 17:53:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C77EBAF9C
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 15:53:12 +0000 (UTC)
Date: Tue, 16 Jul 2019 17:53:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190716155311.GA4641@rei>
References: <20190715125426.30568-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715125426.30568-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] timers/timer_create0{2, 3,
 4}: Ported to new library
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
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
> + *
> + * Author:	Aniruddha Marathe <aniruddha.marathe@wipro.com>
> + *
> + * Ported to new library:
> + * 07/2019	Christian Amann <camann@suse.com>
> + */
> +/*
> + *
> + * Basic test for timer_create(2):
> + *
> + *	Creates a timer for each available clock using the
> + *	following notification types:
> + *	1) SIGEV_NONE
> + *	2) SIGEV_SIGNAL
> + *	3) SIGEV_THREAD
> + *	4) SIGEV_THREAD_ID
> + *	5) NULL
> + */
> +
> +#include <signal.h>
> +#include <time.h>
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +#include "common_timers.h"
> +
> +static struct sigevent evp;

I guess that there is no reason for evp to be global variable now.

> +static struct notif_type {
> +	int		sigev_signo;
> +	int		sigev_notify;
> +	char		*message;
> +	struct sigevent *sevp;
> +} types[] = {
> +	{SIGALRM, SIGEV_NONE, "SIGEV_NONE", &evp},
> +	{SIGALRM, SIGEV_SIGNAL, "SIGEV_SIGNAL", &evp},
> +	{SIGALRM, SIGEV_THREAD, "SIGEV_THREAD", &evp},
> +	{SIGALRM, SIGEV_THREAD_ID, "SIGEV_THREAD_ID", &evp},
> +	{0, 0, "NULL", NULL},
> +};
> +
> +static void run(unsigned int n)
> +{
> +	unsigned int i;
> +	struct notif_type *nt = &types[n];
> +	kernel_timer_t created_timer_id;
> +
> +	tst_res(TINFO, "Testing notification type: %s", nt->message);
> +
> +	memset(&evp, 0, sizeof(evp));
> +
> +	for (i = 0; i < CLOCKS_DEFINED; ++i) {
> +		clock_t clock = clock_list[i];
> +
> +		evp.sigev_value  = (union sigval) 0;
> +		evp.sigev_signo  = nt->sigev_signo;
> +		evp.sigev_notify = nt->sigev_notify;
> +
> +		if (strstr(get_clock_str(clock), "CPUTIME_ID")) {

Maybe even here we can go for explicit:

	clock == CLOCK_PROCESS_CPUTIME_ID ||
	clock == CLOCK_THREAD_CPUTIME_ID

> +			/* (PROCESS_CPUTIME_ID &
> +			 *  THREAD_CPUTIME_ID)
> +			 * is not supported on kernel versions
> +			 * lower than 2.6.12
> +			 */
> +			if ((tst_kvercmp(2, 6, 12)) < 0)
> +				continue;
> +		}
> +		if (!strcmp(get_clock_str(clock), "MONOTONIC_RAW"))
> +			continue;

Why not just clock == CLOCK_MONOTONIC_RAW ?

> +		if (!strcmp(nt->message, "SIGEV_THREAD_ID"))
> +			evp._sigev_un._tid = getpid();

Here as well, why not just nt->sigev_notify == SIGEV_THREAD_ID ?

> +		TEST(tst_syscall(__NR_timer_create,
> +			clock, nt->sevp,
> +			&created_timer_id));
> +
> +		if (TST_RET != 0) {
> +			if (allowed_to_fail(clock) && TST_ERR == EINVAL) {
> +				tst_res(TPASS,
> +					"%s unsupported, failed as expected: %s",
> +					get_clock_str(clock),
> +					tst_strerrno(TST_ERR));
                                           ^
                                          You can use TTERRNO flag here instead.
> +			} else {
> +				tst_res(TFAIL | TTERRNO,
> +					"Failed to create timer for %s",
> +					get_clock_str(clock));
> +			}
> +			continue;
> +		}
> +
> +		tst_res(TPASS, "Timer successfully created for %s",
> +					get_clock_str(clock));
> +
> +		TEST(tst_syscall(__NR_timer_delete, created_timer_id));
> +		if (TST_RET != 0) {
> +			tst_res(TINFO, "Failed to delete timer %s",
                                  ^
				  Really TINFO I would go for TFAIL|TTERRNO here
> +				get_clock_str(clock));
> +		}
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(types),
> +	.needs_root = 1,
> +};

...

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Wipro Technologies Ltd, 2003.  All Rights Reserved.
> + *
> + * Author: Aniruddha Marathe <aniruddha.marathe@wipro.com>
> + *
> + * Ported to new library:
> + * 07/2019      Christian Amann <camann@suse.com>
> + */
> +/*
> + * Basic error handling test for timer_create(2):
> + *
> + *	Passes invalid parameters when calling the syscall and checks
> + *	if it fails with EFAULT:
> + *	1) Pass an invalid pointer for the sigevent structure parameter
> + *	2) Pass an invalid pointer for the timer ID parameter
> + */
> +
> +#include <stdlib.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <time.h>
> +#include <signal.h>
> +#include "tst_test.h"
> +#include "common_timers.h"
> +
> +static struct sigevent sig_ev;
> +static kernel_timer_t  timer_id;
> +
> +static struct testcase {
> +	struct sigevent	*ev_ptr;
> +	kernel_timer_t	*kt_ptr;
> +	int		error;
> +	char		*description;
> +} tcases[] = {
> +	{NULL, &timer_id, EFAULT, "invalid sigevent struct"},
> +	{&sig_ev, NULL, EFAULT, "invalid timer ID"},
> +};
> +
> +static int have_recent_kernel(void)
> +{
> +	return tst_kvercmp(2, 6, 12) >= 0;
> +}
> +
> +static void run(unsigned int n)
> +{
> +	unsigned int i;
> +	struct testcase *tc = &tcases[n];
> +
> +	tst_res(TINFO, "Testing for %s.", tc->description);
> +
> +	for (i = 0; i < CLOCKS_DEFINED; ++i) {
> +		clock_t clock = clock_list[i];
> +
> +		/* PROCESS_CPUTIME_ID & THREAD_CPUTIME_ID are not supported on
> +		 * kernel versions lower than 2.6.12
> +		 */
> +		if (strstr(get_clock_str(clock), "CPUTIME_ID") &&
> +		    !have_recent_kernel())
                           ^
			   Well recent is kind of relative word, I
			   wouldn't call 2.6.12 recent yet it works fine
			   here.

What about we called the function have_cputime_timers() or something
similar?

I guess that we can also put it in the common header and use it in the
previous test as well.


> +			tc->error = EINVAL;
> +
> +		TEST(tst_syscall(__NR_timer_create, clock_list[n], tc->ev_ptr,
> +			     tc->kt_ptr));
> +
> +		if (TST_RET != -1 || TST_ERR != tc->error) {
> +			if (allowed_to_fail(clock) && TST_ERR == EINVAL) {
                            ^
			    Maybe this should be called
			    "possibly_unsupported()" or something
			    similar.
> +				tst_res(TPASS,
> +					"%s unsupported, failes as expected: %s",
> +					get_clock_str(clock),
> +					tst_strerrno(TST_ERR));

                                        TTERRNO here as well

> +			} else {
> +				tst_res(TFAIL | TTERRNO,
> +					"%s didn't fail as expected (%s) - Got",
> +					get_clock_str(clock),
> +					tst_strerrno(tc->error));
> +			}
> +			continue;
> +		}
> +		tst_res(TPASS, "Timer creation for %s failed as expected: %s",
> +				get_clock_str(clock), tst_strerrno(tc->error));
> +	}
> +}
> +
> +static void setup(void)
> +{
> +	tcases[0].ev_ptr = tst_get_bad_addr(NULL);
> +	tcases[1].kt_ptr = tst_get_bad_addr(NULL);
> +
> +	sig_ev.sigev_value  = (union sigval) 0;
> +	sig_ev.sigev_signo  = SIGALRM;
> +	sig_ev.sigev_notify = SIGEV_NONE;
> +}
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.setup = setup,
> +};
> -- 
> 2.16.4
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
