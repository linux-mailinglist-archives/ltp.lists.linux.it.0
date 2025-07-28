Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B311B13D65
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jul 2025 16:40:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E01B63C925B
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jul 2025 16:40:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4C033C6391
 for <ltp@lists.linux.it>; Mon, 28 Jul 2025 16:40:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C02F0600439
 for <ltp@lists.linux.it>; Mon, 28 Jul 2025 16:40:21 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ACE3D211D4;
 Mon, 28 Jul 2025 14:40:20 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99887138A5;
 Mon, 28 Jul 2025 14:40:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QBf8JNSLh2jOFwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jul 2025 14:40:20 +0000
Date: Mon, 28 Jul 2025 16:40:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250728144015.GA772942@pevik>
References: <20250724170003.479248-1-pvorel@suse.cz>
 <aId7M6soHD3246n0@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aId7M6soHD3246n0@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: ACE3D211D4
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] fsconfig03: Quit on first error
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
> > Test runs in loop 5000x, if it fails, it pollutes output a lot.

> > Currently bcachefs fails 4883x:
> > fsconfig03.c:53: TFAIL: fsconfig() passed unexpectedly

> > Skip with goto to keep check for a taint flags.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > or do we want to quit after more errors, e.g. 10x?

> > Kind regards,
> > Petr

> >  testcases/kernel/syscalls/fsconfig/fsconfig03.c | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig03.c b/testcases/kernel/syscalls/fsconfig/fsconfig03.c
> > index add54769e0..985278986a 100644
> > --- a/testcases/kernel/syscalls/fsconfig/fsconfig03.c
> > +++ b/testcases/kernel/syscalls/fsconfig/fsconfig03.c
> > @@ -51,15 +51,18 @@ static void run(void)

> >  		if (!TST_RET) {
> >  			tst_res(TFAIL, "fsconfig() passed unexpectedly");
> > +			goto cleanup;

> Shouldn't break; be better in this case?

Ah, sure. I'll merge with break.
Thank you!

Kind regards,
Petr

> Otherwise it looks good.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
