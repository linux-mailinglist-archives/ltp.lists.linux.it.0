Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB83D1E57
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:37:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4409A3C61EF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 08:37:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A7F83C5A5A
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:37:28 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8376E600D6D
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 08:37:27 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D244B9FC89;
 Thu, 22 Jul 2021 06:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626935844; bh=Dp+DDWyDqu4OUbnVog2PPHihreSG8pMgC0EObjvDMOs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=LKh4dAQEkIqlJWB/aa+91ED8UDTQjnPl6iGyfUmZoUGH9SMXqiPyMipyX/PfXjEOB
 Wyi4Yhv+rpoBWqeJoO336a03sRWU8//L4sRwAR4Zm74VQpgdB/fKXk5dubjgePl/77
 8+2ePMvz0xyYpPqVEyot7HLORux6yTNG3lJ3vyZM=
To: Leo Liang <ycliang@andestech.com>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
 <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
 <20210722063232.GA28553@andestech.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3d17ca93-3c93-894c-77d2-0b588fce3dad@jv-coder.de>
Date: Thu, 22 Jul 2021 08:37:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722063232.GA28553@andestech.com>
Content-Language: en-US
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: "richiejp@f-m.fm" <richiejp@f-m.fm>,
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?=
 <alankao@andestech.com>, "metan@ucw.cz" <metan@ucw.cz>,
 "ycliang@cs.nctu.edu.tw" <ycliang@cs.nctu.edu.tw>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Leo,


On 7/22/2021 8:32 AM, Leo Liang wrote:
> Hi Joerg,
> On Thu, Jul 22, 2021 at 12:35:59PM +0800, Joerg Vehlow wrote:
>> Hi,
>>
>> On 7/21/2021 4:37 PM, Petr Vorel wrote:
>>> Hi Leo,
>>>
>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>>>
>>>>    	rmdir cgroup/0 cgroup/1
>>>> -	umount cgroup/
>>>> +	tst_umount cgroup/	# Avoid possible EBUSY error
>>>>    }
>>>>    #---------------------------------------------------------------------------
>>>> @@ -193,7 +193,7 @@ test3()
>>>>    	wait $pid2 2>/dev/null
>>>>    	rmdir $cpu_subsys_path/0 2> /dev/null
>>>> -	umount cgroup/ 2> /dev/null
>>>> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
>>> I'd prefer: # keep "/" to avoid possible EBUSY error
>>> But that can be changed before merge.
>>>
>>> More I'm interested if other maintainers agree with me about this approach.
>>> (keep / here instead of in tst_umount())
>> I had a first look at this patches and was curious, what the reasoning
>> behind the "/" is.
>> The comment you suggest is wrong. The / was introduced to prevent
>> unmounting some other mountpoint,
>> where the device was cgroup.
>> Imho the approach of adding a / to the end was wrong and intransparent.
>> I would rather use "./cgroup" or "$PWD/cgroup".
>> If possible, I'd actually change tst_umount, to always unmount the
>> mountpoint and not the device, i.e. if the given path is not an absolute
>> path, make it absolute (e.g. by prepending $PWD").
>> This way the check if the mountpoint exist wouldn't be the fuzzy thing
>> it is right now.
>>
>> As for the comment ("# Avoid possible EBUSY error"): Honestly I'd drop
>> it and like in the c-api make using tst_umount instead of plain umount
>> the default, for the same reasons.
> Got it!
> Thanks for the detailed explanation!
> I will send a v5 patch for this modification.
> (making the path absolute inside tst_umount)
This was just my opinon. I am not in the place to say how it should be done.
Maybe wait for replies from the maintainers.
Additionally, all usages of tst_umount have to be checked, to ensure 
they are passing a mountpoint and not a device, otherwise my proposal 
cannot be implemented in tst_umount.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
