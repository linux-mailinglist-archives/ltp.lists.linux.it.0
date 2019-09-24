Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B41BC809
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 14:42:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB63F3C20AE
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 14:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F1E903C04F4
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 14:42:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B55ED1A005E5
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 14:42:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E385AAFB1;
 Tue, 24 Sep 2019 12:42:23 +0000 (UTC)
References: <20190924105801.7616-1-liwang@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20190924105801.7616-1-liwang@redhat.com>
Date: Tue, 24 Sep 2019 14:42:23 +0200
Message-ID: <87wodxkgr4.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] fzsync: revoke thread_b if parent hits an
 accidental break
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
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> We shouldn't rely entirely on the pair->exit flag in tst_fzsync_pair_cleanup()
> since there is possible to call tst_brk() at anyplace of thread_a, that will
> lead to timeout eventually because of thread_b(tst_fzsync_wait_b) fall into
> an infinite(no explicit condition to exit) loop.
>
> Thread_a path trace:
>   tst_brk()
>     cleanup()
>       tst_fzsync_pair_cleanup()
>         SAFE_PTHREAD_JOIN(pair->thread_b, NULL)
>         #Or pthread_cancel(pair->thread_b)
>
> We fix the problem via a way to kill thread_b with pthread_cancel.

Good idea, however not an easy one to implement.

>
> Work-around: [commit 2e74d996: Check recvmmsg exists before entering fuzzy loop]
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Richard Palethorpe <rpalethorpe@suse.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>
> Notes:
>     Patch V2: http://lists.linux.it/pipermail/ltp/2019-January/010489.html
>     Patch V1: http://lists.linux.it/pipermail/ltp/2019-January/010438.html
>
>  include/tst_fuzzy_sync.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index f9a1947c7..152f779cb 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -63,6 +63,7 @@
>  #include <time.h>
>  #include <math.h>
>  #include <stdlib.h>
> +#include <pthread.h>
>  #include "tst_atomic.h"
>  #include "tst_timer.h"
>  #include "tst_safe_pthread.h"
> @@ -218,9 +219,13 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  static void tst_fzsync_pair_cleanup(struct tst_fzsync_pair *pair)
>  {
>  	if (pair->thread_b) {
> -		tst_atomic_store(1, &pair->exit);
> -		SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
> -		pair->thread_b = 0;
> +		if (pair->exit == 1) {

It can just be

if (!pair->exit) {
   ...
}

We want to join the thread and set the func pointer to zero regardless
of how we exit.

> +			SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
> +			pair->thread_b = 0;
> +		} else {

I suggest still setting pair->exit here and maybe sleeping for
100ms. This gives thread B chance to exit gracefully. It is possible
that if thread B is in a spin loop then the thread won't be cancelled as
asynchronous cancellation is not guaranteed by POSIX.

> +			pthread_cancel(pair->thread_b);
> +			pair->thread_b = 0;
> +		}
>  	}
>  }
>
> @@ -271,8 +276,11 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  	pair->a_cntr = 0;
>  	pair->b_cntr = 0;
>  	pair->exit = 0;
> -	if (run_b)
> +	if (run_b) {
> +		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);

These need to go inside thread B unless I am mistaken. Which means you
must wrap the user supplied function. You can create a function which
accepts a pointer to some contiguous memory containing the user supplied function
pointer and the user supplied arg pointer.

This can then set the threads cancel type before calling the user func with
the arg.

>  		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
> +	}
>
>  	pair->exec_time_start = (float)tst_timeout_remaining();
>  }

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
