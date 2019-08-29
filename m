Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C79A1AED
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 15:08:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17AF23C2018
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 15:08:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9E1F73C1C6D
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 15:08:47 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 790F310006BE
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 15:08:36 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7TD83UJ030036
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 29 Aug 2019 06:08:19 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 29 Aug 2019 06:08:04 -0700
To: Jan Stancek <jstancek@redhat.com>
References: <1566544121-147769-1-git-send-email-zhe.he@windriver.com>
 <4200333.8516580.1566933979370.JavaMail.zimbra@redhat.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <45ccbb16-aaf7-6016-4719-3968c45ce201@windriver.com>
Date: Thu, 29 Aug 2019 21:08:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4200333.8516580.1566933979370.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.221]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: rt_sigwaitinfo01: Fix failure for MIPS
 arches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 8/28/19 3:26 AM, Jan Stancek wrote:
>
> ----- Original Message -----
>> From: He Zhe <zhe.he@windriver.com>
>>
>> rt_sigtimedwait01 fails as follow on MIPS arches
>> rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
>> (.../sigwaitinfo01.c: 148): Unexpected failure:
>> TEST_ERRNO=EINVAL(22): Invalid argument
>>
>> As this case purposely bypasses glibc, it should align with the size of
>> kernel
>> definition of sigset_t which is different from other arches.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15
>>
>> This patch adds specific case for MIPS.
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>> b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>> index 5a32ce1..5c2fa99 100644
>> --- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>> +++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
>> @@ -128,9 +128,16 @@ static int my_sigtimedwait(const sigset_t * set,
>> siginfo_t * info,
>>  static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
>>  			      struct timespec *timeout)
>>  {
>> -
>> -	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64
>> and 8, resp. */
>> -	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
>> +	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64
>> and 8, resp,
>> +	 * except for MIPS which are 128 and 8, resp.
>> +	 */
>> +	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout,
>> +#ifdef __mips__
>> +		16
>> +#else
>> +		8
>> +#endif
> Hi,
>
> looking at kernel SYSCALL_DEFINE4(rt_sigtimedwait,..), the size is
> used in this check:
>         if (sigsetsize != sizeof(sigset_t))                                                                                                                   
>                 return -EINVAL; 
>
> So I'm wondering if need to have an absolute value here, and if we can't
> replace it with sizeof(sigset_t) or _NSIG / 8?

Thanks, I did try with sizeof(sigset_t) but it gave 128 bytes for MIPS.
_NSIG works well. I'll send v2.

Zhe

>
> Regards,
> Jan
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
