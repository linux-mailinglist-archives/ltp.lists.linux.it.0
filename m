Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44B904C5F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2024 09:09:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6E3D3D0BE5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2024 09:09:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F19C23D0B76
 for <ltp@lists.linux.it>; Wed, 12 Jun 2024 09:09:02 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=neilb@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6B8F61002058
 for <ltp@lists.linux.it>; Wed, 12 Jun 2024 09:09:02 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 88FAA5BCFB;
 Wed, 12 Jun 2024 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718176141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA6suEtJ1Wm6DTNcti+lUkN3qJPn424kTR0RHITUBCY=;
 b=aHEfu/9IM5Sw0UcPbnPtFScAmNS7/gxRq8y210X3UCVRfm+e5nFQR08yUoLcV5hd0K1E6t
 SUEogeiGMAmot87StL5zU+QHU/RgNTWNXv4HPXOqbKtfrl5qgJJW8Vbypk/Dy5oORTw+sj
 GYNtDHy5oXL69JVT1clfgXES79rb2aQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718176141;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA6suEtJ1Wm6DTNcti+lUkN3qJPn424kTR0RHITUBCY=;
 b=HntaK/XD3nY2iLQWy9DJ3O1MRlPRTKTqhereJg0jBlyTNfW9PnJmt8RhSHT/47IW1ANDZk
 JgypLnQlpNmQKBBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="aHEfu/9I";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HntaK/XD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718176141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA6suEtJ1Wm6DTNcti+lUkN3qJPn424kTR0RHITUBCY=;
 b=aHEfu/9IM5Sw0UcPbnPtFScAmNS7/gxRq8y210X3UCVRfm+e5nFQR08yUoLcV5hd0K1E6t
 SUEogeiGMAmot87StL5zU+QHU/RgNTWNXv4HPXOqbKtfrl5qgJJW8Vbypk/Dy5oORTw+sj
 GYNtDHy5oXL69JVT1clfgXES79rb2aQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718176141;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XA6suEtJ1Wm6DTNcti+lUkN3qJPn424kTR0RHITUBCY=;
 b=HntaK/XD3nY2iLQWy9DJ3O1MRlPRTKTqhereJg0jBlyTNfW9PnJmt8RhSHT/47IW1ANDZk
 JgypLnQlpNmQKBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB73B137DF;
 Wed, 12 Jun 2024 07:08:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 03rTG4lJaWaxRAAAD6G6ig
 (envelope-from <neilb@suse.de>); Wed, 12 Jun 2024 07:08:57 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Al Viro" <viro@zeniv.linux.org.uk>
In-reply-to: <20240612031404.GH1629371@ZenIV>
References: <>, <20240612031404.GH1629371@ZenIV>
Date: Wed, 12 Jun 2024 17:08:53 +1000
Message-id: <171817613375.14261.11854641862108370837@noble.neil.brown.name>
X-Rspamd-Queue-Id: 88FAA5BCFB
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[kernel.org,suse.cz,gmail.com,arm.com,lists.linux.it,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9]; MISSING_XM_UA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] VFS: generate FS_CREATE before FS_OPEN when
 ->atomic_open used.
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-nfs@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 12 Jun 2024, Al Viro wrote:
> On Wed, Jun 12, 2024 at 12:55:40PM +1000, NeilBrown wrote:
> > > 	IF we don't care about that, we might as well take fsnotify_open()
> > > out of vfs_open() and, for do_open()/do_tmpfile()/do_o_path(), into
> > > path_openat() itself.  I mean, having
> > >         if (likely(!error)) {
> > >                 if (likely(file->f_mode & FMODE_OPENED)) {
> > > 			fsnotify_open(file);
> > >                         return file;
> > > 		}
> > > in there would be a lot easier to follow...  It would lose fsnotify_open()
> > > in a few more failure exits, but if we don't give a damn about having it
> > > paired with fsnotify_close()...
> > > 
> > 
> > Should we have fsnotify_open() set a new ->f_mode flag, and
> > fsnotify_close() abort if it isn't set (and clear it if it is)?
> > Then we would be guaranteed a balance - which does seem like a good
> > idea.
> 
> Umm...  In that case, I would rather have FMODE_NONOTIFY set just before
> the fput() in path_openat() - no need to grab another flag from ->f_mode
> (not a lot of unused ones there) and no need to add any overhead on
> the fast path.
> 

Unfortunately that gets messy if handle_truncate() fails.  We would need
to delay the fsnotify_open() until after truncate which means moving it
out of vfs_open() or maybe calling do_dentry_open() directly from
do_open() - neither of which I like.

I think it is best to stick with "if FMODE_OPENED is set, then we call
fsnotify_open() even if the open will fail", and only move the place
where fsnotify_open() is called.

BTW I was wrong about gfs.  Closer inspection of the code show that
finish_open() is only called in the ->atomic_open case.

Thanks,
NeilBrown

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
