Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E83ADA689
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 09:37:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20D583C233D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 09:37:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 122133C229B
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 09:37:02 +0200 (CEST)
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A94921A00CDD
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 09:37:01 +0200 (CEST)
Received: by mail-ot1-x344.google.com with SMTP id 41so1026042oti.12
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 00:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=casparzhang-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U69GtdYxIMBceJtCAO5Pmmi9m5s4/I2L4clrzE7/KPY=;
 b=zS2G+Lg2LE+ocDfeiLjcymIDCCT1HREPg7FkYEl/O4PpDU4x08Jv7z12DwCWjKe1S7
 h27RKEx8jy0T3ZfpiFdUfcw9dZ4OaQkEyTeqIEFtTDkHm3KlBcFx3meFW6xB4/tLy+N0
 DVYfnKGvSRswTWwGcYHhy6LELxWC1+Jlnq4qQA5gF1EsFBYrwZ3uTiema4+mrd2Zfq5D
 aFLD4Wz/272eZYVF/BjKWrHOIix+mwl7wi9kTXu9nXeRUbzu4sQi3lNQLpyrq7jP72t0
 oFNuTX9p1vu68M8VSHUFvp3G31kmsbN2fkIa4yZzytiAumAMtZzY7SdtJkO4MpkAmxgw
 P0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U69GtdYxIMBceJtCAO5Pmmi9m5s4/I2L4clrzE7/KPY=;
 b=P8DM0GSZRhzon2bOV0/kec2yO23HzL2L9k0xqfhr6r6ihxCqJEeGZ1yz3d09SPt5hl
 7osjKZIhJUulqdv10DQOe9T4lEkuSgjwDqI2FP/ffsgCru/r0b4QMmQtB0Ng5KrsHk2G
 OlkVMAXjWk8B+gSWmyheQzq8lnlgH/hPDAACGhGJ8fZtcTgoUWtPj6X/+Tn8JJEer3m/
 rRISYDQ7CyTvhCH1xVUVfh6jzNpnIfHCTS4x3YXlj4hgCLQk7nts/Ztiri9at3lEDKge
 jibPbHJDuA0KfXlnLptplX/Lnqe8eAB0Oxe3JvUxXWkcB2YaCRbLnlHIeLKI4NTkSn9D
 X6Hw==
X-Gm-Message-State: APjAAAXR3hiz87bVnUyEdi0Q/jvRZjW6tJ0XzPRN4KPGts4b9Z5wePEJ
 /7czctFzvXQqM3Hp3JJ1HpBWrg==
X-Google-Smtp-Source: APXvYqzJcBVuFXKHAGl3mPLmVDM4qsi2ZDSDhDf5Yp0uI9VHgFhVtr2BQNjYHcusbrslPsTl1BkmRg==
X-Received: by 2002:a9d:67d7:: with SMTP id c23mr1965167otn.0.1571297820086;
 Thu, 17 Oct 2019 00:37:00 -0700 (PDT)
Received: from casparzhang.com ([205.204.117.5])
 by smtp.gmail.com with ESMTPSA id c21sm420932otp.15.2019.10.17.00.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 00:36:58 -0700 (PDT)
Date: Thu, 17 Oct 2019 15:36:53 +0800
From: Caspar Zhang <caspar@casparzhang.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20191017073653.GA2590@casparzhang.com>
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
 <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
 <20191016025405.GA86846@casparzhang.com>
 <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/sync_file_range: add partial file
 sync test-cases
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
Cc: Caspar Zhang <caspar@casparzhang.com>, LTP List <ltp@lists.linux.it>,
 joseph.qi@linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 16, 2019 at 11:53:48AM +0530, Sumit Garg wrote:
> Hi Caspar,
>
> On Wed, 16 Oct 2019 at 08:24, Caspar Zhang <caspar@casparzhang.com> wrote:
> >
> > Hi Sumit,
> >
> > On Fri, Oct 04, 2019 at 01:03:19PM +0530, Sumit Garg wrote:
> > > Hi Caspar,
> > >
> > > On Sun, 29 Sep 2019 at 18:58, Caspar Zhang <caspar@casparzhang.com> wrote:
> > > >
> > > > Hi Sumit,
> > > >
> > > > On Mon, Jun 10, 2019 at 03:43:16PM +0530, Sumit Garg wrote:
> > > >
> > > > <snip>
> > > >
> > > > >
> > > > > -     if (written >= FILE_SIZE)
> > > > > +     if ((written >= tc->exp_sync_size) &&
> > > > > +         (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> > > >
> > > > May I ask why it is +1/10 of expected sync_size as upper bound here,
> > > > since it looks like a magic number to me.
> > >
> > > It was an outcome of discussion here [1]. The reason being to test
> > > that only particular portion of file is written to device for whom
> > > sync has been invoked and +1/10 as upper bound to incorporate for any
> > > metadata.
> >
> > I see, thanks for explanation.
> >
> > >
> > > [1] https://patchwork.ozlabs.org/patch/1051647/
> > >
> > > >
> > > > We encountered test failure in the second case in a debug kernel,
> > > > reproducible about once out of 20 times run.
> > >
> > > Interesting case. Can you share results after applying below patch?
> >
> > Tested this patch, no TFAIL occured in debug kernel after 200+ times
> > run, looks good to me. Thanks! Please add my
>
> From these results, the reason for the failure that you reported
> earlier seems to be writes to the device during "tst_fill_fd()"
> operation (they were found negligible/zero with normal kernel). But
> it's strange to know that you didn't get any TFAIL after the patch as
> I expected "Sync equals write" to fail.
>
> So can you also put following debug print and share logs of your test run?

Retested with debug print, during my 1000-times run, pre-sync remains 0
in all the other fs types except only ext4. For ext4 cases, pre-sync
could be non-zero, e.g.:

    Sync equals write: Synced 33554432, expected 33554432, pre-sync 0
    Sync inside of write: Synced 17301504, expected 16777216, pre-sync 1308672
    Sync overlaps with write: Synced 8650752, expected 8388608, pre-sync 1310720

Note that pre-sync could be non-zero in `equals writes` case sometimes
too, like another round below:

    Sync equals write: Synced 34078720, expected 33554432, pre-sync 260096
    Sync inside of write: Synced 17039360, expected 16777216, pre-sync 4980736
    Sync overlaps with write: Synced 8912896, expected 8388608, pre-sync 1048576

Such non-zero situation in ext4 case is reproducible ~10% of my
1000-times run.

Thanks,
Caspar




>
> --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -68,6 +68,8 @@ static void verify_sync_file_range(struct testcase *tc)
>
>         SAFE_CLOSE(fd);
>
> +       printf("%s: Synced %li, expected %li, pre-sync %li\n",
> +               tc->desc, written, tc->exp_sync_size, written_pre);
>         if ((written >= tc->exp_sync_size) &&
>             (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
>                 tst_res(TPASS, "%s", tc->desc);
>
> -Sumit
>
> >
> > Reviewed-by: Caspar Zhang <caspar@linux.alibaba.com>
> >
> > directly if you're going to make a formal patch later.
> >
> > Thanks,
> > Caspar
> >
> > >
> > > diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > index eb08143..1bc1a44 100644
> > > --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > @@ -42,7 +42,7 @@ struct testcase {
> > >  static void verify_sync_file_range(struct testcase *tc)
> > >  {
> > >         int fd;
> > > -       unsigned long written;
> > > +       unsigned long written, written_pre;
> > >
> > >         fd = SAFE_OPEN(tc->fname, O_RDWR|O_CREAT, MODE);
> > >
> > > @@ -52,6 +52,8 @@ static void verify_sync_file_range(struct testcase *tc)
> > >
> > >         tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
> > >
> > > +       written_pre = tst_dev_bytes_written(tst_device->dev);
> > > +
> > >         TEST(sync_file_range(fd, tc->sync_off, tc->sync_size,
> > >                              SYNC_FILE_RANGE_WAIT_BEFORE |
> > >                              SYNC_FILE_RANGE_WRITE |
> > > @@ -70,8 +72,8 @@ static void verify_sync_file_range(struct testcase *tc)
> > >             (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> > >                 tst_res(TPASS, "%s", tc->desc);
> > >         else
> > > -               tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
> > > -                       written, tc->exp_sync_size);
> > > +               tst_res(TFAIL, "%s: Synced %li, expected %li, pre-sync %li",
> > > +                       tc->desc, written, tc->exp_sync_size, written_pre);
> > >  }
> > >
> > >  static struct testcase testcases[] = {
> > >
> > > -Sumit
> > >
> > > >
> > > > The reason is unclear yet, however my guess is that more pages could be
> > > > written to disk in a debug kernel than a release kernel.
> > > >
> > > > My codes and config as below:
> > > >
> > > > tree: https://github.com/alibaba/cloud-kernel :: ck-4.19.67 branch;
> > > > config: https://github.com/alibaba/cloud-kernel/blob/master/config-4.19.y-x86_64-debug
> > > >
> > > > If you like you can build a test kernel on a KVM guest and try to
> > > > reproduce, or just run a RHEL8 kernel I guess (@Li Wang, you can have a
> > > > try on RHEL8 debug kernel if possible).
> > > >
> > > > a sample output:
> > > >
> > > > tst_device.c:87: INFO: Found free device 0 '/dev/loop0'
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext2
> > > > tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext3
> > > > tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext4
> > > > tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports xfs
> > > > tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
> > > > tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
> > > > tst_supported_fs_types.c:60: INFO: Kernel supports vfat
> > > > tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
> > > > tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported
> > > > tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported
> > > > tst_test.c:1179: INFO: Testing on ext2
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > tst_test.c:1179: INFO: Testing on ext3
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > tst_test.c:1179: INFO: Testing on ext4
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:74: FAIL: Sync inside of write: Synced 19658752, expected 16777216
> > > >                         ^^^^
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > tst_test.c:1179: INFO: Testing on xfs
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > tst_test.c:1179: INFO: Testing on btrfs
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > tst_test.c:1179: INFO: Testing on vfat
> > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > sync_file_range02.c:111: INFO: Pre-filling file
> > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > >
> > > > Summary:
> > > > passed   17
> > > > failed   1
> > > > skipped  0
> > > > warnings 0
> > > >
> > > > Any thoughts would be appreicated.
> > > >
> > > > Thanks,
> > > > Caspar
> > > >
> > > >
> > > > >               tst_res(TPASS, "Test file range synced to device");
> > > > >       else
> > > > > -             tst_res(TFAIL, "Synced %li, expected %i", written, FILE_SIZE);
> > > > > +             tst_res(TFAIL, "Synced %li, expected %li", written,
> > > > > +                     tc->exp_sync_size);
> > > > > +}
> > > > > +
> > > > > +static struct testcase testcases[] = {
> > > > > +     { FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },
> > > > > +     { FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, FILE_SZ_MB },
> > > > > +     { FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE_SZ/2, FILE_SZ_MB/4 },
> > > > > +};
> > > > > +
> > > > > +static void run(unsigned int i)
> > > > > +{
> > > > > +     verify_sync_file_range(&testcases[i]);
> > > > >  }
> > > > >
> > > > >  static void setup(void)
> > > > >  {
> > > > >       if (!check_sync_file_range())
> > > > >               tst_brk(TCONF, "sync_file_range() not supported");
> > > > > +
> > > > > +     if (!strcmp(tst_device->fs_type, "vfat")) {
> > > > > +             tst_res(TINFO, "Pre-filling file");
> > > > > +             tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> > > > > +             sync();
> > > > > +     }
> > > > >  }
> > > > >
> > > > >  static struct tst_test test = {
> > > > > +     .tcnt = ARRAY_SIZE(testcases),
> > > > >       .needs_root = 1,
> > > > >       .mount_device = 1,
> > > > >       .all_filesystems = 1,
> > > > >       .mntpoint = MNTPOINT,
> > > > >       .setup = setup,
> > > > > -     .test_all = verify_sync_file_range,
> > > > > +     .test = run,
> > > > >  };
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > >
> > > > > --
> > > > > Mailing list info: https://lists.linux.it/listinfo/ltp
> > > >
> > > > --
> > > >         Thanks,
> > > >         Caspar
> >
> > --
> >         Thanks,
> >         Caspar

--
        Thanks,
        Caspar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
