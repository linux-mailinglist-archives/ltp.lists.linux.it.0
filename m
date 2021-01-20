Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09B2FCDB2
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 11:00:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83BA53C5DBD
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 11:00:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C11DE3C3071
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 11:00:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 059A61000AEB
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 11:00:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 556F3AC9B;
 Wed, 20 Jan 2021 10:00:15 +0000 (UTC)
References: <20210120070053.11490-1-ycliang@andestech.com>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
In-reply-to: <20210120070053.11490-1-ycliang@andestech.com>
Date: Wed, 20 Jan 2021 10:00:14 +0000
Message-ID: <87sg6w9bdd.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fzsync: Add sched_yield for single core
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

> Fuzzy sync library uses spin waiting mechanism
> to implement thread barrier behavior, which would
> cause this test to be time-consuming on single core machine.
>
> Fix this by adding sched_yield in the spin waiting loop,
> so that the thread yields cpu as soon as it enters the waiting loop.

Thanks for sending this in. Comments below.

>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  include/tst_fuzzy_sync.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 4141f5c64..64d172681 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -59,9 +59,11 @@
>   * @sa tst_fzsync_pair
>   */
>  
> +#include <sys/sysinfo.h>
>  #include <sys/time.h>
>  #include <time.h>
>  #include <math.h>
> +#include <sched.h>
>  #include <stdlib.h>
>  #include <pthread.h>
>  #include "tst_atomic.h"
> @@ -564,6 +566,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
>  		       && tst_atomic_load(our_cntr) < INT_MAX) {
>  			if (spins)
>  				(*spins)++;
> +			if(get_nprocs() == 1)

We should use tst_ncpus() and then cache the value so we are not making
a function call within the loop. It is probably best to avoid calling
this function inside tst_fzsync_pair_wait, it may even result in a
system call.

We should probably cache the value in tst_fzsync_pair, maybe as a
boolean e.g. "yield_in_wait". This can be set/checked in the
tst_fzsync_pair_init function. Also this will allow the user to handle
CPUs being offlined if the test itself can cause that.

> +				sched_yield();
>  		}
>  
>  		tst_atomic_store(0, other_cntr);
> @@ -581,6 +585,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
>  		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
>  			if (spins)
>  				(*spins)++;
> +			if(get_nprocs() == 1)
> +				sched_yield();
>  		}
>  	}
>  }

Everyone please note that we will have to test this extensively to
ensure it does break existing reproducers.

Alternatively to this approach we could create seperate implementations
of pair_wait and use a function pointer. I am thinking it may be best to
do it both ways and perform some measurements.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
