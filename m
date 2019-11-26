Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCD109D92
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:10:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CEEE3C207C
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:10:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 89C2D3C0515
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:10:42 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF5FF601D1D
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:10:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19142B1B8;
 Tue, 26 Nov 2019 12:10:41 +0000 (UTC)
Date: Tue, 26 Nov 2019 13:10:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191126121038.GC16922@rei.lan>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
 <20191125153245.GA15129@rei.lan>
 <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f914dce-92b7-9070-6230-d76b73d7da34@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> >> We run the test with timeout=1000 now and it works fine. It is simpler
> >> than thinking about any
> >> other synchronization technique. The additonal wait adds less than 30
> >> for all tests, that use memcg_process.
> > 30 what? seconds? That is unfortunatelly not acceptable.
> Yes 30 seconds. Why shouldn't that be not acceptable? It is nothing compared
> to the runtime of other tests.

I have written a blog post that partly applies to this case, see:

https://people.kernel.org/metan/why-sleep-is-almost-never-acceptable-in-tests

> > Actually having a closer look at the code there is a loop that checks
> > every 100ms if:
> >
> > 1) the process is still alive
> > 2) if there was increase in usage_in_bytes in the corresponding cgroup
> >
> > So what is wrong with the original code?
> Please reread the description of my initial post. The problem is the 
> signal race
> not the check. The checkpoint system prevents the race. There is no way 
> around
> a solid synchronization.

So the problem is that sometimes the program has not finished handling
the first signal and we are sending another, right?

I guess that the proper solution would be avoding the signals in the
first place. I guess that we can estabilish two-way communication with
fifos, which would also mean that we would get notified as fast as the
child dies as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
