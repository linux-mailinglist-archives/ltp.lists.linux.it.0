Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E283BACEA25
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Jun 2025 08:28:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF2013CA20E
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Jun 2025 08:28:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEA763C987F
 for <ltp@lists.linux.it>; Thu,  5 Jun 2025 08:28:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3EE266000E2
 for <ltp@lists.linux.it>; Thu,  5 Jun 2025 08:28:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 38F2A20E26;
 Thu,  5 Jun 2025 06:28:34 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BF66137FE;
 Thu,  5 Jun 2025 06:28:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gF6WBRI5QWj8GQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 05 Jun 2025 06:28:34 +0000
Date: Thu, 5 Jun 2025 08:28:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20250605062832.GA1184316@pevik>
References: <20250603152253.214656-1-mdoucha@suse.cz>
 <20250603152253.214656-2-mdoucha@suse.cz>
 <20250604063521.GA1094733@pevik>
 <5be510c9-7bea-42f8-9232-e6e44a82aea9@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5be510c9-7bea-42f8-9232-e6e44a82aea9@suse.cz>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 38F2A20E26
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] epoll_pwait: Refactor timeout to struct
 timespec
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

Hi Martin,

...
> > > +++ b/testcases/kernel/syscalls/epoll_pwait/epoll_pwait_var.h
> > > @@ -14,22 +14,22 @@
> > >   #define NSEC_PER_MSEC (1000000L)

> > >   static int do_epoll_pwait(int epfd, struct epoll_event *events, int
> > > -	maxevents, int timeout, const sigset_t *sigmask)
> > > +	maxevents, struct timespec *timeout, const sigset_t *sigmask)
> > >   {
> > > -	if (tst_variant == 0)
> > > -		return epoll_pwait(epfd, events, maxevents, timeout, sigmask);
> > > +	if (tst_variant == 0) {
> > > +		int timeout_ms = -1;

> > very nit: I would reverse the condition to save indent for tst_variant == 0:

> Feel free to do it during merge, but it'd be better to check (tst_variant ==
> 1) instead in case there will be epoll_pwait3() in the future.

Thanks for your ack + good point, changed as tst_variant == 1.
Patchset merged, thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
