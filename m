Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF027044BE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 May 2023 07:35:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 700063CB327
	for <lists+linux-ltp@lfdr.de>; Tue, 16 May 2023 07:35:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2A9E3CB2F8
 for <ltp@lists.linux.it>; Tue, 16 May 2023 07:35:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E24B560070A
 for <ltp@lists.linux.it>; Tue, 16 May 2023 07:35:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 13FEA21AD9;
 Tue, 16 May 2023 05:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1684215352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hkg6hyITi6xz7KG+jBVgvCg/1VFsXSPf5sv4jOSvsxI=;
 b=ZX23+hiSZmic1xKzhIUNyr0r7Tfxf1Ke74Hmt2cGo42e+KEc/imRDpsSgGtZgXv+vJB3gy
 aYtfDBpIyWASVMAhKiBAosy2P6qkO4GG0XNhD4o11m6yh2OWhqWud+h21QUzK9YK5nW+h1
 mTT1qPaFSasZLAfGhTZ35EtrCYYNTmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1684215352;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hkg6hyITi6xz7KG+jBVgvCg/1VFsXSPf5sv4jOSvsxI=;
 b=0yIOobfaaEJL73cY2u2v5ODWsKR0+awFoiRiOAXvCZKryLyyx8ltBt5n0WOEZHiNRxAH34
 N/YMHxa5JWTQsfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9F171377D;
 Tue, 16 May 2023 05:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RLK4MzcWY2SKXAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 16 May 2023 05:35:51 +0000
Date: Tue, 16 May 2023 07:35:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it
Message-ID: <20230516053550.GA21020@pevik>
References: <ZEjsKC6ESB1+mM0H@rei>
 <CAEemH2dESMRqQwLPvf7t20et6i9bG_uzS7OUVEy53TpWkqsFWQ@mail.gmail.com>
 <CAEemH2dUGD_0R-RH7bS4U_qPD+G_na51TaYyNtw3Yt=uQx9nTQ@mail.gmail.com>
 <ZFoSZkkjVXQhdEpe@yuki>
 <CAEemH2fycnWnsMe7sKZn357zj5QZr_Y7+ML0GAAWeQGkASu47g@mail.gmail.com>
 <20230510130347.GA225439@pevik> <ZGIwYcx1sPGbL6eY@yuki>
 <20230516045803.GA4238@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516045803.GA4238@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi Cyril,

> > Hi!
> > > I'll can do, what I did previously:
> > > 	- new release commit and tag and create release in github from it
> > >     - uploading tarballs
> > > 	- release notes for shell API (mostly network shell API)

> > > It'd be big help if Cyril managed to do release notes and the announcement.

> > I'm ready at my side. Peter can you please proceed with tagging the git
> > and tarball upload?

> Sure, I'm about to do it now.

I've tagged LTP, created release on Github, where I uploaded tarballs, checksums
and html metadata. I'll upload pdf metadata shortly.

@Cyril please post the announcement and add it to the release (or let me know if
I should add it from your mail).

Kind regards,
Petr

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
