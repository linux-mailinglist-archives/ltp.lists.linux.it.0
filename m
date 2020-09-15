Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4AF26A069
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 647CE3C2B46
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 10:10:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E729D3C1C7A
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:10:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 454EA2005E6
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 10:10:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00109AFC5;
 Tue, 15 Sep 2020 08:10:20 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:10:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200915081032.GA8111@yuki.lan>
References: <20200915031402.26519-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915031402.26519-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: relax the time diff in VM
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
> To balance that the test inside a VM can NOT get enough CPU time, which
> result in sporadically fails with the time comparing.
> 
> clock_gettime04.c:155: PASS: CLOCK_REALTIME: Difference between successive readings is reasonable
> clock_gettime04.c:155: PASS: CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable
> clock_gettime04.c:148: FAIL: CLOCK_MONOTONIC: Difference between successive readings greater than 5 ms (2): 22
> clock_gettime04.c:155: PASS: CLOCK_MONOTONIC_COARSE: Difference between successive readings is reasonable
> clock_gettime04.c:148: FAIL: CLOCK_MONOTONIC_RAW: Difference between successive readings greater than 5 ms (1): 22
> clock_gettime04.c:148: FAIL: CLOCK_BOOTTIME: Difference between successive readings greater than 5 ms (1): 29
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>

The idea is good, but I think that the implementation could be better.

Why can't we just call the tst_is_virt() in test setup and if we detect
that we are running on virtual machine print a TINFO message that
maximal expected difference has been multiplied by 10?

> ---
>  .../kernel/syscalls/clock_gettime/clock_gettime04.c      | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> index 2f484c43f..5c4a5d751 100644
> --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> @@ -92,6 +92,7 @@ static void run(unsigned int i)
>  	struct test_variants *tv;
>  	int count = 10000, ret;
>  	unsigned int j;
> +	int virt_env = tst_is_virt(VIRT_ANY);
>  
>  	do {
>  		for (j = 0; j < ARRAY_SIZE(variants); j++) {
> @@ -143,11 +144,17 @@ static void run(unsigned int i)
>  
>  			diff /= 1000000;
>  
> -			if (diff >= 5) {
> +			if (!virt_env && diff >= 5) {
>  				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms (%d): %lld",
>  					tst_clock_name(clks[i]), j, diff);
>  				return;
>  			}
> +
> +			if (virt_env && diff >= 50) {
> +				tst_res(TFAIL, "%s: Difference between successive readings(in VM) greater than 50 ms (%d): %lld",
> +					tst_clock_name(clks[i]), j, diff);
> +				return;
> +			}
>  		}
>  	} while (--count);
>  
> -- 
> 2.21.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
