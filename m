Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D621F63DC
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B2133C2E02
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A7D253C21E9
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:11:18 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E2C741000298
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:11:17 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id n23so10822512ljh.7
 for <ltp@lists.linux.it>; Fri, 05 Jun 2020 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9bEvclg9ansMyy940YpHwicyUB1uZprPk6CAynsvQQ=;
 b=R6M9V5mleeAxaTJYvvbRV3ETK3mcVK15TvRQpr+kGEVYK2gS8s4ybXJ0W+rtvTayzZ
 9LW3UUKxsF3OasGL7DnZuiCziygXhxOFxJ9G7ONVS4kOfzs4D1rvepzQMOJG1VrOIABi
 YrsgpOCb7kDwKvMvBA8kZKr/lFC+W7QfjlKdPlbdcj4iX56ZDn2tCIbLqTPrGjbtHrA0
 xvSZwUOo6khL96m1dW2+NqOD/Tq5J4x2HCFytvqisp6YOK1z1m1aZnR6jHFNUqxpnAvz
 IoO76HEtcNzrAAhiyfszZqUOMXqWRcNIVRLi4wQ/+zHW0jSJ3pWSKV4mY6R9zj5NilyQ
 EYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9bEvclg9ansMyy940YpHwicyUB1uZprPk6CAynsvQQ=;
 b=Y1zXnEXwwrhna41/W49npglWj4nlxHx7txzu2hxRtwR4ufLQS8GVL9BNWQGLBA7Wom
 86T4Ath33wMhvP2+jSfANrjPvn3NaX0bw99NVRucAnE9lBax7tBwTGDgrLQy4rVEpv/i
 aKSxxWIS+s4AmILupHDLxEBviOi/C660lRJGJD5YGkhAh/CXcd8gOWXj+jB3fJzuQfTw
 4ZQ5fzvQy1pcENNOzdGpvwp0XD1Y7dCNGTvMoQAeFqE8x2vzDyEcQDgbT5m5bqFhL3U1
 PTYLYtqjQwA+3BlOyWQbpUmvMiaJRtLhAijTCl7Q05wrncMzLaicJklCQFIJWfHJubge
 LB4A==
X-Gm-Message-State: AOAM533EqtqMp/PdBPFRGftIBW2EI4QWRk9YSX2/segnFHnbXjX8Dwam
 QzetSvCQQslhSZ0Jh/EuA8+5CMmKtj6+uIl7PTUQkg==
X-Google-Smtp-Source: ABdhPJzkmeicRYu9VDjVeTJxBbWwEiTajl+nyfNwxd9SirjyAQd6FiGe3MMsiQ3ZNPpW2gulJhXsaPRWmqTU7B4yODU=
X-Received: by 2002:a2e:96c2:: with SMTP id d2mr4172314ljj.439.1591348277100; 
 Fri, 05 Jun 2020 02:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuGwcE3zyMFQPpfA0CyW=4WOg9V=kCfKhS7b8930jQofA@mail.gmail.com>
 <CA+G9fYuUvjDeLXVm2ax_5UF=OJeH7fog0U7GG2vEUXg-HXWRqg@mail.gmail.com>
 <CAB0TPYGo5ePYrah3Wgv_M1fx91+niRe12YaBBXGfs5b87Fjtrg@mail.gmail.com>
 <CAB0TPYEx4Z8do3qL1KVpnGGnorTLGqKtrwi1uQgxQ6Xw3JqiYw@mail.gmail.com>
 <ca8a4087-8c8b-6105-3f2c-1e2deee5f987@cn.fujitsu.com>
 <14be1119-50a7-3861-dfd4-42a239413ee7@cn.fujitsu.com>
In-Reply-To: <14be1119-50a7-3861-dfd4-42a239413ee7@cn.fujitsu.com>
Date: Fri, 5 Jun 2020 11:11:06 +0200
Message-ID: <CAB0TPYE4yvunSmK=oK7goaCRa+B1BxAoVhEkK+yhtDNwnJS6VA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Christoph Hellwig <hch@lst.de>, linux-block <linux-block@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hey Yang,

On Fri, Jun 5, 2020 at 10:59 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Hi Martijn
>
> Sorry for noise. I see your patch in here[1] . I will modify
> ioctl_loop01 to test that LO_FLAGS_PARTSCAN can not clear and
> LO_FLAGS_AUTOCLEAR can be clear.

Thanks, that would indeed be useful.

>
> ps: Giving the url of patch is better so that other people doesn't need
> to investigate it again.
> [1]https://patchwork.kernel.org/patch/11588321/

Ok, will do next time!

Best,
Martijn
>
> Best Regards
> Yang Xu
> > Hi Martijn
> >
> >> Hi Naresh,
> >>
> >> I just sent a patch and cc'd you. I verified all the loop tests pass
> >> again with that patch.
> > I think you want to say "without".  I verified the ioctl_loop01 fails
> > with faf1d25440 ("loop: Clean up LOOP_SET_STATUS lo_flags handling").
> >
> > This kernel commit breaks old behaviour(if old flag all 0, new flag is
> > always 0 regradless your flag setting).
> >
> > I think we should modify code as below:
> > diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> > index 13518ba191f5..c6ba8cf486ce 100644
> > --- a/drivers/block/loop.c
> > +++ b/drivers/block/loop.c
> > @@ -1364,11 +1364,9 @@ loop_set_status(struct loop_device *lo, const
> > struct loop_info64 *info)
> >          if (err)
> >                  goto out_unfreeze;
> >
> > -       /* Mask out flags that can't be set using LOOP_SET_STATUS. */
> > -       lo->lo_flags &= ~LOOP_SET_STATUS_SETTABLE_FLAGS;
> > -       /* For those flags, use the previous values instead */
> > -       lo->lo_flags |= prev_lo_flags & ~LOOP_SET_STATUS_SETTABLE_FLAGS;
> > -       /* For flags that can't be cleared, use previous values too */
> > +       /* Mask out flags that can be set using LOOP_SET_STATUS. */
> > +       lo->lo_flags &= LOOP_SET_STATUS_SETTABLE_FLAGS;
> > +       /* For flags that can't be cleared, use previous values. */
> >          lo->lo_flags |= prev_lo_flags &~LOOP_SET_STATUS_CLEARABLE_FLAGS;
> >
> > Best Regards
> > Yang Xu
> >>
> >> Thanks,
> >> Martijn
> >>
> >>
> >> On Thu, Jun 4, 2020 at 9:10 PM Martijn Coenen <maco@android.com> wrote:
> >>>
> >>> Hi Naresh,
> >>>
> >>> I suspect the loop failures are due to
> >>> faf1d25440d6ad06d509dada4b6fe62fea844370 ("loop: Clean up
> >>> LOOP_SET_STATUS lo_flags handling"), I will investigate and get back
> >>> to you.
> >>>
> >>> Thanks,
> >>> Martijn
> >>>
> >>> On Thu, Jun 4, 2020 at 7:19 PM Naresh Kamboju
> >>> <naresh.kamboju@linaro.org> wrote:
> >>>>
> >>>> + linux-block@vger.kernel.org
> >>>>
> >>>> On Thu, 4 Jun 2020 at 22:47, Naresh Kamboju
> >>>> <naresh.kamboju@linaro.org> wrote:
> >>>>>
> >>>>> Following three test cases reported as regression on Linux mainline
> >>>>> kernel
> >>>>> on x86_64, arm64, arm and i386
> >>>>>
> >>>>>    ltp-syscalls-tests:
> >>>>>      * ioctl_loop01
> >>>>>      * mknod07
> >>>>>      * setns01
> >>>>>
> >>>>> git repo:
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >>>>> git branch: master
> >>>>> GOOD:
> >>>>>    git commit: b23c4771ff62de8ca9b5e4a2d64491b2fb6f8f69
> >>>>>    git describe: v5.7-1230-gb23c4771ff62
> >>>>> BAD:
> >>>>>    git commit: 1ee08de1e234d95b5b4f866878b72fceb5372904
> >>>>>    git describe: v5.7-3523-g1ee08de1e234
> >>>>>
> >>>>> kernel-config:
> >>>>> https://builds.tuxbuild.com/U3bU0dMA62OVHb4DvZIVuw/kernel.config
> >>>>>
> >>>>> We are investigating these failures.
> >>>>>
> >>>>> tst_test.c:906: CONF: btrfs driver not available
> >>>>> tst_test.c:1246: INFO: Timeout per run is 0h 15m 00s
> >>>>> tst_device.c:88: INFO: Found free device 1 '/dev/loop1'
> >>>>> ioctl_loop01.c:49: PASS: /sys/block/loop1/loop/partscan = 0
> >>>>> [ 1073.639677] loop_set_status: loop1 () has still dirty pages
> >>>>> (nrpages=1)
> >>>>> ioctl_loop01.c:50: PASS: /sys/block/loop1/loop/autoclear = 0
> >>>>> ioctl_loop01.c:51: PASS: /sys/block/loop1/loop/backing_file =
> >>>>> '/scratch/ltp-mnIdulzriQ/9cPtLQ/test.img'
> >>>>> ioctl_loop01.c:63: FAIL: expect 12 but got 17
> >>>>> ioctl_loop01.c:67: FAIL: /sys/block/loop1/loop/partscan != 1 got 0
> >>>>> ioctl_loop01.c:68: FAIL: /sys/block/loop1/loop/autoclear != 1 got 0
> >>>>> ioctl_loop01.c:79: FAIL: access /dev/loop1p1 fails
> >>>>> [ 1073.679678] loop_set_status: loop1 () has still dirty pages
> >>>>> (nrpages=1)
> >>>>> ioctl_loop01.c:85: FAIL: access /sys/block/loop1/loop1p1 fails
> >>>>>
> >>>>> HINT: You _MAY_ be missing kernel fixes, see:
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c70d95c0f2
> >>>>>
> >>>>>
> >>>>> mke2fs 1.43.8 (1-Jan-2018)
> >>>>> [ 1264.711379] EXT4-fs (loop0): mounting ext2 file system using the
> >>>>> ext4 subsystem
> >>>>> [ 1264.716642] EXT4-fs (loop0): mounted filesystem without journal.
> >>>>> Opts: (null)
> >>>>> mknod07     0  TINFO  :  Using test device LTP_DEV='/dev/loop0'
> >>>>> mknod07     0  TINFO  :  Formatting /dev/loop0 with ext2 opts=''
> >>>>> extra opts=''
> >>>>> mknod07     1  TPASS  :  mknod failed as expected:
> >>>>> TEST_ERRNO=EACCES(13): Permission denied
> >>>>> mknod07     2  TPASS  :  mknod failed as expected:
> >>>>> TEST_ERRNO=EACCES(13): Permission denied
> >>>>> mknod07     3  TFAIL  :  mknod07.c:155: mknod succeeded unexpectedly
> >>>>> mknod07     4  TPASS  :  mknod failed as expected:
> >>>>> TEST_ERRNO=EPERM(1): Operation not permitted
> >>>>> mknod07     5  TPASS  :  mknod failed as expected:
> >>>>> TEST_ERRNO=EROFS(30): Read-only file system
> >>>>> mknod07     6  TPASS  :  mknod failed as expected:
> >>>>> TEST_ERRNO=ELOOP(40): Too many levels of symbolic links
> >>>>>
> >>>>>
> >>>>> setns01     0  TINFO  :  ns_name=ipc, ns_fds[0]=6,
> >>>>> ns_types[0]=0x8000000
> >>>>> setns01     0  TINFO  :  ns_name=mnt, ns_fds[1]=7, ns_types[1]=0x20000
> >>>>> setns01     0  TINFO  :  ns_name=net, ns_fds[2]=8,
> >>>>> ns_types[2]=0x40000000
> >>>>> setns01     0  TINFO  :  ns_name=pid, ns_fds[3]=9,
> >>>>> ns_types[3]=0x20000000
> >>>>> setns01     0  TINFO  :  ns_name=uts, ns_fds[4]=10,
> >>>>> ns_types[4]=0x4000000
> >>>>> setns01     0  TINFO  :  setns(-1, 0x8000000)
> >>>>> setns01     1  TPASS  :  invalid fd exp_errno=9
> >>>>> setns01     0  TINFO  :  setns(-1, 0x20000)
> >>>>> setns01     2  TPASS  :  invalid fd exp_errno=9
> >>>>> setns01     0  TINFO  :  setns(-1, 0x40000000)
> >>>>> setns01     3  TPASS  :  invalid fd exp_errno=9
> >>>>> setns01     0  TINFO  :  setns(-1, 0x20000000)
> >>>>> setns01     4  TPASS  :  invalid fd exp_errno=9
> >>>>> setns01     0  TINFO  :  setns(-1, 0x4000000)
> >>>>> setns01     5  TPASS  :  invalid fd exp_errno=9
> >>>>> setns01     0  TINFO  :  setns(11, 0x8000000)
> >>>>> setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> >>>>> errno=EBADF(9): Bad file descriptor
> >>>>> setns01     0  TINFO  :  setns(11, 0x20000)
> >>>>> setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> >>>>> errno=EBADF(9): Bad file descriptor
> >>>>> setns01     0  TINFO  :  setns(11, 0x40000000)
> >>>>> setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> >>>>> errno=EBADF(9): Bad file descriptor
> >>>>> setns01     0  TINFO  :  setns(11, 0x20000000)
> >>>>> setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> >>>>> errno=EBADF(9): Bad file descriptor
> >>>>> setns01     0  TINFO  :  setns(11, 0x4000000)
> >>>>> setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> >>>>> errno=EBADF(9): Bad file descriptor
> >>>>>
> >>>>> Full test log link,
> >>>>> https://lkft.validation.linaro.org/scheduler/job/1467931#L8047
> >>>>>
> >>>>> test results comparison shows this test case started failing from
> >>>>> June-2-2020
> >>>>> https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/ioctl_loop01/history/
> >>>>>
> >>>>>
> >>>>> https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/setns01/history/
> >>>>>
> >>>>>
> >>>>> https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-4092-g38696e33e2bd/testrun/2779586/suite/ltp-syscalls-tests/test/mknod07/history/
> >>>>>
> >>>>>
> >>>>>
> >>>>> --
> >>>>> Linaro LKFT
> >>>>> https://lkft.linaro.org
> >>
> >>
> >
> >
> >
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
