Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B659B30D69E
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 10:49:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C8E63C739E
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 10:49:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 12B733C5E21
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 10:49:10 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3C1E11A000B9
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 10:49:08 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="104144641"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Feb 2021 17:49:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2D7994CE6D88;
 Wed,  3 Feb 2021 17:49:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Feb 2021 17:49:05 +0800
Message-ID: <601A71A4.4000600@cn.fujitsu.com>
Date: Wed, 3 Feb 2021 17:49:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <YBLbV2EhTWKihyE2@yuki.lan>
In-Reply-To: <YBLbV2EhTWKihyE2@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2D7994CE6D88.ADA28
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/3] syscalls/mallinfo03: Add an overflow test
 when setting 2G size
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
>> +void test_mallinfo(void)
>> +{
>> +	struct mallinfo info;
>> +	char *buf;
>> +	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
>> +
>> +	buf = SAFE_MALLOC(size);
>
> If nothing else use of SAFE_MALLOC() here is wrong. The call may
> potentionally fail and return NULL since we are passing overly large
> value there.
>
> For example it will fail if memory overcommit is disabled and there is
> not enough free memory.
>
> So we should, at least, use malloc() instead and skip the test if NULL
> was returned.
>
Agree. Will do it in v2.
>> +	info = mallinfo();
>> +	if (info.hblkhd<  0) {
>> +		print_mallinfo("Test malloc 2G",&info);
>> +		tst_res(TFAIL, "The member of struct mallinfo overflow, we should use mallinfo2");
>> +	} else {
>> +		/*We will never get here*/
>> +		tst_res(TPASS, "The member of struct mallinfo doesn't overflow");
>> +	}
>> +	free(buf);
>> +}
>> +
>> +static struct tst_test test = {
>> +	.test_all = test_mallinfo,
>> +};
>> +
>> +#else
>> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
>> +#endif
>> --
>> 2.23.0
>>
>>
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
