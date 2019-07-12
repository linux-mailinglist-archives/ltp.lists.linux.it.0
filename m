Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA366666B5
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 08:00:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B2B3C1D19
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 08:00:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DD4623C1C86
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 08:00:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 42031100286F
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 08:00:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71241078"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 14:00:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 073ED4CDF044;
 Fri, 12 Jul 2019 14:00:09 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 12 Jul 2019 14:00:12 +0800
Message-ID: <5D2821EB.6070807@cn.fujitsu.com>
Date: Fri, 12 Jul 2019 14:00:11 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
 <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
 <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
In-Reply-To: <c0c07134-f5a8-b4d3-c210-c58c36653423@windriver.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 073ED4CDF044.AFCE7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] getrlimit03: adjust a bit of code to
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

on 2019/07/12 13:46, Hongzhi, Song wrote:
>
> On 7/11/19 3:48 PM, Jan Stancek wrote:
>>
>> ----- Original Message -----
>>> Error info:
>>> getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
>>> ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
>>>
>>> According to kernel code: [arch/mips/include/uapi/asm/resource.h]
>>> RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
>>>
>>> /*
>>>   * SuS says limits have to be unsigned.
>>>   * Which makes a ton more sense anyway,
>>>   * but we keep the old value on MIPS32,
>>>   * for compatibility:
>>>   */
>>> #ifndef __mips64
>>> # define RLIM_INFINITY      0x7fffffffUL
>>> #endif
>>>
>>> Adding conditional statement about mips to fix this.
>>>
>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>> ---
>>>   testcases/kernel/syscalls/getrlimit/getrlimit03.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> index e4d56c4..1903558 100644
>>> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
>>> @@ -61,7 +61,13 @@ struct rlimit_ulong {
>>>       unsigned long rlim_cur;
>>>       unsigned long rlim_max;
>>>   };
>>> +#ifdef __mips
>>> +#ifndef __mips64
>>> +const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
>>> +#else
>>>   const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
>>> +#endif
>>> +#endif
>> Hi,
>>
>> This will break every other arch, because it's now undefined 
>> everywhere except mips.
>
>
> Is there a good way to filter mips32?
>
> I tried
>
>  65 #ifdef __mips
>  66 #ifndef __mips64
>  67 const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
>  68 #endif
>  69 const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
>  70 #else
>  71 const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
>  72 #endif
>
> but mips32 thinks the RLIM_INFINITY_UL micro is redefined.

Hi hongzhi

You redefine RLIM_INFINITY_UL macro indeed when on mips32 because line 67 and 69.

It should be as below:
+#ifdef __mips
+#ifndef __mips64
+const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
#endif
+#else
+const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
+#endif

  

>
>
>>
>>>     static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>>>   {
>>> @@ -101,8 +107,8 @@ static int compare_u64_ulong(int resource, uint64_t
>>> val_u64,
>>>   {
>>>       if ((val_u64 > RLIM_INFINITY_UL && val_ul != RLIM_INFINITY_UL) ||
>>>           (val_u64 <= RLIM_INFINITY_UL && val_ul != val_u64)) {
>>> -        tst_res(TFAIL, "__NR_prlimit64(%d) had %s = %" PRIx64 " but "
>>> __NR_getrlimit_ulong_str "(%d) had %s = %lx",
>>> -            resource, kind, val_u64,
>>> +        tst_res(TFAIL, "SIGNED_GETRLIMIT = %d __WORDSIZE %d 
>>> ULONG_MAX = %lu
>>> RLIM_INFINITY_UL = %lu __NR_prlimit64(%d) had %s = %" PRIx64 " but "
>>> __NR_getrlimit_ulong_str "(%d) had %s = %lx",
>>> +            SIGNED_GETRLIMIT, __WORDSIZE, ULONG_MAX, 
>>> RLIM_INFINITY_UL, resource,
>> I suggest to split it into another tst_res() message, line above is 
>> nearly 200 characters.
>
>
> Sorry, I shouldn't append debug code to patch.
>
> --Hongzhi
>
>
>>
>> Regards,
>> Jan
>>
>>> kind, val_u64,
>>>               resource, kind, val_ul);
>>>           return -1;
>>>       }
>>> -- 
>>> 2.8.1
>>>
>>>
>>> -- 
>>> Mailing list info: https://lists.linux.it/listinfo/ltp
>>>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
