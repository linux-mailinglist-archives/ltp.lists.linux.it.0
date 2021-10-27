Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EC43C6C4
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:48:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD2473C68B1
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Oct 2021 11:48:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F29033C0CD6
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:48:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6B5BB2010EA
 for <ltp@lists.linux.it>; Wed, 27 Oct 2021 11:48:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D5711FD40;
 Wed, 27 Oct 2021 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635328080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmsEQzbmCnjeQAJNSacxn+JFT7bOWVKW1WOef4SitxI=;
 b=VNgYxnPVnQWfVdrkVFxfG3O6/oAe71QWmokIwZYOtml65GTTC8DMKDr4qxfZhbe99W0vDP
 DDBdpUDb2jMHun6mkkSg5EZI/ZTOXH8p9/7k48pC7qdPZu3n6Ag+sEBGR6wd5DSnmcPiVm
 8FmRK/8FxXAy99PlYN4E/X1JMuMvNag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635328080;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmsEQzbmCnjeQAJNSacxn+JFT7bOWVKW1WOef4SitxI=;
 b=gpuNsgRGfBnAaAdCLtCgH0QaG4Q2z6mWys9Nx+M+4+N3P3Z0Vebyrq9NZFmAVmIxN2qh9+
 kX8iOs5GAP4B2XAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7991713B85;
 Wed, 27 Oct 2021 09:48:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mp/tGVAgeWFBNQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Oct 2021 09:48:00 +0000
Date: Wed, 27 Oct 2021 11:47:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YXkgTU8rdPaqQgw5@pevik>
References: <20211018154800.11013-1-chrubis@suse.cz>
 <20211018154800.11013-8-chrubis@suse.cz> <YXKgjCFoS3ykchcH@pevik>
 <YXanndP2pTMlpNsH@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXanndP2pTMlpNsH@rei>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/7] docparse/Makefile: Do not abort on missing
 generators
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
> > > Since we want to use the metadata.json in the testrunner it must bte
> > nit: typo s/bte/be

> > > build unconditionally.
> > According to docs:
> >   --with-metadata-generator=asciidoc|asciidoctor
> >   --disable-metadata      Disable metadata generation (both HTML and PDF,
> >                           default no)
> >   --disable-metadata-html Disable metadata HTML generation (default no)
> >   --enable-metadata-pdf   Enable metadata PDF generation (default no)

> > I'd like to have single option which does not create HTML and PDF (thus does not
> > require asciidoc|asciidoctor. I wonder if we could change build system to keep
> > --disable-metadata, build always docparse and json as we need, but with
> > ./configured --disable-metadata just not run HTML and PDF generation?

> I'm starting to think that the docparse.c should be moved to a
> metadata/paraser.c and that we should keep the documentation generators
> separate from the parser, that would allow us to keep all the configure
> switches while metadata.json would be build and installed
> unconditionally.

Good idea, go ahead with a patch please.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
