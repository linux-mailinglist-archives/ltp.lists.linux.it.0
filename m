Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56205B0BFE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:55:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06A0B3C2082
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:55:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 934783C0733
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:55:21 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1F8041A0A32F
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:55:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C6E11000;
 Thu, 12 Sep 2019 02:55:18 -0700 (PDT)
Received: from [10.1.197.50] (e120937-lin.cambridge.arm.com [10.1.197.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7563F59C;
 Thu, 12 Sep 2019 02:55:17 -0700 (PDT)
To: Li Wang <liwang@redhat.com>, cfamullaconrad@suse.com
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
 <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
From: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
Date: Thu, 12 Sep 2019 10:55:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

Hi

On 12/09/2019 10:34, Li Wang wrote:
>>>>> I also wonder if it is worth somehow put this minimum-enforce
>>>>> mechanism inside the framework itself
>>>>> instead that hardcoding it in this specific test (unless you
>>>>> already mean to do it this way...
>>>>> and I misunderstood)
>>>>
>>>> Yes, I was thinking about it as well.
>>>> LTP_TIMEOUT_MUL should be reserved for users, tests should use
>>>> LTP_TIMEOUT_MUL_MIN,
>>>> check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN
>>>> would be in
>>>> _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9
>>>> (VIRT_PERF_THRESHOLD_MIN).
>>>
>>> +1 agree.
>>
>> I have a general question. What do we try to get with
>> LTP_TIMEOUT_MUL_MIN? From my perspective, we try to set a minimum
>> timeout value. Isn't it the value (struct tst_test*)->timeout ?
>>
> 
> Well, the (struct tst_test*)->timeout is the default minimum value to set a
> timeout, but for some test case(e.g memcg_stress_test.sh), they required
> time should be higher than the default. So as we discussed in the above
> mails, we're planning to introduce a new variable LTP_TIMEOUT_MUL_MIN to
> set as a new minimum value for test timeout. The operation will be
> encapsulate in function  _tst_setup_timer().
> 
> 
> 
>>
>> I'm missing such configuration value for shell. Is there one?
>>
> 
> No, we don't have it so far.
> 
> 
>>
>> Or do we need to increase timeout in smaller steps and that is why we
>> need this LTP_TIMEOUT_MUL_MIN?
>>
> 
> Hmm, what we want to do is:
> 
> If a testcase needs timeout value is larger than the default (300 sec), we
> could only define a variable LTP_TIMEOUT_MUL_MIN in the test, then the
> _tst_setup_timer() will detect if LTP_TIMEOUT_MUL_MIN is valid and reset
> the minimum time for the test.
> 
> @Petr and @Cristian, If I misunderstand anything, please correct me.

my understanding was that:

- we should already be able to set a non default per-test timeout using
  the existing global LTP_TIMEOUT_MUL (and we are)

- in this test we hardcoded such LTP_TIMEOUT_MUL to 7 because is the minimum sane
  value for this test (less than 7 and it fails 100%)

- we want to allow again the user to specify its own LTP_TIMEOUT_MUL if he wants
  BUT also being able to enforce on a test by test basis a MINIMUM allowed value:
  so we would define LTP_TIMEOUT_MUL_MIN=7 here, and then a user would be free to 
  run LTP with a different global LTP_TIMEOUT_MUL but when running this test
  
  + if LTP_TIMEOUT_MUL < LTP_TIMEOUT_MUL_MIN ===> use local LTP_TIMEOUT_MUL_MIN
  + if LTP_TIMEOUT_MUL >= LTP_TIMEOUT_MUL_MIN  ===> use global LTP_TIMEOUT_MUL

This way you don't break specific tests' needs while allowing the user to global reduce
run-time....now basically the user cannot enforce a higher timeout on this test
using the global LTP_TIMEOUT_MUL even if it should be allowed to since this wouldn't
break the test.

...unless I misunderstood too o_O :D


Thanks

Cristian





> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
