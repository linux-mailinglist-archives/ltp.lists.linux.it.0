Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDBA2E76E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2025 10:16:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46CA83C987E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2025 10:16:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 40D723C9875
 for <ltp@lists.linux.it>; Mon, 10 Feb 2025 10:16:36 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 497E310119A1
 for <ltp@lists.linux.it>; Mon, 10 Feb 2025 10:16:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E6CE1F37E;
 Mon, 10 Feb 2025 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739178994;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YlkQJlOKsMRty/by0M78v1aEBYUg2N5hitGwr6a/Ws=;
 b=anA34jyqvA4VZq7/h2VAmOPh/XwTOIenAxWiN7C0qhJlbr9CFIX6g4h6dpkkRTt42YTERj
 tOnnpAm08ThT/CQljhljdkoOQwiO+1Gg0OgoEyka+eyzmiRYKlSvuvpS0wdgt0OD9pz4Uk
 IAmFJGOnUE/bxPVBjybUs4BBllmnGEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739178994;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YlkQJlOKsMRty/by0M78v1aEBYUg2N5hitGwr6a/Ws=;
 b=0zQVV+YO/SYkFrJoO8RFrcbIbuFkGXzUkJN5yU/Cq9R2SW+XJqu4cMzpIPKG7tpe7RKO6u
 Rq70jXHaP9GC4nDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=anA34jyq;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=0zQVV+YO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1739178994;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YlkQJlOKsMRty/by0M78v1aEBYUg2N5hitGwr6a/Ws=;
 b=anA34jyqvA4VZq7/h2VAmOPh/XwTOIenAxWiN7C0qhJlbr9CFIX6g4h6dpkkRTt42YTERj
 tOnnpAm08ThT/CQljhljdkoOQwiO+1Gg0OgoEyka+eyzmiRYKlSvuvpS0wdgt0OD9pz4Uk
 IAmFJGOnUE/bxPVBjybUs4BBllmnGEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1739178994;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YlkQJlOKsMRty/by0M78v1aEBYUg2N5hitGwr6a/Ws=;
 b=0zQVV+YO/SYkFrJoO8RFrcbIbuFkGXzUkJN5yU/Cq9R2SW+XJqu4cMzpIPKG7tpe7RKO6u
 Rq70jXHaP9GC4nDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F66713A62;
 Mon, 10 Feb 2025 09:16:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AImHGfLDqWe6MgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 10 Feb 2025 09:16:34 +0000
Date: Mon, 10 Feb 2025 10:16:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250210091617.GA1823157@pevik>
References: <20241218184518.16190-1-chrubis@suse.cz>
 <20241218184518.16190-7-chrubis@suse.cz>
 <20241227104805.GD317565@pevik> <Z6Y8KLsXDWnttBL6@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6Y8KLsXDWnttBL6@yuki.lan>
X-Rspamd-Queue-Id: 8E6CE1F37E
X-Spam-Score: -3.71
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.71 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+];
 REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 06/13] testcases/kernel/mem: Move check_hugepage()
 + PATH_THP
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

> Hi!
> > > +#define PATH_THP "/sys/kernel/mm/transparent_hugepage/"
> > > +
> > > +static inline void check_hugepage(void)
> > > +{
> > > +        if (access(PATH_HUGEPAGES, F_OK))
> > > +                tst_brk(TCONF, "Huge page is not supported.");
> > > +}

> > I guess we don't want to move this into static inline function (used only in 2
> > tests.

> > 	if (access(PATH_THP, F_OK) == -1)
> > 		tst_brk(TCONF, "THP not enabled in kernel?");

> > I also wonder if we should add to the library struct tst_test test something
> > like .requires_proc_sys which would check for files in /sys or /proc. There
> > could be an optional parameter for TCONF message. Advantage would be to have
> > this in docparse docs (or isn't it useful to see this)?

> > We have .save_restore, but that's only for files and it reads the value.
> > But it could share the flags (TST_SR_TCONF, TST_SR_TBROK, TST_SR_SKIP, ...).

> Logically save_restore is not a good candidate since we are checking a
> directory existence here. So maybe we need to add .needs_paths array of
> strings into tst_test later on...

Yeah. .needs_paths sounds reasonable + use flags we already have (TST_SR_TCONF,
TST_SR_TBROK, TST_SR_SKIP).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
