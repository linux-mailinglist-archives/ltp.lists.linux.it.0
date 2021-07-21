Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F43D0692
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 03:57:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50CD03C9835
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 03:57:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 124683C70A0
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 03:57:30 +0200 (CEST)
Received: from smtpbg501.qq.com (smtpbg501.qq.com [203.205.250.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C95F0140033A
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 03:57:27 +0200 (CEST)
X-QQ-mid: bizesmtp44t1626832641t3ig3cev
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 21 Jul 2021 09:57:20 +0800 (CST)
X-QQ-SSF: 01400000008000206000B00A0000000
X-QQ-FEAT: iT7OqstxuAmUJMpJnurcSSjkgRb/OFRjpPCha0EiZLo67LBcFP3SPYHLpbdMm
 z3BMy/3Rbf1urK4ddQQfQi1flV8gL1oCZuD2MR+QafP1BWGvmB6e/IrXC2nPTf9UjZ39Xd9
 Dgp+oT1vUgDPlOY41C2sUL2NixpFgE/JjqIn1IcgmTrtUOhl/9YyvqbYGczughbIllEW7CV
 N0K78zPAFi/1cB1cZpW9XOxCTUd0pl1Ow15NDI4v25yVpSvZ23nzzCl2kf/45xAN0NAM2bK
 D3rRQqqrhQ5i/h8W16qFaJTsMPHXmuHf6fM/BHqklvTxmNuW3aasbkeWpdxeTV3r8NhqJa5
 jerYYZJNQ5JwtQ2G7g=
X-QQ-GoodBg: 2
To: Petr Vorel <pvorel@suse.cz>
References: <20210720063852.1883-1-zhanglianjie@uniontech.com>
 <YPaBnxlp2SsxCaPE@pevik> <045e5fc2-05a7-e006-3bb6-2f536c5634b4@uniontech.com>
 <YPaaFAdTO9coCUxN@pevik>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <36548c15-1d5a-c74e-87f4-63049deec070@uniontech.com>+479EA11EEA18FB8F
Date: Wed, 21 Jul 2021 09:57:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YPaaFAdTO9coCUxN@pevik>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] stime: Only o32 system calls require 32-bit
 programs on mips
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 2021-07-20 17:40, Petr Vorel wrote:
> Hi zhanglianjie,
> 
> [ Cc Thomas Bogendoerfer, MIPS kernel maintainer ]
> 
>> On 2021-07-20 15:56, Petr Vorel wrote:
>>> Hi zhanglianjie,
> 
>>>> The stime() system call is only o32, not n32 and n64. If you do not
>>>> specify that the current program is compiled to 32-bit when compiling
>>>> the program on mips, the stime() system call will fail when the
>>>> program is running.
>>> You're right that stime() is only on o32. But tst_syscall() should catch that.
>>> Or does it set different errno than ENOSYS?
> 
>> The returned errno is EFAULT. The o32 system call of stime is implemented on
>> mips, so ENOSYS will not be returned.
> I see.
> 
>> COMPAT_SYSCALL_DEFINE1(stime, compat_time_t __user *, tptr)
>> {
>>      ...
>>      if (get_user(tv.tv_sec, tptr))
>>          return -EFAULT;
>>      ...
>> }
> 
>> The tptr address is in the user space 0x120010da0, and after the system
>> call, it is 0x20010da0 in the kernel state, and the upper 32 bits are set to
>> 0, resulting in a failure to copy data from the user space to the kernel
>> space.
> Thanks for explanation.
> 
>> This patch needs to be modified and cannot affect other architectures.
> Yes, o2 has to fixed, but agree that this would affect other archs which
> supports __NR_stime, i.e. i386 now also complains:
> stime_var.h:31: TCONF: the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit
> 
> but it should stay:
> stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)
> 
Thanks for the code review.
If it only affects the mips architecture and does not affect other 
architectures, does it need to be modified here?
>>> ...
>>>> +#if defined(__mips__) && _MIPS_SZLONG == 32
> Not sure if this would work to whitelist only mips n32 and n64 (keep mips o32
> and all other archs):
> #if ! defined(_MIPS_SZLONG) || _MIPS_SZLONG == 32
> 
It can be determined that only mips n32 and n64 need to be whitelisted, 
and calling stime() on other 64-bit architectures will return ENOSYS.

In the following compilation conditions, _ABIO32, _ABI64, and _ABIN32 
have been defined:

grep -E 'ifdef|if defined' ~/ltp/include/lapi/syscalls.h
#ifdef __aarch64__
#ifdef __arc__
#ifdef __arm__
#ifdef __hppa__
#ifdef __i386__
#ifdef __ia64__
#if defined(__mips__) && defined(_ABIN32)
#if defined(__mips__) && defined(_ABI64)
#if defined(__mips__) && defined(_ABIO32)
#ifdef __powerpc64__
#ifdef __powerpc__
#ifdef __s390x__
#if defined(__s390__) && !defined(__s390x__)
#ifdef __sh__
#if defined(__sparc__) && defined(__arch64__)
#if defined(__sparc__) && !defined(__arch64__)
#ifdef __x86_64__


Modified patch v2:
https://patchwork.ozlabs.org/project/ltp/patch/20210720083708.13281-1-zhanglianjie@uniontech.com/
> 
>>>>    		return tst_syscall(__NR_stime, ntime);
>>>> +#else
>>>> +		tst_brk(TCONF, "the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit");
>>>> +#endif
> 

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
