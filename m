Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691B2F633B
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 15:35:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F35983C6A66
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 15:35:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0CD623C3183
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 15:35:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5099D1000C73
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 15:35:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5421AC95;
 Thu, 14 Jan 2021 14:35:05 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:36:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YABW1ZcnfFbjUoBq@yuki.lan>
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
> I have a similar problem for semctl09 failed on arm, arm64, i386 and x86_64.
> 
> semctl09.c:67: TINFO: Test SYS_semc[ 1067.769270] audit: type=1701
> audit(1610604534.411:38): auid=4294967295 uid=0 gid=0 ses=4294967295
> pid=6275 comm=\"semctl09\" exe=\"/opt/ltp/testcases/bin/semctl09\"
> sig=11 res=1
> tl syscall
> semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> semctl09.c:155: TPASS: SEM_INFO returned valid index 10 to semid 10
> semctl09.c:164: TPASS: Counted used = 1
> semctl09.c:112: TPASS: semset_cnt = 1
> semctl09.c:119: TPASS: sen_cnt = 2
> tst_test.c:1313: TBROK: Test killed by SIGSEGV!

There seems to be a part of the log missing here, if it's segfaulting in
the libc semctl() there used to be glibc bug for SEM_STAT_ANY which may
cause SIGSEGV:

https://sourceware.org/bugzilla/show_bug.cgi?id=26637

> And on i386,
> 
> tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> semctl09.c:67: TINFO: Test SYS_semctl syscall
> semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> semctl09.c:155: TPASS: SEM_INFO returned valid index 11 to semid 11
> semctl09.c:164: TPASS: Counted used = 1
> semctl09.c:112: TPASS: semset_cnt = 1
> semctl09.c:119: TPASS: sen_cnt = 2
> semctl09.c:132: TINFO: Test SEM_STAT_ANY with root user
> semctl09.c:155: TPASS: SEM_INFO returned valid index 11 to semid 11
> semctl09.c:164: TPASS: Counted used = 1
> semctl09.c:112: TPASS: semset_cnt = 1
> semctl09.c:119: TPASS: sen_cnt = 2
> tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> semctl09.c:70: TINFO: Test libc semctl()
> semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> semctl09.c:149: TFAIL: SEM_STAT_ANY doesn't pass the buffer specified
> by the caller to kernel
> semctl09.c:132: TINFO: Test SEM_STAT_ANY with root user
> semctl09.c:149: TFAIL: SEM_STAT_ANY doesn't pass the buffer specified
> by the caller to kernel

This just says that the glibc bug is present so it's likely that the
same bug is causing segfaults on the rest of the architectures.

> only fails on the arm beagleboard-x15 device.
> 
> accept02.c:55: TBROK: setsockopt(3, 0, 42, 0xb6f4cf7c, 132) failed: ENODEV (19)

Looks like muticast groups is not compiled in kernel here.

We should handle this and report TCONF instead, however this is not a
regression, the test has been like this for three years.

> clock_gettime04.c:143: TFAIL: CLOCK_REALTIME: Time travelled backwards
> (5): -1610153174499293029 ns
> clock_gettime04.c:151: TFAIL: CLOCK_REALTIME_COARSE: Difference
> between successive readings greater than 5 ms (4): 9
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> successive readings is reasonable
> clock_gettime04.c:151: TFAIL: CLOCK_MONOTONIC_COARSE: Difference
> between successive readings greater than 5 ms (2): 9
> clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between
> successive readings is reasonable
> clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between
> successive readings is reasonable

This shouldn't really happen, what this says is that time jumped 51
years back. That is really absurd.

> getrlimit03.c:168: TPASS: __NR_prlimit64(0) and __NR_ugetrlimit(0)
> gave consistent results
> tst_test.c:1313: TBROK: Test killed by SIGILL!

Can we have a backtrace here? It's impossible to say what happened here
without further debugging.

> on x86_64:
> The ioctl_sg01 test killed and reported failed.
> 
> tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> [  332.383394] ioctl_sg01 invoked oom-killer:

That's likely due to tst_pollutte_memory().

What are the overcommit settings on that machine?

This is probably worth fixing before the release if we manage to figure
out the cause.

> ksm03 and ksm03_1 both failed due to,
> 
> tst_device.c:423: TINFO: No device is mounted at /tmp/cgroup_mem
> tst_cgroup.c:122: TINFO: Cgroup v2 mount at /tmp/cgroup_mem success
> tst_cgroup.c:301: TBROK: Failed to close FILE
> '/tmp/cgroup_mem/cgroup.subtree_control': ENOENT (2)

That is known and reported:

https://github.com/linux-test-project/ltp/issues/734

Ritchard is trying to rewrite LTP cgroup library to solved this, it
should land in git repository in a month or two.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
