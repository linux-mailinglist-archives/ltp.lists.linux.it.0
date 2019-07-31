Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9B27BA12
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:02:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98C923C1D49
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:02:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E5B7D3C18FE
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:01:56 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8C821100143C
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:01:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,329,1559491200"; d="scan'208";a="72575025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 15:01:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id EFF764CDE81D;
 Wed, 31 Jul 2019 15:01:47 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 31 Jul 2019 15:01:48 +0800
Message-ID: <5D413CD8.6040209@cn.fujitsu.com>
Date: Wed, 31 Jul 2019 15:01:44 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729140043.GB31077@dell5510> <20190729141011.GA1965@dell5510>
 <5D400066.2090204@cn.fujitsu.com> <20190730133530.GA32652@dell5510>
In-Reply-To: <20190730133530.GA32652@dell5510>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: EFF764CDE81D.A1573
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] syscalls/copy_file_range01: add
 cross-device test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


> Hi,
>
>>>> Whole patchset LGTM, but here we got quite a lot of failures after increasing
>>>> test coverage with .all_filesystems = 1 (which use should be noted in commit
>>>> message):
>>>> copy_file_range02.c:120: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
>>>> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
>>>> ...
>>>> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
>> Hi Petr
>> can you give more information? such as distros, filesystem, envrionment,  do you get 16(EBUSY) on all filesystems?
>> Because on my machine, I get the following result on 4.18.0-80.el8.x86_64(I test on vfat, extN,xfs,btrfs).
> Failing on various distros (VM: openSUSE Tumbleweed, Debian stable and testing,
> Centos 7; also on real HW openSUSE), fs: ext4, xfs, btrfs, vfat.
>
> I wonder, what I do wrong. I posted whole output of one machine below.
Hi Petr

You do nothing wrong.  It fails on various distros because the patchset was merged into upstream kernel since 5.2.

I guess it was not merged into any distros stable kernel Now.


patchurl:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96e6e8f4a
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5

also add xfstests case url:
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/553{554,564,565}




>>> Also .mount_device = 1 and .all_filesystems = 1 require
>>> .needs_root = 1 definition or you get
>>> tst_device.c:97: INFO: Not allowed to open /dev/loop-control. Are you root?: EACCES
>>> tst_device.c:132: INFO: No free devices found
>>> tst_device.c:308: BROK: Failed to acquire device
>>> BTW I wonder whether these could be detected automatically.
>> Here needs root because /dev/loop-control needs it.  But it doesn't represent mount_device and all_filesystems
>>   need root.
>> Or, I misunderstand your idea?
> I thought that for some cases it'd be nice, if .needs_root = 1 was added
> internally. But probably bad idea, I guess we should be explicit and add it.
> Kind regards,
> Petr
>
> tst_device.c:86: INFO: Found free device 1 '/dev/loop1'
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
> tst_test.c:1161: INFO: Testing on ext2
> tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext2 opts='' extra opts=''
> mke2fs 1.45.0 (6-Mar-2019)
> tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
> copy_file_range.h:41: INFO: Testing libc copy_file_range()
> tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
> Setting up swapspace version 1, size = 36 KiB (36864 bytes)
> no label, UUID=e585e0bd-0e55-4cdc-a37f-ca81411021c3
> swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
  I am curious about why swapon got this error.

> copy_file_range02.c:89: CONF: swapon binary not installed
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
> copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
> copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
> copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
> copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
> copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
> copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
> swapoff: file_swap: swapoff failed: Invalid argument
> copy_file_range02.c:89: CONF: swapoff binary not installed
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
