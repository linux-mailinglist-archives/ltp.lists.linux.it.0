Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB1478E56
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:47:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2CF13C1D4B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 16:47:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C67D23C0137
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:47:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 375081401250
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 16:47:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F60CAF04;
 Mon, 29 Jul 2019 14:47:18 +0000 (UTC)
Date: Mon, 29 Jul 2019 16:47:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190729144718.GB8824@dell5510>
References: <20190617213138.15896-1-petr.vorel@gmail.com>
 <20190717173456.GA5272@dell5510> <20190718082655.GA24449@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718082655.GA24449@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/ustat: Use __kernel_daddr_t instead
 of daddr_t
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

Hi Cyril,

> > > This fixes build for musl, which does not have <sys/ustat.h> nor
> > > typedef daddr_t. Musl does not define these as ustat is deprecated
> > > in favor of statfs() and daddr_t is ancient [1].

> > > Other libc also does not have <sys/ustat.h> (ustat support was removed
> > > from glibc in 2.28), but they have daddr_t.

> > > This brings <linux/types.h> dependency for ustat testing.

> > > Typedef is needed as sparc and mips have __kernel_daddr_t long,
> > > otherwise it's int.

> > > [1] https://www.openwall.com/lists/musl/2019/06/10/1

> I'm always worried when we use types starting with double underscores
> but let's apply this one, we can always revert it in a case that it
> breaks build somewhere.
Thanks, merged.

BTW <linux/types.h> is also checked in m4/ltp-signalfd.m4 so there is duplicity
in check, but I gave up cleanup it now.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
