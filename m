Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D73C863A
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:34:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86EA53C7572
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:34:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 21C963C0234
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:34:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B3E40601286
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:34:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A10122A36;
 Wed, 14 Jul 2021 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626273283;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9zNONeaGWOMI6so8iEdc66Ho5t1BYhwnXJps2y0+E0=;
 b=b97v3eBUZASre3qmgLjILO+feYN8qAUAUUsT/xK8CAaX6AsxJLtWaD2/XYzka4aOeON1vb
 o+qMU3sVbpM/nv/EUWvqJ3gZvE4NKs0Vkb+u0iJQCjAVAI4okCqfNNv5naugIkaqtJPY7H
 Q6hRBGKZCv5N66E1W/VJgo85W8LCBiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626273283;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9zNONeaGWOMI6so8iEdc66Ho5t1BYhwnXJps2y0+E0=;
 b=0WrzZ0lWyNRN0z6ej5XJ7i4pcxykjRtlioYusvBDXUE+FkQpbD7VaDNE/pGgpr5Vr+evYV
 Id62bwOZqWakNEBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D753B13C05;
 Wed, 14 Jul 2021 14:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wCkVMwL27mDhegAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:34:42 +0000
Date: Wed, 14 Jul 2021 16:34:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YO72AKW7/AEDsMtp@pevik>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-4-rpalethorpe@suse.com>
 <YO7CU8UebcFN2VtY@pevik> <87sg0hni07.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sg0hni07.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/8] doc: Add rules and recommendations list
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

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> >> +++ b/doc/test-writing-guidelines.txt
> >> @@ -10,6 +10,11 @@ NOTE: See also
> >>        https://github.com/linux-test-project/ltp/wiki/Shell-Test-API[Shell Test API],
> >>        https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP Library API Writing Guidelines].

> >> +Rules and recommendations which are "machine checkable" should be
> >> +tagged with an ID like +LTP-XXX+. There will be a corresponding entry
> >> +in 'doc/rules.tsv'. When you run 'make check' or 'make check-test' it
> >> +will display these IDs as a reference.
> >> +
> > Actually text is on the top. I suppose, you probably planned to put
> > this into "2.1 C coding style".

> I'm not sure where to put it. The coding style is mostly about syntax
> and formatting. The rules file can state anything machine checkable, so
> that can include shell, directory structure, what functions are used
> etc.

Not sure myself myself. But my note was that you put it below NOTE,
above "1. Guide to clean and understandable code" which looks strange to me.

But not a big deal with it, just a nit.

Kind regards,
Petr

> > Kind regards,
> > Petr

> >>  1. Guide to clean and understandable code
> >>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
