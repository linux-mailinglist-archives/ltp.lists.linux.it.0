Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F187E7A9BA
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 15:35:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6074B3C1D53
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 15:35:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C304E3C180D
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 15:35:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 735FE601AE5
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 15:35:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB2AEAD18;
 Tue, 30 Jul 2019 13:35:31 +0000 (UTC)
Date: Tue, 30 Jul 2019 15:35:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190730133530.GA32652@dell5510>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729140043.GB31077@dell5510> <20190729141011.GA1965@dell5510>
 <5D400066.2090204@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D400066.2090204@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > Whole patchset LGTM, but here we got quite a lot of failures after increasing
> > > test coverage with .all_filesystems = 1 (which use should be noted in commit
> > > message):
> > > copy_file_range02.c:120: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
> > > copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
> > > ...
> > > copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
> Hi Petr
> can you give more information? such as distros, filesystem, envrionment,  do you get 16(EBUSY) on all filesystems?
> Because on my machine, I get the following result on 4.18.0-80.el8.x86_64(I test on vfat, extN,xfs,btrfs).
Failing on various distros (VM: openSUSE Tumbleweed, Debian stable and testing,
Centos 7; also on real HW openSUSE), fs: ext4, xfs, btrfs, vfat.

I wonder, what I do wrong. I posted whole output of one machine below.

> > Also .mount_device = 1 and .all_filesystems = 1 require
> > .needs_root = 1 definition or you get

> > tst_device.c:97: INFO: Not allowed to open /dev/loop-control. Are you root?: EACCES
> > tst_device.c:132: INFO: No free devices found
> > tst_device.c:308: BROK: Failed to acquire device

> > BTW I wonder whether these could be detected automatically.
> Here needs root because /dev/loop-control needs it.  But it doesn't represent mount_device and all_filesystems
>  need root.
> Or, I misunderstand your idea?
I thought that for some cases it'd be nice, if .needs_root = 1 was added
internally. But probably bad idea, I guess we should be explicit and add it.

Kind regards,
Petr

tst_device.c:86: INFO: Found free device 1 '/dev/loop1'
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
tst_test.c:1161: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext2 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=e585e0bd-0e55-4cdc-a37f-ca81411021c3
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext3 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=188ffc43-d712-452d-ba6c-5727457d87d9
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext4 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=3f384ded-2f54-40a5-b43b-826865b3f67e
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with xfs opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=3f088e9f-b153-40f8-813b-661bc5fac6f2
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with btrfs opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=807360ba-a49a-4f8b-b088-92dd455858a7
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with vfat opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:41: INFO: Testing libc copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=b805d82d-c5a2-45d1-9ad3-df7921a36ece
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
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
tst_test.c:1161: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext2 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=e95e50e5-abe4-4f74-924f-af25b1a218a8
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext3 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=9bb43d35-e633-4bcb-9110-28d212c06f53
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with ext4 opts='' extra opts=''
mke2fs 1.45.0 (6-Mar-2019)
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=52c81016-b46d-41b2-9ee9-4a414c108480
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with xfs opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=f8ecfc5d-1cba-4722-a75e-53a7ff49dd96
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with btrfs opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=64581f50-f38d-4ae3-8931-b63f312f26dd
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed
tst_test.c:1161: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop1 with vfat opts='' extra opts=''
tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
copy_file_range.h:44: INFO: Testing tst copy_file_range()
tst_device.c:86: INFO: Found free device 2 '/dev/loop2'
Setting up swapspace version 1, size = 36 KiB (36864 bytes)
no label, UUID=c008d9a3-6100-41ee-b430-8e566b7785d4
swapon: /tmp/wTdW10/file_swap: swapon failed: Invalid argument
copy_file_range02.c:89: CONF: swapon binary not installed
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EISDIR
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EBADF
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 32
copy_file_range02.c:105: CONF: filesystem doesn't support swapfile, skip it
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:118: PASS: copy_file_range failed as expected: EINVAL
copy_file_range02.c:122: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
copy_file_range02.c:127: FAIL: copy_file_range returned wrong value: 0
swapoff: file_swap: swapoff failed: Invalid argument
copy_file_range02.c:89: CONF: swapoff binary not installed

Summary:
passed   96
failed   48
skipped  36
warnings 0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
