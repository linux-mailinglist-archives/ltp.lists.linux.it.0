Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 052892C530A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 12:33:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B91263C4E25
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 12:33:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7F2D13C2C8F
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 12:33:47 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 58CCC1A00890
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 12:33:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0641478;
 Thu, 26 Nov 2020 03:33:43 -0800 (PST)
Received: from [10.37.12.45] (unknown [10.37.12.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C824B3F71F;
 Thu, 26 Nov 2020 03:33:41 -0800 (PST)
To: Thomas Gleixner <tglx@linutronix.de>, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>
References: <20201123083137.11575-1-liwang@redhat.com>
 <20201124153837.GA24470@yuki.lan> <875z5tllih.fsf@nanos.tec.linutronix.de>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <c77c4306-6a7e-01f5-c338-ec1c8ef2c0c6@arm.com>
Date: Thu, 26 Nov 2020 11:36:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <875z5tllih.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
 Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Thomas.

On 11/25/20 11:32 AM, Thomas Gleixner wrote:
[...]

>>> Here we propose to use '__NR_time' to invoke syscall directly that makes
>>> test all get real seconds via ktime_get_real_second.
> 
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
> 
> There is no way to fix this except giving up on the fast accessors and
> make everything take the slow path and read the clock, which might make
> a lot of people unhappy.
> 
> For clock REALTIME #1 is anyway an issue, so I think documenting this
> proper is the right thing to do.
> 
> Thoughts?
>

I completely agree with your analysis and the fact that we should document this
information.

My proposal would be to use either the vDSO document present in the kernel [1]
or the man pages for time(2) and clock_gettime(2). Probably the second would be
more accessible to user space developers.

[1] Documentation/ABI/stable/vdso

> Thanks,
> 
>         tglx
> 

-- 
Regards,
Vincenzo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
