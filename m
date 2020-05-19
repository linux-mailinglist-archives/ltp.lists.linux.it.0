Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7671D96CC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:56:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 093693C4E66
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:56:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3B7893C1F2A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:56:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B8BF81000DAE
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:56:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B63F7B03A;
 Tue, 19 May 2020 12:56:22 +0000 (UTC)
Date: Tue, 19 May 2020 14:56:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519125618.GA29373@dell5510>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
 <20200519122347.GC16008@yuki.lan>
 <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2PgjYyijH=VoNGhs_xk1VvFN6ZNvNM-W4TopWY6jJNbA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > -     tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> > > +     clock_gettime(CLOCK_MONOTONIC, &ts);

> > I guess that this will reintroduce LTP compilation failures on older
> > glibc, which was the primary reason we used the tst_clock_gettime()
> > instead of clock_gettime().

> I see that clock_gettime was first added in glibc-2.1.3 back in 1999.
> Can that actually run LTP any more? If it can and this is considered
> important, I fear the tst_clock_gettime() call needs to be extended
> to call the clock_gettime()/clock_gettime64()/gettimeofday() syscalls,
> whichever is the first to work, and convert the formats from the
> native kernel format to the glibc format.
IMHO the older system we still test in Travis (but going to remove it soon) is
CentOS 6 (kernel 3.10, glibc 2.12, gcc 4.4.7). I suspect that it was needed this
system (e.g. system with old glibc and gcc; gcc required some fixes which
bothered me, but old glibc actually caught some bugs in fallback which we
wouldn't otherwise find). Or am I wrong?

We agreed (few LTP maintainers), that, at least for SUSE and Red Hat is ok to
drop support for distros 10+ years, because these systems are tested with some
older LTP release anyway.

>          Arnd

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
