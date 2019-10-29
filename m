Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1CE8015
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:09:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA65C3C2336
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Oct 2019 07:09:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D0ECD3C1CD8
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:09:04 +0100 (CET)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 27BB560078F
 for <ltp@lists.linux.it>; Tue, 29 Oct 2019 07:09:04 +0100 (CET)
Received: by mail-lj1-x244.google.com with SMTP id t5so6067266ljk.0
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 23:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sT3roJ5SKxfVPY3nnQGWgAvGjPwI4nw6ecZT5PkIskA=;
 b=vrNOdPZzg6ocsqJC7Y1Snl6duhCrP0hpt//DKOM2d9EaBT7s+EhQRTGcF/f8FpZmA1
 EcnxxIr7HPg5HMQVJLFBHzPWYWEBSSiI4E4IAx9GMthD0GqnD+/NeDouBdb/EeXLF7rc
 WYNE7WJn3fBWtg6kcuHBYxhn9YmAgrZVtwDkejlkA4IrUm2K0yC773iANu+Z+pmCYkde
 +5UdQgX5JWHKbBKIG0gnmvR0x+3GXOGaybzGsirss2oBSljQZH8LJpZUgWY82WWMb/6G
 r4UdPTajACUnn1hcospbg6OXyAILo//ZsVHCXA+YF6ZsNvu3SFJjzM5LsxLowDCKwb5B
 HQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sT3roJ5SKxfVPY3nnQGWgAvGjPwI4nw6ecZT5PkIskA=;
 b=Ny0Z4d/1GUwFFevXmlWrK4LitZNsV5LlOK/h8q3FfaYKpxQly7Hd5edBgXo1s565zd
 P7rpLyVSyWdPLoI9RSpT4BMOgit5D3lyvrBcvI/CwPzaJXX8trTZvwxGBAxetAxM2sbt
 b9tdQnJiDsk2my5GHRFU7PLo0PPkhU9rUvIfQ80q6FhKx34xg6koL4c4zg7y/ejO5gd4
 mG9lLZy+HBx0ayYc+QxqSZrnPDh6C1DJFlR6HtTZ4Ig5HnD4OaF7ccSE+HfFtegDuOJI
 uwf95ewNnt83DqNRcXQ/4uasZkN4Aom5XdFEz+ILIlhXsAOtA6G5Vkh3sqy2ctluYmXc
 Y3ww==
X-Gm-Message-State: APjAAAUeukFQkg2n8ZW06ISLab3hsQg4bAHNkYtR4G7Rx137P4Yyf3AZ
 puxP345XhPgYylr/5Dhg6lOp5vXbGKeuP6FBpaHnaQ==
X-Google-Smtp-Source: APXvYqwUHQ6aEx79o/NqhyfXFAMbAzi+IV5yXXy+SUWbXMBHlqf2MUQbPPVAazFSNpLNSzPBcquICB3zFn62i1QUSPM=
X-Received: by 2002:a2e:814b:: with SMTP id t11mr133565ljg.20.1572329343282;
 Mon, 28 Oct 2019 23:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
 <20190929132749.GB73158@casparzhang.com>
 <CAFA6WYNNyeU-tL4vg5PddwDOmU1gaGZJj3hRLYUCnJCY=MYNMw@mail.gmail.com>
 <20191016025405.GA86846@casparzhang.com>
 <CAFA6WYNCHNyPb=GX-jLDHc2m=NGxH-Pgi10Dvvbc65stnV5VMA@mail.gmail.com>
 <20191017073653.GA2590@casparzhang.com>
In-Reply-To: <20191017073653.GA2590@casparzhang.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Oct 2019 11:38:51 +0530
Message-ID: <CA+G9fYst7ZgkUE0+3YXx0o=ZW+XsxD6AFOpnZHwixBrgr43LJA@mail.gmail.com>
To: Caspar Zhang <caspar@casparzhang.com>, Sumit Garg <sumit.garg@linaro.org>
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
Cc: joseph.qi@linux.alibaba.com, lkft-triage@lists.linaro.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Caspar and Sumit,

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

sync_file_range02 test failure reproduced on mainline and stable rc branches
5.3, 4.19, 4.14 on arm64 and arm devices while testing on ext4.

output log,
--------------
tst_test.c:1179: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
Listened to connection for namespace 'tlxc' done
[ 1349.061989] EXT4-fs (loop0): mounting ext3 file system using the
ext4 subsystem
[ 1349.099564] EXT4-fs (loop0): mounted filesystem with ordered data
mode. Opts: (null)
tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
sync_file_range02.c:71: PASS: Sync equals write
Listened to connection for namespace 'tlxc' done
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.43.8 (1-Jan-2018)
[ 1362.579639] EXT4-fs (loop0): mounted filesystem with ordered data
mode. Opts: (null)
tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
sync_file_range02.c:74: FAIL: Sync equals write: Synced 36960256,
expected 33554432
Listened to connection for namespace 'tlxc' done
sync_file_range02.c:74: FAIL: Sync inside of write: Synced 20185088,
expected 16777216
sync_file_range02.c:71: PASS: Sync overlaps with write
Summary:
passed   7
failed   2

Full output log,
--------------------
https://lkft.validation.linaro.org/scheduler/job/983166#L15067

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
