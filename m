Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBC194107
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 15:11:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5826C3C4B4D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 15:11:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 501FB3C0823
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 15:11:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 99F101401A5C
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 15:11:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 032D1B149
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 14:11:02 +0000 (UTC)
Date: Thu, 26 Mar 2020 15:11:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200326141101.GB5185@yuki.lan>
References: <20200326122329.24876-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326122329.24876-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix use after stack unwind in fzsync lib
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
> tst_fzsync_pair_reset() passes a local variable to thread B which may be
> already unwinded by the time the thread wrapper function executes. If new
> variables get allocated and initialized on stack between pthread_create()
> and thread wrapper execution, thread B will segfault.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> Changes since v1:
> - Use tst_alloc() instead of SAFE_MALLOC() to prevent memory leak even if
>   SAFE_PTHREAD_CREATE() fails
> - Revert changes in tst_fzsync_thread_wrapper() as they're no longer needed
> 
>  include/tst_fuzzy_sync.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index c1d0b00f9..8b38cf37d 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -297,8 +297,12 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  	pair->b_cntr = 0;
>  	pair->exit = 0;
>  	if (run_b) {
> -		struct tst_fzsync_run_thread wrap_run_b = {.func = run_b, .arg = NULL};
> -		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, &wrap_run_b);
> +		struct tst_fzsync_run_thread *wrap_run_b;
> +
> +		wrap_run_b = tst_alloc(sizeof(struct tst_fzsync_run_thread));
> +		wrap_run_b->func = run_b;
> +		wrap_run_b->arg = NULL;

Why can't we simply declare the wrap_run_b as a global variable?

> +		SAFE_PTHREAD_CREATE(&pair->thread_b, 0, tst_fzsync_thread_wrapper, wrap_run_b);
>  	}
>  
>  	pair->exec_time_start = (float)tst_timeout_remaining();
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
