Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2A330C77
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:33:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A1513C5573
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:33:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 10A203C300C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:33:38 +0100 (CET)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 50F63600116
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:33:36 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 128BXUgP030010;
 Mon, 8 Mar 2021 19:33:30 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Mar 2021
 19:33:31 +0800
Date: Mon, 8 Mar 2021 19:33:32 +0800
From: Leo Liang <ycliang@andestech.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20210308113332.GB622@andestech.com>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-7-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305155123.18199-7-rpalethorpe@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 128BXUgP030010
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On Fri, Mar 05, 2021 at 11:51:23PM +0800, Richard Palethorpe wrote:
> It is useful for testing Fuzzy Sync itself to set the CPU affinity to
> a single core. The current processes affinity does not effect
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
> +
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

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
