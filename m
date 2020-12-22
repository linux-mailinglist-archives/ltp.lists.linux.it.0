Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D722E0F97
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 22:05:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 684B53C5713
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 22:05:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A305B3C2978
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 22:05:34 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BA5FA10005A0
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 22:05:33 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id BB74B20B83DE;
 Tue, 22 Dec 2020 13:05:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BB74B20B83DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1608671131;
 bh=vVNNNHyetr16pX3MtASOAmYlDz+R5CLNJIU85mpoRec=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JAqmDzvaKTqGIrG+bJAbd8Vh8dMVI590viDaFuZCR0bVF505xQSVC/EvFc4Xfdm7I
 V4jPwVQsVgMr8peGePqZIB6cfG++EkS5kZ0WHXDncFWDL8767x6u95/Qe37AhphHuM
 c8X/NNgirlOXvb+IjQm2VS0wpFypQATkZsoc2b8U=
To: Petr Vorel <pvorel@suse.cz>
References: <20200928194730.20862-1-nramas@linux.microsoft.com>
 <20200928194730.20862-2-nramas@linux.microsoft.com> <X9z2+nXBdTMqHPgD@pevik>
 <0db52810-c7e2-713a-80ed-748e8bb3db74@linux.microsoft.com>
 <20201222195030.GA141126@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <70cce4b0-3b4c-a7b9-9323-8d06d6a188f2@linux.microsoft.com>
Date: Tue, 22 Dec 2020 13:05:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201222195030.GA141126@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-17.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/1] ima: Add test for selinux measurement
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
Cc: paul@paul-moore.com, stephen.smalley.work@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12/22/20 11:50 AM, Petr Vorel wrote:

> 
>>> @Lakshmi
>>> TL;DR: I added some fixes in my fork, branch ima/selinux.v2.draft,
>>> https://github.com/pevik/ltp/commits/ima/selinux.v2.draft
> 
>>> + added 3 additional commits, one of them as you as the author.
>>> I moved some functions to testcases/lib/tst_security.sh, renamed them.
>>> Can you please have a look and test? I don't have any SELinux machine.
> 
>> I'll take a look at the changes in your branch and test it with SELinux
>> enabled.
> Thanks!
> 
>>> @Mimi, all: any comment to this test? My changes are just LTP cleanup
>>> so you can comment it on this patchset.
>>> I suppose you get to this in January.
> 
>>> Some notes for my changes:
> 
>>> As files are quite similar (checks etc), I put both tests into single
>>> file ima_selinux.sh.
>> This should be fine.
> 
>> The reason I put the tests in different files was because I couldn't find a
>> way to run the tests independently (i mean - say, run the SELinux policy
>> measurement test but not the state measurement test or vice-versa).
> 
> Why do you need to run just one of them?
> If you really need to separate them (e.g. to require different OS setup for
> each) you could have 2 functions in single file, but run only one of them
> (TST_CNT not set, which means TST_CNT=1), doing selection with getopt switch?
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#233-optional-command-line-parameters

This is good to know Petr. Thanks for the info.

> 
>>>> New functionality is being added to IMA to measure data provided by
>>>> kernel components. With this feature, IMA policy can be set to enable
>>>> measuring data provided by Linux Security Modules (LSM). Currently one
>>>> such LSM namely selinux is being updated to use this functionality.
>>>> This new functionality needs test automation in LTP.
> 
>>>> Add test cases which verify that the IMA subsystem correctly measures
>>>> the data provided by selinux.
> 
>>> Could you please put into commit message and test kernel commit hash relevant
>>> for the test. Is that 8861d0af642c646c8e148ce34c294bdef6f32f6a (merged into
>>> v5.10-rc1) or there are more relevant commits?
> 
>> The IMA hook to measure kernel critical data + SELinux measurement changes
>> are still being reviewed. Tushar has posted v9 of the patch set.
> Thanks for info (note for myself:
> https://lore.kernel.org/linux-integrity/20201212180251.9943-1-tusharsu@linux.microsoft.com/)
> OK, not yet merged to mainline. It's good you send patches early (speed up the
> inclusion to LTP), but we should merge them into LTP once it's at least
> already in Mimi tree prepared for sending to Linus.
> 
> Feel free to Cc me in your next kernel patches (It *can* help to speedup the inclusion to LTP).

Definitely.

> 
>>> ...
>>>> +### IMA SELinux test
>>>> +
>>>> +To enable IMA to measure SELinux state and policy, `ima_selinux_policy.sh`
>>>> +and `ima_selinux_state.sh` require a readable IMA policy, as well as
>>>> +a loaded measure policy with
>>>> +`measure func=CRITICAL_DATA data_sources=selinux template=ima-buf`
>>> I put this into
>>> testcases/kernel/security/integrity/ima/datafiles/ima_selinux/selinux.policy
>>> and mention it in docs.
>> Sounds good - Thanks.
> 
>> "template=ima_buf" is no longer needed in the IMA policy rule since
>> "ima_buf" is the default template for buffer measurement now. I will update
>> "datafiles/ima_selinux/selinux.policy" file.
> 
> +1
> 
> ...
> 
>> Thanks a lot for your help Petr. Appreciate it.
> yw, thanks for your contributions.
> 

thanks,
  -lakshmi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
