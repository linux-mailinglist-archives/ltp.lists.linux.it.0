Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1A6A48F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:08:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A8533C1D11
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:08:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5FA543C1508
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:08:46 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A03C51400DA2
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:08:45 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6G98Ddl011692
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 16 Jul 2019 02:08:23 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 16 Jul 2019 02:08:02 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1563185037-236824-1-git-send-email-hongzhi.song@windriver.com>
 <1563185037-236824-2-git-send-email-hongzhi.song@windriver.com>
 <1694827109.292834.1563260827076.JavaMail.zimbra@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <c852fb75-25d9-455b-dabb-96542c1106d6@windriver.com>
Date: Tue, 16 Jul 2019 17:07:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1694827109.292834.1563260827076.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4] getrlimit03: adjust a bit of code to
 compatiable with mips32
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


On 7/16/19 3:07 PM, Jan Stancek wrote:
>
> ----- Original Message -----
>> Error info:
>> getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
>> ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
>>
>> According to kernel code: [arch/mips/include/uapi/asm/resource.h]
>> RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
>>
>>   /*
>>   * SuS says limits have to be unsigned.
>>   * Which makes a ton more sense anyway,
>>   * but we keep the old value on MIPS32,
>>   * for compatibility:
>>   */
>>   #ifndef __mips64
>>   # define RLIM_INFINITY      0x7fffffffUL
>>   #endif
>>
>> Adding conditional statement about mips to fix this.
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>> b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>> index e4d56c4..03bd821 100644
>> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>> @@ -26,6 +26,7 @@
>>   
>>   #include "tst_test.h"
>>   #include "lapi/syscalls.h"
>> +#include "lapi/abisize.h"
>>   
>>   /**
>>    * Linux provides an "old" getrlimit syscall handler that uses signed long,
>> @@ -61,7 +62,12 @@ struct rlimit_ulong {
>>   	unsigned long rlim_cur;
>>   	unsigned long rlim_max;
>>   };
>> -const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
>> +
>> +#if defined(__mips) && defined(TST_ABI32)
> I see several tests already use __mips__, why did you go with __mips here?
> Anyway, I'm fine with the patch.


I just find kernel uses __mips, but I will change to __mips__ with patch-v5.

Thanks.

--Hongzhi


>
>> +	const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
>> +#else
>> +	const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
>> +#endif
>>   
>>   static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>>   {
>> --
>> 2.8.1
>>
>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
