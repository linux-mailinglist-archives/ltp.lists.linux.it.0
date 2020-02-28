Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1E17381C
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 14:17:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9082D3C6AC0
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 14:17:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 048B33C6AB2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 14:17:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 92BCC1417259
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 14:17:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5097B152;
 Fri, 28 Feb 2020 13:17:19 +0000 (UTC)
Date: Fri, 28 Feb 2020 14:17:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200228131717.GA15552@dell5510>
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-2-pvorel@suse.cz>
 <CAEemH2fTYf91KP6_Kf343taLmoGeTuOvNJWVr1qf5C-02+CZpQ@mail.gmail.com>
 <20200228121347.GB8324@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228121347.GB8324@rei>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] lib: Check also flags for tst_res()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > >  #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
> > >         do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)

> > > +#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
> > > +       TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition)


> > To be honest, this looks verbose and confusing a little. I'm thinking can
> > we just add a prefix TST_ to the kernel macro and use it directly?

> > e.g

> > #define TST_BUILD_BUG_ON(condition) \
> >         do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)

> I guess that the confusing part is that TST_RES_SUPPORTS_... uses
> TST_BRK_SUPPORTS_...

> I guess that it would be nicer if we had TST_BUILD_BUG_ON() and then
> both TST_RES_SUPPORTS_... and TST_BRK_SUPPORTS_... would use it.

> I personally think that TST_BUILD_BUG_ON() itself is not verbose enough
> though.

+1. I'll implement it like this and merge (unless somebody objects).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
