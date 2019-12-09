Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505011653A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 04:13:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9DE43C180D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 04:13:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1DBE93C04F9
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 04:13:30 +0100 (CET)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5C33E1401ABB
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 04:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=vbHO7
 NKcp+cxIl8hzQM5yM4YEKhz8lqLbA7k3SR9e48=; b=fAEzkyN3nLK0OnKPsQJv1
 U84cjiulQeO/nNqil7EEF0sHbE1wTLCjXvvlM6BvxYbkyBbmOeAjZLmaTAeq18jK
 UtGfPc45r1qh6W6uo6sCutnjVYTjSomuFrqmA4w0wYyJkRS/hecpZZQuIwIYSnKs
 laZzic5bpkqn6HIpIhzVY4=
Received: from [192.168.0.10] (unknown [183.211.129.120])
 by smtp11 (Coremail) with SMTP id D8CowADXXovUu+1dCPtvAQ--.8793S2;
 Mon, 09 Dec 2019 11:13:25 +0800 (CST)
To: Martin Doucha <mdoucha@suse.cz>
References: <20191202101943.17335-1-ice_yangxiao@163.com>
 <7b7c1e8a-1db1-bf9f-96ff-01803416120e@suse.cz>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <31fe4c0c-863e-4ba6-d8d7-1af909013fb7@163.com>
Date: Mon, 9 Dec 2019 11:13:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b7c1e8a-1db1-bf9f-96ff-01803416120e@suse.cz>
Content-Language: en-US
X-CM-TRANSID: D8CowADXXovUu+1dCPtvAQ--.8793S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr13KrykCF1fKw1UAFW5Wrg_yoW5XFy8pr
 Wvqw1a9r4xJFZrJayxt3WUKr1rZ3WfZFW7t3s8J3WYvF17G3s2ywnIgF4jkFyakr98Zw1F
 vay5XwnxWw4DCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6CJPUUUUU=
X-Originating-IP: [183.211.129.120]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMxWGXlXl04IEDgAAsV
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuhotplug05.sh: Rewrite test case
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

Thanks for your comment.
Also sorry for the late reply.

On 12/4/19 11:11 PM, Martin Doucha wrote:
> On 12/2/19 11:19 AM, Xiao Yang wrote:
>> +do_test()
>> +{
> First of all, your patch changes the test scenario. The original
> scenario is this:
> (setup) Deactivate selected CPU
> 1. Check that load statistics are zero or empty for selected CPU
> 2. Activate selected CPU
> 3. Check that load statistics are valid for selected CPU
> 4. Deactivate selected CPU
> (cleanup) Activate selected CPU
>
> I have a few kernel builds where step 3 correctly detects regression.
>
> Your changed scenario looks like this:
> 1. Activate selected CPU
> 2. Check that load statistics are non-zero for selected CPU
> 3. Deactivate selected CPU
> 4. Check that load statistics are empty for selected CPU
> (cleanup) Return selected CPU back to original state
>
> Your new scenario has two problems:
>
> - You have to run at least two test loops to verify that reactivating a
> CPU doesn't break /proc/stat entries.

I think running cpuhotplug05.sh with -i 2 can verfiy this point.

Perhaps we can add -i option to runtest/cpuhotplug, or do you prefer to 
keep the original scenario?

>
> - You only check that load statistics are non-zero. This works with sar
> because the program already normalizes load statistics for you. But it
> won't detect the regression mentioned above because the bug sets one of
> the entries to something absurdly high. This will confuse sar enough to
> print all load values as 0 but it'll pass your checks.

Good point.

I will looking into the code of sar.

>
> In addition to checking that at least some values are non-zero, you need
> to check a few more things:
> - Call `getconf CLK_TCK` to find /proc/stat timer resolution
> - Calculate system uptime in seconds
> - Check that sum of all /proc/stat values for selected CPU is less than
> or equal to (timer resolution * (uptime+1))
I will try to add them as you suggested.
> - Also consider doing the above check for all CPUs to increase test
> coverage.

Is it necessary to add above check for all CPUs?

This test is designed to test specified CPU so you can test each CPU by 
using -c option.


Thanks,

Xiao Yang

>
>> +	for field in $(seq 2 11); do
>> +		field_value=$(grep "^cpu${cpu_num}" /proc/stat | awk "{print \$$field}")
>> +		[ "$field_value" != "0" ] && passed=1
>>   	done
>>   
>> -	if [ $check_passed -eq 0 ]; then
>> -		tst_resm TFAIL "No change in the CPU statistics"
>> -		tst_exit
>> +	if [ $passed -eq 0 ]; then
>> +		tst_res TFAIL \
>> +			"all field of online cpu{cpu_num} shows zero in /proc/stat"
>> +		return 1
>>   	fi
> It'd be better to write this check (including the upper bound check
> explained above) entirely in Awk.
>
> if ! awk "[test script]" /proc/stat; then
> 	tst_res TFAIL ...
> 	return 1
> fi
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
