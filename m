Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B536F319F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 15:37:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD2B93C2078
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 15:37:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D076A3C1D56
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 15:37:10 +0100 (CET)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6DE3C1002749
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 15:37:10 +0100 (CET)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iSiuI-0007ss-9x; Thu, 07 Nov 2019 15:37:06 +0100
Date: Thu, 7 Nov 2019 15:37:05 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20191107125559.GI4131@hirez.programming.kicks-ass.net>
Message-ID: <alpine.DEB.2.21.1911071536190.4256@nanos.tec.linutronix.de>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <20191107123224.GA6315@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
 <20191107125559.GI4131@hirez.programming.kicks-ass.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

On Thu, 7 Nov 2019, Peter Zijlstra wrote:
> On Thu, Nov 07, 2019 at 01:40:47PM +0100, Thomas Gleixner wrote:
> > On Thu, 7 Nov 2019, Peter Zijlstra wrote:
> 
> > > +	mono = ktime_get_ns();
> > > +	real = ktime_get_real_ns();
> > > +	/*
> > > +	 * Compute btime by subtracting the elapsed time from the current
> > > +	 * CLOCK_REALTIME.
> > > +	 *
> > > +	 * XXX totally buggered, because it changes results across
> > > +	 * adjtime() calls and suspend/resume.
> > > +	 */
> > > +	delta = mono - tsk->start_time; // elapsed in ns
> > > +	btime = real - delta;		// real ns - elapsed ns
> > > +	do_div(btime, NSEC_PER_SEC);	// truncated to seconds
> > > +	stats->ac_btime = btime;
> > 
> > That has pretty much the same problem as just storing the CLOCK_REALTIME
> > start time at fork and additionally it is wreckaged vs. suspend resume.
> 
> It's wrecked in general. It also jumps around for any REALTIME
> adjustment.
> 
> > So a CLOCK_REALTIME time stamp at fork would at least be correct
> > vs. suspend resume.
> 
> But still wrecked vs REALTIME jumps, as in, when DST flips the clock
> back an hour, your timestamp is in the future.
> 
> Any which way around the whole thing is buggered.  The only real fix is
> not using REALTIME anything. Which is why I'm loath to add that REALTIME
> timestamp at fork(), it just encourages more use.

Fair enough. You have a sane alternative though: CLOCK_TAI

Thanks,

	tglx



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
