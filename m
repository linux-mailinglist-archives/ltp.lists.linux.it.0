Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A08341D06D5
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:03:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68E923C23BF
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 08:03:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ECE963C21AE
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:03:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D37FD14016FC
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:03:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,386,1583164800"; d="scan'208";a="91978576"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 14:03:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0F35D4BCC8A2;
 Wed, 13 May 2020 14:03:24 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 14:03:22 +0800
Message-ID: <5EBB8DAA.5080509@cn.fujitsu.com>
Date: Wed, 13 May 2020 14:03:22 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <20200513012626.1571-2-yangx.jy@cn.fujitsu.com>
 <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
In-Reply-To: <20200513055533.ipmghf2oacc22mzy@vireshk-i7>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0F35D4BCC8A2.A0B2B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/pidfd_open*.c: Drop .min_kver flag
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

On 2020/5/13 13:55, Viresh Kumar wrote:
> On 13-05-20, 09:26, Xiao Yang wrote:
>> 1) Drop .min_kver flag directly because of two following reasons:
>>     a) pidfd_open(2) may be backported to old kernel which is less
>>        than v5.3 so kernel version check is meaningless.
>>     b) tst_syscall() can report TCONF if pidfd_open(2) is not supported.
>> 2) For pidfd_open03.c, check if pidfd_open(2) is not supported before
>>     calling fork().
>>
>> Signed-off-by: Xiao Yang<yangx.jy@cn.fujitsu.com>
>> Reviewed-by: Viresh Kumar<viresh.kumar@linaro.org>
>
> You can not apply someone's tag without them explicitly asking you to.
Hi Viresh,

OK, I can remove it.

>
>> ---
>>   testcases/kernel/syscalls/pidfd_open/pidfd_open01.c |  1 -
>>   testcases/kernel/syscalls/pidfd_open/pidfd_open02.c |  1 -
>>   testcases/kernel/syscalls/pidfd_open/pidfd_open03.c | 12 +++++++++++-
>>   3 files changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> index ba1580bc7..6f5114f68 100644
>> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> @@ -29,6 +29,5 @@ static void run(void)
>>   }
>>
>>   static struct tst_test test = {
>> -	.min_kver = "5.3",
>>   	.test_all = run,
>>   };
>> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
>> index dc86cae7a..a7328ddfe 100644
>> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
>> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
>> @@ -51,7 +51,6 @@ static void run(unsigned int n)
>>   }
>>
>>   static struct tst_test test = {
>> -	.min_kver = "5.3",
>>   	.tcnt = ARRAY_SIZE(tcases),
>>   	.test = run,
>>   	.setup = setup,
>> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
>> index 48470e5e1..9e27ee75e 100644
>> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
>> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open03.c
>> @@ -49,8 +49,18 @@ static void run(void)
>>   		tst_res(TPASS, "pidfd_open() passed");
>>   }
>>
>> +static void setup(void)
>> +{
>> +	int pidfd = -1;
>> +
>> +	// Check if pidfd_open(2) is not supported
>> +	pidfd = tst_syscall(__NR_pidfd_open, getpid(), 0);
>> +	if (pidfd != -1)
>> +		SAFE_CLOSE(pidfd);
>> +}
>> +
>
> This only fixes the 3rd test, the other two will have an issue now.

Could you tell which issue happen? Thanks a lot.
The other two don't need the extra check because the implementation of 
pidfd_open() can do it well.  For 3rd test, I want to check the support 
of pidfs_open() before doing fork().

Thanks,
Xiao Yang
>
>>   static struct tst_test test = {
>> -	.min_kver = "5.3",
>> +	.setup = setup,
>>   	.test_all = run,
>>   	.forks_child = 1,
>>   	.needs_checkpoints = 1,
>> --
>> 2.21.0
>>
>>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
