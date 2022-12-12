Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F164A4C5
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 17:31:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57A3C3CBE5F
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 17:31:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D98A3C2B4D
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 17:31:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 211E020075E
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 17:31:42 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 34A66338CF;
 Mon, 12 Dec 2022 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670862702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbX5yNmsQfDI0H9JrFjV67yVm0YPVu6f5ah517Se7g0=;
 b=iY0P5IaokaUIsr4OUqq9cuSN/8SV8Hkay8BP0RXLo+t0S3cbpGuAyihYhUZFeWJ2aJN2Ez
 Lm1U7hl7rMFAnInr7KUZ3JT8MdwG/2QjyYvzcFollawIbqma6Kcd+IuYbgc7OTNek4iGd+
 2Gu99kBUy3L1e/TCOB/IPdyc/6/o7Vg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670862702;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KbX5yNmsQfDI0H9JrFjV67yVm0YPVu6f5ah517Se7g0=;
 b=4GmEXXv/2QR2IlHElcX/t/GSrKvD0wkTEfZWGwxnXtET0x08ed/mEzBDF95F24Vx1vF8h2
 ZXXln9nAd4SRlMDA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EC2782C141;
 Mon, 12 Dec 2022 16:31:41 +0000 (UTC)
References: <20221212160322.4600-1-pvorel@suse.cz>
User-agent: mu4e 1.8.11; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 12 Dec 2022 16:31:03 +0000
Organization: Linux Private Site
In-reply-to: <20221212160322.4600-1-pvorel@suse.cz>
Message-ID: <87k02wshw2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] aio-stress.c: Use static variable iterations
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

Petr Vorel <pvorel@suse.cz> writes:

> local iteration variable in worker() was probably left over from
> previous versions rewrite (maybe -i was not used in previous versions).
>
> Clang correctly reported:
> aio-stress.c:1049:6: warning: variable 'iteration' set but not used [-Wunused-but-set-variable]
> int iteration = 0;
>
> Fixes: 054d45390 ("Rewrite aio-stress test using LTP API")
>
> Reported-by: Richard Palethorpe <rpalethorpe@suse.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> reported by Richie [1], I got confused thus merge before this fix.
>
> [1] https://lore.kernel.org/ltp/87h6yfifbr.fsf@suse.de/
>
>  testcases/kernel/io/ltp-aiodio/aio-stress.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/io/ltp-aiodio/aio-stress.c b/testcases/kernel/io/ltp-aiodio/aio-stress.c
> index 39db14d65..29e679087 100644
> --- a/testcases/kernel/io/ltp-aiodio/aio-stress.c
> +++ b/testcases/kernel/io/ltp-aiodio/aio-stress.c
> @@ -1046,7 +1046,6 @@ static int *worker(struct thread_info *t)
>  	char *this_stage = NULL;
>  	struct timeval stage_time;
>  	int status = 0;
> -	int iteration = 0;
>  	int cnt;
>  
>  	aio_setup(&t->io_ctx, 512);
> @@ -1151,7 +1150,7 @@ restart:
>  
>  	/* someone got restarted, go back to the beginning */
>  	if (t->active_opers && cnt < iterations) {
> -		iteration++;
> +		iterations++;

Why is this correct?

>  		goto restart;
>  	}


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
