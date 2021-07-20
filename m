Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B83CF5E9
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:17:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75E453C65BA
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:17:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF2BD3C6296
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:17:30 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6477B1400C5A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:17:27 +0200 (CEST)
X-QQ-mid: bizesmtp52t1626769042t0lhvcnz
Received: from [10.4.23.46] (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 20 Jul 2021 16:17:21 +0800 (CST)
X-QQ-SSF: 01400000008000107000000D0000000
X-QQ-FEAT: bQsUcYFpAAZBprT2weXLAjrYKV9uHFuzr0AjotfuOgSu7ULNuc6xatjOltTxW
 69HpzRHc63jA+/AlJzoYrJZdHr8l58XOOrBgAsA9uitMiQ5aKSaRG8hBA+p5+B9Gg2Z7oMs
 JGM3IXT/dzNxZdtf2aeFGnPXjcGjT/vrE6eTBD7Yh+tFTrizQpbmkgwO+FtpMweuEwKl7jl
 MpsscGDLRC5EhdvFyTnLOD9GPVPvd3mUx3NtYydvdBQGRbYGLcMYcDpdKzMsBZ02p1R/wBt
 AZOJqQd1ZsZyqpw9qYbzZtOZq7np8Wb8Mq7FSt2XQoa4Kpk/MlAwbB6PCm7iJyZrJGoDboB
 shO/wZNurhEg4kojAc=
X-QQ-GoodBg: 2
To: Petr Vorel <pvorel@suse.cz>
References: <20210720063852.1883-1-zhanglianjie@uniontech.com>
 <YPaBnxlp2SsxCaPE@pevik>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <045e5fc2-05a7-e006-3bb6-2f536c5634b4@uniontech.com>+26B8CE0DB4330340
Date: Tue, 20 Jul 2021 16:17:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YPaBnxlp2SsxCaPE@pevik>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.8 required=7.0 tests=FORGED_MUA_MOZILLA,
 INVALID_MSGID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS autolearn=disabled
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 2021-07-20 15:56, Petr Vorel wrote:
> Hi zhanglianjie,
> 
>> The stime() system call is only o32, not n32 and n64. If you do not
>> specify that the current program is compiled to 32-bit when compiling
>> the program on mips, the stime() system call will fail when the
>> program is running.
> You're right that stime() is only on o32. But tst_syscall() should catch that.
> Or does it set different errno than ENOSYS?

The returned errno is EFAULT. The o32 system call of stime is 
implemented on mips, so ENOSYS will not be returned.

COMPAT_SYSCALL_DEFINE1(stime, compat_time_t __user *, tptr)
{
     ...
     if (get_user(tv.tv_sec, tptr))
         return -EFAULT;
     ...
}

The tptr address is in the user space 0x120010da0, and after the system 
call, it is 0x20010da0 in the kernel state, and the upper 32 bits are 
set to 0, resulting in a failure to copy data from the user space to the 
kernel space.

This patch needs to be modified and cannot affect other architectures.

> 
> ...
>> +#if defined(__mips__) && _MIPS_SZLONG == 32
>>   		return tst_syscall(__NR_stime, ntime);
>> +#else
>> +		tst_brk(TCONF, "the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit");
>> +#endif
> 

-- 
Regards,
Zhang Lianjie



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
