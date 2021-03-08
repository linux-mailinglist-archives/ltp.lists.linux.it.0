Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FA33122D
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 16:30:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC4403C655D
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 16:30:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 533B63C5570
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 16:30:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0F7DF1400DC6
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 16:30:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E442AE1F
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 15:30:15 +0000 (UTC)
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-7-rpalethorpe@suse.com> <YEY6bJ/FYL240kK9@yuki.lan>
User-agent: mu4e 1.4.15; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YEY6bJ/FYL240kK9@yuki.lan>
Date: Mon, 08 Mar 2021 15:30:14 +0000
Message-ID: <87blbthddl.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] fzsync: Check processor affinity
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
>> It is useful for testing Fuzzy Sync itself to set the CPU affinity to
>> a single core. The current processes affinity does not effect
>                                                            ^
> 							 affect?

Yup.

>> tst_ncpus(), but we can get the affinity separately.
>> 
>> Note that checking this still does not guarantee we will use yield
>> when restricted to only one core. We would have to periodically probe
>> which CPUs threads are running on until we detect more than one CPU.
>> 
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  include/tst_fuzzy_sync.h | 20 ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
>> index 36a604e13..ea356ab44 100644
>> --- a/include/tst_fuzzy_sync.h
>> +++ b/include/tst_fuzzy_sync.h
>> @@ -59,9 +59,11 @@
>>   * @sa tst_fzsync_pair
>>   */
>>  
>> +#define _GNU_SOURCE
>> +
>>  #include <math.h>
>>  #include <pthread.h>
>> -#include <sched.h>
>> +#include "lapi/cpuset.h"
>>  #include <stdbool.h>
>>  #include <stdlib.h>
>>  #include <sys/time.h>
>> @@ -213,12 +215,26 @@ struct tst_fzsync_pair {
>>   */
>>  static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>>  {
>> +	long ncpus = tst_ncpus();
>> +#ifdef CPU_COUNT
>> +	size_t cpusz = CPU_ALLOC_SIZE(ncpus);
>> +	cpu_set_t *cpus = CPU_ALLOC(ncpus);
>> +
>> +	if (sched_getaffinity(0, cpusz, cpus)) {
>> +		tst_res(TWARN | TERRNO, "sched_getaffinity(0, %zu, %zx)",
>> +			cpusz, (size_t)cpus);
>> +	} else {
>> +		ncpus = CPU_COUNT(cpus);
>> +	}
>> +	free(cpus);
>> +#endif
>
> Can we instead put this into the lib/tst_cpu.c and call it
> tst_allowed_cpus() or something like this?

Yeah sure, I guess this will allow me to handle the GNU feature test
macro better as well.

>
>>  	CHK(avg_alpha, 0, 1, 0.25);
>>  	CHK(min_samples, 20, INT_MAX, 1024);
>>  	CHK(max_dev_ratio, 0, 1, 0.1);
>>  	CHK(exec_time_p, 0, 1, 0.5);
>>  	CHK(exec_loops, 20, INT_MAX, 3000000);
>> -	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
>> +	CHK(yield_in_wait, 0, 1, (ncpus <= 1));
>>  }
>>  #undef CHK
>>  
>> -- 
>> 2.30.1
>> 
>> 
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
