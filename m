Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E1E995E
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:46:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C25E53C22A3
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 10:46:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A3EA43C1CA6
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:46:00 +0100 (CET)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C06D1601CB3
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 10:45:59 +0100 (CET)
Received: by mail-lf1-x141.google.com with SMTP id y127so1043200lfc.0
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E9gbKrhlz8CeUISj1JKezUjfPaaADLcfo2ApwM1SAo4=;
 b=d74IFIu9GVf63AMl55JyNWYpBGu4dv9ZTsi79iumbi5DvTZZchRI7gr1PFh0J0GaPJ
 h77a1uMm0QFbY5Blfry3O/EmUv21ZWCZS8pi8k06mKHUIddv8S1SwADkEx5Sz5VDFAbC
 1E9nAi5gJh4Itg2bcpa9JmSn7dyzyx/RBIb/U7RXqCMAyTMmYoF7cOYGXElhIkJP49cW
 ui/5c5rBglo5a/EqTn4aQGJH8FmDhph0WNZnln2W64ttl7XW6umjmadvZPyEtCnB1OYc
 lPaPeIY60zNxmNW6Pk9kJPArubEBrwwvG4/YnaeNjWM6BLj0naJUpgS/DU63dsGIjYDz
 45RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E9gbKrhlz8CeUISj1JKezUjfPaaADLcfo2ApwM1SAo4=;
 b=AWI0Zop+QToymPzfFVQqyDMs/Oua2rYfzyG6+dRUPKgCJK0vKah9lfqUEsAz1QXnc2
 P0VBSU4JMRNp9+Ts76jiJvO2dEl916oBA1WbmaMXoH8KBioV6UZkBrwD8qoktvjgvvQ6
 gNf5vrvjXE/UC6I6S6GfSTuSUJKhrzsRGKOk73rp0uNfZPsh/jIhfeutPEKjF/OeJY3G
 BeiCkbUpScwD56/e+vnZYmdBcGB8C7bQvtiDaGFeafV5F2yrXzJkAFtTPBtqqzKlDF9u
 FzsbHj/Yttvev4EfyiOjMqXIMDSHOhk3MorHPOR1nYcqbPlJISGJigqEtXS/oFqVdqMd
 IAOQ==
X-Gm-Message-State: APjAAAX59lJBd+74OiD+UvQ+cScvpHd4kczqn+/+Ux9PIT6N9imfcZx/
 SnzgZRFIlcv2H5QXSp80N3ijYNu5DFBx/HZTD9Zr/JJLjx8=
X-Google-Smtp-Source: APXvYqzlztgPe09z10aru/r016pvqGb7avgjg9aNdaIveuC0zZ9rN+y9d/h6bmKGgsRKQrY77ax/Aohz6YDRZdj0PFo=
X-Received: by 2002:a05:6512:409:: with SMTP id u9mr5547088lfk.0.1572428758984; 
 Wed, 30 Oct 2019 02:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
 <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
 <20191016025405.GA86846@casparzhang.com>
 <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
 <20191017073653.GA2590@casparzhang.com>
 <CA+G9fYst7ZgkUE0+3YXx0o=ZW+XsxD6AFOpnZHwixBrgr43LJA@mail.gmail.com>
In-Reply-To: <CA+G9fYst7ZgkUE0+3YXx0o=ZW+XsxD6AFOpnZHwixBrgr43LJA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 30 Oct 2019 15:15:47 +0530
Message-ID: <CAFA6WYO_xaOqYmyx39OpvJDmjoMi_Cqn09t9+orvTbO2Lrzt-A@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
 joseph.qi@linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Naresh,

On Tue, 29 Oct 2019 at 11:39, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Hi Caspar and Sumit,
>
> > > > > > We encountered test failure in the second case in a debug kernel,
> > > > > > reproducible about once out of 20 times run.
> > > > >
> > > > > Interesting case. Can you share results after applying below patch?
> > > >
> > > > Tested this patch, no TFAIL occured in debug kernel after 200+ times
> > > > run, looks good to me. Thanks! Please add my
> > >
> > > From these results, the reason for the failure that you reported
> > > earlier seems to be writes to the device during "tst_fill_fd()"
> > > operation (they were found negligible/zero with normal kernel). But
> > > it's strange to know that you didn't get any TFAIL after the patch as
> > > I expected "Sync equals write" to fail.
> > >
> > > So can you also put following debug print and share logs of your test run?
> >
> > Retested with debug print, during my 1000-times run, pre-sync remains 0
> > in all the other fs types except only ext4. For ext4 cases, pre-sync
> > could be non-zero, e.g.:
> >
> >     Sync equals write: Synced 33554432, expected 33554432, pre-sync 0
> >     Sync inside of write: Synced 17301504, expected 16777216, pre-sync 1308672
> >     Sync overlaps with write: Synced 8650752, expected 8388608, pre-sync 1310720
> >
> > Note that pre-sync could be non-zero in `equals writes` case sometimes
> > too, like another round below:
> >
> >     Sync equals write: Synced 34078720, expected 33554432, pre-sync 260096
> >     Sync inside of write: Synced 17039360, expected 16777216, pre-sync 4980736
> >     Sync overlaps with write: Synced 8912896, expected 8388608, pre-sync 1048576
> >
> > Such non-zero situation in ext4 case is reproducible ~10% of my
> > 1000-times run.
>
> sync_file_range02 test failure reproduced on mainline and stable rc branches
> 5.3, 4.19, 4.14 on arm64 and arm devices while testing on ext4.
>

Can you test again with the fix proposed here [1]?

[1] http://lists.linux.it/pipermail/ltp/2019-October/014157.html

-Sumit

> output log,
> --------------
> tst_test.c:1179: INFO: Testing on ext2
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.43.8 (1-Jan-2018)
> tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on ext3
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.43.8 (1-Jan-2018)
> Listened to connection for namespace 'tlxc' done
> [ 1349.061989] EXT4-fs (loop0): mounting ext3 file system using the
> ext4 subsystem
> [ 1349.099564] EXT4-fs (loop0): mounted filesystem with ordered data
> mode. Opts: (null)
> tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
> sync_file_range02.c:71: PASS: Sync equals write
> Listened to connection for namespace 'tlxc' done
> sync_file_range02.c:71: PASS: Sync inside of write
> sync_file_range02.c:71: PASS: Sync overlaps with write
> tst_test.c:1179: INFO: Testing on ext4
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.43.8 (1-Jan-2018)
> [ 1362.579639] EXT4-fs (loop0): mounted filesystem with ordered data
> mode. Opts: (null)
> tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
> sync_file_range02.c:74: FAIL: Sync equals write: Synced 36960256,
> expected 33554432
> Listened to connection for namespace 'tlxc' done
> sync_file_range02.c:74: FAIL: Sync inside of write: Synced 20185088,
> expected 16777216
> sync_file_range02.c:71: PASS: Sync overlaps with write
> Summary:
> passed   7
> failed   2
>
> Full output log,
> --------------------
> https://lkft.validation.linaro.org/scheduler/job/983166#L15067
>
> - Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
