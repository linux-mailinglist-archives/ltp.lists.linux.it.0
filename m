Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFAAB9BE9
	for <lists+linux-ltp@lfdr.de>; Fri, 16 May 2025 14:22:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10EBB3CC5AF
	for <lists+linux-ltp@lfdr.de>; Fri, 16 May 2025 14:22:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86D873CC505
 for <ltp@lists.linux.it>; Fri, 16 May 2025 14:22:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D0A4B200B6B
 for <ltp@lists.linux.it>; Fri, 16 May 2025 14:22:12 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 50CCB1F394;
 Fri, 16 May 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A76A513411;
 Fri, 16 May 2025 12:22:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3GxzJvEtJ2h/JgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 16 May 2025 12:22:09 +0000
Date: Fri, 16 May 2025 14:22:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mark Wielaard <mark@klomp.org>
Message-ID: <20250516122207.GB303097@pevik>
References: <20250516075113.522145-1-pvorel@suse.cz>
 <aCb7Pi6Vgkc8OMja@yuki.lan>
 <20250516093129.GG12775@gnu.wildebeest.org>
 <20250516120943.GA303097@pevik>
 <1579a022f9ea78ae74060c03d10a8e1601f1af80.camel@klomp.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579a022f9ea78ae74060c03d10a8e1601f1af80.camel@klomp.org>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 50CCB1F394
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] valgrind-announce: Update valgrind ML
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
Cc: valgrind-developers@lists.sourceforge.net, ltp@lists.linux.it,
 Martin Cermak <mcermak@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mark,

> Hi Petr, Hi Cyril,

> On Fri, 2025-05-16 at 14:09 +0200, Petr Vorel wrote:
> > > On Fri, May 16, 2025 at 10:45:50AM +0200, Cyril Hrubis wrote:
> > > > > valgrind-developers has heavy traffic, use valgrind-announce.

> > > > Was this requested by valgrind devs? I suppose this is fine as long as
> > > > we get their ack.

> > > I think valgrind-developers is a better place for announcing new
> > > versions of LTP.  We can then update our own valgrind testing.
> > > valgrind-announce is really for users when valgrind itself has a new
> > > release.

> > Sure, let's keep valgrind-developers. Thanks for feedback.

> > I would consider it disturbing for myself to need to subscribe on
> > valgrind-developers before the release and unsubscribe then, but
> > it's Cyril who is going to send the announcement mail anyway.

> You don't really need to subscribe tp valgrind-developers. If you
> aren't subscribed then the message goes to moderation and will normally
> be approved within a day (and the sender is normally added to the
> approved list). I think this is similar to the ltp list (I am not
> subscribed, but seem able to post anyway).

Great, we can rely on you looking at the "pending moderator requests".

This is also maintained on our side, mostly by Cyril. When I notice valid mail
(there is a lot of spam of course) I approve the sender to be able to send
without a subscription.

I got used to mailing lists on lore.kernel.org to which one can post without any
subscription. Also kernel developers got used to it (as they often send to LTP
ML without a subscription). But I'm never sure if the "pending moderator requests"
on other MLs is actively monitored.

Kind regards,
Petr

> Cheers,

> Mark

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
