Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA6C39BF2
	for <lists+linux-ltp@lfdr.de>; Thu, 06 Nov 2025 10:08:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C78513CD2B6
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Nov 2025 10:08:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F69E3C22FC
 for <ltp@lists.linux.it>; Thu,  6 Nov 2025 10:08:02 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 167E5600BD9
 for <ltp@lists.linux.it>; Thu,  6 Nov 2025 10:08:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5EDF71F786;
 Thu,  6 Nov 2025 09:08:01 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37A09139A9;
 Thu,  6 Nov 2025 09:08:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id a3GIDHFlDGmdfgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 06 Nov 2025 09:08:01 +0000
Date: Thu, 6 Nov 2025 10:07:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20251106090759.GA1008660@pevik>
References: <20251105154716.995786-1-pvorel@suse.cz>
 <20251105154716.995786-3-pvorel@suse.cz>
 <CAEemH2fogMWAawF4eqWrLhJphMMq=V8GrO2DFuGxMKEp+zqZ_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fogMWAawF4eqWrLhJphMMq=V8GrO2DFuGxMKEp+zqZ_A@mail.gmail.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 5EDF71F786
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/3] swapon03: Try to swapon() as many files until
 it fails
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
Cc: Michal Hocko <mhocko@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> >  /*\
> > - * This test case checks whether swapon(2) system call returns:
> > + * Test checks whether :man2:`swapon` system call returns EPERM when the
> > maximum
> > + * number of swap files are already in use.
> >   *
> > - *  - EPERM when there are more than MAX_SWAPFILES already in use.
> > + * NOTE: test does not try to calculate MAX_SWAPFILES from the internal
> > + * kernel implementation (which is currently <23, 29> depending on kernel
> > + * configuration). Instead test exptect that at least 15 swap files minus
> > + * currently used swap can be created.
> >   */

> >  #include <stdio.h>
> > @@ -20,49 +24,54 @@
> >  #include "lapi/syscalls.h"
> >  #include "libswap.h"

> > +#define NUM_SWAP_FILES 15


> Does the number 15 have a specific meaning?

No. I wanted something high enough but reasonably smaller than the current
minimum 23, because it can get even smaller in the future.

Should I move/add some of the docs from docparse doc (the note) to this
definition?

> Anyway, the whole patch set looks good to me:
> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
