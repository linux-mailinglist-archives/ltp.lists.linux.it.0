Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C41887AEFB9
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Sep 2023 17:29:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89EB23CDC8C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Sep 2023 17:29:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76B1D3CDC7C
 for <ltp@lists.linux.it>; Tue, 26 Sep 2023 17:29:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B1D69200BA5
 for <ltp@lists.linux.it>; Tue, 26 Sep 2023 17:29:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8604D1F893;
 Tue, 26 Sep 2023 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695742194;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CA+e6otUPLrh7iOOxWf8G8+TvGBRwCgYMyESmcCQLIY=;
 b=LJQhwM2LmuOaHgnTc2VbepcbKUsJpejdHTGyElWmhixSTXF61AhgmIM9xIvJWnr+ihFDhZ
 vKSjdrc5uHgnz/nwZpsADGzS9+CcVDrGHnc/nQcpzcHmq3aQovRFdZRPVnKCS8xolTCx8c
 ZvsBSHnlxbujiF5lwxAwtgUoVY7aZEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695742194;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CA+e6otUPLrh7iOOxWf8G8+TvGBRwCgYMyESmcCQLIY=;
 b=Lt0de4+kjLSws/UlpiwwSbs6wdgJ4VPPx0uMYv6vXCX6MLegN8rklHIlZOSgKRk6A5m4aq
 M5a1uFr1cfFCvWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 473D813434;
 Tue, 26 Sep 2023 15:29:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MJRmEPL4EmWdfwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 26 Sep 2023 15:29:54 +0000
Date: Tue, 26 Sep 2023 17:29:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230926152952.GF159673@pevik>
References: <20230920095318.340582-1-pvorel@suse.cz>
 <20230920095318.340582-6-pvorel@suse.cz> <ZRLLL_h8V8rk-H3T@yuki>
 <20230926135456.GD159673@pevik> <ZRLpdxsuOwPabRTG@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRLpdxsuOwPabRTG@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] doc: Update release procedure
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > >  * lwn at lwn.net
> > > >  * akpm at linux-foundation.org
> > > > -* torvalds at linux-foundation.org.
> > Are these mails complete? I would at least add automated-testing@lists.yoctoproject.org.

> These are actually emails that we inherited from times 10 years ago,
> nobody who gets these emails haven't complained yet, so it stays that
> way.

Sure, sure. I just suggest to add automated-testing at lists.yoctoproject.org
(to the other mailing list section, instead of to the individual persons
sections I wrongly put now).

> I guess that a proper solution may be having a ltp-release mailing list
> so that people can subscribe themselves, on the other way this may be
> overkill.

It looks to me overkill as well.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
