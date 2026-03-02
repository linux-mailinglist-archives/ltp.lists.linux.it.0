Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K8qHpdfpWlc+QUAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 10:59:51 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 125E61D5E0C
	for <lists+linux-ltp@lfdr.de>; Mon, 02 Mar 2026 10:59:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C80FF3D75BB
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2026 10:59:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 607273C4C64
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 10:59:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B07DA1000946
 for <ltp@lists.linux.it>; Mon,  2 Mar 2026 10:59:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2AC43F823;
 Mon,  2 Mar 2026 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772445585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqBSyV5PL7jQFZWoJYdR4TC1110JfVTvhmobTe4LuM4=;
 b=BI7Sl+kT34Zyu2gW+116c5eVJRsin7b/Htt+wVTEZ2wYp6PG7ux5mrYfOlSbaqGdW9VvJF
 t53Pjde1EOdza2qCVpKEg9LqR3T/nXOowALxTRfi/oc//ZGBP4DBHWMr3vcA3m9zBXxYkh
 tKE/olARxy+OWm4+eWctOeRKGROyCNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772445585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqBSyV5PL7jQFZWoJYdR4TC1110JfVTvhmobTe4LuM4=;
 b=pmWk9kyinj/EYZUgnQ3w4WASkKNSQ+cRsMi+xV5w7veDBPgnH4NLwiedY+P6qbT4LYDaFE
 pEb6i5VoWRoee9BQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=BI7Sl+kT;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=pmWk9kyi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1772445585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqBSyV5PL7jQFZWoJYdR4TC1110JfVTvhmobTe4LuM4=;
 b=BI7Sl+kT34Zyu2gW+116c5eVJRsin7b/Htt+wVTEZ2wYp6PG7ux5mrYfOlSbaqGdW9VvJF
 t53Pjde1EOdza2qCVpKEg9LqR3T/nXOowALxTRfi/oc//ZGBP4DBHWMr3vcA3m9zBXxYkh
 tKE/olARxy+OWm4+eWctOeRKGROyCNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1772445585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gqBSyV5PL7jQFZWoJYdR4TC1110JfVTvhmobTe4LuM4=;
 b=pmWk9kyinj/EYZUgnQ3w4WASkKNSQ+cRsMi+xV5w7veDBPgnH4NLwiedY+P6qbT4LYDaFE
 pEb6i5VoWRoee9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0BCD3EA69;
 Mon,  2 Mar 2026 09:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id atMSJpFfpWk+EgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 02 Mar 2026 09:59:45 +0000
Date: Mon, 2 Mar 2026 10:59:54 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <aaVfmr0jWE-_4SYG@yuki.lan>
References: <20260301012808.15588-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260301012808.15588-1-liwang@redhat.com>
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: Extend -D flag to support multiple debug
 levels
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.937];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,yuki.lan:mid]
X-Rspamd-Queue-Id: 125E61D5E0C
X-Rspamd-Action: no action

Hi!
> This patch extends the LTP debugging framework by introducing multiple
> levels of verbosity for the '-D' command line option. Instead of a simple
> on/off toggle, it now allows developers to specify whether they want debug
> output exclusively from the test process, or from both the test and library
> processes.
> 
> The supported debug levels are:
>   -D0     : Disable all debug logs (default behavior)
>   -D1 (-D): Enable debug logs for the test process only
>   -D2     : Enable verbose debug logs for both the test and library processes
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  doc/developers/debugging.rst |  6 ++++++
>  lib/tst_test.c               | 25 +++++++++++++++----------
>  2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/doc/developers/debugging.rst b/doc/developers/debugging.rst
> index 181e5b096..8b5550b73 100644
> --- a/doc/developers/debugging.rst
> +++ b/doc/developers/debugging.rst
> @@ -12,6 +12,12 @@ The LTP framework supports ``TDEBUG`` flag test debug messages. These
>  messages can be enabled using the ``-D`` parameter or setting ``LTP_ENABLE_DEBUG=1``
>  environment variable (see :doc:`../users/setup_tests`).
>  
> +The ``-D`` parameter also supports the following verbosity levels:
> +
> +  ``-D0``: Disable all debug logs (default behavior).
> +  ``-D1`` (or ``-D``): Enable debug logs for the test process only.
> +  ``-D2``: Enable verbose debug logs for both the test and library processes.
> +
>  Tracing and debugging syscalls
>  ------------------------------
>  
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 239494b6f..f7907223e 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -83,7 +83,7 @@ struct context {
>  	tst_atomic_t abort_flag;
>  	uint32_t mntpoint_mounted:1;
>  	uint32_t ovl_mounted:1;
> -	uint32_t tdebug:1;
> +	uint32_t tdebug;
>  };
>  
>  struct results {
> @@ -217,7 +217,7 @@ void tst_reinit(void)
>  	tst_max_futexes = (size - offsetof(struct ipc_region, futexes)) / sizeof(futex_t);
>  
>  	if (context->tdebug)
> -		tst_res(TINFO, "Restored metadata for PID %d", getpid());
> +		tst_res(TDEBUG, "Restored metadata for PID %d", getpid());

I suppose that we do not need the if (context->tdebug) now.


Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
