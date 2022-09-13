Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1B5B699E
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:35:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 663153CAAEC
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 10:35:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C76333CAA8E
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:35:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8836F1A010DE
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 10:35:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD3DA34993;
 Tue, 13 Sep 2022 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663058126;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bsNaxwMBDAPAzIyTalRDt6F2pNlZwCGLYRQJA3TK08=;
 b=SDvnxiNC39yNmvb0Hd4Mfy/cEWngJy6G9vMNE+kFU4khjcEJ1busBeS/ImnV19MRvuYwru
 w+A1OT4wwmhkV7xl7R1hKFY9TKUS2/+waFeJOJSnq8yW/Q4lxRMSwZvnjfd4sF/CGbRtxi
 PullcvZxUwwuehLp2LkDkL5k9ZlDHDs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663058126;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bsNaxwMBDAPAzIyTalRDt6F2pNlZwCGLYRQJA3TK08=;
 b=a4qu1w0mFkI7unCQdeDLqUtwPVlvgEx+dXZWc/92zoLnccwrSTIukZLh5JbLCS/mF4uemw
 D1Q6nflXEdEOJ3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FC43139B3;
 Tue, 13 Sep 2022 08:35:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E9ekJc5AIGOhGwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Sep 2022 08:35:26 +0000
Date: Tue, 13 Sep 2022 10:35:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YyBAzH/NOwMhEJsH@pevik>
References: <20220910170518.17006-1-pvorel@suse.cz>
 <YyA+hyLQ5hy0UdZA@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyA+hyLQ5hy0UdZA@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Add .mailmap
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
Cc: Jiri Jaburek <jjaburek@redhat.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > although I prefer to keep signing non-SUSE work ("after work hacking")
> > with my private gmail mail, for release counting purposes it's better to
> > keep only SUSE mail.

> I usually fix the duplicates by hand, we even have typos there so some
> post processing is needed anyways. And it takes less than 5 minutes
> too.

> On the other hand there is no reason not to add this.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks! I'll merge it later today or tomorrow if nobody objects.

> > I suppose others want to update their mail. I didn't dare to add these,
> > feel free to send patch with your setup:

> > Andrea Cervesato <andrea.cervesato@suse.com> <andrea.cervesato@suse.de>
> > Jiri Jaburek <jjaburek@redhat.com> <jjaburek@users.noreply.github.com>
> > Richard Palethorpe <rpalethorpe@suse.com> <rpalethorpe@suse.com>
> > Yang Xu <xuyang2018.jy@fujitsu.com> <yangx.jy@cn.fujitsu.com>

> I guess that everyone should add their aliases if they want to.

Fully agree. The above is just a hint for them.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
