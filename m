Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F3B1D134B
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:54:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA8AB3C54EE
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:54:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 807B43C2555
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:54:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F3BAD20109C
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:54:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0DC9AAD4B;
 Wed, 13 May 2020 12:54:33 +0000 (UTC)
Date: Wed, 13 May 2020 14:54:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200513125428.GA15868@dell5510>
References: <437d6fd3926de4c801ae0edb2379c6afafcb34d4.1589190284.git.viresh.kumar@linaro.org>
 <20200513113318.GA25472@dell5510>
 <20200513114239.roy5hqu26lm2of4l@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513114239.roy5hqu26lm2of4l@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Fix issues around calling syscalls with
 old timespec
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> > >  #ifndef __kernel_timex
> > > +#if defined(__x86_64__) && defined(__ILP32__)
> > > +typedef long long __kernel_long_t;
> > > +#else
> > > +typedef long __kernel_long_t;
> > > +#endif
> > > +
> > > +typedef __kernel_long_t	__kernel_old_time_t;

> > It's caused by this fallback definition ^, which is already in
> > include/tst_timer.h. Simple deleting it should fix the problem

> But tst_timer.h isn't included here in clock_adjtime at all. What's
tst_timer.h has been included in clock_adjtime.h since 5085e14c7e

> special with Centos that failure is seen there only ?
> Any idea ?

Not sure why it's only for old CentOS 6. Usually there is some bug in the
headers (conflicting headers which has been fixed in newer distros) or something
simply missing.
And we should really drop CentOS 6 from travis CI, we agreed to discontinue gcc
4 support (10 years old). But I wanted to drop it after the release.

BTW typedef long long __kernel_long_t; is in <asm/posix_types_x32.h>
which you include via <asm/posix_types.h>. But redefining typedef is not a
problem.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
