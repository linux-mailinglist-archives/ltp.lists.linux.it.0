Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA664BBD7A5
	for <lists+linux-ltp@lfdr.de>; Mon, 06 Oct 2025 11:43:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85C3A3CE112
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Oct 2025 11:43:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0FAF3C7746
 for <ltp@lists.linux.it>; Mon,  6 Oct 2025 11:43:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3D6C52000E9
 for <ltp@lists.linux.it>; Mon,  6 Oct 2025 11:43:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47E881F45B;
 Mon,  6 Oct 2025 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759743826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jp+ELpnK/lHfoRFr7MOzVdg6YSNGCuC05YbtBHXbVCQ=;
 b=KImu8aJgI5UO7rbu2HOctDpgl41bBzFEVoRN92iYuNMs2yi5wp0Y0jA8ycFrPN0RUkbIvt
 qnnpO+6TzbugLn9GlgZo3X2JpFnMAotGUizJxt/+nh4Cx17Aflv/4ahJM6FDKPntVtRPOb
 P1NNlkrPJHzLUrgM369zORknMjJcIpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759743826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jp+ELpnK/lHfoRFr7MOzVdg6YSNGCuC05YbtBHXbVCQ=;
 b=Dv257UwkKL5lSMZDwZ0x1r7qmbQSg6dt1I64s4rC8VvpIlXbN3+nBbEYTWHNXDX6HBG+jj
 xsJNLsqwWwRvvrCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=KImu8aJg;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Dv257Uwk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759743826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jp+ELpnK/lHfoRFr7MOzVdg6YSNGCuC05YbtBHXbVCQ=;
 b=KImu8aJgI5UO7rbu2HOctDpgl41bBzFEVoRN92iYuNMs2yi5wp0Y0jA8ycFrPN0RUkbIvt
 qnnpO+6TzbugLn9GlgZo3X2JpFnMAotGUizJxt/+nh4Cx17Aflv/4ahJM6FDKPntVtRPOb
 P1NNlkrPJHzLUrgM369zORknMjJcIpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759743826;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jp+ELpnK/lHfoRFr7MOzVdg6YSNGCuC05YbtBHXbVCQ=;
 b=Dv257UwkKL5lSMZDwZ0x1r7qmbQSg6dt1I64s4rC8VvpIlXbN3+nBbEYTWHNXDX6HBG+jj
 xsJNLsqwWwRvvrCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAC2213700;
 Mon,  6 Oct 2025 09:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wR48OFGP42j+QwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 06 Oct 2025 09:43:45 +0000
Date: Mon, 6 Oct 2025 11:43:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20251006094344.GB66983@pevik>
References: <20251003101310.13359-1-akumar@suse.de> <aOODn-CZ7F1A777o@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOODn-CZ7F1A777o@yuki.lan>
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.cz:replyto,suse.cz:dkim];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Rspamd-Queue-Id: 47E881F45B
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.71
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] openposix: update invalid clock id to accomodate
 new auxiliary clock ids
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

Hi Cyril, Avinesh,

> Hi!
> > There can be 8 more clock ids reserved on systems with
> > CONFIG_POSIX_AUX_CLOCK=y [1]
> > consequently clock 17 no longer remains an invalid id.

> > [1] https://lkml.org/lkml/2025/5/19/341

> > Signed-off-by: Avinesh Kumar <akumar@suse.de>
> > ---
> >  .../conformance/interfaces/clock_getres/6-2.c                 | 4 ++--
> >  .../conformance/interfaces/clock_gettime/8-2.c                | 4 ++--
> >  .../conformance/interfaces/clock_settime/17-2.c               | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)

> > diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> > index c44809012..62de33c4f 100644
> > --- a/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> > +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_getres/6-2.c
> > @@ -17,7 +17,7 @@
> >   *   unassigned value = -1073743192 (ex. of what gcc will set to)
> >   *   unassigned value = 1073743192 (ex. of what gcc will set to)
> >   *   -1
> > - *   17 (currently not = to any clock)
> > + *   25 (not associated to any clock, considering posix auxiliary clocks also)

> Technically you can have any number of clocks defined by a system that
> implements POSIX. So the comment here should be:

> "hopefully big enough not to be a valid clock value"

> And we may possibly bump it to a larger value as well, e.g. 50

Thanks for info. Out of curiosity: I suppose the different approach from the
exact value for LTP Linux tests fixed in 5c0e414511 (which use lib/tst_clocks.c)
is because POSIX tests can be tested for other Unix like tests? Is the POSIX
testsuite intended for BSD or any unix like kernels/OS? If yes, I wonder if
anybody does (and if it even compiles).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
