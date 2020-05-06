Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCEE1C7023
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 14:17:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26E873C57AB
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 14:17:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A03B53C2232
 for <ltp@lists.linux.it>; Wed,  6 May 2020 14:17:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4453F6016E8
 for <ltp@lists.linux.it>; Wed,  6 May 2020 14:17:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1FEE9AE3A;
 Wed,  6 May 2020 12:17:09 +0000 (UTC)
Date: Wed, 6 May 2020 14:17:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200506121704.GA8586@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510>
 <87d07isaka.fsf@our.domain.is.not.set>
 <877dxpsb4n.fsf@our.domain.is.not.set>
 <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
 <CAEemH2coDuWHPt8SMosAtpjNd4VxmkGw3FWWajUOYXaNN7o0og@mail.gmail.com>
 <1352538726.11479675.1588763647954.JavaMail.zimbra@redhat.com>
 <20200506113817.GA5409@dell5510>
 <1139985312.11485617.1588766778300.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1139985312.11485617.1588766778300.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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

Hi Jan,

> > > -#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H)
> > > +#include <linux/version.h>
> > Shouldn't we also check for <linux/version.h> with autotools? Or are kernel
> > headers mandatory for LTP build?

> We already include this header in some syscalls tests, so I assumed it won't be an issue.

OK, no problem.

> > > +
> > > +#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H) \
> > > +       && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)

> > >  #include <linux/if_packet.h>
> > >  #include <linux/if_ether.h>
> > > @@ -373,6 +376,6 @@ static struct tst_test test = {

> > >  #else

> > > -TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h>");
> > > +TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h> and
> > > 4.10+");

> > +1.

> > BTW, why this tests requires 4.10 for runtime?

> It's for compilation. struct can_frame fields it's using were introduced in 4.10.

Do you mean a2f11835994e ("can.h: make padding given by gcc explicit") from
v4.2-rc1? + there is no change for include/uapi/linux/can.h in 4.10.

This is just a separate question to this fix (thank you for finding a solution).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
