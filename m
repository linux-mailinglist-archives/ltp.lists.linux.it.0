Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7330D340
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 07:03:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 438A83C73AA
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 07:03:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D47173C2EDF
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 07:03:03 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 07C226009EA
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 07:03:01 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,397,1602518400"; d="scan'208";a="104133559"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Feb 2021 14:02:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2F7CF4CE546D;
 Wed,  3 Feb 2021 14:02:49 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Feb 2021 14:02:48 +0800
Message-ID: <601A3C9A.904@cn.fujitsu.com>
Date: Wed, 3 Feb 2021 14:03:06 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <YBLdKsBkrLuyvbjA@yuki.lan>
In-Reply-To: <YBLdKsBkrLuyvbjA@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2F7CF4CE546D.AFCD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/3] syscalls/mallinfo01: Add a basic test for
 mallinfo
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
Sorry for late reply, I am busy with other thing.
>> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
>> new file mode 100644
>> index 000000000..1a2a30af1
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> + */
>> +
>> +/*\
>> + * [DESCRIPTION]
>> + *
>> + * Basic mallinfo() test. Refer to glibc test
>> + * https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c
>> +\*/
>> +
>> +#include<malloc.h>
>> +
>> +#include "tst_test.h"
>> +#include "tst_safe_macros.h"
>> +
>> +#ifdef HAVE_MALLINFO
>> +static char *buf;
>> +static struct mallinfo info1;
>> +
>> +static void
>> +print_mallinfo(const char *msg, struct mallinfo *m)
>> +{
>> +	tst_res(TINFO, "%s...", msg);
>> +#define P(f) tst_res(TINFO, "%s: %d", #f, m->f)
>> +	P(arena);
>> +	P(ordblks);
>> +	P(smblks);
>> +	P(hblks);
>> +	P(hblkhd);
>> +	P(usmblks);
>> +	P(fsmblks);
>> +	P(uordblks);
>> +	P(fordblks);
>> +	P(keepcost);
>> +}
>> +
>> +void test_mallinfo(void)
>> +{
>> +	struct mallinfo info2;
>> +	int i;
>> +	int total = 0;
>> +
>> +	for (i = 1; i<  20; i++) {
>> +		buf = SAFE_MALLOC(160 * i);
>
> The buf here has to be array and we have to free the buffers at the end
> of this function, otherwise the malloc() will fail sooner or later when
> the test_mallinfo() function runs in a loop.
Yes. Will do it in v2.
>
>> +		total += 16 * i;
It looks glibc test uses wrong multiple for total variable, I will 
correct it (16=>160). Also, I have sent a patch to glibc.
>> +	}
>> +
>> +	info2 = mallinfo();
>> +	print_mallinfo("Test",&info2);
>> +	if (info2.uordblks>  info1.uordblks + total)
>> +		tst_res(TPASS, "mallinfo() passed");
>> +	else
>> +		tst_res(TFAIL, "mallinfo() failed");
>> +
>> +	info1 = info2;
>
> And then we cannot do this either.
Yes, Will do it in v2.
>
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	if (sizeof(info1.arena) != sizeof(int))
>> +		tst_res(TFAIL, "The member of mallinfo struct is not int");
>> +
>> +	info1 = mallinfo();
>> +	print_mallinfo("Start",&info1);
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	if (buf)
>> +		free(buf);
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.test_all = test_mallinfo,
>> +	.cleanup = cleanup,
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
