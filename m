Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDA244CDC
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 18:42:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA3F23C309D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 18:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 252593C1CB8
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 18:42:27 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F16316015BD
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 18:42:26 +0200 (CEST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22FC220829
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597423344;
 bh=d9BdbP4v4mPSDocV/X8+coEoeF/GEtkKDXHdvTvLuJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1xJwF7/Z5fXekgvEA4/s8tnI3lcrFDZ98TP7EG6yuS8XsxBej+56+3k6/PMJkPC58
 y3qZKfLadclxFXM4dqw4Rwm1JMXDpFOx8VVUY5jg5ea8IX+IbDD9/2DjKVbfP9fcib
 inC92fPJcUFr6vRgYO5d8mZLHIljXZj+HQgN9m60=
Received: by mail-wr1-f41.google.com with SMTP id f12so8873504wru.13
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 09:42:24 -0700 (PDT)
X-Gm-Message-State: AOAM532bI5a1Xtb81kWQ8sR5NuhlbQi7zay38+Z8o8fbBpCm2xjv+O+l
 Nz2S5+Yedt/kv4r37dRlIBdorYbsVGbsJWl6ptWNwg==
X-Google-Smtp-Source: ABdhPJx0QaAUcNfSeXLu/stSOna5JR3L8S7t74nSnFtCX82+18VMezwOCF6D8vKUwpCcNllN0B49x2PvIki11hNqfN0=
X-Received: by 2002:adf:e90f:: with SMTP id f15mr3538919wrm.18.1597423342736; 
 Fri, 14 Aug 2020 09:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
 <20200616132705.GW2531@hirez.programming.kicks-ass.net>
 <20200617131742.GD8389@yuki.lan>
 <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
 <20200812093114.GA13676@yuki.lan> <20200814145823.GA13646@yuki.lan>
In-Reply-To: <20200814145823.GA13646@yuki.lan>
From: Andy Lutomirski <luto@kernel.org>
Date: Fri, 14 Aug 2020 09:42:11 -0700
X-Gmail-Original-Message-ID: <CALCETrUZO7ifrQPKks=LuUoTcPcM7nE_TjaCXWpwMm8TOZLzDg@mail.gmail.com>
Message-ID: <CALCETrUZO7ifrQPKks=LuUoTcPcM7nE_TjaCXWpwMm8TOZLzDg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On Fri, Aug 14, 2020 at 7:58 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > do_debug is a bit of a red herring here.  ptrace should not be able to
> > > put a breakpoint on a kernel address, period.  I would just pick a
> > > fixed address that's in the kernel text range or even just in the
> > > pre-KASLR text range and make sure it gets rejected.  Maybe try a few
> > > different addresses for good measure.
> >
> > I've looked at the code and it seems like this would be a bit more
> > complicated since the breakpoint is set by an accident in a race and the
> > call still fails. Which is why the test triggers the breakpoint and
> > causes infinite loop in the kernel...
> >
> > I guess that we could instead read back the address with
> > PTRACE_PEEKUSER, so something as:
> >
> >
> > break_addr = ptrace(PTRACE_PEEKUSER, child_pid,
> >                     (void *)offsetof(struct user, u_debugreg[0]),
> >                     NULL);
> >
> > if (break_addr == kernel_addr)
> >       tst_res(TFAIL, "ptrace() set break on a kernel address");
>
> So this works actually nicely, even better than the original code.
>
> Any hints on how to select a fixed address in the kernel range as you
> pointed out in one of the previous emails? I guess that this would end
> up as a per-architecture mess of ifdefs if we wanted to hardcode it.
>

It's fundamentally architecture dependent.  Sane architectures like
s390x don't even have this concept.

--Andy

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
