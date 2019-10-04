Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DF2CB509
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 09:33:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7596F3C228F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 09:33:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7A57C3C226E
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 09:33:33 +0200 (CEST)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4F204600293
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 09:33:01 +0200 (CEST)
Received: by mail-lj1-x244.google.com with SMTP id y23so5419201lje.9
 for <ltp@lists.linux.it>; Fri, 04 Oct 2019 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQ6HoOqKaTdCZJ7re2VruM1mgenKQLunPrds7X4FXbA=;
 b=pUohnBr4s22WKza9zzt3G1E1bjJqVTEuIQYxKsfhAegZ661igv5yw1OyGSik62Gupf
 qlYGijK3LQfBnA4j/G2LXs5/isFtG/GEfgq3z4uX1pIm5QkGQL0YrJ1PKBn1wy1x9v25
 bFb0tW2hbpavyXOGWI/OlBFuymuxij+Bnsuyw+CqI0JnfKyaPdsRWln/B+8DuYxtQlnh
 xhrqGCxoiLB1xq8Hpr1379syyPwaF3i2/KOOJd295hhrJDtzzZJrjhZ6ruZ37CQAtzG/
 yCZd6c2J/gURaM6ryhjMp8wq8/6CRVjAw5k6a+R/iCONDYSn1JJvLGZnQ0JN1B55fgIH
 pS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQ6HoOqKaTdCZJ7re2VruM1mgenKQLunPrds7X4FXbA=;
 b=lxnPMGh82BjMlAUKvSWgegpm6rdlZcf4Z+RBBvx4z9anURngMNcrarai7TBM4ZvC3k
 ywttczzBhXojNVZgkPmYro/wRFZvBgusjPvG1F5gJBcTDx0mad+FeNoezl9SQalC1Sde
 TueVQIsVVg7vELSqh3j/57UsDd8L8AaNgZK7dbCsOyNnJanvsgcu1EFwUN65adVrw02Z
 cGS+UT7PU6QoSswsZTqXCSswNUAq1MtRHUyZw8gJ8lMSti3YBGX6IRvsC00KsxC1Lv+R
 AV94UwqqHtS4AfDPDSdmF8kUtZU/aTHpBQ7mHW0hqolYvLG6UqN+9G/U2XwKG2yoahyt
 krJw==
X-Gm-Message-State: APjAAAVnlifO/Oh7Nnvguwkbqp8UzD7met2wjtF22pMt9n8bUd2OynQI
 pI3UltQi5uNiXvH2swIg4INQhTv/6v0KcE53qYzhlFRG6Dg=
X-Google-Smtp-Source: APXvYqzuAw+5E9xQJGpxL2RnASZYeIJSXZJXBny7agdu8ebN0AdSISDuLmjEJkEzAjWomCAn5A4xkKdiMKXNaX5pRtw=
X-Received: by 2002:a2e:9693:: with SMTP id q19mr8833983lji.12.1570174411652; 
 Fri, 04 Oct 2019 00:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
In-Reply-To: <20190929132749.GB73158@casparzhang.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 4 Oct 2019 13:03:19 +0530
Message-ID: <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Caspar,

On Sun, 29 Sep 2019 at 18:58, Caspar Zhang <caspar@casparzhang.com> wrote:
>
> Hi Sumit,
>
> On Mon, Jun 10, 2019 at 03:43:16PM +0530, Sumit Garg wrote:
>
> <snip>
>
> >
> > -     if (written >= FILE_SIZE)
> > +     if ((written >= tc->exp_sync_size) &&
> > +         (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
>
> May I ask why it is +1/10 of expected sync_size as upper bound here,
> since it looks like a magic number to me.

It was an outcome of discussion here [1]. The reason being to test
that only particular portion of file is written to device for whom
sync has been invoked and +1/10 as upper bound to incorporate for any
metadata.

[1] https://patchwork.ozlabs.org/patch/1051647/

>
> We encountered test failure in the second case in a debug kernel,
> reproducible about once out of 20 times run.

Interesting case. Can you share results after applying below patch?

diff --git a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
index eb08143..1bc1a44 100644
--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -42,7 +42,7 @@ struct testcase {
 static void verify_sync_file_range(struct testcase *tc)
 {
        int fd;
-       unsigned long written;
+       unsigned long written, written_pre;

        fd = SAFE_OPEN(tc->fname, O_RDWR|O_CREAT, MODE);

@@ -52,6 +52,8 @@ static void verify_sync_file_range(struct testcase *tc)

        tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);

+       written_pre = tst_dev_bytes_written(tst_device->dev);
+
        TEST(sync_file_range(fd, tc->sync_off, tc->sync_size,
                             SYNC_FILE_RANGE_WAIT_BEFORE |
                             SYNC_FILE_RANGE_WRITE |
@@ -70,8 +72,8 @@ static void verify_sync_file_range(struct testcase *tc)
            (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
                tst_res(TPASS, "%s", tc->desc);
        else
-               tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
-                       written, tc->exp_sync_size);
+               tst_res(TFAIL, "%s: Synced %li, expected %li, pre-sync %li",
+                       tc->desc, written, tc->exp_sync_size, written_pre);
 }

 static struct testcase testcases[] = {

-Sumit

>
> The reason is unclear yet, however my guess is that more pages could be
> written to disk in a debug kernel than a release kernel.
>
> My codes and config as below:
>
> tree: https://github.com/alibaba/cloud-kernel :: ck-4.19.67 branch;
> config: https://github.com/alibaba/cloud-kernel/blob/master/config-4.19.y-x86_64-debug
>
> If you like you can build a test kernel on a KVM guest and try to
> reproduce, or just run a RHEL8 kernel I guess (@Li Wang, you can have a
> try on RHEL8 debug kernel if possible).
>
> a sample output:
>
> tst_device.c:87: INFO: Found free device 0 '/dev/loop0'
> tst_supported_fs_types.c:60: INFO: Kernel supports ext2
> tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
> tst_supported_fs_types.c:60: INFO: Kernel supports ext3
> tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
> tst_supported_fs_types.c:60: INFO: Kernel supports ext4
> tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
> tst_supported_fs_types.c:60: INFO: Kernel supports xfs
> tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
> tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
> tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
> tst_supported_fs_types.c:60: INFO: Kernel supports vfat
> tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
> tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported
> tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported
> tst_test.c:1179: INFO: Testing on ext2
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.43.5 (04-Aug-2017)
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on ext3
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.43.5 (04-Aug-2017)
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on ext4
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.43.5 (04-Aug-2017)
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:74: FAIL: Sync inside of write: Synced 19658752, expected 16777216
>                         ^^^^
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on xfs
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on btrfs
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on vfat
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> sync_file_range02.c:111: INFO: Pre-filling file
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
>
> Summary:
> passed   17
> failed   1
> skipped  0
> warnings 0
>
> Any thoughts would be appreicated.
>
> Thanks,
> Caspar
>
>
> >               tst_res(TPASS, "Test file range synced to device");
> >       else
> > -             tst_res(TFAIL, "Synced %li, expected %i", written, FILE_SIZE);
> > +             tst_res(TFAIL, "Synced %li, expected %li", written,
> > +                     tc->exp_sync_size);
> > +}
> > +
> > +static struct testcase testcases[] = {
> > +     { FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },
> > +     { FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, FILE_SZ_MB },
> > +     { FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE_SZ/2, FILE_SZ_MB/4 },
> > +};
> > +
> > +static void run(unsigned int i)
> > +{
> > +     verify_sync_file_range(&testcases[i]);
> >  }
> >
> >  static void setup(void)
> >  {
> >       if (!check_sync_file_range())
> >               tst_brk(TCONF, "sync_file_range() not supported");
> > +
> > +     if (!strcmp(tst_device->fs_type, "vfat")) {
> > +             tst_res(TINFO, "Pre-filling file");
> > +             tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> > +             sync();
> > +     }
> >  }
> >
> >  static struct tst_test test = {
> > +     .tcnt = ARRAY_SIZE(testcases),
> >       .needs_root = 1,
> >       .mount_device = 1,
> >       .all_filesystems = 1,
> >       .mntpoint = MNTPOINT,
> >       .setup = setup,
> > -     .test_all = verify_sync_file_range,
> > +     .test = run,
> >  };
> > --
> > 2.7.4
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
> --
>         Thanks,
>         Caspar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
