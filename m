Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD2C148D
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 15:28:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF2923C110F
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 15:28:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8FC5F3C0EAF
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 15:28:21 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 12A521000A42
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 15:28:12 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id t14so5823906pgs.3
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=casparzhang-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pr9lhbZMwTdT3dSmcwCEes4h7Gz76vm9O7pYrAqmDJw=;
 b=y6/iKekWiu9PcpB0ElAo0nAeHocuR9uFCQFr11YgjxnXbzRhhYU6CcpV48FVrqyJ2b
 lLclB3okiVpEpu6NfJdAAoOD5ptv+SFotU801ZZXcduEE3JnmEs9d8yfyZC5m9lY/gp8
 dYLJpavbLLhfUzOlyvAygT8vZVhAD4FsueIaNlIsEYJyPq1qmj2MME+42XHfcsqOYnYA
 S5LyNB9usBQTOEZSRz/hfCQL3sTzPh1qdMswWF7buLQSKF+BwD1ZRHWPdIK6i9PnHStW
 mdW8Sw6t3mjHw6Np8XzvV3TbpvGuP8mwSbHvTi2PMxsL1s/fSQ2gVPc3Z8MPORxgam14
 Nmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pr9lhbZMwTdT3dSmcwCEes4h7Gz76vm9O7pYrAqmDJw=;
 b=pj3eBqiM4tXamyUjh3e9dKTIucCkD1AKckVLITgWeYKD9tBgw1L/B2eyh8UyoBYgzA
 mPGqgMCAveiEPfTFgwJex7W29WLBfYgdQkxQ8gju92rPr2yv5xJY99GLPpBPKdP7Ejsh
 UMxXDu+c0n4M3/FfGAF+APYWtq3hP5fyi49BJ69RTOTLvTJdN0c9jhrjIJn7kOobz/6B
 SVmwU/4zLIlO1EIvTcvICnzF7BAakV2mfCnZjv8lx1tMgchc+bZ2ZrFCeQA1ZKX3aasN
 STeHHpJcgdzx3nzcMJxU9fLv1yKea9+r6mxxOKRAW8/vE+iFnkwBUHAi8UuiQeZALYzA
 INzw==
X-Gm-Message-State: APjAAAV9txWfABDpCXyufMvwpr0E0nOGSpjfV5Sv8czxbYp9E/LW0rqB
 o1eZassInkG8BFbGA+2TQvosgQ==
X-Google-Smtp-Source: APXvYqxdLoWU2gliy7NyQoMqUBZfxv0JeUZ9Hw7fIwPKSQuHVZMaQFYwFSKxv7SXc+4yxKi61+D6qw==
X-Received: by 2002:aa7:8edd:: with SMTP id b29mr15854011pfr.138.1569763698628; 
 Sun, 29 Sep 2019 06:28:18 -0700 (PDT)
Received: from casparzhang.com ([240e:390:f42:daf2:5527:e075:cc2:8947])
 by smtp.gmail.com with ESMTPSA id v68sm9363821pfv.47.2019.09.29.06.28.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Sep 2019 06:28:16 -0700 (PDT)
Date: Sun, 29 Sep 2019 21:27:49 +0800
From: Caspar Zhang <caspar@casparzhang.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20190929132749.GB73158@casparzhang.com>
References: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560161596-30156-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Sumit,

On Mon, Jun 10, 2019 at 03:43:16PM +0530, Sumit Garg wrote:

<snip>

>
> -	if (written >= FILE_SIZE)
> +	if ((written >= tc->exp_sync_size) &&
> +	    (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))

May I ask why it is +1/10 of expected sync_size as upper bound here,
since it looks like a magic number to me.

We encountered test failure in the second case in a debug kernel,
reproducible about once out of 20 times run.

The reason is unclear yet, however my guess is that more pages could be
written to disk in a debug kernel than a release kernel.

My codes and config as below:

tree: https://github.com/alibaba/cloud-kernel :: ck-4.19.67 branch;
config: https://github.com/alibaba/cloud-kernel/blob/master/config-4.19.y-x86_64-debug

If you like you can build a test kernel on a KVM guest and try to
reproduce, or just run a RHEL8 kernel I guess (@Li Wang, you can have a
try on RHEL8 debug kernel if possible).

a sample output:

tst_device.c:87: INFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:60: INFO: Kernel supports ext2
tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext3
tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext4
tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports xfs
tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports vfat
tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
tst_supported_fs_types.c:83: INFO: Filesystem exfat is not supported
tst_supported_fs_types.c:83: INFO: Filesystem ntfs is not supported
tst_test.c:1179: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.5 (04-Aug-2017)
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.43.5 (04-Aug-2017)
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.43.5 (04-Aug-2017)
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:74: FAIL: Sync inside of write: Synced 19658752, expected 16777216
                        ^^^^
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write
tst_test.c:1179: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
sync_file_range02.c:111: INFO: Pre-filling file
sync_file_range02.c:71: PASS: Sync equals write
sync_file_range02.c:71: PASS: Sync inside of write
sync_file_range02.c:71: PASS: Sync overlaps with write

Summary:
passed   17
failed   1
skipped  0
warnings 0

Any thoughts would be appreicated.

Thanks,
Caspar


>  		tst_res(TPASS, "Test file range synced to device");
>  	else
> -		tst_res(TFAIL, "Synced %li, expected %i", written, FILE_SIZE);
> +		tst_res(TFAIL, "Synced %li, expected %li", written,
> +			tc->exp_sync_size);
> +}
> +
> +static struct testcase testcases[] = {
> +	{ FNAME1, 0, FILE_SZ, FILE_SZ, 0, FILE_SZ_MB },
> +	{ FNAME2, FILE_SZ/4, FILE_SZ/2, FILE_SZ/2, 0, FILE_SZ_MB },
> +	{ FNAME3, FILE_SZ/4, FILE_SZ/2, FILE_SZ/4, FILE_SZ/2, FILE_SZ_MB/4 },
> +};
> +
> +static void run(unsigned int i)
> +{
> +	verify_sync_file_range(&testcases[i]);
>  }
>
>  static void setup(void)
>  {
>  	if (!check_sync_file_range())
>  		tst_brk(TCONF, "sync_file_range() not supported");
> +
> +	if (!strcmp(tst_device->fs_type, "vfat")) {
> +		tst_res(TINFO, "Pre-filling file");
> +		tst_fill_file(FNAME3, 0, TST_MB, FILE_SZ_MB);
> +		sync();
> +	}
>  }
>
>  static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(testcases),
>  	.needs_root = 1,
>  	.mount_device = 1,
>  	.all_filesystems = 1,
>  	.mntpoint = MNTPOINT,
>  	.setup = setup,
> -	.test_all = verify_sync_file_range,
> +	.test = run,
>  };
> --
> 2.7.4
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

--
        Thanks,
        Caspar

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
