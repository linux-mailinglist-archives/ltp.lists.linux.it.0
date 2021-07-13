Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 496F93C7033
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:14:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D28243C877F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 14:14:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA8513C0354
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:14:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C344F200929
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 14:14:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E880B203BE;
 Tue, 13 Jul 2021 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626178480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDrjpip1xK67mJG1yj6UNxPA/QOC2DFFYWoKOmf46ZM=;
 b=Pi9VSjNylIqugYyzuSnecpgn6mFOFoB0NpvNel/k8uucaa330GVIoF2XK5EvjFwyTVGBmW
 w7d3mEzo9s2zImpUfJwkuHLs0+uc13TFNUGJ3bf1tfQsAEukki7ubguim2IRZtdnCCPW4d
 shGQcBOaSY9+XHsbJAV/BFo7zwuX/7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626178480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDrjpip1xK67mJG1yj6UNxPA/QOC2DFFYWoKOmf46ZM=;
 b=LbgJaQF2hSe45fbUhN09XrnkxkwilkPY6lRQH9X9Xosn6e1gXkUK2ngvdWruxe/eDEKpzg
 d/nX4wNE7yV77AAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5B7B13AEE;
 Tue, 13 Jul 2021 12:14:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IXIoM7CD7WApfwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Jul 2021 12:14:40 +0000
Date: Tue, 13 Jul 2021 13:49:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YO19s5999M7m24dI@yuki>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
 <YO1VaOB8nnMh6FT1@pevik> <YO1cIhIKgEPrApUC@yuki>
 <YO1p3LfWwdY0cmGj@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO1p3LfWwdY0cmGj@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] tst_strstatus.c fails on Alpine
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
> FYI musl commit 41c63282 ("fix definitions of WIFSTOPPED and WIFSIGNALED
> to support up to signal 127") [1] mentions mips bug discussion on linux-mips ML
> from 2013 (musl fix is also from that time) [2]:
> 
> > I think it's feasible to ask {g,uc}libc to change their defines
> > (on MIPS as a minimum), and live with 127 signals.
> 
> => I haven't checked if it was posted at the time. I wonder if anybody cares
> enough about mips nowadays to fix this. I also like these guarders, thus I
> wonder if musl should have it only for mips (currently it's for all archs).

Hmm, as long as you allow signal 127 you really have to look at the
zeroed unused bits to distinguish between stopped and killed by a
signal. And after that the invalid cobinations end up only to be
non-zero in the upper byte and anything else than 0x7f in the lower
byte without the special value 0xffff.

So in addition to the 0x01ff things like 0x0101 etc. are invalid as
well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
