Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3051D98EA
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 16:06:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700593C4E69
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 16:06:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D3C683C042A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 16:06:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38BDC602458
 for <ltp@lists.linux.it>; Tue, 19 May 2020 16:06:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09505AC40;
 Tue, 19 May 2020 14:06:39 +0000 (UTC)
Date: Tue, 19 May 2020 16:07:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200519140704.GE16008@yuki.lan>
References: <20200519120725.25750-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519120725.25750-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] C API: Turn .test_variants into array of
 description
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> index 061b2bb22..40dae4b24 100644
> --- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> +++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> @@ -107,14 +107,12 @@ struct test_case tc[] = {
>  static struct test_variants {
>  	int (*clock_adjtime)(clockid_t clk_id, void *timex);
>  	enum tst_timex_type type;
> -	char *desc;
>  } variants[] = {
>  #if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
> -	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX, .desc = "syscall with old kernel spec"},
> +	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX},
>  #endif
> -
>  #if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
> -	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec"},
> +	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX},
>  #endif
>  };
>  
> @@ -188,8 +186,6 @@ static void setup(void)
>  	size_t i;
>  	int rval;
>  
> -	tst_res(TINFO, "Testing variant: %s", tv->desc);
> -
>  	saved.type = tv->type;
>  	rval = tv->clock_adjtime(CLOCK_REALTIME, tst_timex_get(&saved));
>  	if (rval < 0) {
> @@ -257,7 +253,15 @@ static struct tst_test test = {
>  	.setup = setup,
>  	.cleanup = cleanup,
>  	.tcnt = ARRAY_SIZE(tc),
> -	.test_variants = ARRAY_SIZE(variants),
> +	.test_variants = (const char *[]) {
> +#if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
> +		"syscall with old kernel spec",
> +#endif
> +#if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
> +		"syscall time64 with kernel spec",
> +#endif
> +		NULL
> +	},

I do not think that having more ifdefs and splitting the test variant
structure helps to make things simple in the case of timer testcases.

What exact problem are you trying to solve?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
