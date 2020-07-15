Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DC22155B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:46:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 799B83C4F48
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 21:46:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id AA3793C22AD
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:46:41 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B1BA41000B67
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 21:46:40 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9CE6B20B4909;
 Wed, 15 Jul 2020 12:46:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9CE6B20B4909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1594842399;
 bh=d3CV4BL7ujSFiwhyOnB+HGNOe44sG+z8CNjbDopcBCc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ip6my/otIOnxnQ0GXpo01z1P/2A9T31qikBqEQf4K4I4UeuiMDHf1crTbQ+cpmwdv
 5CohA8ZVRhmtwN8sLln9Dft/7GvAzOzEQqVof05OaoQM/mB9OAESNfu8xbbLDE9GbF
 b89xdFfzqVRPRJ6Z0Dz2JeUjqQSUUqHA44KGtBLA=
To: Petr Vorel <pvorel@suse.cz>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
 <20200715081857.GB10916@dell5510>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <3ec443ab-f9ed-a435-2a61-e1b7c8f513dd@linux.microsoft.com>
Date: Wed, 15 Jul 2020 15:46:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200715081857.GB10916@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


On 7/15/20 4:18 AM, Petr Vorel wrote:
>> +++ b/testcases/kexec/utils.sh
>> @@ -0,0 +1,47 @@
>> +#!/bin/sh
>> +
>> +install() {
>> +    local arg="$1"
>> +
>> +    if [ ! -d "/etc/init.d" ]; then
>> +        mkdir /etc/init.d
>> +    fi
> I'm not sure if tests like this are suitable for LTP.
> Ideal LTP test is a normal test, which is able to run with runltp, cleanup after
> itself and use LTP C or/and shell API. LTP is full of tests which needs special
> handling and thus not being run, not sure if it's a good idea to introduce yet
> another one.
>
> Also test shouldn't not significantly modify SUT to make it unbootable, which
> I'm not sure in this case. This is a big difference to kselftests which are
> meant to help during kernel development which somehow expects some system
> modifications (as you install your custom build kernel).
>
> I wonder if using QEMU would help to implement this test while not touching SUT
> (thus be able to run this test with runltp). If you miss something in LTP API
> just let us know.
Using qemu is an interesting idea, but would be difficult to generalize.

I actually do agree with you that a test like this may not be 
appropriate for
LTP since it's so separate and alien to the rest of the LTP suite.

I need to confirm internally before I make a decision here, but is there
a better place to put a test like this?


Thanks for your review,

Lachlan :)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
