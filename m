Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3982722200F
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:57:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B16183C4EE6
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 11:57:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BBA113C1450
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:57:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 460651401B63
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 11:57:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 273DCB635;
 Thu, 16 Jul 2020 09:57:45 +0000 (UTC)
Date: Thu, 16 Jul 2020 11:57:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Qais Yousef <qais.yousef@arm.com>
Message-ID: <20200716095738.GA9395@dell5510>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qais,

> > BTW this has already been reviewed and tested by Huacai Chen [1].
> > LGTM, although I'd prefer to detect with with polling, isn't it possible? [1].

> FWIW I did try to avoid the sleep [1].
Yes, I know, but that was in kernel code (great you tried to fix the problem in
the kernel). Here I mean avoid blind sleep in the test. Reporting problem and
taking "sleep 1" fix would be most probably just enough. Below are suggestions to
consider before taking your posted fix as is.

> Were you thinking of something like that (pseudo code)?

> 	for i in $(seq 3)
> 	do
> 		sleep 1
> 		verify()
> 		if [ sucess ]; then
> 			break;
> 		fi
> 	done

> Or you had something more sophisticated in mind?
No, certainly not more sophisticated :). You can also use TST_RETRY_FUNC helper
instead of creating loop manually. It sleeps in 1 sec.

NOTE: TST_RETRY_FUNC is a wrapper for TST_RETRY_FN_EXP_BACKOFF, using it you can
define sleep time. Unfortunately current code does not allow to loop over less
than 1s, maybe it'd be worth for some cases, where the event is really fast.

@Metan, @Li: would it be worth to change TST_RETRY_FUNC (in both C and shell) to
use ms instead of s?

Also, we have tst_sleep helper, which supports also ms and us (but using
TST_RETRY_FUNC is IMHO better).

I'd have to look more deeply into the test to figure out the verifier.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
