Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6230588F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:37:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71E753C5E9D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:37:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B4E363C4FB6
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:37:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 575E6600747
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:37:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DCF4AD57;
 Wed, 27 Jan 2021 10:37:04 +0000 (UTC)
References: <20210127031853.3485-1-ycliang@andestech.com>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
In-reply-to: <20210127031853.3485-1-ycliang@andestech.com>
Date: Wed, 27 Jan 2021 10:37:03 +0000
Message-ID: <87czxq8y40.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] fzsync: Add sched_yield for single core
 machine
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Leo,

Leo Yu-Chi Liang <ycliang@andestech.com> writes:

> +	/**

Trailing whitespace

> +	 * Internal; The flag indicates single core machines or not
> +	 *

Same as above

> +	 * If running on single core machines, it would take considerable
> +	 * amount of time to run fuzzy sync library.
> +	 * Thus call sched_yield to give up cpu to decrease the test time.
> +	 */
> +	bool yield_in_wait;

Actually it appears the CHK macro is not compatible with bool, it
produces compiler warnings. You can either just change this to 'int
yield_in_wait:1;' or don't use the CHK macro.


> +
>  };
>  
>  #define CHK(param, low, hi, def) do {					      \
> @@ -206,6 +218,7 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  	CHK(max_dev_ratio, 0, 1, 0.1);
>  	CHK(exec_time_p, 0, 1, 0.5);
>  	CHK(exec_loops, 20, INT_MAX, 3000000);
> +	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
>  }
>  #undef CHK
>  
> @@ -550,7 +563,8 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
>   */
>  static inline void tst_fzsync_pair_wait(int *our_cntr,
>  					int *other_cntr,
> -					int *spins)
> +					int *spins,
> +					bool yield_in_wait)
>  {
>  	if (tst_atomic_inc(other_cntr) == INT_MAX) {
>  		/*
> @@ -564,6 +578,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
>  		       && tst_atomic_load(our_cntr) < INT_MAX) {
>  			if (spins)
>  				(*spins)++;
> +			if(yield_in_wait)
> +				sched_yield();
>  		}
>  
>  		tst_atomic_store(0, other_cntr);
> @@ -581,6 +597,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
>  		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
>  			if (spins)
>  				(*spins)++;
> +			if(yield_in_wait)
> +				sched_yield();

After disassembling this, it appears the compiler does not move the
yield branch outside the loop. The spins branch is optimised out because
it is a compile time constant when NULL.

This might not matter, but it will need testing on a lot of
platforms. OTOH we could manually move the branch outside of the loop.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
