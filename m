Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E62DB935F2
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 23:27:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DD733C6EF3
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 23:27:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 171B23C6EF3
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 23:26:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7635A1000405
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 23:26:56 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4ECEE22D25;
 Mon, 22 Sep 2025 21:26:55 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30DCF1388C;
 Mon, 22 Sep 2025 21:26:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zKEeCx+/0WgzDQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 22 Sep 2025 21:26:55 +0000
Date: Mon, 22 Sep 2025 23:26:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250922212645.GA57626@pevik>
References: <20250918152640.1146279-1-mark@klomp.org>
 <aND_aLgsukouVATL@yuki.lan>
 <20250922082452.GH19408@gnu.wildebeest.org>
 <aNEJyIv9QdQdyKQN@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNEJyIv9QdQdyKQN@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4ECEE22D25
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] mmap04: Make sure the scanf address format is at
 least 8 hex chars
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
Cc: Mark Wielaard <mark@klomp.org>, Martin Cermak <mcermak@redhat.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mark, Cyril,

> Hi!
> > > > The addresses in /proc/self/maps are at least 8 hex chars. Zeros are
> > > > added to the front of the address when shorted (both on 32bit and
> > > > 64bit systems.

> > > > Under valgrind the mmaps used in kernel/syscalls/mmap/mmap04.c come
> > > > out very low in the address space and might be shorter than 8 hex
> > > > chars. This causes the scanf to fail:
> > > > mmap04.c:62: TBROK: Expected 1 conversions got 0 FILE '/proc/self/maps'

> > > I guess I do not understand the problem here. The PRIxPTR translates to
> > > "x", "lx", or "llx" depending on architecture and as far as I can tell
> > > the %x modifier handles leading zeroes just fine.

> > The problem is that we want to match (scanf) an absolute address
> > (addr2) at the start of the line. It is this absolute/literal address
> > that doesn't match (because it might not have leading zeros).

> > e.g. We might want to match the address 403a000 and want to match
> > against: 0403a000-04048000 rw-p

> > When creating the fmt which we want to use for scanf we currently
> > generate: "403a000-%*x %s" Which doesn't match because it is missing
> > the leading zero (the "-%*x %s" would match the rest, except that the
> > start of the line doesn't). So with the "%08" fix we would generate:
> > "0403a000-%*x %s" which does match because it has the same number of
> > leading zeros.

> Ah right, I'm blind, we generate the fmt on the fly. In that case
> padding to eight zeroes will match what kernel does.

Mark, thanks for fixing our test! Merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
