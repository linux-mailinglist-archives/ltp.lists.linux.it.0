Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CF109107
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 16:32:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1168E3C2241
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 16:32:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4E4E93C1CA2
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 16:32:51 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 514851A00ED5
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 16:32:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 757D6BB3F;
 Mon, 25 Nov 2019 15:32:47 +0000 (UTC)
Date: Mon, 25 Nov 2019 16:32:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191125153245.GA15129@rei.lan>
References: <20191106073621.58738-1-lkml@jv-coder.de>
 <365bdf26-4e52-2159-17cd-52f2fb22e7fd@jv-coder.de>
 <20191125132957.GC8703@rei.lan>
 <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e5756af-d7ef-7919-da6b-46e7fbf3cb66@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
> >> Actually this does not work like this, because some of the
> >> tests trigger the oom killer and TEST_CHECKPOINT_WAIT calling
> >> tst_checkpoint uses ROD. Is it ok to directly call
> >>
> >> tst_checkpoint wait 10000 "1"
> >>
> >> and ignore the result here?
> > Wouldn't that delay the test for too long?
> >
> > The default timeout for checkpoints is probably too big.
> >
> > This problem is quite tricky to get right I guess. Maybe we can watch
> > /proc/[pid]/statm for increase data + stack memory.
> The timeout is specified on the command line (the 10000) in ms.

Ah, sorry I was blind.

> We run the test with timeout=1000 now and it works fine. It is simpler 
> than thinking about any
> other synchronization technique. The additonal wait adds less than 30 
> for all tests, that use memcg_process.

30 what? seconds? That is unfortunatelly not acceptable.

Actually having a closer look at the code there is a loop that checks
every 100ms if:

1) the process is still alive
2) if there was increase in usage_in_bytes in the corresponding cgroup

So what is wrong with the original code?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
