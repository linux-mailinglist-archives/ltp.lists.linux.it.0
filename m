Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B72F7E21
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:27:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54B163C6A09
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 15:27:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 28CEA3C2644
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:26:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A58461400759
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 15:26:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFBAFAC8F;
 Fri, 15 Jan 2021 14:26:57 +0000 (UTC)
Date: Fri, 15 Jan 2021 15:27:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YAGmbrmtAtyI8zQ4@yuki.lan>
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
 <YABW1ZcnfFbjUoBq@yuki.lan>
 <CA+G9fYs2bv98uFgrH+WEYzDagFPy0PWruk=Em9GdMXmnQQUTCw@mail.gmail.com>
 <YAGgEcFEN8/ElosC@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAGgEcFEN8/ElosC@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Holidays and LTP release
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > > getrlimit03.c:168: TPASS: __NR_prlimit64(0) and __NR_ugetrlimit(0)
> > > > gave consistent results
> > > > tst_test.c:1313: TBROK: Test killed by SIGILL!
> > >
> > > Can we have a backtrace here? It's impossible to say what happened here
> > > without further debugging.
> > 
> > I do not have backtrace log for this now.
> > Let me share strace output log in this link,
> > # strace -f ./getrlimit03
> > https://lkft.validation.linaro.org/scheduler/job/2145166#L2569
> 
> Thanks.
> 
> I've managed to reproduce as well but I have no idea what happens there,
> it looks like something gets corrupted and the processor attempts to
> execute invalid code.
> 
> Maybe we pass wrong size of the rlim structure somewhere and kernel
> writes over a stack.

This is really strange it looks like glibc has wrong syscall number for
getrlimit.

On 32bit ARM I do have in /usr/include/asm-generic/unistd.h

#define __NR_getrlimit 163

While the getrlimit should be 191. It looks like x86-64 syscall
definitions are installed on the system for some strange reason, even
the header says that it's for x86-64.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
