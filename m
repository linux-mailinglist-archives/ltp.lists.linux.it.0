Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL6hHNr6jWnz9wAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 17:07:54 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F270E12F3BA
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 17:07:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C15513CF3E2
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Feb 2026 17:07:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 317143CB779
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 17:07:39 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 714521400132
 for <ltp@lists.linux.it>; Thu, 12 Feb 2026 17:07:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C3FC13E6C3;
 Thu, 12 Feb 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770912455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPnxbqaz/Nc1yhvAmvDoFy2o39vb0mY3UEAlNeTIFX8=;
 b=dFztZ2ndRHdeVDlp3887QXH7QPLUIbZ0bTXilkod81yU9hoHBLKQPVz0BVxX0gQFSphLXj
 lcs4HaU3e8Pj0iA/NfbojfHllN1PrT3CEzzx6mndU6lVCbJBTEAjadJfN0s6YuXv2Y7nwZ
 DRIioxFz38Q74mY+jutGHZqFaBSlCro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770912455;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPnxbqaz/Nc1yhvAmvDoFy2o39vb0mY3UEAlNeTIFX8=;
 b=eA62dt+HYmAMWYVZ7N3UZkeq4kge/lnhh0NGCvucAIytoxqyF9NGNQM/pPPrR3LPgdhIel
 H7/kcLhqnTGn5yAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=huAkJueO;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=QQN3rPR9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770912454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPnxbqaz/Nc1yhvAmvDoFy2o39vb0mY3UEAlNeTIFX8=;
 b=huAkJueOzSijXXVyU/05YC5HQanCHi8Z3A2x1HDVbpieFNFEpgtluCyjkmhtpuc433g2vH
 Lu2ucQkmxr7EbDEsu3URaJdGalcDctrdPY+g+3wnFUy+6p9LJTdyCmq8qxLDUmT9yVAs3X
 295tG8VorRRPpqybdeNf8NYPV8Br6lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770912454;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPnxbqaz/Nc1yhvAmvDoFy2o39vb0mY3UEAlNeTIFX8=;
 b=QQN3rPR9n6u1CuopP122NhbCOaf3AGwopHYYs3xfH/dQc0nYxG+rmKshm4hUuA59xq+jhq
 TW+CMQTee9/hKaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EAA13EA62;
 Thu, 12 Feb 2026 16:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6z3gC8b6jWlSYAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 12 Feb 2026 16:07:34 +0000
Date: Thu, 12 Feb 2026 17:07:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20260212160732.GA54354@pevik>
References: <20260211-fix_doc_build-v1-1-42897785e0c7@suse.com>
 <aYyrcqnGWKhsIUej@yuki.lan> <20260212084804.GA5659@pevik>
 <DGCV06VWH5W4.2S96MUIO5X4ZL@suse.com> <20260212093257.GA8902@pevik>
 <DGCW24NO41YF.34RVLSFL2026H@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGCW24NO41YF.34RVLSFL2026H@suse.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] doc: fix documentation build with latest
 setuptools
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: F270E12F3BA
X-Rspamd-Action: no action

Hi Andrea,

> > It is a workaround in a sense because new linuxdoc master thanks to my fix [1]

> Now it's more clear, thanks for fixing it!

> > will not need setuptools any more (which I explained in my patch). Normally we
> > would update, but upstream does not have time to release.

> > Also, new release will use hatch, we'll need to use pyproject.toml instead of
> > requirements.txt.

> Isn't pyproject.toml used specifically for python projects? I'm not sure
> about our LTP documentation setup which is just a sphinx configuration.

Likely, my python fu is very limited.

Anyway, because CI started to fail and also our real doc started to fail (Feb 11
and 12) [1] I agreed with Andrea to merge the fix. I dared to add a comment that
it's workaround.

Kind regards,
Petr

[1] https://app.readthedocs.org/projects/linux-test-project/builds/?version__slug=latest

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
