Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB1E4896E1
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 12:01:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D8D33C9378
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 12:01:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03EEB3C92E2
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 12:01:02 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D9D91001287
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 12:00:53 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.100.83])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 567099F75E;
 Mon, 10 Jan 2022 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1641812452; bh=gQXwcmX3WM8z4qMJV5g1BgC3aF0Zhao4iuPVi4Ug51U=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=NT6K/F1oc0aFadzYVGqPkoD3zfdqrEBGOECgMGIvzv++wkJXrA1L4U67CVxQYzrJb
 huPYnmQmsgEDrHHuqRtBLDpJBfc5a99tMVSgn7Gn1Ro4FpqwkZita0rwi4VyIq+JNB
 pUxPgVlKAjLpFAMYq9MvtS1xc/NEQF92qEwDHh/I=
Message-ID: <4b61c5e9-0976-9e5c-543f-f0ad29307b24@jv-coder.de>
Date: Mon, 10 Jan 2022 12:00:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: rpalethorpe@suse.de
References: <20211124080413.768368-1-lkml@jv-coder.de> <87tug2kldc.fsf@suse.de>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: <87tug2kldc.fsf@suse.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] cpuset_regression_test: Fix test,
 if cpuset groups exist already
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

Hi,


Am 11/24/2021 um 9:24 AM schrieb Richard Palethorpe:
> Hello Joerg,
> 
> Joerg Vehlow <lkml@jv-coder.de> writes:
> 
>> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>>
>> Fix three errors:
>>   1. read -d is not posix, but not even required,
>>      because find and read work line-based
>>   2. Setting cpuset.cpus to an empty string is not allowed.
>>      -> If there are cpuset groups defined already, we need at least two cpus.
>>      One is used for the test, the other one is used for existing groups.
>>   3. Existing cgroup hierarchies were not handled correctly.
>>      When setting the cpuset.cpus, it must be done first for parent groups,
>>      otherwise cpu constraints for can be violated.
>>
>> Fixes: 6950e96eabb2 ("cpuset_regression_test: Allow running, if groups exist")
>> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 
> Looks Good!
> 
> Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>
> 

a little ping for merging this

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
