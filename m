Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B3B0B79
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:34:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6E513C2084
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:34:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B10843C0733
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:34:03 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 574771000D0A
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:33:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC9F51000;
 Thu, 12 Sep 2019 02:33:59 -0700 (PDT)
Received: from [10.1.197.50] (e120937-lin.cambridge.arm.com [10.1.197.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20B973F59C;
 Thu, 12 Sep 2019 02:33:59 -0700 (PDT)
To: cfamullaconrad@suse.com, Li Wang <liwang@redhat.com>,
 Petr Vorel <pvorel@suse.cz>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
From: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <94524a07-ee29-4d7a-dc0c-8687d59b7318@arm.com>
Date: Thu, 12 Sep 2019 10:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568279073.3621.12.camel@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Clemens

On 12/09/2019 10:04, Clemens Famulla-Conrad wrote:
> On Mon, 2019-09-02 at 10:34 +0800, Li Wang wrote:
>> On Fri, Aug 30, 2019 at 6:46 PM Petr Vorel <pvorel@suse.cz> wrote:
>>>
>>> Hi Cristian,
>>>
>>>> On 30/08/2019 09:50, Petr Vorel wrote:
>>>>> Hi Li,
>>>>> Good point. Something like this could do it:
>>>>> -LTP_TIMEOUT_MUL=7
>>>>> +min_timeout=7
>>>>> +[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout
>>>>> ] && LTP_TIMEOUT_MUL=$min_timeout
>>>>> Unless we test only integers:
>>>>> +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt
>>>>> $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
>>>
>>>
>>>> I would certainly introduce a check on the minimum allowed test-
>>>> timeout and just stick to integers.
>>>> (is it really needed to worry for float multipliers ?)
>>
>> No, I guess the integer division in the shell/C is enough.
>>
>>> Not sure, but it'd be good to have it same for C and for shell.
>>> Otherwise
>>> working variable for C would fail on shell.
>>>
>>>> I also wonder if it is worth somehow put this minimum-enforce
>>>> mechanism inside the framework itself
>>>> instead that hardcoding it in this specific test (unless you
>>>> already mean to do it this way...
>>>> and I misunderstood)
>>>
>>> Yes, I was thinking about it as well.
>>> LTP_TIMEOUT_MUL should be reserved for users, tests should use
>>> LTP_TIMEOUT_MUL_MIN,
>>> check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN
>>> would be in
>>> _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9
>>> (VIRT_PERF_THRESHOLD_MIN).
>>
>> +1 agree.
> 
> I have a general question. What do we try to get with
> LTP_TIMEOUT_MUL_MIN? From my perspective, we try to set a minimum
> timeout value. Isn't it the value (struct tst_test*)->timeout ?
> 
> I'm missing such configuration value for shell. Is there one?
> 
> Or do we need to increase timeout in smaller steps and that is why we
> need this LTP_TIMEOUT_MUL_MIN?
> 

My understanding was that the idea was to allow the user to select its own
LTP_TIMEOUT_MUL at will, while enforcing a minimum per-test LTP_TIMEOUT_MUL_MIN
where needed, since, as an example for this test, reducing LTP_TIMEOUT_MUL < 7
will cause it to fail straight away

Cristian

>>>
>>> I wonder if it'd be useful to have some functionality in C
>>> (ltp_timeout_mul_min
>>> as a struct tst_test, default 1).
>>
>> Yes. But seems no need to involve a new field in struct tst_test,
>> maybe we could complete that in the function tst_set_timeout(int
>> timeout).
>>
>>>
>>>> So that, roughly, in the test
>>>> LTP_TIMEOUT_MUL_MIN=7
>>>> LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-7}
>>>> and somewhere in framework test initialization you enforce it
>>>> (maybe with a warning for the user when overriding its setup)
>>>> [ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt
>>>> $LTP_TIMEOUT_MUL_MIN ] && LTP_TIMEOUT_MUL=$LTP_TIMEOUT_MUL_MIN
>>>
>>> +1. Feel free to send a patch.
>>
>> Agree.
>>
>> -- 
>> Regards,
>> Li Wang
>>
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
