Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C617DC65
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 10:27:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA6C03C613A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 10:27:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 32C383C60FA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 10:27:37 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B3930600E2E
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 10:27:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,532,1574092800"; d="scan'208";a="86048154"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Mar 2020 17:27:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4727450A998D;
 Mon,  9 Mar 2020 17:17:31 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 9 Mar 2020 17:27:29 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200309080134.GB299736@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3752c0de-404b-4436-6807-21688d1cfd94@cn.fujitsu.com>
Date: Mon, 9 Mar 2020 17:27:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200309080134.GB299736@x230>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4727450A998D.AABD8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] syscalls/settimeofday01: convert to new
 library
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

Hi  Petr

> Hi Xu,
>> Also, since glibc 2.31[1], when tz and tv are both null, it will get
>> SIGSEGV sig. So, remove this EFAULT error test to adopt glibc 2.31.
> +1, thanks for testing on new glibc.
> 
>> Moreover, musl 1.2.0 is now available and changes time_t for 32-bit
>> archs to a 64-bit type. It is updated to slove y2038 problem and get
> => typo solve.
>> time function no longer used for 32bit arch but not affecting set time
>> function and 64 bit arch, more info see[2]. So for gettimeofday(), we
>> use tst_syscall instead of calling libc to avoid this problem.
> Hm, it'd be nice to test both raw syscall and libc implementations (via
> tst_variant),
 From glibc 2.31 announce,
"settimeofday itself is obsolescent according to POSIX.  Programs
   that set the system time should use clock_settime and/or the adjtime
   family of functions instead".

This is why I am not using tst_variant for this case.
Also, glibc actually call clock_settime/gettime for this pair.

>but IMHO there is no way to detect musl change. Or am I missing
> something?
> 
I remembered we have a commit for this "
syscalls: Check for time64 unsafe syscalls before using them"
Looking musl glibc code[1], can we use 
__NR_gettimeofday_time32/__NR_settimeofday_time32 in syscalls.h to 
detect this change?

[1]http://git.musl-libc.org/cgit/musl/commit/?id=5a105f19b5aae79dd302899e634b6b18b3dcd0d6
> + one would prefer this change to be in a separate commit, but we can live with that :).
> 
> I guess there is no need to setup SAFE_{G,S}ETTIMEOFDAY(), because only these 2
> tests and stime_var.h are using it (or at least no now).
Agree. The more important reason is that get/settimeofday is obsolete, 
we should use other syscall to set/get time.

Best Regards
Yang Xu
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
