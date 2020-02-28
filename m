Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFFD173187
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:05:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 742FE3C2353
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 08:05:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 715D03C22CB
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:05:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E8D35100204F
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 08:05:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 34EEEAE2C;
 Fri, 28 Feb 2020 07:05:08 +0000 (UTC)
Date: Fri, 28 Feb 2020 08:05:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200228070506.GA23156@dell5510>
References: <20200227163922.317-1-pvorel@suse.cz>
 <20200227163922.317-2-pvorel@suse.cz>
 <CAEemH2fTYf91KP6_Kf343taLmoGeTuOvNJWVr1qf5C-02+CZpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fTYf91KP6_Kf343taLmoGeTuOvNJWVr1qf5C-02+CZpQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

Hi Li,

> Thanks for your work on this!
Thanks for your review!

...
> > +++ b/include/tst_common.h
> > @@ -77,4 +77,7 @@
> >  #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
> >         do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)

> > +#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
> > +       TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition)


> To be honest, this looks verbose and confusing a little. I'm thinking can
> we just add a prefix TST_ to the kernel macro and use it directly?

> e.g

> #define TST_BUILD_BUG_ON(condition) \
>         do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)
Yep, I was also thinking to get back to the original name BUILD_BUG_ON().
TST_BUILD_BUG_ON() is even better (although I considered TST_ as part of public
API, this is internal implementation).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
