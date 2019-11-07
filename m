Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82984F2E41
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 13:40:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93E743C2269
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 13:40:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 457223C078F
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:40:52 +0100 (CET)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 91194201698
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:40:51 +0100 (CET)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iSh5j-0005IA-Kd; Thu, 07 Nov 2019 13:40:47 +0100
Date: Thu, 7 Nov 2019 13:40:47 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20191107123224.GA6315@hirez.programming.kicks-ass.net>
Message-ID: <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <20191107123224.GA6315@hirez.programming.kicks-ass.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
> Lets start by saying this accounting stuff is terrible crap and it
> deserves to fail and burn.

No argument about that.

> And what does btime want? As implemented it jumps around if you ask the
> question twice with an adjtime() call or suspend in between. Of course,
> if we take an actual CLOCK_REALTIME timestamp at fork() the value
> doesn't change, but then it can be in the future (DST,adjtime()), which
> is exactly the reason why CLOCK_REALTIME is absolute shit for timestamps
> (logging, accounting, etc.).
> 
> And your 'fix' is pretty terible too. Arguably ktime_get_seconds() wants
> fixing for not having the ns accumulation and actually differing from
> tv_sec, but now you accrue one source of ns while still disregarding
> another (also, I friggin hate timespec, it's a terrible interface for
> time).
> 
> All in all, I'm tempted to just declare this stuff broken and -EWONTFIX,
> but if we have to do something, something like the below is at least
> internally consistent.

Kinda :)

> +	mono = ktime_get_ns();
> +	real = ktime_get_real_ns();
> +	/*
> +	 * Compute btime by subtracting the elapsed time from the current
> +	 * CLOCK_REALTIME.
> +	 *
> +	 * XXX totally buggered, because it changes results across
> +	 * adjtime() calls and suspend/resume.
> +	 */
> +	delta = mono - tsk->start_time; // elapsed in ns
> +	btime = real - delta;		// real ns - elapsed ns
> +	do_div(btime, NSEC_PER_SEC);	// truncated to seconds
> +	stats->ac_btime = btime;

That has pretty much the same problem as just storing the CLOCK_REALTIME
start time at fork and additionally it is wreckaged vs. suspend resume.

So a CLOCK_REALTIME time stamp at fork would at least be correct
vs. suspend resume.

The same result is achieved by:

       boot = ktime_get_boot_ns();
       delta = boot = tsk->real_start_time;

Typing real_start_time makes me really cringe.

Thanks,

	tglx

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
