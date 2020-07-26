Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671522DD0F
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Jul 2020 09:56:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2388B3C269C
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Jul 2020 09:56:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B464C3C0886
 for <ltp@lists.linux.it>; Sun, 26 Jul 2020 09:55:57 +0200 (CEST)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BD4D86005DE
 for <ltp@lists.linux.it>; Sun, 26 Jul 2020 09:54:30 +0200 (CEST)
IronPort-SDR: of4vt0Dst8mSKwNmYPOj99gquVx7SRyGoC/pIpSfXcvYQ2s5WItsLElTwDKgrFooguN/fqU5HC
 ZJMEF2/fpipg==
X-IronPort-AV: E=McAfee;i="6000,8403,9693"; a="215441233"
X-IronPort-AV: E=Sophos;i="5.75,397,1589266800"; 
 d="xz'?scan'208";a="215441233"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2020 00:55:45 -0700
IronPort-SDR: B82c+WlXbz9vm8yuR9nK4eRP571f7gEXtLUKxahsvspsrvAW8BwxwGofYK3t/dQ2y3aBTGHGZu
 OiErhW5XKxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,397,1589266800"; 
 d="xz'?scan'208";a="285357033"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2020 00:55:42 -0700
Date: Sun, 26 Jul 2020 15:55:11 +0800
From: kernel test robot <rong.a.chen@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200726075511.GI1850@shao2-debian>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="h22Fi9ANawrtbNPX"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 UPPERCASE_50_75 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [blk] 6e6fcbc27e: ltp.fs_fill.fail
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
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 lkp@lists.01.org, Baolin Wang <baolin.wang7@gmail.com>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 6e6fcbc27e7788af54139c53537395d95560f2ef ("blk-mq: support batching dispatch in case of io")
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-5.9/drivers


in testcase: ltp
with following parameters:

	disk: 1HDD
	fs: ext4
	test: fs-03

test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
test-url: http://linux-test-project.github.io/


on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <rong.a.chen@intel.com>



<<<test_start>>>
tag=fs_fill stime=1595659069
cmdline="fs_fill"
contacts=""
analysis=exit
<<<test_output>>>
tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
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
tst_supported_fs_types.c:92: INFO: FUSE does support ntfs
tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
tst_test.c:1308: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
fs_fill.c:87: PASS: Got 10 ENOSPC runtime 1194ms
tst_test.c:1308: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file14
fs_fill.c:87: PASS: Got 17 ENOSPC runtime 1000ms
tst_test.c:1308: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
fs_fill.c:87: PASS: Got 73 ENOSPC runtime 1000ms
tst_test.c:1308: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file2
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file2
fs_fill.c:87: PASS: Got 111 ENOSPC runtime 566ms
tst_test.c:1308: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
fs_fill.c:87: PASS: Got 10 ENOSPC runtime 9454ms
tst_test.c:1308: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Cannot kill test processes!
Congratulation, likely test hit a kernel bug.
Exitting uncleanly...
<<<execution_status>>>
initiation_status="ok"
duration=385 termination_type=exited termination_id=1 corefile=no
cutime=53 cstime=1400
<<<test_end>>>



To reproduce:

        # build kernel
	cd linux
	cp config-5.8.0-rc2-00057-g6e6fcbc27e7788 .config
	make HOSTCC=gcc-9 CC=gcc-9 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-9 CC=gcc-9 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email



Thanks,
Rong Chen


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.8.0-rc2-00057-g6e6fcbc27e7788"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.8.0-rc2 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-9 (Debian 9.3.0-14) 9.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=90300
CONFIG_LD_VERSION=234000000
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_SCHED_THERMAL_PRESSURE is not set
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_LSM is not set
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
CONFIG_X86_AMD_PLATFORM_DEVICE=y
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
# CONFIG_XEN_PV is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m
CONFIG_X86_THERMAL_VECTOR=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
CONFIG_PERF_EVENTS_AMD_POWER=m
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
CONFIG_ACPI_APEI_ERST_DEBUG=y
CONFIG_DPTF_POWER=m
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
CONFIG_PMIC_OPREGION=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32 is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m
CONFIG_KVM_AMD_SEV=y
CONFIG_KVM_MMU_AUDIT=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
# CONFIG_UNUSED_SYMBOLS is not set
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_WBT_MQ=y
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_ZSMALLOC_PGTABLE_MAPPING is not set
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
CONFIG_NF_LOG_NETDEV=m
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
# CONFIG_NETFILTER_XT_TARGET_LED is not set
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
CONFIG_NF_LOG_BRIDGE=m
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
# CONFIG_BRIDGE_MRP is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
# CONFIG_6LOWPAN_NHC is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
# CONFIG_BT_MRVL_SDIO is not set
# CONFIG_BT_MTKSDIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_RDMA is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_KUNIT_DRIVER_PE_TEST=y
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SKD is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_RDMA is not set
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_VMWARE_VMCI=m

#
# Intel MIC & related support
#
# CONFIG_INTEL_MIC_BUS is not set
# CONFIG_SCIF_BUS is not set
# CONFIG_VOP_BUS is not set
# end of Intel MIC & related support

# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
# CONFIG_SCSI_SAS_ATA is not set
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_ISCI is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
CONFIG_MD_CLUSTER=m
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
# CONFIG_AMD_XGBE is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_NET_VENDOR_AURORA is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
CONFIG_TIGON3=y
CONFIG_TIGON3_HWMON=y
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBE_IPSEC=y
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
CONFIG_SKGE=y
# CONFIG_SKGE_DEBUG is not set
# CONFIG_SKGE_GENESIS is not set
# CONFIG_SKY2 is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_MSCC_OCELOT_SWITCH is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
CONFIG_YELLOWFIN=m
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
CONFIG_8139CP=y
CONFIG_8139TOO=y
CONFIG_8139TOO_PIO=y
# CONFIG_8139TOO_TUNE_TWISTER is not set
# CONFIG_8139TOO_8129 is not set
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_THUNDER is not set
# CONFIG_MDIO_XPCS is not set
CONFIG_PHYLIB=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MII PHY device drivers
#
# CONFIG_ADIN_PHY is not set
# CONFIG_AMD_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_FIXED_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
CONFIG_USB_NET_CDCETHER=y
CONFIG_USB_NET_CDC_EEM=y
CONFIG_USB_NET_CDC_NCM=y
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
CONFIG_USB_NET_DM9601=y
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=y
CONFIG_USB_NET_SMSC95XX=y
CONFIG_USB_NET_GL620A=y
CONFIG_USB_NET_NET1080=y
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
CONFIG_USB_NET_CDC_SUBSET_ENABLE=y
CONFIG_USB_NET_CDC_SUBSET=y
# CONFIG_USB_ALI_M5632 is not set
# CONFIG_USB_AN2720 is not set
CONFIG_USB_BELKIN=y
CONFIG_USB_ARMLINUX=y
# CONFIG_USB_EPSON2888 is not set
# CONFIG_USB_KC2190 is not set
CONFIG_USB_NET_ZAURUS=y
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
CONFIG_USB_NET_INT51X1=y
CONFIG_USB_IPHETH=y
CONFIG_USB_SIERRA_NET=y
# CONFIG_USB_VL600 is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT7601U is not set
# CONFIG_MT76x0U is not set
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT76x2U is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
# CONFIG_MT7663U is not set
# CONFIG_MT7915E is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set
CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_HYPERV_NET is not set
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set
CONFIG_NVM=y
# CONFIG_NVM_PBLK is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK=m
CONFIG_SYNCLINKMP=m
CONFIG_SYNCLINK_GT=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
# CONFIG_TRACE_SINK is not set
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set
CONFIG_NVRAM=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
CONFIG_DEVPORT=y
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
# CONFIG_TCG_XEN is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=m
CONFIG_PINCTRL_BROXTON=m
CONFIG_PINCTRL_CANNONLAKE=m
CONFIG_PINCTRL_CEDARFORK=m
CONFIG_PINCTRL_DENVERTON=m
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_BT8XX is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_W1 is not set
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
# CONFIG_SENSORS_AMD_ENERGY is not set
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_DRIVETEMP is not set
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_MLX_WDT is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
CONFIG_SP5100_TCO=m
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_XEN_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_IR_IMON_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_IR_ENE=m
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_TTUSBIR is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SIR=m
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_TTM_DMA_PAGE_POOL=y
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_FBCON=y
CONFIG_DRM_GMA500=m
CONFIG_DRM_GMA600=y
CONFIG_DRM_GMA3600=y
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_GENERIC is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SONY is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_WHITELIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_XIRCOM is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
# CONFIG_INFINIBAND_EXP_LEGACY_VERBS_NEW_UAPI is not set
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_INFINIBAND_I40IW is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_BNXT_RE is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
# CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
# CONFIG_RTC_DRV_RV3029_HWMON is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MEM=m
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
# CONFIG_XEN_BALLOON is not set
CONFIG_XEN_DEV_EVTCHN=m
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
# CONFIG_XEN_PVCALLS_FRONTEND is not set
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
# end of Xen driver support

# CONFIG_GREYBUS is not set
# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_ALIENWARE_WMI is not set
# CONFIG_HUAWEI_WMI is not set
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_XIAOMI_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
# CONFIG_DELL_SMBIOS_SMM is not set
CONFIG_DELL_LAPTOP=m
CONFIG_DELL_RBTN=m
CONFIG_DELL_RBU=m
CONFIG_DELL_SMO8800=m
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
CONFIG_DELL_WMI_AIO=m
CONFIG_DELL_WMI_LED=m
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
CONFIG_HP_WIRELESS=m
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_INTEL_ATOMISP2_PM is not set
CONFIG_INTEL_HID_EVENT=m
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_MENLOW is not set
CONFIG_INTEL_OAKTRAIL=m
CONFIG_INTEL_VBTN=m
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_I2C_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
CONFIG_INTEL_PMC_CORE=m
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
CONFIG_PMC_ATOM=y
# CONFIG_MFD_CROS_EC is not set
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
CONFIG_HAVE_CLK=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
# CONFIG_GENERIC_PHY is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=m
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_QUOTACTL_COMPAT=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_PSTORE_BLK is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=y
CONFIG_CRYPTO_GLUE_HELPER_X86=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=y
CONFIG_CRYPTO_USER_API_AEAD=y
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=y
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
CONFIG_CRC7=m
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=m
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_DMA_VIRT_OPS=y
CONFIG_SWIOTLB=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_KASAN is not set
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_PERF_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_X86_DECODER_SELFTEST=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
# CONFIG_KUNIT_DEBUGFS is not set
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=m
# CONFIG_KUNIT_ALL_TESTS is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
# CONFIG_LINEAR_RANGES_TEST is not set
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='ltp'
	export testcase='ltp'
	export category='functional'
	export need_modules=true
	export need_memory='4G'
	export job_origin='/lkp-src/allot/cyclic:p1:linux-devel:devel-hourly/vm-snb/ltp-1hdd-part2.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='vm-snb-223'
	export tbox_group='vm-snb'
	export kconfig='x86_64-rhel-8.3'
	export nr_vm=64
	export submit_id='5f1b6220d3e994389b75f575'
	export job_file='/lkp/jobs/scheduled/vm-snb-223/ltp-1HDD-ext4-fs-03-debian-10.4-x86_64-20200603.cgz-6e6fcbc27e7788af54139c53537395d95560f2ef-20200725-14491-q8d1h6-26.yaml'
	export id='065bec73e2a4ca800d1cb6ad4c3c7827984bbf55'
	export queuer_version='/lkp-src'
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=8
	export memory='16G'
	export hdd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf'
	export swap_partitions='/dev/vdg'
	export need_kconfig='CONFIG_BLK_DEV_SD
CONFIG_SCSI
CONFIG_BLOCK=y
CONFIG_SATA_AHCI
CONFIG_SATA_AHCI_PLATFORM
CONFIG_ATA
CONFIG_PCI=y
CONFIG_BLK_DEV_LOOP
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_VCAN=m
CONFIG_IPV6_VTI=m
CONFIG_MINIX_FS=m
CONFIG_KVM_GUEST=y
CONFIG_EXT4_FS'
	export commit='6e6fcbc27e7788af54139c53537395d95560f2ef'
	export ssh_base_port=23032
	export enqueue_time='2020-07-25 06:35:13 +0800'
	export _id='5f1b622fd3e994389b75f587'
	export _rt='/result/ltp/1HDD-ext4-fs-03/vm-snb/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef'
	export user='lkp'
	export compiler='gcc-9'
	export head_commit='52947647b48e30541e3992c10027c87f1cca14e6'
	export base_commit='ba47d845d715a010f7b51f6f89bae32845e6acb7'
	export branch='linux-next/master'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/ltp/1HDD-ext4-fs-03/vm-snb/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/8'
	export scheduler_version='/lkp/lkp/.src-20200723-181920'
	export LKP_SERVER='inn'
	export arch='x86_64'
	export max_uptime=3600
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/vm-snb-223/ltp-1HDD-ext4-fs-03-debian-10.4-x86_64-20200603.cgz-6e6fcbc27e7788af54139c53537395d95560f2ef-20200725-14491-q8d1h6-26.yaml
ARCH=x86_64
kconfig=x86_64-rhel-8.3
branch=linux-next/master
commit=6e6fcbc27e7788af54139c53537395d95560f2ef
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/vmlinuz-5.8.0-rc2-00057-g6e6fcbc27e7788
max_uptime=3600
RESULT_ROOT=/result/ltp/1HDD-ext4-fs-03/vm-snb/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/8
LKP_SERVER=inn
selinux=0
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/modules.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20200709.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20200715.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20200715.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export repeat_to=192
	export schedule_notify_address=
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/vmlinuz-5.8.0-rc2-00057-g6e6fcbc27e7788'
	export dequeue_time='2020-07-25 06:36:04 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-snb-223/ltp-1HDD-ext4-fs-03-debian-10.4-x86_64-20200603.cgz-6e6fcbc27e7788af54139c53537395d95560f2ef-20200725-14491-q8d1h6-26.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_setup nr_hdd=1 $LKP_SRC/setup/disk

	run_setup fs='ext4' $LKP_SRC/setup/fs

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='fs-03' $LKP_SRC/tests/wrapper ltp
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper ltp
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time ltp.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--h22Fi9ANawrtbNPX
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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

--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ltp

2020-07-25 06:37:37 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2020-07-25 06:37:38 ./runltp -f fs-03
INFO: creating /lkp/benchmarks/ltp/output directory
INFO: creating /lkp/benchmarks/ltp/results directory
Checking for required user/group ids

'nobody' user id and group found.
'bin' user id and group found.
'daemon' user id and group found.
Users group found.
Sys group found.
Required users/groups exist.
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

/etc/os-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

uname:
Linux vm-snb-223 5.8.0-rc2-00057-g6e6fcbc27e7788 #1 SMP Sat Jul 25 03:48:24 CST 2020 x86_64 GNU/Linux

/proc/cmdline
ip=::::vm-snb-223::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/vm-snb-223/ltp-1HDD-ext4-fs-03-debian-10.4-x86_64-20200603.cgz-6e6fcbc27e7788af54139c53537395d95560f2ef-20200725-14491-q8d1h6-26.yaml ARCH=x86_64 kconfig=x86_64-rhel-8.3 branch=linux-next/master commit=6e6fcbc27e7788af54139c53537395d95560f2ef BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/vmlinuz-5.8.0-rc2-00057-g6e6fcbc27e7788 max_uptime=3600 RESULT_ROOT=/result/ltp/1HDD-ext4-fs-03/vm-snb/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e6fcbc27e7788af54139c53537395d95560f2ef/8 LKP_SERVER=inn selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_loglevel console=tty0 earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw rcuperf.shutdown=0 watchdog_thresh=60

Gnu C                 
Clang                 
Gnu make               4.2.1
util-linux             2.33.1
mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs, namespaces, assert, debug)
modutils               26
e2fsprogs              1.44.5
Linux C Library        > libc.2.28
Dynamic linker (ldd)   2.28
Procps                 3.3.15
Net-tools              2.10-alpha
iproute2               iproute2-ss190107
iputils                iputils-s20180629
ethtool                4.19
Kbd                    119:
Sh-utils               8.30
Modules Loaded         dm_mod bochs_drm drm_vram_helper drm_ttm_helper sr_mod intel_rapl_msr intel_rapl_common cdrom crct10dif_pclmul ttm crc32_pclmul crc32c_intel drm_kms_helper sg ipmi_devintf syscopyarea ipmi_msghandler sysfillrect ata_generic ghash_clmulni_intel sysimgblt ata_piix fb_sys_fops ppdev drm joydev libata parport_pc i2c_piix4 serio_raw parport ip_tables

free reports:
              total        used        free      shared  buff/cache   available
Mem:       16392760      391912    13736560       13136     2264288    13598128
Swap:             0           0           0

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       40 bits physical, 48 bits virtual
CPU(s):              8
On-line CPU(s) list: 0-7
Thread(s) per core:  1
Core(s) per socket:  1
Socket(s):           8
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               42
Model name:          Intel Xeon E312xx (Sandy Bridge)
Stepping:            1
CPU MHz:             2693.510
BogoMIPS:            5387.02
Hypervisor vendor:   KVM
Virtualization type: full
L1d cache:           32K
L1i cache:           32K
L2 cache:            4096K
L3 cache:            16384K
NUMA node0 CPU(s):   0-7
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx hypervisor lahf_lm cpuid_fault pti xsaveopt arat

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2438     -n 2438 -p -f /tmp/ltp-tLTMtcyMnS/alltests -l /lkp/benchmarks/ltp/results/LTP_RUN_ON-2020_07_25-06h_37m_38s.log  -C /lkp/benchmarks/ltp/output/LTP_RUN_ON-2020_07_25-06h_37m_38s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_ON-2020_07_25-06h_37m_38s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2020_07_25-06h_37m_38s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2020_07_25-06h_37m_38s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2020_07_25-06h_37m_38s.tconf
Running tests.......
<<<test_start>>>
tag=read_all_sys stime=1595659058
cmdline="read_all -d /sys -q -r 3"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
read_all.c:466: PASS: Finished reading files

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=0 corefile=no
cutime=21 cstime=111
<<<test_end>>>
<<<test_start>>>
tag=fs_racer stime=1595659059
cmdline="fs_racer.sh -t 5"
contacts=""
analysis=exit
<<<test_output>>>
408703
639912
1819208
"Cleaning up"
fs_racer_file_create.sh: no process found
fs_racer_dir_create.sh: no process found
fs_racer_file_rm.sh: no process found
fs_racer_file_rename.sh: no process found
fs_racer_file_link.sh: no process found
fs_racer_file_symlink.sh: no process found
fs_racer_file_list.sh: no process found
fs_racer_file_concat.sh: no process found
rm: cannot remove '/tmp/ltp-tLTMtcyMnS/race': Directory not empty
<<<execution_status>>>
initiation_status="ok"
duration=5 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=6
<<<test_end>>>
<<<test_start>>>
tag=quota_remount_test01 stime=1595659064
cmdline="quota_remount_test01.sh"
contacts=""
analysis=exit
<<<test_output>>>
quota_remount_test01    0  TINFO  :  Successfully mounted the File System
quota_remount_test01    0  TINFO  :  Successfully Created Quota Files
quota_remount_test01    0  TINFO  :  Successfully Turned on Quota
quota_remount_test01    0  TINFO  :  Successfully wrote to the filesystem
quota_remount_test01    0  TINFO  :  Successfully Remounted Read-Only FS
quota_remount_test01    0  TINFO  :  Successfully Remounted Read-Write FS
quota_remount_test01    0  TINFO  :  Usage successfully Changed after Remount
quota_remount_test01    1  TPASS  :  Quota on Remount Successfull
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=5 cstime=16
<<<test_end>>>
<<<test_start>>>
tag=isofs stime=1595659064
cmdline="isofs.sh"
contacts=""
analysis=exit
<<<test_output>>>
isofs 1 TINFO: timeout per run is 0h 5m 0s
isofs 1 TPASS: mkisofs -o isofs.iso -quiet /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -J /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -hfs -D /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -R /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -R -J /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -f -l -D -J -allow-leading-dots -R /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options
isofs 1 TPASS: mkisofs -o isofs.iso -quiet -allow-lowercase -allow-multidot -iso-level 3 -f -l -D -J -allow-leading-dots -R /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/files 2> /dev/null passed as expected
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,norock" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,nojoliet" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=1024,cruft" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=2048,nocompress" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=off,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=strict,map=acorn,gid=bin,uid=bin" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,check=relaxed,map=normal" options
mount: /tmp/ltp-tLTMtcyMnS/LTP_isofs.Gcw7Em5kli/mnt: WARNING: device write-protected, mounted read-only.
isofs 1 TPASS: mount/umount with "loop,block=512,unhide,session=2" options

Summary:
passed   77
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=5 termination_type=exited termination_id=0 corefile=no
cutime=96 cstime=181
<<<test_end>>>
<<<test_start>>>
tag=fs_fill stime=1595659069
cmdline="fs_fill"
contacts=""
analysis=exit
<<<test_output>>>
tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
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
tst_supported_fs_types.c:92: INFO: FUSE does support ntfs
tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
tst_test.c:1308: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
fs_fill.c:87: PASS: Got 10 ENOSPC runtime 1194ms
tst_test.c:1308: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file14
fs_fill.c:87: PASS: Got 17 ENOSPC runtime 1000ms
tst_test.c:1308: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file6
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file4
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
fs_fill.c:87: PASS: Got 73 ENOSPC runtime 1000ms
tst_test.c:1308: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file2
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file2
fs_fill.c:87: PASS: Got 111 ENOSPC runtime 566ms
tst_test.c:1308: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
fs_fill.c:87: PASS: Got 10 ENOSPC runtime 9454ms
tst_test.c:1308: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
fs_fill.c:103: INFO: Running 10 writer threads
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Cannot kill test processes!
Congratulation, likely test hit a kernel bug.
Exitting uncleanly...
<<<execution_status>>>
initiation_status="ok"
duration=385 termination_type=exited termination_id=1 corefile=no
cutime=53 cstime=1400
<<<test_end>>>
<<<test_start>>>
tag=binfmt_misc01 stime=1595659454
cmdline="binfmt_misc01.sh"
contacts=""
analysis=exit
<<<test_output>>>
binfmt_misc01 1 TINFO: timeout per run is 0h 5m 0s
binfmt_misc01 1 TPASS: Failed to register a binary type
binfmt_misc01 2 TPASS: Failed to register a binary type
binfmt_misc01 3 TPASS: Failed to register a binary type
binfmt_misc01 4 TPASS: Failed to register a binary type
binfmt_misc01 5 TPASS: Failed to register a binary type
binfmt_misc01 6 TPASS: Failed to register a binary type
binfmt_misc01 7 TPASS: Failed to register a binary type
binfmt_misc01 8 TPASS: Failed to register a binary type
binfmt_misc01 9 TPASS: Failed to register a binary type

Summary:
passed   9
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=0 corefile=no
cutime=11 cstime=21
<<<test_end>>>
<<<test_start>>>
tag=binfmt_misc02 stime=1595659455
cmdline="binfmt_misc02.sh"
contacts=""
analysis=exit
<<<test_output>>>
binfmt_misc02 1 TINFO: timeout per run is 0h 5m 0s
binfmt_misc02 1 TPASS: Recognise and unrecognise a binary type as expected
binfmt_misc02 2 TPASS: Recognise and unrecognise a binary type as expected
binfmt_misc02 3 TPASS: Recognise and unrecognise a binary type as expected
binfmt_misc02 4 TPASS: Recognise and unrecognise a binary type as expected
binfmt_misc02 5 TPASS: Fail to recognise a binary type
binfmt_misc02 6 TPASS: Fail to recognise a binary type

Summary:
passed   6
failed   0
skipped  0
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=13 cstime=25
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20200515-110-gd2768c84e

       ###############################################################

            Done executing testcases.
            LTP Version:  20200515-110-gd2768c84e
       ###############################################################


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--h22Fi9ANawrtbNPX--
