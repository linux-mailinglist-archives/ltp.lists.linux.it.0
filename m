Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED563A7C4C
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 12:44:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81AB13C4D41
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 12:44:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2D0C3C1F4E
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 12:44:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 435631400200
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 12:44:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64C081FD2A;
 Tue, 15 Jun 2021 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623753855;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0m2Of7eLUHnNbDqO8DhF4akusA4HsK92sPIe2Ipe+PI=;
 b=Zele0KHlDI5oSs8bcdrLzTblwZrHBq0m1VOjG4WS4xjSbA/glZtOaqjkcJRpf6McTorz1E
 bcOkp6Ub0nk2xMhXGx70hX9P5aaHBSf+nwac2MNwa3q1XZRGpT0W0rP8Yx4g1FnmboUnoA
 p9FH/K2RunpqCF+HPI7u6gFutFlyZmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623753855;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0m2Of7eLUHnNbDqO8DhF4akusA4HsK92sPIe2Ipe+PI=;
 b=FV4wDY9ZTHrYYm37Ek/644yhTHTDOGH0i0pGW19FOS911Tw13mmVhrda/YMPg/A9RP9z7C
 cgQfsZC+kV09J8Bg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 38E52118DD;
 Tue, 15 Jun 2021 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623753855;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0m2Of7eLUHnNbDqO8DhF4akusA4HsK92sPIe2Ipe+PI=;
 b=Zele0KHlDI5oSs8bcdrLzTblwZrHBq0m1VOjG4WS4xjSbA/glZtOaqjkcJRpf6McTorz1E
 bcOkp6Ub0nk2xMhXGx70hX9P5aaHBSf+nwac2MNwa3q1XZRGpT0W0rP8Yx4g1FnmboUnoA
 p9FH/K2RunpqCF+HPI7u6gFutFlyZmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623753855;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0m2Of7eLUHnNbDqO8DhF4akusA4HsK92sPIe2Ipe+PI=;
 b=FV4wDY9ZTHrYYm37Ek/644yhTHTDOGH0i0pGW19FOS911Tw13mmVhrda/YMPg/A9RP9z7C
 cgQfsZC+kV09J8Bg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id To9PCX+EyGB9KgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 10:44:15 +0000
Date: Tue, 15 Jun 2021 12:44:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YMiEfQfujl9lJ1lZ@pevik>
References: <20210614115638.25467-1-rpalethorpe@suse.com>
 <20210614115638.25467-3-rpalethorpe@suse.com>
 <YMdcgrabnou+u90I@pevik> <YMdfDZPxY7lZC8F0@pevik>
 <87r1h44j6k.fsf@suse.de> <87o8c84j3f.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8c84j3f.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v3 2/2] Start libclang based analyzer and
 TEST() check
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
...

> >>> > +#else
> >>> > +
> >>> > +int main(const attr_unused int argc, const attr_unused char *const *const argv)
> >>> > +{
> >>> > +	emit_error("clang-checks was not built correctly; libclang headers are not installed!\n");
> >>> emit_error() is not visible here, thus build fails. Please add it
> >>before HAVE_CLANG_C_INDEX_H.

> > +1

> > Uhg.


> >>> Or you could just use tst_test.h with TST_NO_DEFAULT_MAIN and here would be TST_TEST_TCONF()
> >>> (+ LTP_ATTRIBUTE_UNUSED).

> >> ...
> >>> > +/* Copied from lib/tst_ansi_color.c */
> >>> > +static int color_enabled(const int fd)

> >> Also you'd probably get tst_color_enabled() and other things from
> >> lib/tst_ansi_color.c for color handling for free when using
> >> tst_test.h.

> > We would probably have to build the ltplib with HOSTCC. I don't think we
> > can just include the headers.

> > It is tempting, but it also seems very circular. I can imagine someone
> > half refactoring a library and wanting to run the checks on one
> > translation unit. However Make would detect a dependency has changed, so
> > would try to rebuild the checker with a broken ltplib...

> > We could probably make it work, but having the checker depend on the
> > thing it checks seems like a recipe for complication. Meanwhile we just
> > get to share a few macros and string constants.

> Although we could create a tools lib with shared code for the meta data
> parser and maybe the future parallel executor if that does not use the
> test lib.

Uh, I'm sorry, I missed build dependency. It's probably not worth to rewriting
this part just to reuse a bit of code. We might look into that in the future,
but for now please just fix a build with your original approach.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
