Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA12F7448
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:28:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B08593C3191
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 09:28:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 264B83C3114
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:28:10 +0100 (CET)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AA29C1000EA7
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 09:28:09 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id by27so8584165edb.10
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 00:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5MtkMArciyvU9HV8Cmf5ItKC1shpwSgVZg0VGd43R8=;
 b=XtECfzwx8gOGDSb0FLvHHVMEJDKnzdpBFQ7/Cetv2cutOxfhBIwiATDc61RV5OF88o
 SJUyrqgdExOxz/WyhN9QKsF3Y0qo+8JuCeUTeowgxRzlAS5EyInEOw2K6JdWY5v1+5hF
 qaUV+MrEO7quQ5QUf7dzO2vh1swgku33HltZQ3/oTHRukTPCUK1vLVPHXfrIOxFsbAI0
 ppsGV5RqvUBDeSVr/K3KLvgocnVc7V7WTwYs7e+GuaUVDeQex8zcHT48CdnU7UbMn6/i
 iS0ebyW7kzGHtw6/9ydWMxMVGSfAUB0zwN0VEFdHOXKSjENH6to0mWiBo8qxQAyPPKdy
 /eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5MtkMArciyvU9HV8Cmf5ItKC1shpwSgVZg0VGd43R8=;
 b=F7xgasRwaBxDCGO+BP1m3t4hNvPkGB85VRlX5YSTUKY2tvTsm+0sOtXAyrt7g2++od
 C6/EM2UWBBP1O5zA4J+JTLHTSzjeM/gfSFUuarrH1ZTA2kJLRNcnegilxThTllgEpHdN
 RCPYwT8SQl15g3h+iZAW3pg+w31uCMU01ufV5yFDlBmm5216EPM0S7lMcxN0JprYR2Ul
 OSnMuN+dCUa136eHLL/zpatbvE7tuY2785dZ8Ix8Oj/axZvJfs1u5+AOaBkG2+DwpLRM
 GSXQo/saKi/+MkElZgxgO68KrMlNHBQgVL+78HCSK9yOTpvIGqke5qIiheUAbzzUMg8Q
 AyuA==
X-Gm-Message-State: AOAM532Wf92n2NMY7GJj5Yr30v5gGcLl4wZuCz71nmLOGr2ZP6rba5zg
 c2hGKYJ5DrdFRN7JFLQpa8UBcZmPnI7l4MCBZhTPNA==
X-Google-Smtp-Source: ABdhPJyxKdV42Z0YISyuwrTH6oSZPy8xPTQGKTImO9DKZmqJOAOLNBI8KB+Qn3+F5RUfCQgeDhr/QDn9P3D5onjhZEQ=
X-Received: by 2002:a05:6402:60a:: with SMTP id
 n10mr930476edv.230.1610699289050; 
 Fri, 15 Jan 2021 00:28:09 -0800 (PST)
MIME-Version: 1.0
References: <X9tMlNxJbwCWIRnO@yuki.lan> <X/Wq28noppvB5MGw@yuki.lan>
 <20210113095724.214c904a@kmaincent-XPS-13-7390>
 <CA+G9fYv1UFr+7ePC7tLjCY4JPsoQdBdf-6Jpr40zmsoYRWVrdQ@mail.gmail.com>
 <YABW1ZcnfFbjUoBq@yuki.lan>
In-Reply-To: <YABW1ZcnfFbjUoBq@yuki.lan>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 15 Jan 2021 13:57:57 +0530
Message-ID: <CA+G9fYs2bv98uFgrH+WEYzDagFPy0PWruk=Em9GdMXmnQQUTCw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
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

On Thu, 14 Jan 2021 at 20:05, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > I have a similar problem for semctl09 failed on arm, arm64, i386 and x86_64.
> >
> > semctl09.c:67: TINFO: Test SYS_semc[ 1067.769270] audit: type=1701
> > audit(1610604534.411:38): auid=4294967295 uid=0 gid=0 ses=4294967295
> > pid=6275 comm=\"semctl09\" exe=\"/opt/ltp/testcases/bin/semctl09\"
> > sig=11 res=1
> > tl syscall
> > semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> > semctl09.c:155: TPASS: SEM_INFO returned valid index 10 to semid 10
> > semctl09.c:164: TPASS: Counted used = 1
> > semctl09.c:112: TPASS: semset_cnt = 1
> > semctl09.c:119: TPASS: sen_cnt = 2
> > tst_test.c:1313: TBROK: Test killed by SIGSEGV!
>
> There seems to be a part of the log missing here, if it's segfaulting in
> the libc semctl() there used to be glibc bug for SEM_STAT_ANY which may
> cause SIGSEGV:
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=26637
>
> > And on i386,
> >
> > tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> > semctl09.c:67: TINFO: Test SYS_semctl syscall
> > semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> > semctl09.c:155: TPASS: SEM_INFO returned valid index 11 to semid 11
> > semctl09.c:164: TPASS: Counted used = 1
> > semctl09.c:112: TPASS: semset_cnt = 1
> > semctl09.c:119: TPASS: sen_cnt = 2
> > semctl09.c:132: TINFO: Test SEM_STAT_ANY with root user
> > semctl09.c:155: TPASS: SEM_INFO returned valid index 11 to semid 11
> > semctl09.c:164: TPASS: Counted used = 1
> > semctl09.c:112: TPASS: semset_cnt = 1
> > semctl09.c:119: TPASS: sen_cnt = 2
> > tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> > semctl09.c:70: TINFO: Test libc semctl()
> > semctl09.c:132: TINFO: Test SEM_STAT_ANY with nobody user
> > semctl09.c:149: TFAIL: SEM_STAT_ANY doesn't pass the buffer specified
> > by the caller to kernel
> > semctl09.c:132: TINFO: Test SEM_STAT_ANY with root user
> > semctl09.c:149: TFAIL: SEM_STAT_ANY doesn't pass the buffer specified
> > by the caller to kernel
>
> This just says that the glibc bug is present so it's likely that the
> same bug is causing segfaults on the rest of the architectures.
>
> > only fails on the arm beagleboard-x15 device.
> >
> > accept02.c:55: TBROK: setsockopt(3, 0, 42, 0xb6f4cf7c, 132) failed: ENODEV (19)
>
> Looks like muticast groups is not compiled in kernel here.

True.
We have not enabled multicast groups.
# CONFIG_IP_MULTICAST is not set


>
> We should handle this and report TCONF instead, however this is not a
> regression, the test has been like this for three years.

Reporting TCONF would be right here.

>
> > clock_gettime04.c:143: TFAIL: CLOCK_REALTIME: Time travelled backwards
> > (5): -1610153174499293029 ns
> > clock_gettime04.c:151: TFAIL: CLOCK_REALTIME_COARSE: Difference
> > between successive readings greater than 5 ms (4): 9
> > clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
> > successive readings is reasonable
> > clock_gettime04.c:151: TFAIL: CLOCK_MONOTONIC_COARSE: Difference
> > between successive readings greater than 5 ms (2): 9
> > clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between
> > successive readings is reasonable
> > clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between
> > successive readings is reasonable
>
> This shouldn't really happen, what this says is that time jumped 51
> years back. That is really absurd.

This is always reproduced on arm beagleboard-x15, i386 32-bit qemu_i386
and qemu_arm.

clock_gettime04.c:143: TFAIL: CLOCK_REALTIME: Time travelled backwards
(5): -1610599851098100352 ns

https://lkft.validation.linaro.org/scheduler/job/2142122#L3885
https://lkft.validation.linaro.org/scheduler/job/2144548#L2534


>
> > getrlimit03.c:168: TPASS: __NR_prlimit64(0) and __NR_ugetrlimit(0)
> > gave consistent results
> > tst_test.c:1313: TBROK: Test killed by SIGILL!
>
> Can we have a backtrace here? It's impossible to say what happened here
> without further debugging.

I do not have backtrace log for this now.
Let me share strace output log in this link,
# strace -f ./getrlimit03
https://lkft.validation.linaro.org/scheduler/job/2145166#L2569

>
> > on x86_64:
> > The ioctl_sg01 test killed and reported failed.
> >
> > tst_test.c:1263: TINFO: Timeout per run is 0h 15m 00s
> > ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> > [  332.383394] ioctl_sg01 invoked oom-killer:
>
> That's likely due to tst_pollutte_memory().
>
> What are the overcommit settings on that machine?

overcommit_memory is 0.
After changing overcommit to 2 the test got PASS.

> This is probably worth fixing before the release if we manage to figure
> out the cause.

cat /proc/sys/vm/overcommit_memory
0
cat /proc/sys/vm/overcommit_ratio
50
./runltp -s ioctl_sg01 --> FAILED

echo 2 > /proc/sys/vm/overcommit_memory
cat /proc/sys/vm/overcommit_memory
2
./runltp -s ioctl_sg01 --> PASS

Full test run  link,
https://lkft.validation.linaro.org/scheduler/job/2142340#L8823

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
