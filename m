Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200738BCF4
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 05:29:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A09983C876E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 05:29:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB1DE3C3026
 for <ltp@lists.linux.it>; Fri, 21 May 2021 05:29:17 +0200 (CEST)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7F0FF10006AE
 for <ltp@lists.linux.it>; Fri, 21 May 2021 05:29:14 +0200 (CEST)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FmX764yqczqVXy
 for <ltp@lists.linux.it>; Fri, 21 May 2021 11:25:38 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 11:29:10 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 11:29:09 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-2-xieziyao@huawei.com> <YKbUah2GaIHb6f19@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <5527040d-6b16-a40d-98df-179d5cae28c6@huawei.com>
Date: Fri, 21 May 2021 11:29:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKbUah2GaIHb6f19@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/sendfile: Convert sendfile08 to the
 new API
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


>> +++ b/testcases/kernel/syscalls/sendfile/sendfile08.c
> I'd put your or LTP copyright (as your wish) because test was significantly
> changed. (We had some copyright issues in the past thus it's better to state it.)
> ...
>> +/*\
>> + * [Description]
>> + *
>>    * Bug in the splice code has caused the file position on the write side
>>    * of the sendfile system call to be incorrectly set to the read side file
>>    * position. This can result in the data being written to an incorrect offset.
>>    *
>> - * This is a regression test for kernel commit
>> - * 2cb4b05e7647891b46b91c07c9a60304803d1688
>> + * This is a regression test for kernel commit 2cb4b05e7647.
> 
> nit: I wonder if we want to repeat what we already declare in .min_kver.
> This is not specific to this patch, we keep doing it, but IMHO necessary
> and we should stop that.
Agree with you.

>>    */
> 
>> -#include <sys/sendfile.h>
>> -#include <sys/stat.h>
>> -#include <sys/types.h>
>> -#include <errno.h>
>> -#include <fcntl.h>
>>   #include <stdio.h>
>> +#include <fcntl.h>
>>   #include <string.h>
>>   #include <unistd.h>
>> -#include "test.h"
>> -#include "safe_macros.h"
>> +#include <sys/stat.h>
>> +#include <sys/types.h>
>> +#include <sys/sendfile.h>
> 
> nit: it looks to me that only <stdio.h> <string.h> <sys/sendfile.h> are needed.
+1

> But maybe others are needed and included in other headers.
> 
> Also only these were needed in legacy API:
> #include <sys/sendfile.h>
> #include <errno.h>
> #include "test.h"
> #include "safe_macros.h"
> But <errno.h> is needed only for legacy API => use just these 3 mentioned above.
> 
> ...
>> +	char buf[BUFSIZ];
>> +	SAFE_LSEEK(out_fd, 0, SEEK_SET);
> nit: sendfile08.c:43: WARNING: Missing a blank line after declarations
> It's actually more readable to have blank line after char buf[BUFSIZ];
+1

> 
>> +	SAFE_READ(0, out_fd, buf, BUFSIZ);
>> +
>> +	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL)))
>> +		tst_res(TPASS, "sendfile(2) copies data correctly");
>> +	else
>> +		tst_res(TFAIL, "sendfile(2) copies data incorrectly. "
>> +			       "Expect \"%s%s\", got \"%s\"",
>> +			TEST_MSG_OUT, TEST_MSG_IN, buf);
> 
> sendfile08.c:50: WARNING: quoted string split across lines
> 
> 	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL))) {
> 		tst_res(TPASS, "sendfile() copied data correctly");
> 		return;
> 	}
> 
> 	tst_res(TFAIL, "sendfile() copied data incorrectly: '%s', expected '%s%s'",
> 			buf, TEST_MSG_OUT, TEST_MSG_IN);
> 
> i.e. not splitting string, get some space by return instead else,
> we don't mind using single quote (code is more readable),
> removing also 2 in sendfile(2) (2 is man section, but that's just confusing).
> 
> Changes are minor, if we agre on that it can be done during merge.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Kind regards,
> Petr
> .
> 

Hi, Petr,

Thanks for your review and agree with changes above.

BTW, would you mind adding your changes to the v2 version? Please see: 
https://patchwork.ozlabs.org/project/ltp/list/?series=244863

Thank you,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
