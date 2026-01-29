Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKw3GT/0e2meJgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:58:55 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E5B5C8E
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:58:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97D603CBE28
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 00:58:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35FE73C99DA
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 00:58:51 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 70478600652
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 00:58:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0907343D0;
 Thu, 29 Jan 2026 23:58:50 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CD8E3EA61;
 Thu, 29 Jan 2026 23:58:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UEx9GDr0e2lVWgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 29 Jan 2026 23:58:50 +0000
Date: Fri, 30 Jan 2026 00:58:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20260129235849.GA120546@pevik>
References: <20251215165247.GC282302@pevik>
 <DF171554SNRA.2CKR0Q3FLG2TU@suse.com>
 <CABeuJB2TJ4bQDX709-sLO0tb0acYH770kS6X5zXMh0V0M3Yt-w@mail.gmail.com>
 <aV6DCbns02E4BCTj@yuki.lan> <20260107160656.GB791855@pevik>
 <aV6G0gxYWHSFkls0@yuki.lan>
 <CAASaF6wOSvi+07Pq5O6+f1Hkrq6WWMgpCaooJxWrO9uOvRM3pw@mail.gmail.com>
 <20260108133147.GB4263@pevik> <20260128072445.GB13495@pevik>
 <aXt390Nf52MwkiGK@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXt390Nf52MwkiGK@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Terry Tritton <terry.tritton@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_EQ_FROM(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:replyto,suse.cz:email]
X-Rspamd-Queue-Id: 107E5B5C8E
X-Rspamd-Action: no action

> Hi!
> > OK, it's a bool, let's merge it.
> > I'm sorry to block it with a long discussion, but IMHO it was useful to bring
> > some conclusion (I'm going to send a patch for rules).

> I would merge this before the release, since this works fine as long as
> namespaces are not disabled on commandline, which should be a corner
> case and I would like to fix that with the hooks I've proposed in reply
> to email from Jan.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Right, finally merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
