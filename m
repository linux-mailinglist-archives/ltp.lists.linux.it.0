Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3504331339
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:19:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 790F43C5595
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:19:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 75CFA3C5573
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:18:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DC5B960071E
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:18:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20CF9AD87;
 Mon,  8 Mar 2021 16:18:57 +0000 (UTC)
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-2-rpalethorpe@suse.com> <YEZDKa54i+QbKesQ@yuki.lan>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YEZDKa54i+QbKesQ@yuki.lan>
Date: Mon, 08 Mar 2021 16:18:55 +0000
Message-ID: <878s6xhb4g.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/6] fzsync: Add self test
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> Add a validation test for the Fuzz Sync library. It has a range of
>> data races which Fuzzy Sync must reproduce. This is much easier to
>> setup and run than reproducing real kernel bugs.
>> 
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
>> ---
>>  lib/newlib_tests/.gitignore         |   1 +
>>  lib/newlib_tests/test16.c           |   2 +
>>  lib/newlib_tests/tst_fuzzy_sync01.c | 233 ++++++++++++++++++++++++++++
>>  3 files changed, 236 insertions(+)
>>  create mode 100644 lib/newlib_tests/tst_fuzzy_sync01.c
>> 
>> diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
>> index 6c2612259..bb235f433 100644
>> --- a/lib/newlib_tests/.gitignore
>> +++ b/lib/newlib_tests/.gitignore
>> @@ -40,3 +40,4 @@ tst_bool_expr
>>  test_macros01
>>  test_macros02
>>  test_macros03
>> +tst_fuzzy_sync01
>> \ No newline at end of file
>  ^
>  Missing newline...

Ah sorry, I thought I had fixed the new line at EOF thing.

>
>> diff --git a/lib/newlib_tests/test16.c b/lib/newlib_tests/test16.c
>> index 0d74e1eae..7a9b5f20e 100644
>> --- a/lib/newlib_tests/test16.c
>> +++ b/lib/newlib_tests/test16.c
>> @@ -9,6 +9,8 @@
>>   * which they should take it in turns to update.
>>   */
>>  
>   ^
>   Trailing whitespaces.

I think this is just a context line which is not part of the diff. There
is no new line in the source file and it seems git-format-patch produces
it.

>
> Can you please setup your $EDITOR to fix these two?
>
>> +#define _GNU_SOURCE
>
> Also I guess that we need that for sched_getaffinity(), in this case it
> should have been part of the patch that adds it.
>
> Also I would prefer to move to the sched_getaffinity() code to move to
> the test library.
>
>>  #include <stdlib.h>
>>  #include "tst_test.h"
>>  #include "tst_safe_pthread.h"
>> diff --git a/lib/newlib_tests/tst_fuzzy_sync01.c b/lib/newlib_tests/tst_fuzzy_sync01.c
>> new file mode 100644
>> index 000000000..22b78977a
>> --- /dev/null
>> +++ b/lib/newlib_tests/tst_fuzzy_sync01.c
>> @@ -0,0 +1,233 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 Richard Palethorpe <rpalethorpe@suse.com>
>> + */
>> +#define _GNU_SOURCE
>> +
>> +#include "tst_test.h"
>> +#include "tst_fuzzy_sync.h"
>> +
>> +enum race_window_state {
>> +	/* We are in a race window which will cause behaviour that has
>> +	 * very different timings to the target. We must avoid these
>> +	 * race windows. */
>> +	TOO_EARLY,
>> +	TOO_LATE,
>> +	/* We are not in the target race window, but the timings of
>> +	 * this behaviour are similar to those of the target. */
>> +	EARLY_OR_LATE,
>> +	/* We in the target race window */
>> +	CRITICAL,
>> +};
>> +
>> +enum wait_with {
>> +	SPIN,
>> +	SLEEP,
>> +};
>> +
>> +struct window {
>> +	const enum wait_with type;
>> +	const int time;
>> +};
>> +
>> +struct race_shape {
>> +	const struct window too_early;
>> +	const struct window early;
>> +	const struct window critical;
>> +	const struct window late;
>> +	const struct window too_late;
>> +};
>> +
>> +struct scenario {
>> +	const char *const name;
>> +	const struct race_shape a;
>> +	const struct race_shape b;
>> +};
>> +
>> +static struct tst_fzsync_pair pair;
>> +
>> +static volatile enum race_window_state state;
>> +
>> +static const struct scenario races[] = {
>> +	{ "No delay",
>> +	  {{SPIN, 0 }, {SPIN, 0 }, {SPIN, 100 }, {SPIN, 0 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SPIN, 0 }, {SPIN, 100 }, {SPIN, 0 }, {SPIN, 0 }},
>> +	},
>> +	{ "Exit aligned",
>> +	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	},
>> +	{ "Entry aligned",
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SLEEP, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SLEEP, 1 }, {SPIN, 0 }},
>> +	},
>> +	{ "delay A entry",
>> +	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
>> +	},
>> +	{ "delay B entry",
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
>> +	},
>> +	{ "delay A exit",
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SLEEP, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SPIN, 1 }, {SPIN, 0 }},
>> +	},
>> +	{ "delay B exit",
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 10 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	  {{SPIN, 0 }, {SPIN, 1 }, {SPIN, 1000 }, {SLEEP, 1 }, {SPIN, 0 }},
>> +	},
>> +	{ "too early",
>> +	  {{SPIN, 10 }, {SLEEP, 1 }, {SPIN, 100 }, {SPIN, 100 }, {SPIN, 0 }},
>> +	  {{SLEEP, 1 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 10 }, {SPIN, 0 }},
>> +	},
>> +	{ "too late",
>> +	  {{SPIN, 10000 }, {SLEEP, 1 }, {SPIN, 100 }, {SPIN, 100 }, {SPIN, 10 }},
>> +	  {{SPIN, 0 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 1000 }, {SPIN, 10 }},
>> +	},
>> +};
>> +
>> +static void cleanup(void)
>> +{
>> +	tst_fzsync_pair_cleanup(&pair);
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	pair.min_samples = 10000;
>> +
>> +	tst_fzsync_pair_init(&pair);
>> +}
>> +
>> +static void delay(struct window w)
>> +{
>> +	struct timespec ts = { 0, w.time };
>> +	volatile int time = w.time;
>> +
>> +	if (pair.yield_in_wait)
>> +		time /= 100;
>> +
>> +	switch(w.type) {
>> +	case SPIN:
>> +		while (time--) {
>> +			if (pair.yield_in_wait)
>> +				sched_yield();
>> +		}
>
> Why do we yield here? Isn't the library supposed to do so now?

Because on a single CPU spinning without yield is just like pausing
time. Time only moves when the "observer" has chance to update as
well. In this case the "observer" being the other thread.

>
>> +		break;
>> +	case SLEEP:
>> +		nanosleep(&ts, NULL);
>> +		break;
>> +	}
>> +}
>> +
>> +static void *worker(void *v)
>> +{
>> +	unsigned int i = *(unsigned int *)v;
>> +	const struct race_shape *r = &races[i].b;
>> +
>> +	while (tst_fzsync_run_b(&pair)) {
>> +		state = EARLY_OR_LATE;
>> +
>> +		tst_fzsync_start_race_b(&pair);
>> +		if (r->too_early.time) {
>> +			state = TOO_EARLY;
>> +			delay(r->too_early);
>> +		}
>> +
>> +		state = EARLY_OR_LATE;
>> +		delay(r->early);
>> +
>> +		state = CRITICAL;
>> +		delay(r->critical);
>> +
>> +		state = EARLY_OR_LATE;
>> +		delay(r->late);
>> +
>> +		if (r->too_late.time) {
>> +			state = TOO_LATE;
>> +			delay(r->too_late);
>> +		}
>> +		tst_fzsync_end_race_b(&pair);
>> +	}
>
> I guess that I get this part, the thread B is marching always the same,
> changing the state and doing short sleeps.
>
>> +	return NULL;
>> +}
>> +
>> +static void run(unsigned int i)
>> +{
>> +	const struct race_shape *r = &races[i].a;
>> +	struct tst_fzsync_run_thread wrap_run_b = {
>> +		.func = worker,
>> +		.arg = &i,
>> +	};
>> +	int too_early = 0, early_or_late = 0, critical = 0, too_late = 0;
>> +	enum race_window_state state_copy;
>> +
>> +
>> +	tst_fzsync_pair_reset(&pair, NULL);
>> +	SAFE_PTHREAD_CREATE(&pair.thread_b, 0, tst_fzsync_thread_wrapper,
>> +			    &wrap_run_b);
>> +
>> +	while (tst_fzsync_run_a(&pair)) {
>> +		tst_fzsync_start_race_a(&pair);
>> +
>> +		delay(r->too_early);
>> +		state_copy = state;
>> +
>> +		switch(state_copy) {
>> +		case TOO_EARLY:
>> +		case TOO_LATE:
>> +			break;
>> +		default:
>> +			delay(r->early);
>> +			state_copy = state;
>> +		}
>> +
>> +		switch(state_copy) {
>> +		case TOO_EARLY:
>> +			too_early++;
>> +			break;
>> +		case EARLY_OR_LATE:
>> +			early_or_late++;
>> +			delay(r->late);
>> +			break;
>> +		case CRITICAL:
>> +			critical++;
>> +			delay(r->critical);
>> +			break;
>> +		case TOO_LATE:
>> +			too_late++;
>> +			delay(r->too_late);
>> +			break;
>> +		default:
>> +			tst_brk(TBROK, "enum is not atomic?");
>> +		}
>> +		tst_fzsync_end_race_a(&pair);
>
> But here we do depend on the state as it has been set by thread B, I
> guess that we depend on the fact that we are synchronized at
> start_race_*() functions and we exit as soon as we know the result,
> right?

The state is read twice, once to check for the special TOO_EARLY or
TOO_LATE states. Then we check if we hit the critical section or not.

The TOO_EARLY and TOO_LATE states change our behavior, so that we delay
for a shorter period of time. This ruins the timing measurements for A
and is what add_bias is supposed to fix.

I probably should split this into two separate tests. One for races that
don't require a bias and another for one which do. Also I will try to
make it clear what the test is doing. It probably needs thinking through
more.

>
> Still I do wonder if this changes things and if it wouldn't be better to
> march with the delays unconditionally and checking the state only at the
> critical section?
>
>> +		switch(state_copy) {
>> +		case TOO_EARLY:
>> +			tst_fzsync_pair_add_bias(&pair, -10);
>> +			break;
>> +		case TOO_LATE:
>> +			tst_fzsync_pair_add_bias(&pair, 10);
>> +			break;
>> +		default:
>> +			;
>> +		}
>
> And here we add bias unconditionaly, wouldn't that synchronize even if
> fuzzy sync was partially broken? Shouldn't we add bias only for cases
> that require it?

Only some tests produce the TOO_EARLY and TOO_LATE states.

>
>> +		if (critical > 100) {
>> +			tst_fzsync_pair_cleanup(&pair);
>> +			break;
>> +		}
>> +	}
>> +
>> +	tst_res(critical ? TPASS : TFAIL, "%20s) =%-4d ~%-4d -%-4d +%-4d",
>> +		races[i].name, critical, early_or_late, too_early, too_late);
>> +}
>> +
>> +static struct tst_test test = {
>> +	.tcnt = ARRAY_SIZE(races),
>> +	.test = run,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +};
>> -- 
>> 2.30.1
>> 


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
