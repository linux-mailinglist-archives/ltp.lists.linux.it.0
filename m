Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A802F89727A
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Apr 2024 16:24:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58A9F3CE197
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Apr 2024 16:24:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B1AF3C1835
 for <ltp@lists.linux.it>; Wed,  3 Apr 2024 16:24:43 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E25DB208DF7
 for <ltp@lists.linux.it>; Wed,  3 Apr 2024 16:24:42 +0200 (CEST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDA4E5CD74;
 Wed,  3 Apr 2024 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1712154280;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vS7p8LFpJI5Yx/FDcoAg/Kpx4O0NgN9toQ9y0p9UIhc=;
 b=bLp72QuDJ+QiOyMa3U2ojF/n+htvtHtbuQaIUoNSnR1z1JecK9YwaShprybz85EZ3ZYYXF
 CrXBVBGk8Leq0pF69YIlKL341ox45Q4QPhI6fJJroIwJt7PJ4Nfpj2bUK7jSo24z2ctKBa
 PQk/D/I1FOfb/JNe10HV68u0CW9aWMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1712154280;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vS7p8LFpJI5Yx/FDcoAg/Kpx4O0NgN9toQ9y0p9UIhc=;
 b=JHZIrHDTOaX/wofVc/WG0eDBKYARD5B+T5M51CA5Ug15yax8Tx8WHA5hmfQ4NOthV3dEU1
 tizd7suub2ZbGOAg==
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 925691331E;
 Wed,  3 Apr 2024 14:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gW3wIahmDWYyXwAAn2gu4w
 (envelope-from <pvorel@suse.cz>); Wed, 03 Apr 2024 14:24:40 +0000
Date: Wed, 3 Apr 2024 16:24:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20240403142431.GA452858@pevik>
References: <20220817204015.31420-1-pvorel@suse.cz> <YwX7r5VWrGRzaXoa@pevik>
 <CAEemH2e_t5XdGNFPOw0suGgAEbWLYPuX-tnZCoxQ1oZJZ9H2pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e_t5XdGNFPOw0suGgAEbWLYPuX-tnZCoxQ1oZJZ9H2pg@mail.gmail.com>
X-Spamd-Result: default: False [-2.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.986]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_TWO(0.00)[2];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -2.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC PATCH 1/1] API: Allow to use xfs filesystems < 300 MB
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org,
 LTP List <ltp@lists.linux.it>, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Petr, All,


> Petr Vorel <pvorel@suse.cz> wrote:

> > Hi all,

> > Could we in the end accept this patch?

> > It'd fix the issue for now and I could set size of the XFS loop device
> > smaller
> > than 300 MB (better for embedded). i.e. 16 MB (or 32 or 64 MB or anything
> > higher
> > if XFS developers are convinced it's needed).


> I personally think YES!
> (sorry for replying so late, I was on vacation last week)

I still plan to implement 

Old thread thus recap Cyril's original proposal [1]

	I'm starting to wonder if we should start tracking minimal FS size per
	filesystem since btrfs and xfs will likely to continue to grow and with
	that we will end up disabling the whole fs related testing on embedded
	boards with a little disk space. If we tracked that per filesystem we
	would be able to skip a subset of filesystems when there is not enough
	space. The downside is obviously that we would have to add a bit more
	complexity to the test library.

I'm willing to implement this Cyril's proposal, but what puts me off is that
Btrfs and XFS developers are already complaining that testing on minimal size is
not a realistic testing. fstests are testing on realistic sizes, Darrick J. Wong
[2]:

	... In the ideal world we'll some day get around to restructuring
	all the xfstests that do tricky things with sub-500M filesystems, but
	that's the unfortunate part of removing support for small disks.

	Most of the fstests don't care about the fs size and so they'll run with
	the configured storage (some tens or millions of gigabytes) so we're
	mostly using the same fs sizes that users are expected to have.

Geert Uytterhoeven suggested [3]:
Yeah, we used to have ext2 root file systems that fit on 1440 KiB floppies.
IIRC, ext3 does have a minimum size of 32 MiB or so.

> > As I wrote before I plan to suggest sizes:
> > btrfs 110 MB
> > the rest (ext[234], xfs, ntfs, vfat, exfat, tmpfs): 16 MB

Maybe safer would be (from more realistic point of testing)
* Btrfs, XFS: 300 MB (keep the current size for Btrfs)
* Maybe raise ext4 to 32 MB (more realistic?)
* others: 16 MB

> +1 thanks for finding the minimal size.

Also Amir noted [4] that we have squashfs01.c asks for .dev_min_size = 1, but we
do the minimal default (300 MB now, it would be 16 MB). Do we want to force
.dev_min_size in this case or use the default minimal?

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/Yv4MBF79PnJKJbwm@yuki/
[2] https://lore.kernel.org/ltp/Yv2A9Ggkv%2FNBrTd4@magnolia/
[3] https://lore.kernel.org/ltp/CAMuHMdUMBjCTwPu7wxrnagXnbyVxxmXN+vHmML0Lr=SyrTw0nQ@mail.gmail.com/
[4] https://lore.kernel.org/ltp/CAOQ4uxjMEHYQwO25dhs5WtzbOkJcee0HofQDTT3cD-qXJn7xQw@mail.gmail.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
