Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 025FA222053
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 12:12:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7AC43C2960
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 12:12:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E458C3C2244
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 12:12:56 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 070041001846
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 12:12:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1C8C1FB;
 Thu, 16 Jul 2020 03:12:54 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC20F3F68F;
 Thu, 16 Jul 2020 03:12:53 -0700 (PDT)
Date: Thu, 16 Jul 2020 11:12:51 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200716101250.vd7nan2u2nydzbnf@e107158-lin.cambridge.arm.com>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
 <20200716095738.GA9395@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716095738.GA9395@dell5510>
User-Agent: NeoMutt/20171215
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 07/16/20 11:57, Petr Vorel wrote:
> Hi Qais,
> 
> > > BTW this has already been reviewed and tested by Huacai Chen [1].
> > > LGTM, although I'd prefer to detect with with polling, isn't it possible? [1].
> 
> > FWIW I did try to avoid the sleep [1].
> Yes, I know, but that was in kernel code (great you tried to fix the problem in
> the kernel). Here I mean avoid blind sleep in the test. Reporting problem and
> taking "sleep 1" fix would be most probably just enough. Below are suggestions to
> consider before taking your posted fix as is.

We're probably talking about the same thing. But to clarify further, my
original fix in kernel had no sleep and would force a wait by flushing the
workqueue when the userspace does the read

https://lore.kernel.org/lkml/20200211141554.24181-1-qais.yousef@arm.com/

But the maintainer was suggesting to do the sleep in the test instead. Which I
didn't like and I didn't understand why my fix isn't good.

Anyways. Looking forward.. :)

> 
> > Were you thinking of something like that (pseudo code)?
> 
> > 	for i in $(seq 3)
> > 	do
> > 		sleep 1
> > 		verify()
> > 		if [ sucess ]; then
> > 			break;
> > 		fi
> > 	done
> 
> > Or you had something more sophisticated in mind?
> No, certainly not more sophisticated :). You can also use TST_RETRY_FUNC helper
> instead of creating loop manually. It sleeps in 1 sec.
> 
> NOTE: TST_RETRY_FUNC is a wrapper for TST_RETRY_FN_EXP_BACKOFF, using it you can
> define sleep time. Unfortunately current code does not allow to loop over less
> than 1s, maybe it'd be worth for some cases, where the event is really fast.
> 
> @Metan, @Li: would it be worth to change TST_RETRY_FUNC (in both C and shell) to
> use ms instead of s?
> 
> Also, we have tst_sleep helper, which supports also ms and us (but using
> TST_RETRY_FUNC is IMHO better).
> 
> I'd have to look more deeply into the test to figure out the verifier.

I'd be happy to consider this as long as it won't steal my day. I'm just
a by-passer developer and my knowledge about the code base is minimal :)

Let me know what would be the preferred approach.

Thanks!

--
Qais Yousef

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
