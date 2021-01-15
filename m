Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EE52F7D70
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 14:59:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A77993C6A0E
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 14:59:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1A5983C2644
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 14:59:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 78D38600E4F
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 14:59:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8452AC8F;
 Fri, 15 Jan 2021 13:59:51 +0000 (UTC)
Date: Fri, 15 Jan 2021 15:00:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YAGgEcFEN8/ElosC@yuki.lan>
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
 <YABW1ZcnfFbjUoBq@yuki.lan>
 <CA+G9fYs2bv98uFgrH+WEYzDagFPy0PWruk=Em9GdMXmnQQUTCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYs2bv98uFgrH+WEYzDagFPy0PWruk=Em9GdMXmnQQUTCw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> > > semctl09.c:155: TPASS: SEM_INFO returned valid index 10 to semid 10
> > > semctl09.c:164: TPASS: Counted used = 1
> > > semctl09.c:112: TPASS: semset_cnt = 1
> > > semctl09.c:119: TPASS: sen_cnt = 2
> > > tst_test.c:1313: TBROK: Test killed by SIGSEGV!
> >
> > There seems to be a part of the log missing here, if it's segfaulting in
> > the libc semctl() there used to be glibc bug for SEM_STAT_ANY which may
> > cause SIGSEGV:
> >
> > https://sourceware.org/bugzilla/show_bug.cgi?id=26637

And it looks like there is something strange going on here, Martin
Doucha is looking into it at the moment.

> > > accept02.c:55: TBROK: setsockopt(3, 0, 42, 0xb6f4cf7c, 132) failed: ENODEV (19)
> >
> > Looks like muticast groups is not compiled in kernel here.
> 
> True.
> We have not enabled multicast groups.
> # CONFIG_IP_MULTICAST is not set
> 
> >
> > We should handle this and report TCONF instead, however this is not a
> > regression, the test has been like this for three years.
> 
> Reporting TCONF would be right here.

Sure, however since this is not a regression let's do that after the
release. Feel free to open an issue so that it's not forgotten.

> > > clock_gettime04.c:143: TFAIL: CLOCK_REALTIME: Time travelled backwards
> > > (5): -1610153174499293029 ns
> > > clock_gettime04.c:151: TFAIL: CLOCK_REALTIME_COARSE: Difference
> > > between successive readings greater than 5 ms (4): 9
> > > clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> > > successive readings is reasonable
> > > clock_gettime04.c:151: TFAIL: CLOCK_MONOTONIC_COARSE: Difference
> > > between successive readings greater than 5 ms (2): 9
> > > clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between
> > > successive readings is reasonable
> > > clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between
> > > successive readings is reasonable
> >
> > This shouldn't really happen, what this says is that time jumped 51
> > years back. That is really absurd.
> 
> This is always reproduced on arm beagleboard-x15, i386 32-bit qemu_i386
> and qemu_arm.
> 
> clock_gettime04.c:143: TFAIL: CLOCK_REALTIME: Time travelled backwards
> (5): -1610599851098100352 ns
> 
> https://lkft.validation.linaro.org/scheduler/job/2142122#L3885
> https://lkft.validation.linaro.org/scheduler/job/2144548#L2534

I've reproduced it here on RPI board, I will have a look.

> > > getrlimit03.c:168: TPASS: __NR_prlimit64(0) and __NR_ugetrlimit(0)
> > > gave consistent results
> > > tst_test.c:1313: TBROK: Test killed by SIGILL!
> >
> > Can we have a backtrace here? It's impossible to say what happened here
> > without further debugging.
> 
> I do not have backtrace log for this now.
> Let me share strace output log in this link,
> # strace -f ./getrlimit03
> https://lkft.validation.linaro.org/scheduler/job/2145166#L2569

Thanks.

I've managed to reproduce as well but I have no idea what happens there,
it looks like something gets corrupted and the processor attempts to
execute invalid code.

Maybe we pass wrong size of the rlim structure somewhere and kernel
writes over a stack.

> > > on x86_64:
> > > The ioctl_sg01 test killed and reported failed.
> > >
> > > tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> > > ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> > > [  332.383394] ioctl_sg01 invoked oom-killer:
> >
> > That's likely due to tst_pollutte_memory().
> >
> > What are the overcommit settings on that machine?
> 
> overcommit_memory is 0.
> After changing overcommit to 2 the test got PASS.
> 
> > This is probably worth fixing before the release if we manage to figure
> > out the cause.
> 
> cat /proc/sys/vm/overcommit_memory
> 0
> cat /proc/sys/vm/overcommit_ratio
> 50
> ./runltp -s ioctl_sg01 --> FAILED
> 
> echo 2 > /proc/sys/vm/overcommit_memory
> cat /proc/sys/vm/overcommit_memory
> 2
> ./runltp -s ioctl_sg01 --> PASS

So it looks like we need better safety margin.

Have you tried to increase the safety in the lib/tst_memutils.c as
pointed out by Martin?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
