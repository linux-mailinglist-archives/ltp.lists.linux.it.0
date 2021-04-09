Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34D35994B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 11:35:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D2F53C735F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 11:35:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 415553C1D96
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 11:34:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 926E81A01111
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 11:34:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89FE4AF10
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 09:34:57 +0000 (UTC)
References: <20210319091837.27319-1-rpalethorpe@suse.com>
 <20210319091837.27319-2-rpalethorpe@suse.com> <YG8ds1Xl53rAWoQc@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YG8ds1Xl53rAWoQc@yuki>
Date: Fri, 09 Apr 2021 10:34:56 +0100
Message-ID: <87wntb3inz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/7] fzsync: Add self tests
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

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> --- a/lib/newlib_tests/test16.c
>> +++ b/lib/newlib_tests/test16.c
>> @@ -9,6 +9,8 @@
>>   * which they should take it in turns to update.
>>   */
>>  
>> +#define _GNU_SOURCE
>
> This isn't needed anymore, right?

Yes.

>
>>  #include <stdlib.h>
>>  #include "tst_test.h"
>>  #include "tst_safe_pthread.h"
>> diff --git a/lib/newlib_tests/tst_fuzzy_sync01.c b/lib/newlib_tests/tst_fuzzy_sync01.c
>> new file mode 100644
>> index 000000000..8db102bdc
>> --- /dev/null
>> +++ b/lib/newlib_tests/tst_fuzzy_sync01.c
>> @@ -0,0 +1,232 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 Richard Palethorpe <rpalethorpe@suse.com>
>> + */
>> +/*\
>> + * [DESCRIPTION]
>> + *
>> + * This verifies Fuzzy Sync's basic ability to reproduce a particular
>> + * outcome to a data race when the critical sections are not aligned.
>> + *
>> + * We make the simplifying assumptions that:
>> + * - Each thread contains a single contiguous critical section.
>> + * - The threads only interact through a single variable.
>> + * - The various timings are constant except for variations introduced
>> + *   by the environment.
>> + *
>> + * If a single data race has N critical sections then we may remove
>> + * N-1 sections to produce a more difficult race. We may then test
>> + * only the more difficult race and induce from this the outcome of
>> + * testing the easier races.
>> + *
>> + * In real code, the threads may interact through many side
>> + * effects. While some of these side effects may not result in a bug,
>> + * they may effect the total time it takes to execute either
>> + * thread. This will be handled in tst_fuzzy_sync02.
>> + *
>> + * The number of variables which two threads interact through is
>> + * irrelevant as the combined state of two variables can be
>> + * represented with a single variable. We may also reduce the number
>> + * of states to simply those required to show the thread is inside or
>> + * outside of the critical section.
>> + *
>> + * There are two fundamental races which require alignment under these
>> + * assumptions:
>> + *      1        2
>> + * A +-----+  +----+	The outer box is total execution time.
>> + *   | #   |  | #  |	The '#' is the critical section.
>> + *
>> + *   |  # |   |   # |
>> + * B +----+   +-----+
>> + *
>> + * So we can either have the critical section of the shorter race
>> + * before that of the longer one. Or the critical section of the
>> + * longer one before the shorter.
>> + *
>> + * In reality both threads will never be the same length, but we can
>> + * test that anyway. We also test with both A as the shorter and B as
>> + * the shorter. We also vary the distance of the critical section from
>> + * the start or end. The delay times are cubed to ensure that a delay
>> + * range is required.
>> + *
>> + * When entering their critical sections, both threads increment the
>> + * 'c' counter variable atomically. They both also increment it when
>> + * leaving their critical sections. We record the value of 'c' when A
>> + * increments it. From the recorded values of 'c' we can deduce if the
>> + * critical sections overlap and their ordering.
>> + *
>> + * 	Start (cs)	| End (ct)	| Ordering
>> + * 	--------------------------------------------
>> + * 	1		| 2		| A before B
>> + * 	3		| 4		| B before A
>> + *
>> + * Any other combination of 'cs' and 'ct' means the critical sections
>> + * overlapped.
>> +\*/
>> +
>> +#define _GNU_SOURCE
>
> And here as well.
>
>> +#include "tst_test.h"
>> +#include "tst_fuzzy_sync.h"
>
> ...
>
>> +static void delay(const int t)
>> +{
>> +	int k = TIME_SCALE(t);
>> +
>> +	while (k--)
>> +		sched_yield();
>> +}
>
> The TIME_SCALE() is not explained anywhere. Also I do wonder if we need
> some kind of runtime tuning for this.

OK, I have added the following explanation:

+/* Scale all the delay times by this function. The races become harder
+ * the faster this function grows. With cubic scaling the race windows
+ * will be 27 times smaller than the entry or return delays. Because
+ * TIME_SCALE(1) = 1*1*1, TIME_SCALE(3) = 3*3*3.

Should I roll another version or will you fix it up?

>
> Otherwise I find these tests much easier to understand over the first
> version. Thanks a lot for the detailed descriptions, they really help a
> lot.
>
> With the _GNU_SOURCE revoved you can consider this:
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
