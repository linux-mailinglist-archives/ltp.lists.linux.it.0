Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 894762FDF3E
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 03:21:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B4AC3C8821
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 03:21:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 120383C31D5
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 03:21:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5066F20034E
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 03:21:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,362,1602518400"; d="scan'208";a="103680493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jan 2021 10:21:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 889BF4CE4B3E;
 Thu, 21 Jan 2021 10:21:08 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 21 Jan 2021 10:21:08 +0800
Message-ID: <6008E512.50704@cn.fujitsu.com>
Date: Thu, 21 Jan 2021 10:21:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
 <20210112020227.11775-3-yangx.jy@cn.fujitsu.com> <YAgHUvIge6svN0gu@yuki.lan>
In-Reply-To: <YAgHUvIge6svN0gu@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 889BF4CE4B3E.AC870
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls: Take use of TST_EXP_PASS_SILENT
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

On 2021/1/20 18:34, Cyril Hrubis wrote:
> Hi!
>> diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
>> index 6c17a7c7c..af088e2fc 100644
>> --- a/testcases/kernel/syscalls/capget/capget01.c
>> +++ b/testcases/kernel/syscalls/capget/capget01.c
>> @@ -32,8 +32,10 @@ static void verify_capget(unsigned int n)
>>   	hdr->version = tc->version;
>>   	hdr->pid = pid;
>>
>> -	TST_EXP_PASS(tst_syscall(__NR_capget, hdr, data),
>> +	TST_EXP_PASS_SILENT(tst_syscall(__NR_capget, hdr, data),
>>   	             "capget() with %s", tc->message);
>> +	if (!TST_PASS)
>> +		return;
>>
>>   	if (data[0].effective&  1<<  CAP_NET_RAW)
>>   		tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");
> I do not agree with the change in the capget01 here since there are
> really two testcases there and the test was producing the same amount of
> TPASS messages before the change to the TST_EXP_PASS() as well.
Hi Cyril,

Running  capget01 with TST_EXP_PASS() shows:
--------------------------------------------------------
capget01.c:35: TPASS: capget() with LINUX_CAPABILITY_VERSION_1 passed
capget01.c:41: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE
capget01.c:35: TPASS: capget() with LINUX_CAPABILITY_VERSION_2 passed
capget01.c:41: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE
capget01.c:35: TPASS: capget() with LINUX_CAPABILITY_VERSION_3 passed
capget01.c:41: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE

Summary:
passed   6
--------------------------------------------------------

Running  capget01 with TST_EXP_PASS_SILENT() shows:
--------------------------------------------------------
capget01.c:43: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE
capget01.c:43: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE
capget01.c:43: TPASS: capget() doesn't get CAP_NET_RAW as expected in PE

Summary:
passed   3
--------------------------------------------------------

If you want to keep two TPASS for a subtest, how about merging two TPASS 
into one? like this:
------------------------------------------------------------------------------------------
capget01.c:43: TPASS: capget() with LINUX_CAPABILITY_VERSION_1 doesn't 
get CAP_NET_RAW as expected in PE
capget01.c:43: TPASS: capget() with LINUX_CAPABILITY_VERSION_2 doesn't 
get CAP_NET_RAW as expected in PE
capget01.c:43: TPASS: capget() with LINUX_CAPABILITY_VERSION_3 doesn't 
get CAP_NET_RAW as expected in PE

Summary:
passed   3
------------------------------------------------------------------------------------------ 

BTW, I just want to avoid many TPASS for a subtest.

Best Regards,
Xiao Yang
> Other than that the patchset is fine.
>
> So with the capget change removed you can add my:
>
> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
