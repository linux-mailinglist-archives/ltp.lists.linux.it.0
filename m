Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E04144994
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 02:52:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAEAA3C245D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 02:52:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 23CED3C2360
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 02:52:09 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BC8B11A00643
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 02:52:07 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,347,1574092800"; d="scan'208";a="82360382"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 09:52:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7DD965010EC0;
 Wed, 22 Jan 2020 09:42:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 09:51:57 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1579420198-29651-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200121151342.GD6337@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6be1ac4c-1f72-d32a-8052-3035af5a4fcc@cn.fujitsu.com>
Date: Wed, 22 Jan 2020 09:51:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200121151342.GD6337@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7DD965010EC0.AE2B2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/add_key05: add new test for the
 length of payload
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



Hi
> Hi!
>> Seeing add_key manpages, the lenth of payload for "user"/"logon"
>> is 32767, this value is up tp 1M for "big_key". For "keyring" type
>> , this value is zero.
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   runtest/syscalls                              |  1 +
>>   testcases/kernel/syscalls/add_key/.gitignore  |  1 +
>>   testcases/kernel/syscalls/add_key/add_key05.c | 99 +++++++++++++++++++
>>   3 files changed, 101 insertions(+)
>>   create mode 100644 testcases/kernel/syscalls/add_key/add_key05.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index f58fefe17..830dfc8b7 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -18,6 +18,7 @@ add_key01 add_key01
>>   add_key02 add_key02
>>   add_key03 add_key03
>>   add_key04 add_key04
>> +add_key05 add_key05
>>   
>>   adjtimex01 adjtimex01
>>   adjtimex02 adjtimex02
>> diff --git a/testcases/kernel/syscalls/add_key/.gitignore b/testcases/kernel/syscalls/add_key/.gitignore
>> index b9a04214d..f57dc2228 100644
>> --- a/testcases/kernel/syscalls/add_key/.gitignore
>> +++ b/testcases/kernel/syscalls/add_key/.gitignore
>> @@ -2,3 +2,4 @@
>>   /add_key02
>>   /add_key03
>>   /add_key04
>> +/add_key05
>> diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
>> new file mode 100644
>> index 000000000..a6d4c1a02
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> + *
>> + * This case test various key type can support how many long
>> + * bytes payload.
>> + * keyring: 0 bytes
>> + * user/logon: 32767 bytes
>> + * big_key: 1M -1byte
>> + */
>> +
>> +#include <errno.h>
>> +#include "tst_test.h"
>> +#include "lapi/keyctl.h"
>> +
>> +struct tcase {
>> +	const char *type;
>> +	const char *desc;
>> +	size_t plen;
>> +	int pass_flag;
>> +	char *message;
>> +} tcases[] = {
>> +	{"keyring", "abc", 0, 1,
>> +	"The key type is keyrings and plen is 0"},
>> +
>> +	{"keyring", "bcd", 1, 0,
>> +	"the key type is keyrings and plen is 1"},
>> +
>> +	{"user", "cde", 32767, 1,
>> +	"The key type is user and plen is 32767"},
>> +
>> +	{"user", "def", 32768, 0,
>> +	"The key type is user and plen is 32768"},
>> +
>> +	{"logon", "ef:g", 32767, 1,
>> +	"The key type is logon and plen is 32767"},
>> +
>> +	{"logon", "fg:h", 32768, 0,
>> +	"The key type is logon and plen is 32768"},
>> +
>> +	{"big_key", "ghi", (1 << 20) - 1, 1,
>> +	"The key type is big_key and plen is 1048575"},
>> +
>> +	{"big_key", "hij", 1 << 20, 0,
>> +	"The key type is big_key and plen is 1048576"},
>> +};
>> +
>> +static char *buf;
>> +static unsigned int logon_nsup, big_key_nsup;
>> +
>> +static void verify_add_key(unsigned int n)
>> +{
>> +	struct tcase *tc = &tcases[n];
>> +
>> +	tst_res(TINFO, "%s", tc->message);
>> +
>> +	if (!strcmp(tc->type, "logon") && logon_nsup) {
>> +		tst_res(TINFO,
>> +			"current system doesn't support logon key type, skip it");
>                       This should be TCONF and the message could be much
> 		     shorther and to the point, something as:
> 
> 		     tst_res(TCONF, "skipping unsupported logon key");
OK.
>> +		return;
>> +	}
>> +
>> +	if (!strcmp(tc->type, "big_key") && big_key_nsup) {
>> +		tst_res(TINFO,
>> +			"current system doesn't support big_key key type, skip it");
> 
> Here as well.
OK.
> 
>> +		return;
>> +	}
>> +
>> +	TEST(add_key(tc->type, tc->desc, buf, tc->plen, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1) {
>> +		if (TST_ERR == EINVAL)
>> +			tst_res(tc->pass_flag ? TFAIL : TPASS, "add_key call failed as expected");
>> +		else
>> +			tst_res(TFAIL | TTERRNO, "add_key call failed expected EINVAL but got");
> 
> This is a bit confusing, we may get the messages even in a case that the
> key is supposed to be successfully created, right?
> 
> I guess that message "TFAIL: add_key call failed as expected" is not
> right.
> 
> Can we separate the negative a positive messages so that they are less
> confusing?
Of course. I will separate them.
> 
>> +		return;
>> +	}
>> +	tst_res(tc->pass_flag ? TPASS : TFAIL, "add_key call succeeded");
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	TEST(add_key("logon", "test:sup_logon", buf, 64, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1)
>> +		logon_nsup = 1;
>> +
>> +	TEST(add_key("big_key", "sup_big_key", buf, 64, KEY_SPEC_THREAD_KEYRING));
>> +	if (TST_RET == -1)
>> +		big_key_nsup = 1;
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +	.test = verify_add_key,
>> +	.bufs = (struct tst_buffers []) {
>> +		{&buf, .size = 1 << 20},
> 
> We actually need different buffer for each different plen size, because
> the sole purpose of the buffer is to map a unaccessible page right after
> the end of the buffer to catch off-by-one accesses.
Agree. I will use different buffers. Also, I will modify add_key01.c 
code as you advised instead of creating a new add_key05.>
>> +		{}
>> +	}
>> +};
>> -- 
>> 2.18.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
