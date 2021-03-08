Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712033113C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 15:51:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242CD3C5579
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 15:51:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E76CB3C08AF
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 15:51:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8B3C2600868
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 15:51:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E26C1AB8C;
 Mon,  8 Mar 2021 14:51:51 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:53:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YEY6bJ/FYL240kK9@yuki.lan>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-7-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305155123.18199-7-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] fzsync: Check processor affinity
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

Hi!
> It is useful for testing Fuzzy Sync itself to set the CPU affinity to
> a single core. The current processes affinity does not effect
                                                           ^
							 affect?
> tst_ncpus(), but we can get the affinity separately.
> 
> Note that checking this still does not guarantee we will use yield
> when restricted to only one core. We would have to periodically probe
> which CPUs threads are running on until we detect more than one CPU.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  include/tst_fuzzy_sync.h | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 36a604e13..ea356ab44 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -59,9 +59,11 @@
>   * @sa tst_fzsync_pair
>   */
>  
> +#define _GNU_SOURCE
> +
>  #include <math.h>
>  #include <pthread.h>
> -#include <sched.h>
> +#include "lapi/cpuset.h"
>  #include <stdbool.h>
>  #include <stdlib.h>
>  #include <sys/time.h>
> @@ -213,12 +215,26 @@ struct tst_fzsync_pair {
>   */
>  static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  {
> +	long ncpus = tst_ncpus();
> +#ifdef CPU_COUNT
> +	size_t cpusz = CPU_ALLOC_SIZE(ncpus);
> +	cpu_set_t *cpus = CPU_ALLOC(ncpus);
> +
> +	if (sched_getaffinity(0, cpusz, cpus)) {
> +		tst_res(TWARN | TERRNO, "sched_getaffinity(0, %zu, %zx)",
> +			cpusz, (size_t)cpus);
> +	} else {
> +		ncpus = CPU_COUNT(cpus);
> +	}
> +	free(cpus);
> +#endif

Can we instead put this into the lib/tst_cpu.c and call it
tst_allowed_cpus() or something like this?

>  	CHK(avg_alpha, 0, 1, 0.25);
>  	CHK(min_samples, 20, INT_MAX, 1024);
>  	CHK(max_dev_ratio, 0, 1, 0.1);
>  	CHK(exec_time_p, 0, 1, 0.5);
>  	CHK(exec_loops, 20, INT_MAX, 3000000);
> -	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
> +	CHK(yield_in_wait, 0, 1, (ncpus <= 1));
>  }
>  #undef CHK
>  
> -- 
> 2.30.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
