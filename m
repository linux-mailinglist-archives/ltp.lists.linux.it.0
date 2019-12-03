Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B21100EF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 16:12:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D33E63C2709
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 16:12:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C7A923C2616
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 16:12:41 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A63D8201401
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 16:12:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8CEFBBB8;
 Tue,  3 Dec 2019 15:12:39 +0000 (UTC)
Date: Tue, 3 Dec 2019 16:12:38 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191203151238.GI2844@rei>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
 <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
 <20191126121038.GC16922@rei.lan>
 <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42d40727-f631-39ff-fdc0-576e13336a4d@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PDS_BTC_ID, PDS_BTC_MSGID, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_lib/memcg_process: Better synchronization
 of signal USR1
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I have written a blog post that partly applies to this case, see:
> >
> > https://people.kernel.org/metan/why-sleep-is-almost-never-acceptable-in-tests
> I know where you are coming from and it is basically the same as my own 
> opinion.
> The difference is: When I look at ltp I see a runtime of more than 6 
> hours, looking at the
> controller test alone it is more than 4 hours. This puts 30 seconds into 
> a very differenet
> perspective than looking at only syscall tests. (In the testrun I looked 
> at it is around 13 minutes).
> That is why I don't care about 30 seconds in this case.

controllers testrun runs for 25 minutes on our servers, it will probably
be reduced to 15 minutes in two or three years with next upgrade. The
main point is that hardware tends to be faster and faster but any sleep
in the tests will not scale and ends up being a problem sooner or later.
It also greatly depends on which HW are you running the tests on.

> > So the problem is that sometimes the program has not finished handling
> > the first signal and we are sending another, right?
> >
> > I guess that the proper solution would be avoding the signals in the
> > first place. I guess that we can estabilish two-way communication with
> > fifos, which would also mean that we would get notified as fast as the
> > child dies as well.
> Correct. Using fifos is probably a viable solution, but it would require 
> library work,
> because otherwise the overhead is way too big.
> Another thing I can think of is extending tst_checkpoint wait to also 
> watch a process
> and stop waiting, if that process dies. This would be the simplest way 
> to get good
> synchronization and get rid of the sleep.

I'm not sure if we can implement this without introducing another race
condition. The only way how to wake up futex from sleep before it
timeouts in a race-free way is sending a signal. In this case we should
see EINTR. But that would mean that the process that is waking up the
futex has to be a child of the process, unless we reparent that process,
but all that would be too tricky I guess.

If we decide to wake the futex regulary to check if the process is alive
we can miss the wake. Well the library tries hard and loops over the
wake syscall for a while, but this could still fail on very slow
devices under load. But if the timing is unfortunate we may miss more
than one wake signal, which would lead to timeout. Timing problems like
that can easily arise on VMs with a single CPU on overbookend host.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
