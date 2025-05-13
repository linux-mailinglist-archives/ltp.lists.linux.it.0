Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC30AB5533
	for <lists+linux-ltp@lfdr.de>; Tue, 13 May 2025 14:52:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BFDF3CC32A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 May 2025 14:52:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 409293CC301
 for <ltp@lists.linux.it>; Tue, 13 May 2025 14:52:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5B48D600A47
 for <ltp@lists.linux.it>; Tue, 13 May 2025 14:52:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C71651F789;
 Tue, 13 May 2025 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747140719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6Fl3QKq073uJzfrZMR91mx3Jg2ETW7Dr8LlFKp9tUc=;
 b=zofMIwDjmGnUD8GzVv/dVgpoj3a9dpYze0wxIfig0LMvbMGQOraCQoWLPH0+3et9PrBQNI
 +kBbKRITTzKxDuHAFBBuXm/CRVHJl2SIhvmHAOs9uG8tuht6ghsZ8YaqRwNsH5KoSd03y+
 wI56/ZxBoRDLzsmqwNFyR/BUwEEBkjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747140719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6Fl3QKq073uJzfrZMR91mx3Jg2ETW7Dr8LlFKp9tUc=;
 b=TWmm7Ix64VHvycNMrQ2uN+hFOmAZJtZfenhc/V7SCmiwtoVNfdpAKq36l+UoIm9xP0aZEF
 Ub/lEZbOx67oMbAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1747140719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6Fl3QKq073uJzfrZMR91mx3Jg2ETW7Dr8LlFKp9tUc=;
 b=zofMIwDjmGnUD8GzVv/dVgpoj3a9dpYze0wxIfig0LMvbMGQOraCQoWLPH0+3et9PrBQNI
 +kBbKRITTzKxDuHAFBBuXm/CRVHJl2SIhvmHAOs9uG8tuht6ghsZ8YaqRwNsH5KoSd03y+
 wI56/ZxBoRDLzsmqwNFyR/BUwEEBkjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1747140719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X6Fl3QKq073uJzfrZMR91mx3Jg2ETW7Dr8LlFKp9tUc=;
 b=TWmm7Ix64VHvycNMrQ2uN+hFOmAZJtZfenhc/V7SCmiwtoVNfdpAKq36l+UoIm9xP0aZEF
 Ub/lEZbOx67oMbAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26ABE137E8;
 Tue, 13 May 2025 12:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KHw9CG9AI2h8TgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 13 May 2025 12:51:59 +0000
Date: Tue, 13 May 2025 14:51:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250513125148.GA244619@pevik>
References: <20250513050530.47541-1-liwang@redhat.com>
 <aCM2PrCrCdPqNIGc@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCM2PrCrCdPqNIGc@yuki.lan>
X-Spam-Level: 
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -7.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] lib: initialize lib|main_pid to zero in the
 setup_ipc
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > +++ b/lib/tst_test.c
> > @@ -59,7 +59,6 @@ static const char *tid;
> >  static int iterations = 1;
> >  static float duration = -1;
> >  static float timeout_mul = -1;
> > -static pid_t lib_pid;
> >  static int mntpoint_mounted;
> >  static int ovl_mounted;
> >  static struct timespec tst_start_time; /* valid only for test pid */
> > @@ -143,7 +142,9 @@ static void setup_ipc(void)
> >  		tst_futexes = (char *)results + sizeof(struct results);
> >  		tst_max_futexes = (size - sizeof(struct results))/sizeof(futex_t);
> >  	}
> > -	results->lib_pid = lib_pid;
> > +
> > +	results->lib_pid = 0;
> > +	results->main_pid = 0;

nit: Is it really needed to int them to 0? Because they should be 0 due the
default struct value, right?

> >  }

> >  static void cleanup_ipc(void)
> > @@ -394,7 +395,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype, const char *fmt,
> >  	 * If tst_brk() is called from some of the C helpers even before the
> >  	 * library was initialized, just exit.
> >  	 */
> > -	if (!results->lib_pid)
> > +	if (!results || !results->lib_pid)
> >  		exit(TTYPE_RESULT(ttype));

> >  	update_results(TTYPE_RESULT(ttype));
> > @@ -1334,6 +1335,8 @@ static void do_setup(int argc, char *argv[])
> >  		tst_test->forks_child = 1;
> >  	}

> > +	setup_ipc();
> > +
> >  	if (tst_test->needs_kconfigs && tst_kconfig_check(tst_test->needs_kconfigs))
> >  		tst_brk(TCONF, "Aborting due to unsuitable kernel config, see above!");

> > @@ -1393,8 +1396,6 @@ static void do_setup(int argc, char *argv[])
> >  	if (tst_test->hugepages.number)
> >  		tst_reserve_hugepages(&tst_test->hugepages);

> > -	setup_ipc();
> > -

> I suppose that this has to go before the tst_reserve_hugepages() so that
> we have results->lib_pid defined and properly clean up after the
> hugepages.

Why? Is that due possible tst_brk() calls in tst_reserve_hugepages()?
(Which uses SAFE_* macros.) That would trigger Because there are tst_brk() calls before.

Also why not assign results->lib_pid = getpid() at the beginning of
tst_run_tcases() ?

Kind regards,
Petr

> However for that to work we have to set the
> results->lib_pid directly in the setup_ipc().

> >  	if (tst_test->bufs)
> >  		tst_buffers_alloc(tst_test->bufs);

> > @@ -1929,10 +1930,11 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
> >  	unsigned int test_variants = 1;
> >  	struct utsname uval;

> > -	lib_pid = getpid();
> >  	tst_test = self;

> >  	do_setup(argc, argv);
> > +
> > +	results->lib_pid = getpid();

> Setting it here is too late.

> Other than that the patch looks good to me.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
