Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8B2151D0
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 06:41:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08E273C29D4
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 06:41:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9F34C3C29CA
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 06:41:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 116011A00801
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 06:41:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; d="scan'208";a="95805679"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 12:41:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EEE854CE4BDF;
 Mon,  6 Jul 2020 12:41:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 12:41:26 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>, <ltp@lists.linux.it>
References: <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
 <81a952af30185d5c72cda19d322d7abbbf7bd8fe.1594006171.git.viresh.kumar@linaro.org>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c3ffe29c-580d-5c7d-feb9-071c4dee98e0@cn.fujitsu.com>
Date: Mon, 6 Jul 2020 12:41:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <81a952af30185d5c72cda19d322d7abbbf7bd8fe.1594006171.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EEE854CE4BDF.A2264
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/sched_rr_get_interval: Validate the
 timeslice
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh

Acked-by.

> Validate the timespec returned by sched_rr_get_interval() against the
> value read from /proc/sys/kernel/sched_rr_timeslice_ms.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2:
> - Add .tags entry
> - check if file is present or not.
> 
>   .../sched_rr_get_interval01.c                     | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> index 31d7b5d56a52..0466be36bec0 100644
> --- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> +++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
> @@ -5,11 +5,18 @@
>    *
>    * Gets round-robin time quantum by calling sched_rr_get_interval() and
>    * checks that the value is sane.
> + *
> + * It is also a regression test for kernel
> + * commit 975e155ed873 ("sched/rt: Show the 'sched_rr_timeslice' SCHED_RR
> + * timeslice tuning knob in milliseconds").
>    */
>   
>   #include <sched.h>
>   #include "tst_timer.h"
>   
> +#define PROC_SCHED_RR_TIMESLICE_MS	"/proc/sys/kernel/sched_rr_timeslice_ms"
> +static int proc_flag;
> +
>   struct tst_ts tp;
>   
>   static struct test_variants {
> @@ -39,6 +46,8 @@ static void setup(void)
>   
>   	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
>   		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
> +
> +	proc_flag = !access(PROC_SCHED_RR_TIMESLICE_MS, F_OK);
>   }
>   
>   static void run(void)
> @@ -62,6 +71,8 @@ static void run(void)
>   		        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
>   	}
>   
> +	if (proc_flag)
> +		TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
>   }
>   
>   static struct tst_test test = {
> @@ -69,4 +80,8 @@ static struct tst_test test = {
>   	.test_variants = ARRAY_SIZE(variants),
>   	.setup = setup,
>   	.needs_root = 1,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "975e155ed873"},
> +		{}
> +	}
>   };
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
