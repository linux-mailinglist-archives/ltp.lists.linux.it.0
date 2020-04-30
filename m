Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E71BF29D
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 10:22:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E1C793C27F0
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 10:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D42763C27DA
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 10:22:53 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3BCE5201446
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 10:22:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,334,1583164800"; d="scan'208";a="90841938"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 16:22:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2DF5B4BCC89B;
 Thu, 30 Apr 2020 16:22:41 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 16:22:41 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1587450108-31100-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587450108-31100-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200429120609.GA668@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2e9ddc2e-8048-63f3-6fe6-62733db28320@cn.fujitsu.com>
Date: Thu, 30 Apr 2020 16:22:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200429120609.GA668@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2DF5B4BCC89B.A132C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: Add TST_ASSERT_FILE_INT and
 TST_ASSERT_FILE_STR
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
>>   #endif /* TST_ASSERT_H__ */
>> diff --git a/lib/tst_assert.c b/lib/tst_assert.c
>> index 8ef3cd72e..65ee76473 100644
>> --- a/lib/tst_assert.c
>> +++ b/lib/tst_assert.c
>> @@ -4,6 +4,7 @@
>>    * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>>    * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
>>    */
>> +#include <stdio.h>
>>   #define TST_NO_DEFAULT_MAIN
>>   #include "tst_assert.h"
>>   #include "tst_test.h"
>> @@ -22,6 +23,22 @@ void tst_assert_int(const char *file, const int lineno, const char *path, int va
>>   	tst_res_(file, lineno, TFAIL, "%s != %d got %d", path, val, sys_val);
>>   }
>>   
>> +void tst_assert_file_int(const char *file, const int lineno, const char *path, const char *buf, int val)
>> +{
>> +	int sys_val;
>> +	char fmt[1024];
>> +
>> +	sprintf(fmt, "%s: %%d", buf);
> 
> If we want to keep the function as generic as possible we shouldn't add
> the colon and space after the %s here.
> 
> There is no standard on proc files, for instance it wouldn't be possible
> to parse /proc/vmstat if we hardcode the format string like that.
> 
> So I would just change this to "%s%%d" instead and pass "Foo: " instead
> just "Foo" in the testcases.
Yes, good suggestion!!
> 
> Also I guess that we should call it prefix rather than buf, but that's
> minor.
Agree. I will send a v2 patch.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
