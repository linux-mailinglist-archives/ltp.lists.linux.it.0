Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2EAEB534
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 12:43:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ACE43C79BF
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jun 2025 12:43:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 249853C681B
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 12:43:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 867101000B44
 for <ltp@lists.linux.it>; Fri, 27 Jun 2025 12:43:03 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3786B1F394;
 Fri, 27 Jun 2025 10:43:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26FD4138A7;
 Fri, 27 Jun 2025 10:43:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fL2YCLZ1XmhWBwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 27 Jun 2025 10:43:02 +0000
Date: Fri, 27 Jun 2025 12:43:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <aF513oTFTybxPdys@yuki.lan>
References: <20250616102619.54254-1-liwang@redhat.com>
 <aF1KmkMhXNWBbUwi@yuki.lan>
 <CAEemH2esWnKqv2q-UM3tHoTRfR6caLp-0yZN1yF6XCk79XSOyA@mail.gmail.com>
 <aF5NFP5KpuebdkwV@yuki.lan>
 <CAEemH2fsxXGfE60UP3EU9s8HzPb7msQSoYMg85h6-R5rvD2JKA@mail.gmail.com>
 <aF5wiX08IWeWYS4v@yuki.lan>
 <CAEemH2fYij1tO0Yfb=pcqc0h_XfP4OonR4dO7PcviGP_vkxf3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fYij1tO0Yfb=pcqc0h_XfP4OonR4dO7PcviGP_vkxf3w@mail.gmail.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 3786B1F394
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/3] checkpoint: Refactor and unify shell/C reinit
 support
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > So, will you send a new patch (or I do that in my next version)?
> >
> > I will send the patchset.
> >
> 
> Thanks! And one more question:
> 
> The tst_checkpoint_init() in tst_checkpoint.c is not used by any test
> and library, should we delete it (and declare that the IPC only init/reinit
> by the tst_test.c function)?

There is actually a define to TST_CHECKPOINT_INIT in the
include/old/old_checkpoint.h but it looks like the last parts where this
is called are old library tests that should be removed along with that.

And the last test that was using it before rewrite was:

commit b043751a6984c41db61067eebb0fee6ebf303960
Author: Andrea Cervesato <andrea.cervesato@suse.de>
Date:   Fri Mar 25 13:54:43 2022 +0100

    Rewrite shm_comm.c using new LTP API

    Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
    Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


So yes please, let's get rid of it. We should have do so actually three
years ago.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
