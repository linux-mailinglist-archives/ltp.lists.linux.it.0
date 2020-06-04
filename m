Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C91F63D9
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62BD03C2DF0
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B97E13C223E
 for <ltp@lists.linux.it>; Thu,  4 Jun 2020 21:11:06 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 47CB514098DA
 for <ltp@lists.linux.it>; Thu,  4 Jun 2020 21:11:05 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id c21so4292838lfb.3
 for <ltp@lists.linux.it>; Thu, 04 Jun 2020 12:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0FMqkfjIzwNR6V/h4b+1kbLwk6T8zG2nwZG76PzOWl4=;
 b=cXpxTi9aJOIFGl5LioIreu8DwLrUp75TGTOrjBAbZgoHbzVDWaa2Fg64R+qFqYTuvM
 La9Z4BSCupWR1ydnCo0uIcuT98kuC2BfLlhkFZFNSmm2bdHXnwtSS8+l4s+/r3CLe9LP
 3PnE71x8dqTsQRTtbp4pCB9lpPBmMPRnJXv2j0ev+PMo1WFA+mNcppSMvcEPJP0Exk7b
 FDjrd5nhhaN0s/fhofbxMBxhbNX0PFkZu6RFAoOYmuNyjrZKbJfr+8FHOT+xiuOcobGK
 BCJ7GBAacvHk+GYdyQgivMEvQabisHpfnm+voD+Abp98+8B3Vdd7doSwd8sSOJS2pMUf
 lcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0FMqkfjIzwNR6V/h4b+1kbLwk6T8zG2nwZG76PzOWl4=;
 b=YiIRrKA/LZi8YTED9DAXb4ydZa42fBnm/w7jcvmC8VFfj2mTUFr5125QaIkWtv6exU
 FzYjDYBdNvQmK7fkikSmtfHCVR10D+QlFQBuylsA9pb1OpJQ8ypBRtmlHTVEUfgjFrzK
 KQvzMVkpjTSMAsCYZjji20GBrFaXc4oIwhh9n7uMxoo+khLwOKdUemCNQACT086FBXPj
 2I0FhAsSabvhVBtK5VVbD+3YUDDINaArqqv7gfCV2cExjnHo1wzLUbIcmSlGUVXrmQds
 BmkFrbK/6TZ9Y5IRCy436pnmnNeQdf2zM6itibuCd3LRT8dfZ2gcYRrrxmrE6w4Ej5Z3
 GhwQ==
X-Gm-Message-State: AOAM53049x7+X7+q0kVV8IFvWtIbAjbAZ5XEY4aKJwbZ5fEcUlpee69x
 FQbrGh/Ls9/kkBIMMaBixnwY+ev0z6Dy9SB4SBynnw==
X-Google-Smtp-Source: ABdhPJxeLtglAPY9jAlFosaebNncQzEHL+mG4AYno5yvXTZLpNvD4TxLpuXCdJER539LNMQtPSMdxbycOmPl2Ug4QHc=
X-Received: by 2002:a19:c04:: with SMTP id 4mr3273082lfm.17.1591297864552;
 Thu, 04 Jun 2020 12:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuGwcE3zyMFQPpfA0CyW=4WOg9V=kCfKhS7b8930jQofA@mail.gmail.com>
 <CA+G9fYuUvjDeLXVm2ax_5UF=OJeH7fog0U7GG2vEUXg-HXWRqg@mail.gmail.com>
In-Reply-To: <CA+G9fYuUvjDeLXVm2ax_5UF=OJeH7fog0U7GG2vEUXg-HXWRqg@mail.gmail.com>
Date: Thu, 4 Jun 2020 21:10:53 +0200
Message-ID: <CAB0TPYGo5ePYrah3Wgv_M1fx91+niRe12YaBBXGfs5b87Fjtrg@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 11 Jun 2020 10:42:03 +0200
Subject: Re: [LTP] LTP: syscalls: regression on mainline - ioctl_loop01
 mknod07 setns01
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
From: Martijn Coenen via ltp <ltp@lists.linux.it>
Reply-To: Martijn Coenen <maco@android.com>
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>,
 linux-block <linux-block@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Naresh,

I suspect the loop failures are due to
faf1d25440d6ad06d509dada4b6fe62fea844370 ("loop: Clean up
LOOP_SET_STATUS lo_flags handling"), I will investigate and get back
to you.

Thanks,
Martijn

On Thu, Jun 4, 2020 at 7:19 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> + linux-block@vger.kernel.org
>
> On Thu, 4 Jun 2020 at 22:47, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Following three test cases reported as regression on Linux mainline kernel
> > on x86_64, arm64, arm and i386
> >
> >   ltp-syscalls-tests:
> >     * ioctl_loop01
> >     * mknod07
> >     * setns01
> >
> > git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > git branch: master
> > GOOD:
> >   git commit: b23c4771ff62de8ca9b5e4a2d64491b2fb6f8f69
> >   git describe: v5.7-1230-gb23c4771ff62
> > BAD:
> >   git commit: 1ee08de1e234d95b5b4f866878b72fceb5372904
> >   git describe: v5.7-3523-g1ee08de1e234
> >
> > kernel-config: https://builds.tuxbuild.com/U3bU0dMA62OVHb4DvZIVuw/kernel.config
> >
> > We are investigating these failures.
> >
> > tst_test.c:906: CONF: btrfs driver not available
> > tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> > tst_device.c:88: INFO: Found free device 1 '/dev/loop1'
> > ioctl_loop01.c:49: PASS: /sys/block/loop1/loop/partscan = 0
> > [ 1073.639677] loop_set_status: loop1 () has still dirty pages (nrpages=1)
> > ioctl_loop01.c:50: PASS: /sys/block/loop1/loop/autoclear = 0
> > ioctl_loop01.c:51: PASS: /sys/block/loop1/loop/backing_file =
> > '/scratch/ltp-mnIdulzriQ/9cPtLQ/test.img'
> > ioctl_loop01.c:63: FAIL: expect 12 but got 17
> > ioctl_loop01.c:67: FAIL: /sys/block/loop1/loop/partscan != 1 got 0
> > ioctl_loop01.c:68: FAIL: /sys/block/loop1/loop/autoclear != 1 got 0
> > ioctl_loop01.c:79: FAIL: access /dev/loop1p1 fails
> > [ 1073.679678] loop_set_status: loop1 () has still dirty pages (nrpages=1)
> > ioctl_loop01.c:85: FAIL: access /sys/block/loop1/loop1p1 fails
> >
> > HINT: You _MAY_ be missing kernel fixes, see:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c70d95c0f2
> >
> > mke2fs 1.43.8 (1-Jan-2018)
> > [ 1264.711379] EXT4-fs (loop0): mounting ext2 file system using the
> > ext4 subsystem
> > [ 1264.716642] EXT4-fs (loop0): mounted filesystem without journal. Opts: (null)
> > mknod07     0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
> > mknod07     0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts=''
> > mknod07     1  TPASS  :  mknod failed as expected:
> > TEST_ERRNO=EACCES(13): Permission denied
> > mknod07     2  TPASS  :  mknod failed as expected:
> > TEST_ERRNO=EACCES(13): Permission denied
> > mknod07     3  TFAIL  :  mknod07.c:155: mknod succeeded unexpectedly
> > mknod07     4  TPASS  :  mknod failed as expected:
> > TEST_ERRNO=EPERM(1): Operation not permitted
> > mknod07     5  TPASS  :  mknod failed as expected:
> > TEST_ERRNO=EROFS(30): Read-only file system
> > mknod07     6  TPASS  :  mknod failed as expected:
> > TEST_ERRNO=ELOOP(40): Too many levels of symbolic links
> >
> >
> > setns01     0  TINFO  :  ns_name=ipc, ns_fds[0]=6, ns_types[0]=0x8000000
> > setns01     0  TINFO  :  ns_name=mnt, ns_fds[1]=7, ns_types[1]=0x20000
> > setns01     0  TINFO  :  ns_name=net, ns_fds[2]=8, ns_types[2]=0x40000000
> > setns01     0  TINFO  :  ns_name=pid, ns_fds[3]=9, ns_types[3]=0x20000000
> > setns01     0  TINFO  :  ns_name=uts, ns_fds[4]=10, ns_types[4]=0x4000000
> > setns01     0  TINFO  :  setns(-1, 0x8000000)
> > setns01     1  TPASS  :  invalid fd exp_errno=9
> > setns01     0  TINFO  :  setns(-1, 0x20000)
> > setns01     2  TPASS  :  invalid fd exp_errno=9
> > setns01     0  TINFO  :  setns(-1, 0x40000000)
> > setns01     3  TPASS  :  invalid fd exp_errno=9
> > setns01     0  TINFO  :  setns(-1, 0x20000000)
> > setns01     4  TPASS  :  invalid fd exp_errno=9
> > setns01     0  TINFO  :  setns(-1, 0x4000000)
> > setns01     5  TPASS  :  invalid fd exp_errno=9
> > setns01     0  TINFO  :  setns(11, 0x8000000)
> > setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(11, 0x20000)
> > setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(11, 0x40000000)
> > setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(11, 0x20000000)
> > setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(11, 0x4000000)
> > setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> >
> > Full test log link,
> > https://lkft.validation.linaro.org/scheduler/job/1467931#L8047
> >
> > test results comparison shows this test case started failing from June-2-2020
> > https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/ioctl_loop01/history/
> >
> > https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/setns01/history/
> >
> > https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/mknod07/history/
> >
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
