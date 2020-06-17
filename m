Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0B1FCE3A
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 15:17:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE1C13C2CB5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 15:17:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CD14E3C0731
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:17:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A87616019E0
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:17:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D269EAD11;
 Wed, 17 Jun 2020 13:17:30 +0000 (UTC)
Date: Wed, 17 Jun 2020 15:17:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200617131742.GD8389@yuki.lan>
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
 <20200616132705.GW2531@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616132705.GW2531@hirez.programming.kicks-ass.net>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [x86/entry] 2bbc68f837: ltp.ptrace08.fail
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, lkp@lists.01.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > >> FYI, we noticed the following commit (built with gcc-9):
> > >> 
> > >> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Debug exception to IDTENTRY_DB")
> > >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > 
> > > Is the head of linux.git exposing the same problem or is this an
> > > intermittent failure, which only affects bisectability?
> > 
> > It sure looks deterministic:
> > 
> > ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debug"
> 
> ROFL

It's nice to have a good laugh, however I would really appreciate if any
of you would help me to fix the test.

The test in question is a regression test for:

commit f67b15037a7a50c57f72e69a6d59941ad90a0f0f
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Mar 26 15:39:07 2018 -1000

    perf/hwbp: Simplify the perf-hwbp code, fix documentation

    Annoyingly, modify_user_hw_breakpoint() unnecessarily complicates the
    modification of a breakpoint - simplify it and remove the pointless
    local variables.

And as far as I can tell it uses ptrace() with PTRACE_POKEUSER in order to
trigger it. But I'm kind of lost on how exactly we trigger the kernel
crash.

What is does is to write:

	(void*)1 to u_debugreg[0]
	(void*)1 to u_debugreg[7]
	do_debug addr to u_debugreg[0]

Looking at the kernel code the write to register 7 enables the breakpoints and
what we attempt here is to change an invalid address to a valid one after we
enabled the breakpoint but that's as far I can go.

So does anyone has an idea how to trigger the bug without the do_debug function
address? Would any valid kernel function address suffice?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
