Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C56E305F16
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 16:07:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0654C3C7A58
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 16:07:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 041393C02D7
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 16:07:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3DD401A00EDC
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 16:07:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84A70B74D;
 Wed, 27 Jan 2021 15:07:28 +0000 (UTC)
Date: Wed, 27 Jan 2021 16:07:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Message-ID: <YBGBr3mBUuX21mtE@pevik>
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
 <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
 <87bldd9t9i.fsf@suse.de> <20210126212855.GC15365@pevik>
 <64f599af-f2a7-901d-06a6-a5ff56a107a2@hartkopp.net>
 <87im7i94iu.fsf@suse.de> <YBFY7w1vseKSA4Df@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBFY7w1vseKSA4Df@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/7] can: Add can_common.h for vcan device setup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

...
> > I wonder Petr, is it still necessary to define IFF_ECHO now only
> > <linux/if.h> is included? Or do they somehow symlink linux/if.h ->
> > net/if.h?
> No.

> > Indeed it seems the current version of uclibc-ng doesn't include
> > IFF_ECHO in <net/if.h>. OTOH musl does define it.
> Yes => please keep that definition in can_common.h (enough here, we don't have
> to bother with if.h when we don't have it yet).
> And I'll send tonight patch to uclibc-ng.
> The more mature musl is the less relevant uclibc-ng is.

Just for a record, I was wrong. Using <linux/if.h> is enough, no need to
keep definition on can_common.h. Sorry for wasting your time.

I mixed two problems: <linux/if.h> and <net/if.h> conflict (there are more headers
which conflict) [1] and sometimes missing definition on uclibc-ng.

*But* musl defines IFF_ECHO in <net/if.h> as they try to allow people not having
to depend on <linux/*.h>, which is IMHO better than blindly relying on
<linux/*.h> which glibc and uclibc{,-ng} (which follows glibc) does much more
than musl:

$ git grep '^#include <linux/.*\.h>' |wc -l
43 # glibc
37 # uclibc-ng
3 # musl

Kind regards,
Petr

[1] https://sourceware.org/glibc/wiki/Synchronizing_Headers#Known_Pairs_of_Headers_that_Conflict

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
