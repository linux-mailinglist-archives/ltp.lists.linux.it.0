Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F29C5E35
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2024 18:05:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C38E13D60FB
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2024 18:05:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88B1A3D60F0
 for <ltp@lists.linux.it>; Tue, 12 Nov 2024 18:05:38 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A7B3143985A
 for <ltp@lists.linux.it>; Tue, 12 Nov 2024 18:05:36 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEBEE21263;
 Tue, 12 Nov 2024 17:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1731431135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQzbQIxt03iCmFxjLTE11D/ZgQrouBWkrZznRhpgl3s=;
 b=Oe7a3tJV9PEIKh+8loLoBy431Ki3IoY9uo5uvXiHMViSoCna4utZVo+2JDot7I8xD9wPPL
 L0QQXdzHyQdCw0lm+xjo2EFQGneHFz7APqy3E5hzrKk5YauqA2nUefyDMAeLTBqRkls4Gb
 Tud3MDD1gAYkj+fur8PHimM3bIHbbNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1731431135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQzbQIxt03iCmFxjLTE11D/ZgQrouBWkrZznRhpgl3s=;
 b=pyHiZ15EUKv6ul6uxVVA39jA5n1wvHcIMzPK3s/ZDW5/NBhlrxLR7+1HGQLWZ7UauQFTmr
 aovG7N862JUohMBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1731431135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQzbQIxt03iCmFxjLTE11D/ZgQrouBWkrZznRhpgl3s=;
 b=Oe7a3tJV9PEIKh+8loLoBy431Ki3IoY9uo5uvXiHMViSoCna4utZVo+2JDot7I8xD9wPPL
 L0QQXdzHyQdCw0lm+xjo2EFQGneHFz7APqy3E5hzrKk5YauqA2nUefyDMAeLTBqRkls4Gb
 Tud3MDD1gAYkj+fur8PHimM3bIHbbNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1731431135;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQzbQIxt03iCmFxjLTE11D/ZgQrouBWkrZznRhpgl3s=;
 b=pyHiZ15EUKv6ul6uxVVA39jA5n1wvHcIMzPK3s/ZDW5/NBhlrxLR7+1HGQLWZ7UauQFTmr
 aovG7N862JUohMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98EC213301;
 Tue, 12 Nov 2024 17:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id P0QYJN+KM2d6KwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 12 Nov 2024 17:05:35 +0000
Date: Tue, 12 Nov 2024 18:05:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20241112170534.GA153227@pevik>
References: <20241111143609.185692-1-pvorel@suse.cz>
 <ZzIr9bBKPmnN_3YY@yuki.lan> <20241112110052.GA208695@pevik>
 <ZzNHVcaeZU1ZKdYV@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzNHVcaeZU1ZKdYV@yuki.lan>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] syscalls: Add missing WEXITSTATUS() check
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

Hi Cyril,

...
> > > --- a/testcases/kernel/syscalls/madvise/madvise08.c
> > > +++ b/testcases/kernel/syscalls/madvise/madvise08.c
> > > @@ -165,7 +165,7 @@ static pid_t run_child(int advice)
> > >                                 fmem,
> > >                                 FMEMSIZE,
> > >                                 advstr);
> > > -                       exit(1);
> > > +                       exit(0);
> > >                 }
> > >                 abort();
> > >         }

> > Good catch, thanks!

> > Maybe it'd be more logical to keep exit(1) (it's error) and check against
> > WEXITSTATUS(status) == 1, but it's a minor detail, let's keep exit(0).

> I wouldn't do so, as it may confuse people into thinking that the return
> value actually carries any information, which it does not since the
> failure has been already reported. I would just stick to exit(0) which
> makes it more clear that we just need to exit the process, nothing more.

This makes sense, kept it this way.

> > Can I merge with your RBT?

> Yes, with the fix above.

Thanks, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
