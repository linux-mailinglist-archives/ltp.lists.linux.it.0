Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB05243295
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 04:55:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5D963C3120
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Aug 2020 04:55:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BE7F03C220D
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 04:55:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8A4256006E2
 for <ltp@lists.linux.it>; Thu, 13 Aug 2020 04:55:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,306,1592841600"; d="scan'208";a="98051091"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Aug 2020 10:55:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 117ED4CE34FC;
 Thu, 13 Aug 2020 10:55:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 Aug 2020 10:55:25 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1595245614-24814-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200812144007.GA23472@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4450ab63-e6c9-092c-9b77-0d3e026b7557@cn.fujitsu.com>
Date: Thu, 13 Aug 2020 10:55:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812144007.GA23472@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 117ED4CE34FC.A21E2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/msgget04: Add test for
 /proc/sys/kernel/msg_next_id
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

HI Cyril

> Hi!
>> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget04.c b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
>> new file mode 100644
>> index 000000000..3791f331a
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
>> @@ -0,0 +1,66 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
>> + *
>> + * It is a basic test about msg_next_id.
>> + * msg_next_id specifies desired id for next allocated IPC message. By default
>> + * they are equal to -1, which means generic allocation logic. Possible values
>> + * to set are in range {0..INT_MAX}.
>> + * Toggle with non-default value will be set back to -1 by kernel after
>> + * successful IPC object allocation.
>> + */
>> +
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <sys/types.h>
>> +#include <sys/ipc.h>
>> +#include <sys/msg.h>
>> +#include "tst_test.h"
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "libnewipc.h"
>> +
>> +#define NEXT_ID_PATH "/proc/sys/kernel/msg_next_id"
>> +static int queue_id = 1, pid;
>> +static key_t msgkey;
>> +
>> +static void verify_msgget(void)
>> +{
>> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
>> +
>> +	TEST(msgget(msgkey, IPC_CREAT | MSG_RW));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "msgget() failed");
>> +		return;
>> +	}
>> +
>> +	queue_id = TST_RET;
>> +	if (queue_id == pid)
>> +		tst_res(TPASS, "msg_next_id succeeded, queue id %d", pid);
>> +	else
>> +		tst_res(TFAIL, "msg_next_id failed, expected id %d, but got %d", pid, queue_id);
>> +
>> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
>> +	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
>> +	pid++;
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	msgkey = GETIPCKEY();
>> +	pid = getpid();
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	if (queue_id != -1)
>> +		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
>> +	SAFE_FILE_SCANF(NEXT_ID_PATH, "-1");
> 
> Shouldn't this be SAFE_FILE_PRINTF() ?
Yes, sorry for the obvious mistake.
But if it will report EINVAL error when the value of NEXT_ID_PATH has 
been -1. I think we may need a flag.
> 
> Otherwise it looks fine, also I can fix this one before pushing.
>
I will send v2.

> 
> 
> Also what happens when we write id of existing id to that file? I guess
> that we can write another test that tries that...
I will look kernel code firstly, then write a case about this.

Best Regards
Yang Xu
> 
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_msgget,
>> +	.needs_root = 1,
>> +};
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
