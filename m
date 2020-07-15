Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A382207D4
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:52:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 276553C4F4A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:52:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 580F03C1D4B
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:52:55 +0200 (CEST)
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BDDD360025F
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:52:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7A4AAF4C;
 Wed, 15 Jul 2020 08:52:56 +0000 (UTC)
Date: Wed, 15 Jul 2020 10:53:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200715085314.GA7741@yuki.lan>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <20200715023642.jlldqjr7phru7ojj@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715023642.jlldqjr7phru7ojj@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RDNS_NONE, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Pushed with minor changes, thanks.
> > 
> > Among other fixes I've moved the signal check from the signal handler to
> > the clear_signal() function, since the tst_res() function is not
> > signal-async-safe...
> 
> What does that mean ? I remember that I added it there in
> clear_signal() first, but then I tried to print the stuff (forcefully)
> from sighandler() and it worked without any issues and so I did that.

Calling printf() from signal handler is not safe, which tst_res() does.

It will work fine 99% of the cases and this is the reason most people do
it anyways. One of the failure modes is the malloc arena lock. Printf
may allocate temporary buffer so if the signal comes when the process is
in the malloc code the process will hang forewer because it will try to
acquire a lock that has been locked before we jumped into the signal
handler, but there is probably more. It usually gets triggered on
stranger architectures, x86 is quite forgiving in this regard.

Signal handlers are generally tricky and there is a list of functions
that carefuly avoid messing with any global state and can be safely used
from withing a signal handler (man 7 signal-safety) anything else is,
unlikely to fail, but still potential hazard.

Generally the safest approach to signal handlers is to set a variable
and exit, which is what I usually do in tests...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
