Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF782ABF81
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:15:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C64123C537B
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:15:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B11FB3C2378
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:15:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 588BC1000479
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:15:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93F88AFBE
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:15:05 +0000 (UTC)
Date: Mon, 9 Nov 2020 16:15:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201109151503.GA15566@pevik>
References: <20201109133245.10879-1-mdoucha@suse.cz>
 <20201109135627.GA18105@yuki.lan>
 <9d91a462-9aa1-eb1f-6bfc-c2db28967840@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d91a462-9aa1-eb1f-6bfc-c2db28967840@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add tst_secureboot_enabled() helper function
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

Hi Martin, Cyril,

...
> >> diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
> >> index 427608a17..cffd11245 100644
> >> --- a/include/mk/config.mk.in
> >> +++ b/include/mk/config.mk.in
> >> @@ -56,8 +56,8 @@ libdir			:= @libdir@
> >>  mandir			:= @mandir@

> >>  CPPFLAGS		:= @CPPFLAGS@
> >> -CFLAGS			:= @CFLAGS@
> >> -LDLIBS			:= @LIBS@
> >> +CFLAGS			:= @CFLAGS@ @EFIVAR_CFLAGS@
> >> +LDLIBS			:= @LIBS@ @EFIVAR_LIBS@

> > Please do not do this.

> > This should be handled like any other library, i.e. we should define
> > EFIVAR_CFLAGS and EFIVAR_LIBS and use them in respective Makefile.
+1 (and sorry for overlooking this).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
