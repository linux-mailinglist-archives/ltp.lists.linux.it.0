Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B889E8B60
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2024 07:14:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACD233E2D03
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2024 07:14:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE6A23E141B
 for <ltp@lists.linux.it>; Mon,  9 Dec 2024 07:14:24 +0100 (CET)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 785B5101AEAA
 for <ltp@lists.linux.it>; Mon,  9 Dec 2024 07:14:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71CDD21175;
 Mon,  9 Dec 2024 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733724862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wgl1Cgv0C8li5Xq6W72hgAwtlMImUH6auyjIMiaBHJk=;
 b=ygV9xI1vgH2UslKtVw8i1G559I4dumhaayL9JiMo9IZEONovgnX7tQfmZ3TDFp2FrzewFk
 YXJM4ZrR8ldqgvsw7ZdkE1aDeR6y3ntIkm/OwHkSzFkcMnidRoQleImVWNvCqz9fxI9FLb
 oBA1j9+YUaw7uh2dKPLokWEOyIgFrcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733724862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wgl1Cgv0C8li5Xq6W72hgAwtlMImUH6auyjIMiaBHJk=;
 b=pZz/UmDa8OfjN/mYuAPFQjTSmEptUs+VWDerJRtkeR/3y97jTf6EbU53mKDEkHLtK61DdP
 Jodv62pSbYnjdMBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733724862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wgl1Cgv0C8li5Xq6W72hgAwtlMImUH6auyjIMiaBHJk=;
 b=ygV9xI1vgH2UslKtVw8i1G559I4dumhaayL9JiMo9IZEONovgnX7tQfmZ3TDFp2FrzewFk
 YXJM4ZrR8ldqgvsw7ZdkE1aDeR6y3ntIkm/OwHkSzFkcMnidRoQleImVWNvCqz9fxI9FLb
 oBA1j9+YUaw7uh2dKPLokWEOyIgFrcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733724862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wgl1Cgv0C8li5Xq6W72hgAwtlMImUH6auyjIMiaBHJk=;
 b=pZz/UmDa8OfjN/mYuAPFQjTSmEptUs+VWDerJRtkeR/3y97jTf6EbU53mKDEkHLtK61DdP
 Jodv62pSbYnjdMBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CEA6138D2;
 Mon,  9 Dec 2024 06:14:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Iy2XEb6KVmdnZwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 09 Dec 2024 06:14:22 +0000
Date: Mon, 9 Dec 2024 07:14:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <20241209061416.GB180329@pevik>
References: <20241201093606.68993-1-zlang@kernel.org>
 <20241201093606.68993-2-zlang@kernel.org>
 <Z02337yqxrfeZxIn@yuki.lan> <Z029S0wgjrsv9qHL@yuki.lan>
 <20241202144208.GB321427@pevik>
 <20241209055309.54x5ngu3nikr3tce@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241209055309.54x5ngu3nikr3tce@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -7.50
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/3] ioctl_ficlone02.c: set all_filesystems to zero
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
Cc: ltp@lists.linux.it, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Mon, Dec 02, 2024 at 03:42:08PM +0100, Petr Vorel wrote:
> > > Hi!
> > > > The code to skip filesystems in the case of all filesystems is in the
> > > > run_tcase_per_fs() function:

> > > > static int run_tcases_per_fs(void)
> > > > {
> > > >         int ret = 0;
> > > >         unsigned int i;
> > > >         const char *const *filesystems = tst_get_supported_fs_types(tst_test->skip_filesystems);

> > > > The skip_filesystems array is passed to the tst_get_supporte_fs_types()
> > > > function which filters out them.

> > > Perhaps you mean that the skiplist does not work with .all_filesystems
> > > _and_ the LTP_SINGLE_FS_TYPE environment variable?

> > > I guess that we need:

> > > diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
> > > index bbbb8df19..49b1d7205 100644
> > > --- a/lib/tst_supported_fs_types.c
> > > +++ b/lib/tst_supported_fs_types.c
> > > @@ -159,6 +159,10 @@ const char **tst_get_supported_fs_types(const char *const *skiplist)

> > >         if (only_fs) {
> > >                 tst_res(TINFO, "WARNING: testing only %s", only_fs);
> > > +
> > > +               if (tst_fs_in_skiplist(only_fs, skiplist))
> > > +                       tst_brk(TCONF, "Requested filesystems is in test skiplist");
> > > +

> > It's a nice feature to be able to force testing on filesystem even it's set to
> > be skipped without need to manually enable the filesystem and recompile.
> > (It helps testing with LTP compiled as a package without need to compile LTP.)
> > Therefore I would avoid this.

> > @Zorro Lang or are you testing whole syscalls on particular filesystem via
> > LTP_SINGLE_FS_TYPE=xfs ?

> Oh, yes, I always use LTP with different LTP_SINGLE_FS_TYPE. So that's might be
> the problem?

Thanks for confirming your use case.

Well, "Testing only" in the help (-h) was added there to suggest it's for
testing/debugging LTP, not a production testing. But newer mind, I'll implement
Cyril's suggestion, real usage justify it. + I'll add LTP_FORCE_SINGLE_FS_TYPE.

We could allow more filesystems, e.g.  instead of running LTP few times with
different LTP_SINGLE_FS_TYPE value: e.g.

for fs in ext4 xfs btrfs; do LTP_SINGLE_FS_TYPE=fs ioctl_ficlone02; done

we could introduce support for particular filesystems
LTP_FILESYSTEMS="ext4,xfs,btrfs" ioctl_ficlone02

(Probably define new variable because "SINGLE" is misleading when supporting
more filesystems. Also when we touch it, I would consider renaming variable
FILESYSTEMS is more obvious for newcomers than "FS_TYPE".)

WDYT?

Kind regards,
Petr

> Thanks,
> Zorro

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
