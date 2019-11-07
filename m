Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802BF2EAE
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5EC03C22A4
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E49913C1D57
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:56:04 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 15339604831
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gyawpv+WI0lozJSUWTS2ESip9V0449YFZgqA+zRI1YQ=; b=l8irkmXsFre5AlFshSr4RYVdK
 x2OYS1VvM1+Ap6bdD3j6W+5trgT5sj3RkjpcY137yFMDSHl8eE/RpBvkkhOOLndg/9u1hFR7s8dK+
 WxlfaX41N3nZzPmG3WexDelchUAcB4yW1GtDzeHsEn3lk6LX7aFzs1AdWcVjDqOCDM6bdU//cbqvB
 osfHGSyIndvDNV9I/ab5C6ih0oXoGqdytaNmSu2ySnhTrZ71R5djL+xdPOxA/RXnQCbsyJPSR7ljU
 yLTF5xRAvRztq8mekVAHz5AjnRZ7ulAGXUQndYzk4lDmGZ59BWkfWYn6LYyiI7huBFYlOI9DM9IjV
 ddMsmYdUw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iShKT-0000nk-Am; Thu, 07 Nov 2019 12:56:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0F92300692;
 Thu,  7 Nov 2019 13:54:54 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 78C9E2025EDA7; Thu,  7 Nov 2019 13:55:59 +0100 (CET)
Date: Thu, 7 Nov 2019 13:55:59 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20191107125559.GI4131@hirez.programming.kicks-ass.net>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <20191107123224.GA6315@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 07 Nov 2019 14:00:29 +0100
Subject: Re: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
 acct.ac_btime
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
Cc: kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rfontana@redhat.com, viro@zeniv.linux.org.uk,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 07, 2019 at 01:40:47PM +0100, Thomas Gleixner wrote:
> On Thu, 7 Nov 2019, Peter Zijlstra wrote:

> > +	mono = ktime_get_ns();
> > +	real = ktime_get_real_ns();
> > +	/*
> > +	 * Compute btime by subtracting the elapsed time from the current
> > +	 * CLOCK_REALTIME.
> > +	 *
> > +	 * XXX totally buggered, because it changes results across
> > +	 * adjtime() calls and suspend/resume.
> > +	 */
> > +	delta = mono - tsk->start_time; // elapsed in ns
> > +	btime = real - delta;		// real ns - elapsed ns
> > +	do_div(btime, NSEC_PER_SEC);	// truncated to seconds
> > +	stats->ac_btime = btime;
> 
> That has pretty much the same problem as just storing the CLOCK_REALTIME
> start time at fork and additionally it is wreckaged vs. suspend resume.

It's wrecked in general. It also jumps around for any REALTIME
adjustment.

> So a CLOCK_REALTIME time stamp at fork would at least be correct
> vs. suspend resume.

But still wrecked vs REALTIME jumps, as in, when DST flips the clock
back an hour, your timestamp is in the future.

Any which way around the whole thing is buggered.  The only real fix is
not using REALTIME anything. Which is why I'm loath to add that REALTIME
timestamp at fork(), it just encourages more use.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
