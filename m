Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921924BCD7
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:54:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BE333C2FA0
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:54:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7355A3C0515
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 21:17:08 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 64E1260063A
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 21:17:07 +0200 (CEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B4592078D;
 Wed, 19 Aug 2020 19:17:03 +0000 (UTC)
Date: Wed, 19 Aug 2020 15:17:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>
Message-ID: <20200819151701.747769ce@oasis.local.home>
In-Reply-To: <20200819102909.000016ac@intel.com>
References: <CA+G9fYtS_nAX=sPV8zTTs-nOdpJ4uxk9sqeHOZNuS4WLvBcPGg@mail.gmail.com>
 <20200819125732.1c296ce7@oasis.local.home>
 <20200819102909.000016ac@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 20 Aug 2020 14:54:20 +0200
Subject: Re: [LTP] NETDEV WATCHDOG: WARNING: at net/sched/sch_generic.c:442
 dev_watchdog
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
Cc: Sasha Levin <sashal@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Netdev <netdev@vger.kernel.org>, Leo Yan <leo.yan@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux- stable <stable@vger.kernel.org>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Jakub Kicinski <kuba@kernel.org>, lkft-triage@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 19 Aug 2020 10:29:09 -0700
Jesse Brandeburg <jesse.brandeburg@intel.com> wrote:


> What I don't understand in the stack trace is this:
> > > [  107.654661] Call Trace:
> > > [  107.657735]  <IRQ>
> > > [  107.663155]  ? ftrace_graph_caller+0xc0/0xc0
> > > [  107.667929]  call_timer_fn+0x3b/0x1b0
> > > [  107.672238]  ? netif_carrier_off+0x70/0x70
> > > [  107.677771]  ? netif_carrier_off+0x70/0x70
> > > [  107.682656]  ? ftrace_graph_caller+0xc0/0xc0
> > > [  107.687379]  run_timer_softirq+0x3e8/0xa10
> > > [  107.694653]  ? call_timer_fn+0x1b0/0x1b0
> > > [  107.699382]  ? trace_event_raw_event_softirq+0xdd/0x150
> > > [  107.706768]  ? ring_buffer_unlock_commit+0xf5/0x210
> > > [  107.712213]  ? call_timer_fn+0x1b0/0x1b0
> > > [  107.716625]  ? __do_softirq+0x155/0x467  
> 
> 
> If the carrier was turned off by something, that could cause the stack
> to timeout since it appears the driver didn't call this itself after
> finishing all transmits like it normally would have.
> 
> Is the trace above correct? Usually the ? indicate unsure backtrace due
> to missing symbols, right?

The "?" means that there wasn't a stack frame to confirm that this was
the true call stack. What happens is that the scan of the stack will
look for any address in the stack that is for a function. If it finds
one, it will print it and add a "?" to that address. Basically, those
functions with the "?" are just addresses found in the stack but was not
part of a stack frame link.

-- Steve

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
