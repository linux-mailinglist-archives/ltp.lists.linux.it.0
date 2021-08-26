Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA313F8628
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:10:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B6803C2F12
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:10:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20C283C2E39
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:10:56 +0200 (CEST)
Received: from smtpbg511.qq.com (smtpbg511.qq.com [203.205.250.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B93041401189
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:10:51 +0200 (CEST)
X-QQ-mid: bizesmtp41t1629976246taa7p1ub
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 26 Aug 2021 19:10:45 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00H0000000
X-QQ-FEAT: Z55rH4EoEBEP3vjHr/UZfFRT4jsTYlqccwtIpUUSNnDXiXVVsHBPbTLsRyaGF
 OiigTBATJb5kAn7sE80fSk0vFap5oXlGQA2TG3tmhvxXx9GY5a30iCBfae88hod+Bf1Bqwn
 XAQ4HfcHDHKGfKdgWoFnrDiY0T63SktNsXJOlZTxyh8NfEKKEXUoxCbtUd6+/hvrJk3AZzt
 DJCfhMtS4nKRs2mnMeISrUEwZEDoP6Ay5jM1GSgpPkgpz7TkKKDw86xoDa4Z3UAElCKjDex
 ugdOnGNcCgmbTsXfcOnXbk9oiseoLALeKCUaairghqopKkLiVACKzaDxyF07qBnGcn6QS8t
 fokIdhD
X-QQ-GoodBg: 2
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210813072657.21976-1-zhanglianjie@uniontech.com>
 <YSZTn5KKmOgFINNX@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <4b6bac9e-1f35-fabc-a6ef-1c52bf9cdccc@uniontech.com>+5943B6CE1329538A
Date: Thu, 26 Aug 2021 19:10:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YSZTn5KKmOgFINNX@yuki>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] syscalls/clone05: Convert to new API
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

Hi,

>> +static void verify_clone(void)
>> +{
>> +	TST_EXP_POSITIVE(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
>> +					CHILD_STACK_SIZE, child_stack), "clone with vfork");
>>
>> -	free(child_stack);
>> +	if (!TST_PASS)
>> +		return;
>>
>> -	cleanup();
>> -	tst_exit();
>> +	TST_EXP_PASS(!child_exited);
> 
> This is misuse of the macro, since the macro checks for -1 on failure
> and we will get 1 on failure here.
> 
> I guess that we should add TST_EXP_VAL() instead for cases like this and
> we would do:
> 
> 	TST_EXP_VAL(child_exited, 1);
> 
> Will you send a patch or should I add it?
> 
I will send patch to add TST_EXP_VAL, thank you.

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
