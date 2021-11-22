Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CD459664
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 22:09:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B7A33C8DAB
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 22:09:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF1DA3C8982
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 22:09:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0A3BE2001AB
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 22:09:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1455321891;
 Mon, 22 Nov 2021 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637615349;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vSeuM+UkXq+4iVBqwr0QlYFSjV8HldzhJA1G3tz+oo=;
 b=bdNN9+3GO0t/ZJwNo/ntHweKuPFkX+p0ufufF7NwxPTePnEHyzxF4XEK4+insnKQKMwA3B
 mIjQPHJSF5zJolRdGKD6xNHBu2Y5IfcBvpxiGSqakUXxeMtjuLIBOCC12m6AyM8R9cjJxD
 vVqiNnH7KdCWsRkJpVEwgztNYyI0EQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637615349;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vSeuM+UkXq+4iVBqwr0QlYFSjV8HldzhJA1G3tz+oo=;
 b=cJHjmUzwcOspkFtxUaSX1oepCoAfz3PwxihV5hwYkT8pZP2nbCcOQUD91SPVpHSOBQs9R9
 VX+H72qrkMlJ57AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AA3313B68;
 Mon, 22 Nov 2021 21:09:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3g8qBfQGnGG7HwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 22 Nov 2021 21:09:08 +0000
Date: Mon, 22 Nov 2021 22:09:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YZwG8nfFmR+q915S@pevik>
References: <20211118235744.802584-1-krisman@collabora.com>
 <CAOQ4uxhbDgdZZ0qphWg1vnW4ZoAkUxcQp631yZO8W49AE18W9g@mail.gmail.com>
 <8735nsuepi.fsf@collabora.com> <YZtLDXW01Cz0BfPU@pevik>
 <87mtlwt7p6.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtlwt7p6.fsf@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/9] Test the new fanotify FAN_FS_ERROR event
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
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.com>,
 Ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,
> Petr Vorel <pvorel@suse.cz> writes:

> > Hi all,

> > <snip>
> >> Hi Amir,

> >> I have pushed v4 to :

> >> https://gitlab.collabora.com/krisman/ltp.git -b fan-fs-error_v4

> > FYI I've rebased it on my fix 3b2ea2e00 ("configure.ac: Add struct
> > fanotify_event_info_pidfd check")

> > https://github.com/linux-test-project/ltp.git -b gertazi/fanotify21.v4.fixes

> > diff to krisman/fan-fs-error_v4:

> Petr,

> Should I send a v5 or is v4 getting picked up and merged with the fixup
> hunk?
No need to sent v4, I'll merge it from my branch. This is info for Amir, which
wanted to use your git tree to base his patchset on (if it wasn't relevant only
to patches for man-pages).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
