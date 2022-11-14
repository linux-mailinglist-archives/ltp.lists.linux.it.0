Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7391C628354
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 15:58:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EE2C3CD239
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Nov 2022 15:58:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AFFCF3CD232
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 15:58:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DFAF91400993
 for <ltp@lists.linux.it>; Mon, 14 Nov 2022 15:58:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2423F200A2;
 Mon, 14 Nov 2022 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668437924;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1a7hCmLBDtVxMh4neya4IouSNlyfhuKerohVpmI2waE=;
 b=EIOMYqnJ9EJgRRPXuDGbuULmEDARz5LZvwroF+mcoORkoa6P70yq1MC75OZYrq4W4bfXr5
 rVAVH06xtebGu1/jHT6AWV775Um155JqiEqh1g2Oq2tiKAR72/g+WmBW4ANRwAQRwtbmt+
 JswAlhWXYrWpiy87PgzQtBYmk11PH70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668437924;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1a7hCmLBDtVxMh4neya4IouSNlyfhuKerohVpmI2waE=;
 b=DCgXwDRl5+32ulDm7XSJyPmBHINlNpQMpFWFZ8D3zU0bjW3JxUBz7Yo1cszZsckXxll+Xr
 pMZKk/uvhU9/P5Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECF2713A8C;
 Mon, 14 Nov 2022 14:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2WqcOKNXcmNkfwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 14 Nov 2022 14:58:43 +0000
Date: Mon, 14 Nov 2022 15:58:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y3JXokTXaSbL0ofr@pevik>
References: <20221110145429.8158-1-pvorel@suse.cz> <8735alu4bp.fsf@suse.de>
 <Y3JGoc2V7VjR0q9Z@pevik> <87tu31sjze.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tu31sjze.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] README.md: Document IRC
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

Hi Richie,

> Hello,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> >> Hello,

> >> Petr Vorel <pvorel@suse.cz> writes:

> >> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> >> > ---
> >> > changes v1->v2
> >> > * s/on/at/

> >> > Kind regards,
> >> > Petr

> >> >  README.md | 3 +++
> >> >  1 file changed, 3 insertions(+)

> >> > diff --git a/README.md b/README.md
> >> > index d45d1ee44..89b2640c1 100644
> >> > --- a/README.md
> >> > +++ b/README.md
> >> > @@ -22,6 +22,9 @@ http://lists.linux.it/listinfo/ltp
> >> >  LTP mailing list is archived at:
> >> >  https://lore.kernel.org/ltp/

> >> > +IRC
> >> > +#ltp at https://libera.chat/[irc.libera.chat]

> > Hi Richie,

> >> Won't the # make it a top level heading?
> > Well, that would be if there was a separate line between those two lines.

> >> https://daringfireball.net/projects/markdown/syntax#header

> > Thus this would work. But I put asciidoc syntax (used in our wiki),
> > instead of markdown.

> > Therefore the correct syntax for README.md is:

> > IRC #ltp at: [https://libera.chat/](irc.libera.chat)
Actually URL must be: [irc.libera.chat](https://libera.chat/)

> > Kind regards,
> > Petr

> Well, either way:

> Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

Thanks a lot, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
