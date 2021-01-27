Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE994305AEF
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:13:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ECFD3C630B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 13:13:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D251D3C00DD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:13:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6BCA5200B86
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 13:13:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDB55ACC6;
 Wed, 27 Jan 2021 12:13:36 +0000 (UTC)
Date: Wed, 27 Jan 2021 13:13:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YBFY7w1vseKSA4Df@pevik>
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
 <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
 <87bldd9t9i.fsf@suse.de> <20210126212855.GC15365@pevik>
 <64f599af-f2a7-901d-06a6-a5ff56a107a2@hartkopp.net>
 <87im7i94iu.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87im7i94iu.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

<snip>
> >>>> IFF_ECHO was included into Linux 2.6.25 together with the CAN
> >>>> subsystem itself.

> >>>> So when you run the tests on Kernels < 2.6.25 you don't have CAN
> >>>> support and don't need IFF_ECHO too.

> >>> Petr, what kernel version and/or distro version did compilation fail on?

> >>> There is a small chance someone might be compiling with old kernel
> >>> headers relative to their kernel. However it is a challenge to compile
> >>> LTP with such an old user land.
> >> No, we don't support 2.6.25 :). I was playing with Buildroot distro
> >> in my spare time.
> >> These embedded toolchains suffer compatibility problems (usually uclibc-ng and
> >> sometimes musl lack the support). This problem was when using sourcery-arm-*.

> > :-/

> >> But this is definitely not a blocker for this patchset. That lapi is not a must,
> >> I can fix it some time later. I usually fix few of these problems before each
> >> LTP release.

> > Ok. No problem. I wasn't aware that e.g. musl or other toolchains
> > select such strange starting points for their include files.

> I wonder Petr, is it still necessary to define IFF_ECHO now only
> <linux/if.h> is included? Or do they somehow symlink linux/if.h ->
> net/if.h?
No.

> Indeed it seems the current version of uclibc-ng doesn't include
> IFF_ECHO in <net/if.h>. OTOH musl does define it.
Yes => please keep that definition in can_common.h (enough here, we don't have
to bother with if.h when we don't have it yet).
And I'll send tonight patch to uclibc-ng.
The more mature musl is the less relevant uclibc-ng is.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
