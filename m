Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F9A3360
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 11:07:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B89EE3C2045
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 11:07:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B68543C1D01
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 11:07:31 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E2278200AF3
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 11:07:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F53B344;
 Fri, 30 Aug 2019 02:07:29 -0700 (PDT)
Received: from [10.1.197.50] (e120937-lin.cambridge.arm.com [10.1.197.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E147A3F718;
 Fri, 30 Aug 2019 02:07:28 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
From: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
Date: Fri, 30 Aug 2019 10:07:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830085036.GA27453@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 30/08/2019 09:50, Petr Vorel wrote:
> Hi Li,
> 
> Good point. Something like this could do it:
> -LTP_TIMEOUT_MUL=7
> +min_timeout=7
> +[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
> 
> Unless we test only integers:
> +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
> 

I would certainly introduce a check on the minimum allowed test-timeout and just stick to integers.
(is it really needed to worry for float multipliers ?)

I also wonder if it is worth somehow put this minimum-enforce mechanism inside the framework itself
instead that hardcoding it in this specific test (unless you already mean to do it this way...
and I misunderstood)

So that, roughly, in the test

LTP_TIMEOUT_MUL_MIN=7
LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-7}

and somewhere in framework test initialization you enforce it (maybe with a warning for the user when overriding its setup)

[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $LTP_TIMEOUT_MUL_MIN ] && LTP_TIMEOUT_MUL=$LTP_TIMEOUT_MUL_MIN

(but my LTP framework memories are a bit blurred now...so feel free to ignore if it is not feasible or practical)

Thanks

Cristian

> But that'd require using only integers, while C allows to use floating point
> numbers :(. We can
> 1) either live with the limitation of integers for shell (+ document it)
> 2) or use awk or bc (but that's external dependency for shell tests (currently
> tst_test.sh requires: cut, tr, wc; tst_net.sh requires awk and ip; so I'd be for
> awk dependency; dependencies should be documented as well)
> 3) write simple utility (tst_float_cmp.c) to compare strings for us
> 
> Of course, we can test only integers:
> +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
> 
> Also, C code requires LTP_TIMEOUT_MUL > 1 in tst_set_timeout().
> We don't have this check. Again, adding it brings problem with float number.
> 
> Kind regards,
> Petr
> 
>> On Fri, Aug 30, 2019 at 2:12 AM Petr Vorel <pvorel@suse.cz> wrote:
> 
>>> While it's good to increase the default LTP_TIMEOUT_MUL value, give user
>>> a chance to change it.
> 
>> It's a good proposal, but one thing we need to consider that there is
>> possible to pass a small timeout value(<5mins) from the user. So what
>> about set a condition judgment which only accepts time value which >=
>> 7?
> 
>>>  # Each test case runs for 900 secs when everything fine
>>>  # therefore the default 5 mins timeout is not enough.
> 
>> Here the code comments reminder this.
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
