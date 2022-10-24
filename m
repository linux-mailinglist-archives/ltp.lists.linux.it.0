Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2860ADEF
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 16:40:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 309613CA165
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Oct 2022 16:40:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E54B3C8F91
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 16:40:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D1662600257
 for <ltp@lists.linux.it>; Mon, 24 Oct 2022 16:40:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F08841FD96;
 Mon, 24 Oct 2022 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666622444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9w9oHXFVIErvrQ09m2W83dtMGhFA8cnQ+WSIeJhiESI=;
 b=hdkXcbverMza5l9SembrKffTZRRV4+wkDlr8uSYmnJBKA02C44qpQIEWKAzxZqn/de8dvs
 vYNMe7bywJQYPzxZJI2dXEQVroPI33zD3POKDK3zZojKB4ulYcuBVwCkNouOWUPTP3unz9
 fohRbABBbuLqUAzueoyPfRxn66JwGTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666622444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9w9oHXFVIErvrQ09m2W83dtMGhFA8cnQ+WSIeJhiESI=;
 b=OEz0PlA4MdztfXtcOxpcicOuv/f+uTfb65Gl22cepNnESWIsjME9198SdopwO7VZcJ/gWH
 G0Cgu0HDLFXM6VDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79BC213A79;
 Mon, 24 Oct 2022 14:40:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0fSlHeqjVmMZKQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 24 Oct 2022 14:40:42 +0000
Date: Mon, 24 Oct 2022 16:42:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Y1akTna0bMncF3td@yuki>
References: <20221013082146.14581-1-andrea.cervesato@suse.com>
 <20221013082146.14581-3-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013082146.14581-3-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v8 1/2] Rewrite aio-stress test using LTP API
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
>  		event_io = t->free_ious;
>  		t->free_ious = t->free_ious->next;
>  		if (grab_iou(event_io, oper)) {
> -			fprintf(stderr, "io unit on free list but not free\n");
> +			tst_res(TINFO, "io unit on free list but not free");
>  			abort();

tst_brk(TBROK, ...) ?

>  		}
>  		return event_io;
> @@ -533,7 +523,8 @@ retry:
>  	if (nr > 0)
>  		goto retry;
>  	else
> -		fprintf(stderr, "no free ious after read_some_events\n");
> +		tst_res(TINFO, "no free ious after read_some_events");
> +
>  	return NULL;
>  }

...

>  /* starts some io for a given file, returns zero if all went well */
> -int run_built(struct thread_info *t, int num_ios, struct iocb **my_iocbs)
> +static int run_built(struct thread_info *t, int num_ios, struct iocb **my_iocbs)
>  {
>  	int ret;
>  	struct timeval start_time;
> @@ -778,17 +757,17 @@ resubmit:
>  		 */
>  		if (ret > 0 || ret == -EAGAIN) {
>  			int old_ret = ret;
> -			if ((ret = read_some_events(t) > 0)) {
> +
> +			ret = read_some_events(t);
> +			if (ret > 0) {
>  				goto resubmit;
>  			} else {
> -				fprintf(stderr, "ret was %d and now is %d\n",
> -					ret, old_ret);
> +				tst_res(TINFO, "ret was %d and now is %d", ret, old_ret);
>  				abort();
>  			}
>  		}
>  
> -		fprintf(stderr, "ret %d (%s) on io_submit\n", ret,
> -			strerror(-ret));
> +		tst_res(TINFO, "ret %d (%s) on io_submit", ret, tst_strerrno(-ret));
>  		return -1;
>  	}
>  	update_iou_counters(my_iocbs, ret, &stop_time);
> @@ -803,21 +782,18 @@ resubmit:
>  static int restart_oper(struct io_oper *oper)
>  {
>  	int new_rw = 0;
> +
>  	if (oper->last_err)
>  		return 0;
>  
> -	/* this switch falls through */
> -	switch (oper->rw) {
> -	case WRITE:
> -		if (stages & (1 << READ))
> -			new_rw = READ;
> -	case READ:
> -		if (!new_rw && stages & (1 << RWRITE))
> -			new_rw = RWRITE;
> -	case RWRITE:
> -		if (!new_rw && stages & (1 << RREAD))
> -			new_rw = RREAD;
> -	}
> +	if (oper->rw == WRITE && (stages & (1 << READ)))
> +		new_rw = READ;
> +
> +	if (oper->rw == READ && (!new_rw && stages & (1 << RWRITE)))
> +		new_rw = RWRITE;
> +
> +	if (oper->rw == RWRITE && (!new_rw && stages & (1 << RREAD)))
> +		new_rw = RREAD;

Maybe this part would be a bit better with goto as:

	if (oper->rv == WRITE && (staves & (1 << READ))) {
		new_rw = READ;
		goto restart;
	}

	if (oper->rv == READ && (stages & (1 << RWRITE))) {
		new_rw = RWRITE;
		goto restart;
	}

	...

restart:

>  	if (new_rw) {
>  		oper->started_ios = 0;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
