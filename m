Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCaKJsi5eWl8ygEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:24:56 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4579DBC9
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:24:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A5A63CAB8E
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 08:24:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 332493C5918
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:24:51 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CFE5E1400E15
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 08:24:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4DBE45BCD1;
 Wed, 28 Jan 2026 07:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769585087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pd/qwnIAqBHnEpZnzKzIkOg3/L7BN+J1YTAi6coiT2o=;
 b=ZnYivHidOITsViFtALSydN67jCNKHRmMC6q3MiinjITV1hqS35DjqDBbq7k67PpInQL4G3
 HqZVsyPaJ8PFKDXfZKwtIWURaRB516tQSc5EhalnJfR8Z/EpoJu8ct/W3MdMCMzeGL/VvR
 UV5VsdR9f9NeJAp4XtHr+NRZbwguGRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769585087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pd/qwnIAqBHnEpZnzKzIkOg3/L7BN+J1YTAi6coiT2o=;
 b=Tz+goIz+9LI/X5zIdyNAtBiIRZ6ijrYvCDYA17gkHzymy+fg1Ufuqk2dC9pwtwJuFxlmw5
 YtMzv0rD/kS46nDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769585087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pd/qwnIAqBHnEpZnzKzIkOg3/L7BN+J1YTAi6coiT2o=;
 b=ZnYivHidOITsViFtALSydN67jCNKHRmMC6q3MiinjITV1hqS35DjqDBbq7k67PpInQL4G3
 HqZVsyPaJ8PFKDXfZKwtIWURaRB516tQSc5EhalnJfR8Z/EpoJu8ct/W3MdMCMzeGL/VvR
 UV5VsdR9f9NeJAp4XtHr+NRZbwguGRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769585087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pd/qwnIAqBHnEpZnzKzIkOg3/L7BN+J1YTAi6coiT2o=;
 b=Tz+goIz+9LI/X5zIdyNAtBiIRZ6ijrYvCDYA17gkHzymy+fg1Ufuqk2dC9pwtwJuFxlmw5
 YtMzv0rD/kS46nDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 161113EA61;
 Wed, 28 Jan 2026 07:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h3FmBL+5eWl7YgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 28 Jan 2026 07:24:47 +0000
Date: Wed, 28 Jan 2026 08:24:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>, Cyril Hrubis <chrubis@suse.cz>,
 Terry Tritton <terry.tritton@linaro.org>,
 Andrea Cervesato <andrea.cervesato@suse.com>, ltp@lists.linux.it,
 Andrea Cervesato <andrea.cervesato@suse.de>, Li Wang <liwang@redhat.com>
Message-ID: <20260128072445.GB13495@pevik>
References: <20251215161353.GA282302@pevik>
 <DEYXGZU8IXPQ.2N0IS65HUZ0LI@suse.com>
 <20251215165247.GC282302@pevik>
 <DF171554SNRA.2CKR0Q3FLG2TU@suse.com>
 <CABeuJB2TJ4bQDX709-sLO0tb0acYH770kS6X5zXMh0V0M3Yt-w@mail.gmail.com>
 <aV6DCbns02E4BCTj@yuki.lan> <20260107160656.GB791855@pevik>
 <aV6G0gxYWHSFkls0@yuki.lan>
 <CAASaF6wOSvi+07Pq5O6+f1Hkrq6WWMgpCaooJxWrO9uOvRM3pw@mail.gmail.com>
 <20260108133147.GB4263@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108133147.GB4263@pevik>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ioctl_pidfd02-06: Add CONFIG_USER_NS and
 CONFIG_PID_NS to needs_kconfigs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 1A4579DBC9
X-Rspamd-Action: no action

...
> > > > Because that was my question - really always prefer kconfig even there is a
> > > > simple runtime solution? I'd like to have some "rule" like conclusion we can
> > > > point during review.

> > > I think that from a long term view this is going to be simpler solution
> > > than having many different types of checks. The less diverse these
> > > checks are the easier they are to review and maintain. Hence I lean
> > > towards kernel config checks even though they are slower (mostly
> > > unmeasurable on today's harware) than the alternatives.

> > I think I lean opposite way, and rather have a check for right
> > environment to support the test.
> > You can have feature X enabled in kernel config, but still disabled
> > later at boot/runtime
> > (e.g. max_user_namespaces=0), or a module simply not being loaded.

> +1, all "tristate" configured as module might be missing. (openSUSE JeOS suffers
> with this when minimal kernel is installed).

> But "bool" are safe unless depend on "tristate" configured as module (not the
> case of CONFIG_USER_NS).

> Kind regards,
> Petr

OK, it's a bool, let's merge it.
I'm sorry to block it with a long discussion, but IMHO it was useful to bring
some conclusion (I'm going to send a patch for rules).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
