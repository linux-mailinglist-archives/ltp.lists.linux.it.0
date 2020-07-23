Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82B22B82E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 22:52:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9312C3C4D5C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 22:52:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F17143C061B
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 22:52:28 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C77FD600B7D
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 22:51:09 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9D38320B4908;
 Thu, 23 Jul 2020 13:52:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9D38320B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1595537546;
 bh=MkJad2TJtcjCuvlskHWJdWE/0toajwPGQ4XvgUMrNhQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P2ChGz+GBFQ/0Aprhq7MGyO9UWO8BTCwT/WPH1aGV5z9chckoaV8TPqgJB0EX04Rr
 xcmg5yRmnnEbI2nbcffcEZE6OlLC9P+tjZgpF6V0elAAmE3on6FVmjKVQ73GpmWuDx
 6J95vnsPWls6PA3xrEO8xQagXuQC2QKwmE/6wPwM=
To: Petr Vorel <pvorel@suse.cz>
References: <20200722184739.19460-1-t-josne@linux.microsoft.com>
 <20200723114600.GB31591@dell5510>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <0a970e3c-a10f-f032-eb26-d738bc220458@linux.microsoft.com>
Date: Thu, 23 Jul 2020 16:52:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200723114600.GB31591@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-16.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] IMA: Add test for kexec cmdline measurement
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

Hi Petr,
Thank you for reviewing

On 7/23/20 7:46 AM, Petr Vorel wrote:
> Hi,
>
> ...
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
>> @@ -0,0 +1,121 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (c) 2020 Microsoft Corporation
>> +# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
>> +#
>> +# Verify that kexec cmdline is measured correctly.
>> +
>> +TST_NEEDS_CMDS="kexec sed xargs printf grep tr"
>> +TST_CNT=1
>> +TST_NEEDS_DEVICE=1
>> +
>> +. ima_setup.sh
>> +
>> +# Since the test is executed inside some sort of
>> +# separate shell, *most* environment variables are
>> +# not accessible, so there's no way to set it from
>> +# the outside.
> Do you mean that using this will not work?
> IMA_KEXEC_IMAGE="${IMA_KEXEC_IMAGE:-/boot/vmlinuz-$(uname -r)}"
> I don't understand that as I'm able to set variables even I run some tests in
> dracut.
I tried doing this in the past, and couldn't get it to work, but I just 
tried it again
and was able to get it working. Essentially, what I tried before was
`SOME_VAR="..." sudo runltp ...`, which doesn't work, but `sudo 
SOME_VAR="..." runltp` does pass the variable
to the test. So, that should be added to this patch.
>
> Also writing same docs doc on 2 places is not good. High level info should go to
> README.md, implementation details to shell script.
This is a good point. I'll reorganize the documentation of this patch.
> Please hold on with posting new version. I have several fixes, thus I'd like to
> send it after we sort this (trying to save you time).
Okay :)
> Kind regards,
> Petr
Thanks,
Lachlan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
