Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16D22A55E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 04:39:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74AB53C22CF
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 04:39:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2A9293C0886
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 04:39:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B35E610007B2
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 04:39:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,385,1589212800"; d="scan'208";a="96775696"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 10:39:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 377144CE4BDF;
 Thu, 23 Jul 2020 10:39:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 10:39:43 +0800
To: Cyril Hrubis <chrubis@suse.cz>, Viresh Kumar <viresh.kumar@linaro.org>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
Date: Thu, 23 Jul 2020 10:39:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714142843.GA14905@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 377144CE4BDF.AF094
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh, Cyril

When tesing timer_settime01 on 3.10.0-1136.el7.x86_64, this case fails 
whether we use any type clock.

timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) 
reported bad values (0: 678013000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) 
reported bad values (0: 358240000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed

Best Regards
Yang Xu


> Hi!
> Pushed with minor changes, thanks.
> 
> Among other fixes I've moved the signal check from the signal handler to
> the clear_signal() function, since the tst_res() function is not
> signal-async-safe...
> 
> diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> index f9d1456da..76f283b81 100644
> --- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> +++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> @@ -10,7 +10,7 @@
>   /*
>    * This tests the timer_settime(2) syscall under various conditions:
>    *
> - * 1) General initialization: No old_value, no flags, 5-second-timer
> + * 1) General initialization: No old_value, no flags
>    * 2) Setting a pointer to a itimerspec struct as old_set parameter
>    * 3) Using a periodic timer
>    * 4) Using absolute time
> @@ -38,10 +38,10 @@ static struct testcase {
>   	int			flag;
>   	char			*description;
>   } tcases[] = {
> -	{NULL, 100000, 0, 0, "general initialization"},
> -	{&old_set, 100000, 0, 0, "setting old_value"},
> -	{&old_set, 100000, 100000, 0, "using periodic timer"},
> -	{&old_set, 100000, 0, TIMER_ABSTIME, "using absolute time"},
> +	{NULL, 50000, 0, 0, "general initialization"},
> +	{&old_set, 50000, 0, 0, "setting old_value"},
> +	{&old_set, 50000, 50000, 0, "using periodic timer"},
> +	{&old_set, 50000, 0, TIMER_ABSTIME, "using absolute time"},
>   };
>   
>   static struct test_variants {
> @@ -71,15 +71,17 @@ static void clear_signal(void)
>   	 */
>   	while (!caught_signal);
>   
> +	if (caught_signal != SIGALRM) {
> +		tst_res(TFAIL, "Received incorrect signal: %s",
> +			tst_strsig(caught_signal));
> +	}
> +
>   	caught_signal = 0;
>   }
>   
>   static void sighandler(int sig)
>   {
> -	if (sig != SIGALRM)
> -		tst_res(TFAIL, "Received incorrect signal: %d", sig);
> -
> -	caught_signal = 1;
> +	caught_signal = sig;
>   }
>   
>   static void setup(void)
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
