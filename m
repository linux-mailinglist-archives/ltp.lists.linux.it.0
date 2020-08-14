Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823C244498
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 07:37:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C10273C308B
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 07:37:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 497323C0639
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 07:37:46 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 1CC8210009CC
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 07:37:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,311,1592841600"; d="scan'208";a="98088198"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Aug 2020 13:37:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 99AB54CE34E2;
 Fri, 14 Aug 2020 13:37:35 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 Aug 2020 13:37:37 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595230227-21468-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200813141953.GG13292@yuki.lan>
 <e304a375-2d99-a083-bd7c-2cb6fe2ed314@cn.fujitsu.com>
 <20200813152536.GH13292@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <b7d3de64-af0f-f384-565f-5f11dc53eb38@cn.fujitsu.com>
Date: Fri, 14 Aug 2020 13:37:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813152536.GH13292@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 99AB54CE34E2.A01DE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] syscalls/msgrcv09: Add error test for
 MSG_COPY flag
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

Hi Cyril


> Hi!
>>>> +static struct tst_test test = {
>>>> +	.needs_tmpdir = 1,
>>>> +	.needs_root = 1,
>>>> +	.needs_kconfigs = (const char *[]) {
>>>> +		"CONFIG_CHECKPOINT_RESTORE",
>>>> +		NULL
>>>> +	},
>>>> +	.min_kver = "3.8.0",
>>>> +	.tcnt = ARRAY_SIZE(tcases),
>>>> +	.test = verify_msgrcv,
>>>> +	.setup = setup,
>>>> +	.cleanup = cleanup,
>>>> +};
>>>
>>> Do we need both min_kver and CONFIG_CHECKPOINT_RESTORE? Wouldn't be
>>> CONFIG_CHECKPOINT_RESTORE enough?
>> I think we need both because the CONFIG_CHECKPOINT_RESTORE macro was not
>> introduced since 3.8. Before 3.8, we can enable this config but the
>> kernel does not support this MSG_COPY FLAG.
>> also using "CONFIG_CHECKPOINT_RESTORE=y" is better.
> 
> Ah, makes sense. I wonder if this worth a comment in the top level
> test description.
In my personal habit, I think a comment is better becuase this is more 
friendly for user.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
