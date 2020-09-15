Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE126A1C2
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 11:11:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CC4E3C2B47
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 11:11:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 063163C13DB
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 11:11:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 05FB61401143
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 11:11:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A009BB24A;
 Tue, 15 Sep 2020 09:12:05 +0000 (UTC)
Date: Tue, 15 Sep 2020 11:12:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200915091217.GA6261@yuki.lan>
References: <20200915084406.8633-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915084406.8633-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] clock_gettime04: multiply the timediff if test
 in VM
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
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>  .../kernel/syscalls/clock_gettime/clock_gettime04.c  | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> index 2f484c43f..be872d9aa 100644
> --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> @@ -22,6 +22,7 @@ clockid_t clks[] = {
>  };
>  
>  static gettime_t ptr_vdso_gettime, ptr_vdso_gettime64;
> +static long long DELTA = 5;

One minor nit, variables are supposed to be lowercase.

Other than that, Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

>  static inline int do_vdso_gettime(gettime_t vdso, clockid_t clk_id, void *ts)
>  {
> @@ -82,6 +83,11 @@ static struct test_variants {
>  
>  static void setup(void)
>  {
> +	if (tst_is_virt(VIRT_ANY)) {
> +		tst_res(TINFO, "Running in a virtual machine, multiply the DELTA by 10.");
> +		DELTA *= 10;
> +	}
> +
>  	find_clock_gettime_vdso(&ptr_vdso_gettime, &ptr_vdso_gettime64);
>  }
>  
> @@ -143,9 +149,9 @@ static void run(unsigned int i)
>  
>  			diff /= 1000000;
>  
> -			if (diff >= 5) {
> -				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms (%d): %lld",
> -					tst_clock_name(clks[i]), j, diff);
> +			if (diff >= DELTA) {
> +				tst_res(TFAIL, "%s: Difference between successive readings greater than %lld ms (%d): %lld",
> +					tst_clock_name(clks[i]), DELTA, j, diff);
>  				return;
>  			}
>  		}
> -- 
> 2.21.3
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
