Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EDB13902
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jul 2025 12:32:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D58E63C95BF
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jul 2025 12:31:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F01463C0F36
 for <ltp@lists.linux.it>; Mon, 28 Jul 2025 12:31:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C2A90600BD9
 for <ltp@lists.linux.it>; Mon, 28 Jul 2025 12:31:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2354121242;
 Mon, 28 Jul 2025 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753698703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCNIwxfJD97gWGDkC6kJ6W3k+uJi8XWMKU0WbXYe2ik=;
 b=3aBJXwrCMB1qFLVlTR7FPMp1nbJJe6M1mn4wN8EdbF6Wtk7H/zCjifJ2UjotF8eD9uUSt1
 X+n/9vRAUb1FwiPF0D6CVukA35zDY72ru969dGgqyXV9KZ7b9QXqFms/bTWDo9ql/9qTan
 JMvbgG5USppFiqXZoVnWpqFeG3kDA1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753698703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCNIwxfJD97gWGDkC6kJ6W3k+uJi8XWMKU0WbXYe2ik=;
 b=AYQRJefui/5dFlZNvv6rb/hdsAERsFTgJWb+qlNssRFiSH5dmECku4kUa50xWH5viDEAkk
 mlFHNh18cXN05mAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1753698703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCNIwxfJD97gWGDkC6kJ6W3k+uJi8XWMKU0WbXYe2ik=;
 b=3aBJXwrCMB1qFLVlTR7FPMp1nbJJe6M1mn4wN8EdbF6Wtk7H/zCjifJ2UjotF8eD9uUSt1
 X+n/9vRAUb1FwiPF0D6CVukA35zDY72ru969dGgqyXV9KZ7b9QXqFms/bTWDo9ql/9qTan
 JMvbgG5USppFiqXZoVnWpqFeG3kDA1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1753698703;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCNIwxfJD97gWGDkC6kJ6W3k+uJi8XWMKU0WbXYe2ik=;
 b=AYQRJefui/5dFlZNvv6rb/hdsAERsFTgJWb+qlNssRFiSH5dmECku4kUa50xWH5viDEAkk
 mlFHNh18cXN05mAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10D9D138A5;
 Mon, 28 Jul 2025 10:31:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G95RA49Rh2hrQwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jul 2025 10:31:43 +0000
Date: Mon, 28 Jul 2025 12:31:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250728103141.GA756176@pevik>
References: <20250728212752.774436-1-wegao@suse.com>
 <aIdLGf5Kx5NuAH98@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aIdLGf5Kx5NuAH98@yuki.lan>
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,suse.cz:replyto];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Score: -7.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] mount08.c: SKIP test if selinux is running
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

Hi,

> The commit is missing why this has to be done. Please be more verbose
> and explain the reasons in the commit message.

+1, I was going to write the same (remember: often more useful commit message is
not *what* you change, but *why* your did the change).

Also, test under SELinux returns EACCES instead of ENOENT:

mount08.c:32: TFAIL: mount(/proc/130541/fd/4) expected ENOENT: EACCES (13)

Why not keep the test just update errno for SELinux?

In setup:
static int exp_errno = ENOENT;

	if (tst_selinux_enforcing())
		exp_errno = EACCES;

> > Signed-off-by: Wei Gao <wegao@suse.com>
> > ---
> >  testcases/kernel/syscalls/mount/mount08.c | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/testcases/kernel/syscalls/mount/mount08.c b/testcases/kernel/syscalls/mount/mount08.c
> > index e2824ac55..1f97de182 100644
> > --- a/testcases/kernel/syscalls/mount/mount08.c
> > +++ b/testcases/kernel/syscalls/mount/mount08.c
> > @@ -41,6 +41,9 @@ static void run(void)

> >  static void setup(void)
> >  {
> > +	if (tst_selinux_enforcing())
> > +		tst_brk(TCONF, "SKIP test since selinux is running");
Please don't use upper case. Also SELinux is not "running" but enabled
in enforce mode. If test should be really skip I would use:

	tst_brk(TCONF, "skip test due SELinux enforce");

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
