Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC23E44D7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 13:28:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24A023C71BD
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 13:28:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE1E53C6086
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 13:28:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7B72D600121
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 13:28:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9E5321EC6;
 Mon,  9 Aug 2021 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628508504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkYK9PlX49uJfWAjXjXxS70eX/tefNMTWg1Gm+IQAiQ=;
 b=jxbAdEB3OAeo3FKvdOg39b5PxJT3oJTT71nV/YXIkerqh4dXX0KeTbSzgfcm9YKSqed0Ta
 cXh6bZUXWZvazmAHYJRXaIHQvjHxdI208rOTFwr0WpV8oFkB/sJmM09kSUwai+hpyaB+aK
 qGuh6LkmxIan/J0fo4wHUUH86VXjHH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628508504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZkYK9PlX49uJfWAjXjXxS70eX/tefNMTWg1Gm+IQAiQ=;
 b=EupvUUokp641T/y+ov9s0lFkc/kTauO6s2wid+49UJeeQvWOfvqQaBw9NiwKStQM+GB6hu
 1Z1hBv6osJ9scGDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 956C913BA9;
 Mon,  9 Aug 2021 11:28:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ujNjI1gREWHTfQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 11:28:24 +0000
Date: Mon, 9 Aug 2021 13:28:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YRERYjpToxyA0AZI@yuki>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
 <20210806164730.51040-7-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806164730.51040-7-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 06/16] syscalls/sched_setparam03: convert to
 new API
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
> +	if (!child_pid) {
> +		/*
> +		 * Call sched_setparam(2) with pid = getppid() so that
> +		 * it will set the scheduling parameters for parent
> +		 * process
> +		 */

I would have removed this comment as well, as it's stating the obvious.

> +		TST_EXP_PASS_SILENT(tv->sched_setparam(getppid(), &p5));
> +		exit(0);
>  	}
> +	tst_reap_children();
>  
> -	cleanup();
> -	tst_exit();
> +	TST_EXP_PASS_SILENT(tv->sched_getparam(0, &p));
> +
> +	if (p.sched_priority == p5.sched_priority)
> +		tst_res(TPASS, "got expected priority %d", p.sched_priority);
> +	else
> +		tst_res(TFAIL, "got priority %d, expected 5", p.sched_priority);
>  }
>  
> -/* setup() - performs all ONE TIME setup for this test */
>  void setup(void)
>  {
> -	struct sched_param p = { 1 };
> -
> -	tst_require_root();
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	/* Change scheduling policy to SCHED_FIFO */
> -	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1) {
> -		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
> -	}
> +	struct sched_variants *tv = &variants[tst_variant];
> +	struct sched_param p = { .sched_priority = 1 };
>  
> +	tst_res(TINFO, "Testing %s variant", tv->desc);
> +	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, SCHED_FIFO, &p));

We should tst_brk() here if this fails, TST_EXP_PASS_SILENT() is not
really supposed to be used in the test setup().

And given that we handle the TCONF case in the function we call by the
pointer we can just do:

	if (tv->sched_setscheduler(0, SCHED_FIFO, &p))
		tst_brk(TBROK | TERRNO, "sched_setcheduler(0, SCHED_FIFO, ...)");


Other than this the rest looks good. With the setup() part fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
