Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A224396A3
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 14:48:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E32ED3C6529
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 14:48:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 158B53C1AEB
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 14:48:31 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 652E3200FEE
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 14:48:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7CB221956;
 Mon, 25 Oct 2021 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635166110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jaDGGYEqHCOCGsYJwhT5q3Bgiu3jFzZj2pEiDDHUNCA=;
 b=lSdrWdKNBRbGQ3UI+kwpRzbAhzvbkFuEWyzsgcynBQEZw/WhFDeehUUy24pCe4dqrI+FSy
 fE24JE5/Fh/2nPjgxneEWPv2D//woZ1wPDMTr+y+phLEk1kykLWz/sJKtcsznBGXKG0XG2
 Fjqtrreg6nZP3VXIPaKs7cGGuP3MO8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635166110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jaDGGYEqHCOCGsYJwhT5q3Bgiu3jFzZj2pEiDDHUNCA=;
 b=Fys6wPgIpzIV6wvOmtueMOOc2yomOuAoWs6HNQhc+1kkSnE+ocK1i6nwi8R5pPn0ifInl3
 leQsevQf9LGWjqDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9143D13A86;
 Mon, 25 Oct 2021 12:48:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 67zJIZ6ndmFLRgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 25 Oct 2021 12:48:30 +0000
Date: Mon, 25 Oct 2021 14:48:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YXanndP2pTMlpNsH@rei>
References: <20211018154800.11013-1-chrubis@suse.cz>
 <20211018154800.11013-8-chrubis@suse.cz> <YXKgjCFoS3ykchcH@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YXKgjCFoS3ykchcH@pevik>
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Since we want to use the metadata.json in the testrunner it must bte
> nit: typo s/bte/be
> 
> > build unconditionally.
> According to docs:
>   --with-metadata-generator=asciidoc|asciidoctor
>   --disable-metadata      Disable metadata generation (both HTML and PDF,
>                           default no)
>   --disable-metadata-html Disable metadata HTML generation (default no)
>   --enable-metadata-pdf   Enable metadata PDF generation (default no)
> 
> I'd like to have single option which does not create HTML and PDF (thus does not
> require asciidoc|asciidoctor. I wonder if we could change build system to keep
> --disable-metadata, build always docparse and json as we need, but with
> ./configured --disable-metadata just not run HTML and PDF generation?

I'm starting to think that the docparse.c should be moved to a
metadata/paraser.c and that we should keep the documentation generators
separate from the parser, that would allow us to keep all the configure
switches while metadata.json would be build and installed
unconditionally.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
