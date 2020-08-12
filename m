Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B506024279D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 11:30:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BD033C311C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 11:30:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 87E6F3C2549
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 11:30:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D9A4A200FE9
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 11:30:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99660AEAC;
 Wed, 12 Aug 2020 09:31:15 +0000 (UTC)
Date: Wed, 12 Aug 2020 11:31:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andy Lutomirski <luto@kernel.org>
Message-ID: <20200812093114.GA13676@yuki.lan>
References: <87y2onbdtb.fsf@nanos.tec.linutronix.de>
 <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
 <20200616132705.GW2531@hirez.programming.kicks-ass.net>
 <20200617131742.GD8389@yuki.lan>
 <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrVX=wxRrv0qw-Enbyg5CEQsy5TigbNt7sSs=MDO6uAnMw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
 lkp@lists.01.org, Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> do_debug is a bit of a red herring here.  ptrace should not be able to
> put a breakpoint on a kernel address, period.  I would just pick a
> fixed address that's in the kernel text range or even just in the
> pre-KASLR text range and make sure it gets rejected.  Maybe try a few
> different addresses for good measure.

I've looked at the code and it seems like this would be a bit more
complicated since the breakpoint is set by an accident in a race and the
call still fails. Which is why the test triggers the breakpoint and
causes infinite loop in the kernel...

I guess that we could instead read back the address with
PTRACE_PEEKUSER, so something as:


break_addr = ptrace(PTRACE_PEEKUSER, child_pid,
                    (void *)offsetof(struct user, u_debugreg[0]),
                    NULL);

if (break_addr == kernel_addr)
	tst_res(TFAIL, "ptrace() set break on a kernel address");

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
