Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E26471464
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Dec 2021 16:19:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29CAF3C87C3
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Dec 2021 16:19:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 164113C4E19
 for <ltp@lists.linux.it>; Sat, 11 Dec 2021 16:19:32 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5D753140098F
 for <ltp@lists.linux.it>; Sat, 11 Dec 2021 16:19:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30C7121116;
 Sat, 11 Dec 2021 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639235971;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kii5QNpNuhwuomo9y5Xjq4A5NHTkOr8lCCJcTZ2BGzk=;
 b=MGADp8QnPrpx4KWq7lm7vd9JcXEIcDA5b+HGnK8zaMCSsLn15poMu/tn/Wc3uaDNgA2ZWX
 glTvHDV257xARtdiuPWV9lEXDX/4hmf0Lz7pfp2KXg1yDmic8i0O82h3JYxPHy0TxLULu6
 cBLdKb2GRcpjAWKBeOYW67Fh9tuFcGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639235971;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kii5QNpNuhwuomo9y5Xjq4A5NHTkOr8lCCJcTZ2BGzk=;
 b=Jwo4CmQU703SykqUxDYWD7CfBj0URkGRX2aosI4AZso3iK0OBxyxgRjZdlB3WTSEu0Sita
 H8wluuNuX6Hs3JBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED7513C97;
 Sat, 11 Dec 2021 15:19:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AMZOJYLBtGGcGQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Sat, 11 Dec 2021 15:19:30 +0000
Date: Sat, 11 Dec 2021 16:19:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YbTBgHwZQEigF/1v@pevik>
References: <20211210134556.26091-1-pvorel@suse.cz>
 <YbN8abgFFb3RTq38@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbN8abgFFb3RTq38@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc/maintainer: Add policy for new
 functionality
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi!
> > Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  doc/maintainer-patch-review-checklist.txt | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> > index c7bb47810..4e2b267ac 100644
> > --- a/doc/maintainer-patch-review-checklist.txt
> > +++ b/doc/maintainer-patch-review-checklist.txt
> > @@ -34,6 +34,9 @@ New test should
> >    GPL-2.0-or-later; the licence for test (e.g. GPL-2.0) should not change
> >    unless test is completely rewritten
> >  * Old copyrights should be kept unless test is completely rewritten
> > +* Tests for new functionality in mainline kernel should be merged after final
> > +  release of kernel which contains that functionality (it's not enough when the
> > +  feature gets into rc1, because it can be reverted in later rc if problematic).

> Sounds reasonable to me, but ideally this should be acked by the rest of
> the maintainers.
Sure, this can wait :).

Cc maintainers directly.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
