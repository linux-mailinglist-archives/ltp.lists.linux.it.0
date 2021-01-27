Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4030575D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:52:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6736D3C5E9D
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 10:52:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3087F3C5D1D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:52:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D88DD10001B7
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 10:52:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45211AD57;
 Wed, 27 Jan 2021 09:52:12 +0000 (UTC)
References: <20210127031853.3485-1-ycliang@andestech.com>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
In-reply-to: <20210127031853.3485-1-ycliang@andestech.com>
Date: Wed, 27 Jan 2021 09:52:11 +0000
Message-ID: <87ft2m906s.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

> Fuzzy sync library uses spin waiting mechanism to implement thread
> barrier behavior, which would cause this test to be time-consuming
> on single core machine.
>
> Fix this by adding sched_yield in the spin waiting loop, so that the
> thread yields cpu as soon as it enters the waiting loop.

Thanks for this, a full review will take some time, but I have some
minor comments already.

>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  include/tst_fuzzy_sync.h | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 4141f5c64..37f3d06f2 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -59,12 +59,15 @@
>   * @sa tst_fzsync_pair
>   */
>  
> -#include <sys/time.h>
> -#include <time.h>
>  #include <math.h>
> -#include <stdlib.h>

Please don't sort existing includes. It will apear in git-blame that you
added these. :-)

>  #include <pthread.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <sys/time.h>
> +#include <time.h>
>  #include "tst_atomic.h"
> +#include "tst_cpu.h"
>  #include "tst_timer.h"
>  #include "tst_safe_pthread.h"
>  
> @@ -180,6 +183,15 @@ struct tst_fzsync_pair {
>  	int exec_loop;
>  	/** Internal; The second thread or 0 */
>  	pthread_t thread_b;
> +	/** 
> +	 * Internal; The flag indicates single core machines or not

Actually I think the user can set this. It does not have to be internal.

> +	 * 
> +	 * If running on single core machines, it would take considerable
> +	 * amount of time to run fuzzy sync library.
> +	 * Thus call sched_yield to give up cpu to decrease the test time.
> +	 */
> +	bool yield_in_wait;
> +
>  };
>  
>  #define CHK(param, low, hi, def) do {					      \
> @@ -206,6 +218,7 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  	CHK(max_dev_ratio, 0, 1, 0.1);
>  	CHK(exec_time_p, 0, 1, 0.5);
>  	CHK(exec_loops, 20, INT_MAX, 3000000);
> +	CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));

The CHK macro will override the user if they set yield_in_wait to
zero. This only effects single core machines; so that it is impossible
for the user to disable yield (at least before calling init which is the
"correct way").

It still allows the user to enable yield on multicore which is good.

To avoid confusion I think it should be noted that users can force
enable yield on multicore, but they can not disable it on single core.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
