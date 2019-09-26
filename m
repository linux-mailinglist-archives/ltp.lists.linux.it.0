Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C46F3BF31C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:37:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9541F3C22D0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:37:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F21E93C1A9D
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:37:16 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 54419201182
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:37:15 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id CB3C29F800;
 Thu, 26 Sep 2019 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1569501434; bh=F7Z4ZRObQKbEXT/aYQOFveu0gXMR24LgGDvbMqPs8uc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=dtuFboPYNgrIHoj5d+pqi1TgNLGD2FHMVyIDQ5m9nvKmpg2Fiz9+HjqjF9FahWy4H
 PlwTHxgS/ZlI7+vKyz581c3zM0bVXsnj8lgs4z0EZCPX4NzTYOHxiH5PcyD2cmxoBn
 Qh6w0UnIPpBXNFiTIngX3hn6O88knoz0iuZl7SQA=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190925092958.125325-1-lkml@jv-coder.de>
 <20190926122546.GA27993@rei>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <ae7daebd-0a33-823c-1434-56a081480c0e@jv-coder.de>
Date: Thu, 26 Sep 2019 14:37:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190926122546.GA27993@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix/conformance/clock/1.1: Deterministic
 timing
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Am 26.09.2019 um 14:25 schrieb Cyril Hrubis:
> Hi!
>> On some systems the loop with 8 million iterations takes a very long time.
>> This patches changes it to busy loop for five seconds.
>>
>> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>> ---
>>   .../conformance/interfaces/clock/1-1.c                 | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
>> index 9c48cd979..cce5beea9 100644
>> --- a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
>> +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
>> @@ -17,20 +17,22 @@
>>   #include <time.h>
>>   #include <stdio.h>
>>   #include <unistd.h>
>> +#include <time.h>
>>   #include "posixtest.h"
>>   
>> -#define LARGENUMBER 8000000
>> +#define BUSY_LOOP_SECONDS 5
>>   int main(void)
>>   {
>>   	clock_t c1, c2;
>>   	double sec1, sec2;
>> -	int i;
>> +	time_t end;
>>   
>>   	c1 = clock();
>>   	sec1 = c1 / CLOCKS_PER_SEC;
>>   
>> -	for (i = 0; i < LARGENUMBER; i++) {
>> -		// keep busy so CPU time increases
>> +	end = time(NULL) + BUSY_LOOP_SECONDS;
>> +
>> +	while (end >= time(NULL)) {
>>   		clock();
>>   	}
> clock_gettime() with CLOCK_MONOTONIC would be better fit there, since
> the wall clock can be changed by ntp and generally is not guaranteed to
> be monotonic...
I was actually thinking the same, but decided to use time() because of 
a) it doesn't matter much as long as some time passes by and b) 
monotonic clocks are an optional feature in posix.
>>   
>> -- 
>> 2.20.1
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
