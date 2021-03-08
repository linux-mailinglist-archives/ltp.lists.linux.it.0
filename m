Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A9330C73
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:33:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCD743C5573
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:33:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 551203C300C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:33:08 +0100 (CET)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 469406008C5
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:33:05 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 128BWoID029779;
 Mon, 8 Mar 2021 19:32:50 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Mar 2021
 19:32:48 +0800
Date: Mon, 8 Mar 2021 19:32:46 +0800
From: Leo Liang <ycliang@andestech.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20210308113246.GA622@andestech.com>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-6-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305155123.18199-6-rpalethorpe@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 128BWoID029779
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/6] fzsync: Move yield check out of loop and add
 yield to delay
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

On Fri, Mar 05, 2021 at 11:51:22PM +0800, Richard Palethorpe wrote:
> During my testing I found no difference between having the branch
> inside the loop and outside. However looking at the generated
> assembly, it definitely does perform the branch inside the loop. This
> could have an effect on some platform with worse branch prediction. So
> I have moved the branch outside of the loop.
> 
> Also I have added sched_yield to the delay loop. If we only have one
> CPU then it is not delaying anything unless the other process can
> progress.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  include/tst_fuzzy_sync.h | 72 ++++++++++++++++++++++++++++++----------
>  1 file changed, 54 insertions(+), 18 deletions(-)
> 
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 5474f81e3..36a604e13 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -183,9 +183,9 @@ struct tst_fzsync_pair {
>  	int exec_loop;
>  	/** Internal; The second thread or 0 */
>  	pthread_t thread_b;
> -	/** 
> -	 * Internal; The flag indicates single core machines or not
> -	 * 
> +	/**
> +	 * The flag indicates single core machines or not
> +	 *
>  	 * If running on single core machines, it would take considerable
>  	 * amount of time to run fuzzy sync library.
>  	 * Thus call sched_yield to give up cpu to decrease the test time.
> @@ -575,31 +575,53 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
>  		 * line above before doing that. If we are in rear position
>  		 * then our counter may already have been set to zero.
>  		 */
> -		while (tst_atomic_load(our_cntr) > 0
> -		       && tst_atomic_load(our_cntr) < INT_MAX) {
> -			if (spins)
> -				(*spins)++;
> -			if(yield_in_wait)
> +		if (yield_in_wait) {
> +			while (tst_atomic_load(our_cntr) > 0
> +			       && tst_atomic_load(our_cntr) < INT_MAX) {
> +				if (spins)
> +					(*spins)++;
> +
>  				sched_yield();
> +			}
> +		} else {
> +			while (tst_atomic_load(our_cntr) > 0
> +			       && tst_atomic_load(our_cntr) < INT_MAX) {
> +				if (spins)
> +					(*spins)++;
> +			}
>  		}
>  
> +
>  		tst_atomic_store(0, other_cntr);
>  		/*
>  		 * Once both counters have been set to zero the invariant
>  		 * is restored and we can continue.
>  		 */
> -		while (tst_atomic_load(our_cntr) > 1)
> -			;
> +		if (yield_in_wait) {
> +			while (tst_atomic_load(our_cntr) > 1)
> +				sched_yield();
> +		} else {
> +			while (tst_atomic_load(our_cntr) > 1)
> +				;
> +		}
>  	} else {
>  		/*
>  		 * If our counter is less than the other thread's we are ahead
>  		 * of it and need to wait.
>  		 */
> -		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
> -			if (spins)
> -				(*spins)++;
> -			if(yield_in_wait)
> +		if (yield_in_wait) {
> +			while (tst_atomic_load(our_cntr) <
> +			       tst_atomic_load(other_cntr)) {
> +				if (spins)
> +					(*spins)++;
>  				sched_yield();
> +			}
> +		} else {
> +			while (tst_atomic_load(our_cntr) <
> +			       tst_atomic_load(other_cntr)) {
> +				if (spins)
> +					(*spins)++;
> +			}
>  		}
>  	}
>  }
> @@ -713,8 +735,15 @@ static inline void tst_fzsync_start_race_a(struct tst_fzsync_pair *pair)
>  	tst_fzsync_wait_a(pair);
>  
>  	delay = pair->delay;
> -	while (delay < 0)
> -		delay++;
> +	if (pair->yield_in_wait) {
> +		while (delay < 0) {
> +			sched_yield();
> +			delay++;
> +		}
> +	} else {
> +		while (delay < 0)
> +			delay++;
> +	}
>  
>  	tst_fzsync_time(&pair->a_start);
>  }
> @@ -744,8 +773,15 @@ static inline void tst_fzsync_start_race_b(struct tst_fzsync_pair *pair)
>  	tst_fzsync_wait_b(pair);
>  
>  	delay = pair->delay;
> -	while (delay > 0)
> -		delay--;
> +	if (pair->yield_in_wait) {
> +		while (delay > 0) {
> +			sched_yield();
> +			delay--;
> +		}
> +	} else {
> +		while (delay > 0)
> +			delay--;
> +	}
>  
>  	tst_fzsync_time(&pair->b_start);
>  }
> -- 
> 2.30.1
>

Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
