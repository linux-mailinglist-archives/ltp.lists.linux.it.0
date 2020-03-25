Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C9192A73
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 14:52:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700C63C4BE1
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 14:52:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8CD083C4BA8
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 14:52:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CBD0060120E
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 14:52:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 501D5AD0F
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 13:52:51 +0000 (UTC)
References: <20200325103734.31295-1-mdoucha@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <20200325103734.31295-1-mdoucha@suse.cz>
Date: Wed, 25 Mar 2020 14:52:50 +0100
Message-ID: <875zeszglp.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix use after stack unwind in fzsync lib
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

Hello,

Martin Doucha <mdoucha@suse.cz> writes:

> tst_fzsync_pair_reset() passes a local variable to thread B which may be
> already unwinded by the time the thread wrapper function executes. If new
> variables get allocated and initialized on stack between pthread_create()
> and thread wrapper execution, thread B will segfault.
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_fuzzy_sync.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index c1d0b00f9..32b9859a0 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -242,11 +242,14 @@ struct tst_fzsync_run_thread {
>   */
>  static void *tst_fzsync_thread_wrapper(void *run_thread)
>  {
> -       struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread *)run_thread;
> +       struct tst_fzsync_run_thread *t = run_thread;
> +       void *ret;
>  
>         pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
>         pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> -       return t.func(t.arg);
> +       ret = t->func(t->arg);
> +       free(t);

Why not use SAFE_FREE?

> +       return ret;
>  }
>  
>  /**
> @@ -297,8 +300,12 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  	pair->b_cntr = 0;
>  	pair->exit = 0;
>  	if (run_b) {
> -		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
> -		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
> +		struct tst_fzsync_run_thread *wrap_run_b;
> +
> +		wrap_run_b = SAFE_MALLOC(sizeof(struct tst_fzsync_run_thread));
> +		wrap_run_b->func = run_b;
> +		wrap_run_b->arg = NULL;
> +		SAFE_PTHREAD_CREATE(&pair->thread_b, 0,
>  tst_fzsync_thread_wrapper, wrap_run_b);

I suppose there is a memory leak here if thread create fails, but we
probably don't care because the test will exit shortly afterwards.

>  	}
>  
>  	pair->exec_time_start = (float)tst_timeout_remaining();


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
