Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8E03D1D16
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 06:36:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A64ED3C5A4C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jul 2021 06:36:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EA0E3C1F4E
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 06:36:02 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EA234600D18
 for <ltp@lists.linux.it>; Thu, 22 Jul 2021 06:36:01 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3A6879F801;
 Thu, 22 Jul 2021 04:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626928559; bh=0DOMuxIRupWCtITwe+fh/AZj1hz5zo8czWF2IDWUt/g=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=YkVq8yYVYoYXg1Em1aZa+RNH7r3Ndf/VmLUPb8yETEn6AXe1NoBS59os7tIKtsg5o
 XdUI+gjkSmJ+EW7gicr/8/KY0KtkBFzmbGeTJI6EHmbg6WdrdCrx7gAL+z9x4z+/Fh
 m79ChfubOGB3lT2Dc3E2j5U8mRHWZzQDmbdmwwcs=
To: Petr Vorel <pvorel@suse.cz>, Leo Liang <ycliang@andestech.com>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
Date: Thu, 22 Jul 2021 06:35:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPgxJwx795fhXgLa@pevik>
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
Cc: richiejp@f-m.fm, Alan Quey-Liang Kao <alankao@andestech.com>, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On 7/21/2021 4:37 PM, Petr Vorel wrote:
> Hi Leo,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>>   	rmdir cgroup/0 cgroup/1
>> -	umount cgroup/
>> +	tst_umount cgroup/	# Avoid possible EBUSY error
>>   }
>>   #---------------------------------------------------------------------------
>> @@ -193,7 +193,7 @@ test3()
>>   	wait $pid2 2>/dev/null
>>   	rmdir $cpu_subsys_path/0 2> /dev/null
>> -	umount cgroup/ 2> /dev/null
>> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> I'd prefer: # keep "/" to avoid possible EBUSY error
> But that can be changed before merge.
>
> More I'm interested if other maintainers agree with me about this approach.
> (keep / here instead of in tst_umount())
I had a first look at this patches and was curious, what the reasoning 
behind the "/" is.
The comment you suggest is wrong. The / was introduced to prevent 
unmounting some other mountpoint,
where the device was cgroup.
Imho the approach of adding a / to the end was wrong and intransparent. 
I would rather use "./cgroup" or "$PWD/cgroup".
If possible, I'd actually change tst_umount, to always unmount the 
mountpoint and not the device, i.e. if the given path is not an absolute 
path, make it absolute (e.g. by prepending $PWD").
This way the check if the mountpoint exist wouldn't be the fuzzy thing 
it is right now.

As for the comment ("# Avoid possible EBUSY error"): Honestly I'd drop 
it and like in the c-api make using tst_umount instead of plain umount 
the default, for the same reasons.

>>   	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
>>   		tst_res TFAIL "lockdep BUG was found"
>> @@ -254,7 +254,7 @@ test5()
>>   	mount -t cgroup none cgroup 2> /dev/null
>>   	mkdir cgroup/0
>>   	rmdir cgroup/0
>> -	umount cgroup/ 2> /dev/null
>> +	tst_umount cgroup/ 2> /dev/null		# Avoid possible EBUSY error
> I'd drop stderr redirection here. It was here originally, but I suppose it's not
> needed when using tst_umount. But that can be done during merge.
+1

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
