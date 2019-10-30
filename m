Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D91ECE9954
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:41:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86F793C22AA
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:41:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4C6273C1CB4
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:41:08 +0100 (CET)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0EF9A600D78
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:41:06 +0100 (CET)
Received: by mail-lj1-x242.google.com with SMTP id m9so1856338ljh.8
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8iAs9zilQ5KRfoYOSf05hG+t/fzbv9GMYNsO50OI60=;
 b=LeJnGnmjAUILfYnO7djyJCm/tQwzHMYLlQ+AoJICHppFlO1Ipmvmme+jegC2yVkZdW
 2zQQABy16RD8Od/i4NRLwxnmy2JUfUYfefww6+QqmlARE1g3PogYCLBfQYJUzm+8tSBt
 JW7cuJXuMUryZQvj7MykSFLhUYcDcJ00XlX2c+60gzcoF0ticj+9AobjqRq1G53BRyuD
 ojCl1I4j7uWEOWsJZ6/khcmU16czbPQafuiEEJOq+hshldPAZofWRkZ04ErMIVNUgeZ3
 rM0JiqHMZZbFHEbZKWutqRBlwJOA9hH2gTNky0Lq6wO5pFT12ixXQh/lsAN3uW9LU8to
 Rhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8iAs9zilQ5KRfoYOSf05hG+t/fzbv9GMYNsO50OI60=;
 b=CA9cKvTUfAWI//ob2HUx6nJWOR5qjLJRjPNrag4untaYFj0T3QZjSzuQi+EU49i9j/
 /QtyJtx85X4pMs4/CEwcPQ/x491RNgnPrfJbCyFv/dv2briZ4zQtSkfMkoWdELauzX0T
 RhoAtVE/E6JudFvzZCEcKHMwO5GLC4He5xUyU+N17DupYx7//yPJuZdrtN4BrBGYDzzt
 Ojm3ZNPtNnp7SWryz/4LJMGrj5bSsMlo+s//y23uEOL2ROT2KKNE2X9meVGRrGWRbY3O
 DfFNtzzNSyifjydOLEmP1y7btE84OEOxE14Fj32xmX4K86jY3AOvF567jGJF9tfRE51b
 YRYA==
X-Gm-Message-State: APjAAAVr7HtWDl3tgjAH44B+gP59szZLW5MmwqPE5fkW+BiyRKGQ7XDU
 WI4YNXGpQazNJo5HSW8F4urirK8JJ9AgikuZYD0Br9lhru4=
X-Google-Smtp-Source: APXvYqwcpKGWjqDXNXwrqz3GuD4ANRR36oXaS1gWuvzsS506rOy+5caHLv+RwsWFLM4fljFx2vGebqOmS+ulAyfWPoE=
X-Received: by 2002:a2e:3919:: with SMTP id g25mr6009894lja.232.1572428466034; 
 Wed, 30 Oct 2019 02:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
 <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
 <20191016025405.GA86846@casparzhang.com>
 <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
 <20191017073653.GA2590@casparzhang.com>
In-Reply-To: <20191017073653.GA2590@casparzhang.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 30 Oct 2019 15:10:54 +0530
Message-ID: <CAFA6WYMz51agYiT5L2fby5C-e-aEjdnpoOk8KUKSVryBh64UZQ@mail.gmail.com>
To: Caspar Zhang <caspar@casparzhang.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Cc: joseph.qi@linux.alibaba.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Caspar,

Sorry for the late reply. I was busy with some other stuff along with
Diwali holidays last week in India. So now I got a chance to dig
deeper into this issue.

On Thu, 17 Oct 2019 at 13:07, Caspar Zhang <caspar@casparzhang.com> wrote:
>
> On Wed, Oct 16, 2019 at 11:53:48AM +0530, Sumit Garg wrote:
> > Hi Caspar,
> >
> > On Wed, 16 Oct 2019 at 08:24, Caspar Zhang <caspar@casparzhang.com> wrote:
> > >
> > > Hi Sumit,
> > >
> > > On Fri, Oct 04, 2019 at 01:03:19PM +0530, Sumit Garg wrote:
> > > > Hi Caspar,
> > > >
> > > > On Sun, 29 Sep 2019 at 18:58, Caspar Zhang <caspar@casparzhang.com> wrote:
> > > > >
> > > > > Hi Sumit,
> > > > >
> > > > > On Mon, Jun 10, 2019 at 03:43:16PM +0530, Sumit Garg wrote:
> > > > >
> > > > > <snip>
> > > > >
> > > > > >
> > > > > > -     if (written >= FILE_SIZE)
> > > > > > +     if ((written >= tc->exp_sync_size) &&
> > > > > > +         (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> > > > >
> > > > > May I ask why it is +1/10 of expected sync_size as upper bound here,
> > > > > since it looks like a magic number to me.
> > > >
> > > > It was an outcome of discussion here [1]. The reason being to test
> > > > that only particular portion of file is written to device for whom
> > > > sync has been invoked and +1/10 as upper bound to incorporate for any
> > > > metadata.
> > >
> > > I see, thanks for explanation.
> > >
> > > >
> > > > [1] https://patchwork.ozlabs.org/patch/1051647/
> > > >
> > > > >
> > > > > We encountered test failure in the second case in a debug kernel,
> > > > > reproducible about once out of 20 times run.
> > > >
> > > > Interesting case. Can you share results after applying below patch?
> > >
> > > Tested this patch, no TFAIL occured in debug kernel after 200+ times
> > > run, looks good to me. Thanks! Please add my
> >
> > From these results, the reason for the failure that you reported
> > earlier seems to be writes to the device during "tst_fill_fd()"
> > operation (they were found negligible/zero with normal kernel). But
> > it's strange to know that you didn't get any TFAIL after the patch as
> > I expected "Sync equals write" to fail.
> >
> > So can you also put following debug print and share logs of your test run?
>
> Retested with debug print, during my 1000-times run, pre-sync remains 0
> in all the other fs types except only ext4. For ext4 cases, pre-sync
> could be non-zero, e.g.:
>
>     Sync equals write: Synced 33554432, expected 33554432, pre-sync 0
>     Sync inside of write: Synced 17301504, expected 16777216, pre-sync 1308672
>     Sync overlaps with write: Synced 8650752, expected 8388608, pre-sync 1310720
>
> Note that pre-sync could be non-zero in `equals writes` case sometimes
> too, like another round below:
>
>     Sync equals write: Synced 34078720, expected 33554432, pre-sync 260096
>     Sync inside of write: Synced 17039360, expected 16777216, pre-sync 4980736
>     Sync overlaps with write: Synced 8912896, expected 8388608, pre-sync 1048576
>
> Such non-zero situation in ext4 case is reproducible ~10% of my
> 1000-times run.
>

Thanks for your testing results. I am able to root-cause this issue.

This issue seems to be caused by left over writes from previous test
runs that are queued up for writes to the device during current test
run leading to over-estimation of synced data to the device causing
the failures that you have reported.

So to avoid those left over writes from estimation, following
additional call to "sync()" is required:

diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index eb08143c3..c66dbd8d2 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -48,6 +48,8 @@ static void verify_sync_file_range(struct testcase *tc)

        lseek(fd, tc->write_off, SEEK_SET);

+       sync();
+
        tst_dev_bytes_written(tst_device->dev);

        tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);

Try to apply this fix at your end and let me know if you still observe
any further failures with this test-case.

-Sumit

> Thanks,
> Caspar
>
>
>
>
> >
> > --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > @@ -68,6 +68,8 @@ static void verify_sync_file_range(struct testcase *tc)
> >
> >         SAFE_CLOSE(fd);
> >
> > +       printf("%s: Synced %li, expected %li, pre-sync %li\n",
> > +               tc->desc, written, tc->exp_sync_size, written_pre);
> >         if ((written >= tc->exp_sync_size) &&
> >             (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> >                 tst_res(TPASS, "%s", tc->desc);
> >
> > -Sumit
> >
> > >
> > > Reviewed-by: Caspar Zhang <caspar@linux.alibaba.com>
> > >
> > > directly if you're going to make a formal patch later.
> > >
> > > Thanks,
> > > Caspar
> > >
> > > >
> > > > diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > > b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > > index eb08143..1bc1a44 100644
> > > > --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > > +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> > > > @@ -42,7 +42,7 @@ struct testcase {
> > > >  static void verify_sync_file_range(struct testcase *tc)
> > > >  {
> > > >         int fd;
> > > > -       unsigned long written;
> > > > +       unsigned long written, written_pre;
> > > >
> > > >         fd = SAFE_OPEN(tc->fname, O_RDWR|O_CREAT, MODE);
> > > >
> > > > @@ -52,6 +52,8 @@ static void verify_sync_file_range(struct testcase *tc)
> > > >
> > > >         tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
> > > >
> > > > +       written_pre = tst_dev_bytes_written(tst_device->dev);
> > > > +
> > > >         TEST(sync_file_range(fd, tc->sync_off, tc->sync_size,
> > > >                              SYNC_FILE_RANGE_WAIT_BEFORE |
> > > >                              SYNC_FILE_RANGE_WRITE |
> > > > @@ -70,8 +72,8 @@ static void verify_sync_file_range(struct testcase *tc)
> > > >             (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> > > >                 tst_res(TPASS, "%s", tc->desc);
> > > >         else
> > > > -               tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
> > > > -                       written, tc->exp_sync_size);
> > > > +               tst_res(TFAIL, "%s: Synced %li, expected %li, pre-sync %li",
> > > > +                       tc->desc, written, tc->exp_sync_size, written_pre);
> > > >  }
> > > >
> > > >  static struct testcase testcases[] = {
> > > >
> > > > -Sumit
> > > >
> > > > >
> > > > > The reason is unclear yet, however my guess is that more pages could be
> > > > > written to disk in a debug kernel than a release kernel.
> > > > >
> > > > > My codes and config as below:
> > > > >
> > > > > tree: https://github.com/alibaba/cloud-kernel :: ck-4.19.67 branch;
> > > > > config: https://github.com/alibaba/cloud-kernel/blob/master/config-4.19.y-x86_64-debug
> > > > >
> > > > > If you like you can build a test kernel on a KVM guest and try to
> > > > > reproduce, or just run a RHEL8 kernel I guess (@Li Wang, you can have a
> > > > > try on RHEL8 debug kernel if possible).
> > > > >
> > > > > a sample output:
> > > > >
> > > > > tst_device.c:87: INFO: Found free device 0 '/dev/loop0'
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext2
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext3
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports ext4
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports xfs
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
> > > > > tst_supported_fs_types.c:60: INFO: Kernel supports vfat
> > > > > tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
> > > > > tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported
> > > > > tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported
> > > > > tst_test.c:1179: INFO: Testing on ext2
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> > > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > > tst_test.c:1179: INFO: Testing on ext3
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> > > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > > tst_test.c:1179: INFO: Testing on ext4
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> > > > > mke2fs 1.43.5 (04-Aug-2017)
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:74: FAIL: Sync inside of write: Synced 19658752, expected 16777216
> > > > >                         ^^^^
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > > tst_test.c:1179: INFO: Testing on xfs
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > > tst_test.c:1179: INFO: Testing on btrfs
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > > tst_test.c:1179: INFO: Testing on vfat
> > > > > tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> > > > > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > > > > sync_file_range02.c:111: INFO: Pre-filling file
> > > > > sync_file_range02.c:71: PASS: Sync equals write
> > > > > sync_file_range02.c:71: PASS: Sync inside of write
> > > > > sync_file_range02.c:71: PASS: Sync overlaps with write
> > > > >
> > > > > Summary:
> > > > > passed   17
> > > > > failed   1
> > > > > skipped  0
> > > > > warnings 0
> > > > >
> > > > > Any thoughts would be appreicated.
> > > > >
> > > > > Thanks,
> > > > > Caspar
> > > > >
> > > > >
> > > > > >               tst_res(TPASS, "Test file range synced to device");
> > > > > >       else
> > > > > > -             tst_res(TFAIL, "Synced %li, expected %i", written, FILE_SIZE);
> > > > > > +             tst_res(TFAIL, "Synced %li, expected %li", written,
> > > > > > +                     tc->exp_sync_size);
> > > > > > +}
> > > > > > +
> > > > > > +static struct testcase testcases[] = {
> > > > > > +     { FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },
> > > > > > +     { FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, FILE_SZ_MB },
> > > > > > +     { FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE_SZ/2, FILE_SZ_MB/4 },
> > > > > > +};
> > > > > > +
> > > > > > +static void run(unsigned int i)
> > > > > > +{
> > > > > > +     verify_sync_file_range(&testcases[i]);
> > > > > >  }
> > > > > >
> > > > > >  static void setup(void)
> > > > > >  {
> > > > > >       if (!check_sync_file_range())
> > > > > >               tst_brk(TCONF, "sync_file_range() not supported");
> > > > > > +
> > > > > > +     if (!strcmp(tst_device->fs_type, "vfat")) {
> > > > > > +             tst_res(TINFO, "Pre-filling file");
> > > > > > +             tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> > > > > > +             sync();
> > > > > > +     }
> > > > > >  }
> > > > > >
> > > > > >  static struct tst_test test = {
> > > > > > +     .tcnt = ARRAY_SIZE(testcases),
> > > > > >       .needs_root = 1,
> > > > > >       .mount_device = 1,
> > > > > >       .all_filesystems = 1,
> > > > > >       .mntpoint = MNTPOINT,
> > > > > >       .setup = setup,
> > > > > > -     .test_all = verify_sync_file_range,
> > > > > > +     .test = run,
> > > > > >  };
> > > > > > --
> > > > > > 2.7.4
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Mailing list info: https://lists.linux.it/listinfo/ltp
> > > > >
> > > > > --
> > > > >         Thanks,
> > > > >         Caspar
> > >
> > > --
> > >         Thanks,
> > >         Caspar
>
> --
>         Thanks,
>         Caspar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
