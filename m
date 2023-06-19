Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA607355D4
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jun 2023 13:29:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C490B3CE200
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jun 2023 13:29:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 089083C9C7B
 for <ltp@lists.linux.it>; Mon, 19 Jun 2023 13:29:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43B03600740
 for <ltp@lists.linux.it>; Mon, 19 Jun 2023 13:29:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D135D218B5;
 Mon, 19 Jun 2023 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687174187;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jb0+DzszBr4ZHz0fqxCF0u123sMQnMtYJ3+W5XWbjhE=;
 b=gFrZPT9UwHzn4Z9vbSlUbOY2cQ3cwu0c1aldgbx6wpbUfrq/Oojhn6t4yCHqdFGiYdm7Br
 hpyYrUcP2Tn8tfDszWt9nqD16R/KxP6GlKeqnwDMKOO8uoEIrBxxm1jDRPdcb4HQCs28P8
 N3sWPEUKKkCEe2MVpiSslG1KrVERR4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687174187;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jb0+DzszBr4ZHz0fqxCF0u123sMQnMtYJ3+W5XWbjhE=;
 b=yO2TwE5+MrDW7kGmKQ5KOjOxHFLFxo8Fh2CgTvzCj9Jz7ufUzUhwualioe7ECF48Vvu4d5
 OgwhZkMijep1q2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D225138E8;
 Mon, 19 Jun 2023 11:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PZ0HIys8kGT/WQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 19 Jun 2023 11:29:47 +0000
Date: Mon, 19 Jun 2023 13:29:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230619112938.GA129463@pevik>
References: <20230619103140.13925-1-pvorel@suse.cz>
 <ZJAvSrRXyng7dqd5@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJAvSrRXyng7dqd5@yuki>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED][PATCH 1/1] ci/debian.minimal.sh: Keep libcap2
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > Trying to remove libcap2 for minimal environment no longer works for
> > Debian 12 bookworm (the new Debian stable release). It looks like
> > libcap2 is required by apt itself:

> > apt remove -y libcap2
> > The following packages have unmet dependencies:
> >  apt : Depends: libapt-pkg6.0 (>= 2.6.1) but it is not going to be installed
> >        Depends: libsystemd0
> >  bsdutils : PreDepends: libsystemd0
> >  util-linux : PreDepends: libsystemd0
> > E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.

> Shouldn't be removal of libcap-dev enough for us not to compile LTP
> against it? Why do we remove libcap2 in the first place?

Yes, you're right. I'm not sure now, but removing libcap-dev was probably enough
even back then.

NOTE: the other error (on debian stable) is metadata generation with asciidoc,
where it miss docbook2x package. I'll send a patch instead of directly fixing
it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
