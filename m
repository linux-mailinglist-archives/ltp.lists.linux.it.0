Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 979DB1FFAF8
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 20:21:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58BC53C2C8E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 20:21:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 233BF3C2B96
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 20:21:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5F41A600FFF
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 20:21:15 +0200 (CEST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 216D7207E8
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592504472;
 bh=n37tItBWAGRC74p29xrPPnmeAZ/VdU4SlehHbZr5cPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t729B66iSN1iCOhLMQzk8aEppNyPTBQZCZOshnvCXfbESRiubSCc6cjGVM/+Ihv2J
 +nNWmkg3f2/Bp6UOhaWzz8p0jt/VjSRKVSp576wUtIvwfnCcFrx6E+xExWUSPOZNc3
 D+l3ndIDJwSj9Uan6dp6LezLyY+/o/fj99LFEuBE=
Received: by mail-wm1-f44.google.com with SMTP id r9so6091351wmh.2
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:21:12 -0700 (PDT)
X-Gm-Message-State: AOAM533q2YxyymL3nZMc5ut09GSsU8Qcv5CNVWZ4Mc9z1fEjfhgGdina
 pKLtnG0NNc4nC8GQpiEZLjm21oqSOcQduRNajvw03Q==
X-Google-Smtp-Source: ABdhPJzUlexIRiLW86cc5O7beowutfjvg3O0HgsHWz+8jlx2NN+oPnNZEbMqFhW6gS7xzckd4mpmuFA4P5Q0pTx0B6M=
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr5304161wmg.176.1592504470731; 
 Thu, 18 Jun 2020 11:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
 <20200616132705.GW2531@hirez.programming.kicks-ass.net>
 <20200617131742.GD8389@yuki.lan>
In-Reply-To: <20200617131742.GD8389@yuki.lan>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 18 Jun 2020 11:20:59 -0700
X-Gmail-Original-Message-ID: <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
Message-ID: <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
 kernel test robot <rong.a.chen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 17, 2020 at 6:17 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > >> FYI, we noticed the following commit (built with gcc-9):
> > > >>
> > > >> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert Debug exception to IDTENTRY_DB")
> > > >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > > >
> > > > Is the head of linux.git exposing the same problem or is this an
> > > > intermittent failure, which only affects bisectability?
> > >
> > > It sure looks deterministic:
> > >
> > > ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debug"
> >
> > ROFL
>
> It's nice to have a good laugh, however I would really appreciate if any
> of you would help me to fix the test.
>
> The test in question is a regression test for:
>
> commit f67b15037a7a50c57f72e69a6d59941ad90a0f0f
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Mar 26 15:39:07 2018 -1000
>
>     perf/hwbp: Simplify the perf-hwbp code, fix documentation
>
>     Annoyingly, modify_user_hw_breakpoint() unnecessarily complicates the
>     modification of a breakpoint - simplify it and remove the pointless
>     local variables.
>
> And as far as I can tell it uses ptrace() with PTRACE_POKEUSER in order to
> trigger it. But I'm kind of lost on how exactly we trigger the kernel
> crash.
>
> What is does is to write:
>
>         (void*)1 to u_debugreg[0]
>         (void*)1 to u_debugreg[7]
>         do_debug addr to u_debugreg[0]
>
> Looking at the kernel code the write to register 7 enables the breakpoints and
> what we attempt here is to change an invalid address to a valid one after we
> enabled the breakpoint but that's as far I can go.
>
> So does anyone has an idea how to trigger the bug without the do_debug function
> address? Would any valid kernel function address suffice?
>

do_debug is a bit of a red herring here.  ptrace should not be able to
put a breakpoint on a kernel address, period.  I would just pick a
fixed address that's in the kernel text range or even just in the
pre-KASLR text range and make sure it gets rejected.  Maybe try a few
different addresses for good measure.

--Andy

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
