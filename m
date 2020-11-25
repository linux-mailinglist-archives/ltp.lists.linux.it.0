Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8A2C4045
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 13:34:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E8023C3066
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 13:34:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A02F93C2D00
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 13:34:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 566D56009F9
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 13:34:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 576F3AC2F;
 Wed, 25 Nov 2020 12:34:43 +0000 (UTC)
Date: Wed, 25 Nov 2020 13:35:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20201125123534.GA28684@yuki.lan>
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201124153837.GA24470@yuki.lan>
 <875z5tllih.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875z5tllih.fsf@nanos.tec.linutronix.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls: avoid time() using
 __cvdso_gettimeofday in use-level's VDSO
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
Cc: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Carlos O'Donell <carlos@redhat.com>,
 John Stultz <john.stultz@linaro.org>,
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This is a general problem and not really just for this particular test
> case.
> 
> Due to the internal implementation of ktime_get_real_seconds(), which is
> a 2038 safe replacement for the former get_seconds() function, this
> accumulation issue can be observed. (time(2) via syscall and newer
> versions of VDSO use the same mechanism).
> 
>      clock_gettime(CLOCK_REALTIME, &ts);
>      sec = time();
>      assert(sec >= ts.tv_sec);
> 
> That assert can trigger for two reasons:
> 
>  1) Clock was set between the clock_gettime() and time().
> 
>  2) The clock has advanced far enough that:
> 
>     timekeeper.tv_nsec + (clock_now_ns() - last_update_ns) > NSEC_PER_SEC
> 
> #1 is just a property of clock REALTIME. There is nothing we can do
>    about that.
> 
> #2 is due to the optimized get_seconds()/time() access which avoids to
>    read the clock. This can happen on bare metal as well, but is far
>    more likely to be exposed on virt.
> 
> The same problem exists for CLOCK_XXX vs. CLOCK_XXX_COARSE
> 
>      clock_gettime(CLOCK_XXX, &ts);
>      clock_gettime(CLOCK_XXX_COARSE, &tc);
>      assert(tc.tv_sec >= ts.tv_sec);
> 
> The _COARSE variants return their associated timekeeper.tv_sec,tv_nsec
> pair without reading the clock. Same as #2 above just extended to clock
> MONOTONIC.

Good hint, I guess that easiest fix would be to switch to coarse timers
for these tests.

> There is no way to fix this except giving up on the fast accessors and
> make everything take the slow path and read the clock, which might make
> a lot of people unhappy.

That's understandable and reasonable. Thanks a lot for the confirmation.

> For clock REALTIME #1 is anyway an issue, so I think documenting this
> proper is the right thing to do.
> 
> Thoughts?

I guess that ideally BUGS section for time(2) and clock_gettime(2)
should be updated with this explanation.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
