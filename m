Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936DBDE05
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 14:21:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2C0A3C20AB
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 14:21:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3E03D3C207B
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 14:21:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E3786600CFA
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 14:21:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0C19AF78;
 Wed, 25 Sep 2019 12:21:36 +0000 (UTC)
References: <20190925103813.16078-1-liwang@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20190925103813.16078-1-liwang@redhat.com>
Date: Wed, 25 Sep 2019 14:21:36 +0200
Message-ID: <87blv8y3an.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Patch v4] fzsync: revoke thread_b if parent hits
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
> We fix the problem via a way to kill thread_b with pthread_cancel. With new
> wrap_run_b involves enabling thread cancel at the start of the thread B,
> then do asynchronous cancellation in tst_fzsync_pair_cleanup if pair->exit
> is not being set to 1.
>
> Workaround: [commit 2e74d996: Check recvmmsg exists before entering fuzzy loop]
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Richard Palethorpe <rpalethorpe@suse.com>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_fuzzy_sync.h | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index f9a1947c7..00c74e951 100644
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
> @@ -218,12 +219,36 @@ static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>  static void tst_fzsync_pair_cleanup(struct tst_fzsync_pair *pair)
>  {
>  	if (pair->thread_b) {
> -		tst_atomic_store(1, &pair->exit);
> +		/* Revoke thread B if parent hits accidental break */
> +		if (!pair->exit) {
> +			tst_atomic_store(1, &pair->exit);
> +			usleep(100000);
> +			pthread_cancel(pair->thread_b);
> +			pair->thread_b = 0;

We still need to join after using cancel, or?

> +			return;
> +		}
>  		SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
>  		pair->thread_b = 0;
>  	}
>  }
>
> +/**
> + * Wrap run_b for tst_fzsync_pair_reset to enable pthread cancel
> + * at the start of the thread B.
> + */
> +static void *wrap_run_b(void *run_b)
> +{
> +       void *(*real_run_b)(void *) = run_b;

The C standard doesn't actually allow this, except maybe C11. See my
other e-mail to patch V3.

> +
> +       if (real_run_b) {
> +	       pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +	       pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> +	       (*real_run_b)(NULL);
> +       }
> +
> +       return NULL;
> +}
> +
>  /**
>   * Zero some stat fields
>   *
> @@ -272,7 +297,7 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  	pair->b_cntr = 0;
>  	pair->exit = 0;
>  	if (run_b)
> -		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
> +		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, wrap_run_b, run_b);
>
>  	pair->exec_time_start = (float)tst_timeout_remaining();
>  }


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
