Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 244AD15B9BE
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 07:45:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8E033C24AA
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 07:45:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 25DD13C0716
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 07:45:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 86243600B11
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 07:45:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,435,1574092800"; d="scan'208";a="83242530"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 14:45:17 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D69CB50A9975;
 Thu, 13 Feb 2020 14:35:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 14:45:11 +0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200213062524.2027846-1-raj.khem@gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c8a71ed3-be25-5eec-3419-adad3539c80f@cn.fujitsu.com>
Date: Thu, 13 Feb 2020 14:45:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200213062524.2027846-1-raj.khem@gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D69CB50A9975.AF116
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Check for time64 unsafe syscalls before
 using them
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

Hi Khem

Can we use simple tst_syscall to fix this like commit 333a47be 
("socketcall01: Use tst_syscall")?

Best Regards
Yang Xu
> musl is using 64bit time_t now on 32bit architectures and these syscalls
> no longer exist, therefore its better to check for them being available
> before using them
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   lib/tst_clocks.c                                        | 9 +++++++++
>   testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 4 ++++
>   testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 4 ++++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index 35798a4aaf..6a5b05c4ea 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -28,15 +28,24 @@
>   
>   int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>   {
> +#if defined(__NR_clock_getres)
>   	return syscall(SYS_clock_getres, clk_id, res);
> +#endif
> +	return -1;
>   }
>   
>   int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>   {
> +#if defined(__NR_clock_gettime)
>   	return syscall(SYS_clock_gettime, clk_id, ts);
> +#endif
> +	return -1;
>   }
>   
>   int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
>   {
> +#if defined(__NR_clock_settime)
>   	return syscall(SYS_clock_settime, clk_id, ts);
> +#endif
> +	return -1;
>   }
> diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> index 583d8f7b9b..b498de5b68 100644
> --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> @@ -41,7 +41,11 @@
>   #include <sys/syscall.h>
>   #include <unistd.h>
>   
> +#ifdef __NR_gettimeofday
>   #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> +#else
> +#define gettimeofday(a,b) (-1)
> +#endif
>   
>   char *TCID = "gettimeofday01";
>   int TST_TOTAL = 1;
> diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> index 1d60f448e8..218e017df8 100644
> --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> @@ -23,7 +23,11 @@
>   
>   #include "tst_test.h"
>   
> +#ifdef __NR_gettimeofday
>   #define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> +#else
> +#define gettimeofday(a,b) (-1)
> +#endif
>   
>   static volatile sig_atomic_t done;
>   static char *str_rtime;
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
