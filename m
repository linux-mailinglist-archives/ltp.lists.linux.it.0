Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AE22E956
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 11:43:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA6903C26BF
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 11:43:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2AC633C0886
 for <ltp@lists.linux.it>; Sun, 26 Jul 2020 10:42:32 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 21DA060102E
 for <ltp@lists.linux.it>; Sun, 26 Jul 2020 10:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595752948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=azwHWIF3wj8FPAYKzz9cwzkMxmerN/l8NWDr8mln7RM=;
 b=GvnXlw6ctgZ7SuK10fggKZG4btSos8EIyugFwGQHQzCEraNIuQ9XkT3mfVKz68AfDtHhst
 +6apdJje84RpCXJFtGiUNvbdmBVljS+A2kqqWV6aQOZLEfLl/nsf+/1kF1o57r78MKqNy7
 BR4++brhIeZurHk0kUJgAcmfW5YA64o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-l6x-CtTqM2mhlg0Z57qzFQ-1; Sun, 26 Jul 2020 04:42:24 -0400
X-MC-Unique: l6x-CtTqM2mhlg0Z57qzFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA61107ACCA;
 Sun, 26 Jul 2020 08:42:22 +0000 (UTC)
Received: from T590 (ovpn-12-72.pek2.redhat.com [10.72.12.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BED115F1EB;
 Sun, 26 Jul 2020 08:42:13 +0000 (UTC)
Date: Sun, 26 Jul 2020 16:42:09 +0800
From: Ming Lei <ming.lei@redhat.com>
To: kernel test robot <rong.a.chen@intel.com>
Message-ID: <20200726084209.GA1110104@T590>
References: <20200726075511.GI1850@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726075511.GI1850@shao2-debian>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 27 Jul 2020 11:43:03 +0200
Subject: Re: [LTP] [blk] 6e6fcbc27e: ltp.fs_fill.fail
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sun, Jul 26, 2020 at 03:55:11PM +0800, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: 6e6fcbc27e7788af54139c53537395d95560f2ef ("blk-mq: support batching dispatch in case of io")
> https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-5.9/drivers
> 
> 
> in testcase: ltp
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: ext4
> 	test: fs-03
> 
> test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> 
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> 
> 
> <<<test_start>>>
> tag=fs_fill stime=1595659069
> cmdline="fs_fill"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
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
> tst_supported_fs_types.c:92: INFO: FUSE does support ntfs
> tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
> tst_test.c:1308: INFO: Testing on ext2
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> fs_fill.c:87: PASS: Got 10 ENOSPC runtime 1194ms
> tst_test.c:1308: INFO: Testing on ext3
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file14
> fs_fill.c:87: PASS: Got 17 ENOSPC runtime 1000ms
> tst_test.c:1308: INFO: Testing on ext4
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
> mke2fs 1.44.5 (15-Dec-2018)
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file6
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file6
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file1
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file6
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file6
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file4
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file3
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file3
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file3
> fs_fill.c:87: PASS: Got 73 ENOSPC runtime 1000ms
> tst_test.c:1308: INFO: Testing on xfs
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file2
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file1
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file1
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file1
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file2
> fs_fill.c:87: PASS: Got 111 ENOSPC runtime 566ms
> tst_test.c:1308: INFO: Testing on btrfs
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread1/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread5/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread2/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread4/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread7/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread10/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread3/file0
> fs_fill.c:53: INFO: Unlinking mntpoint/thread9/file0
> tst_fill_fs.c:39: INFO: open(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread6/file0
> tst_fill_fs.c:59: INFO: write(): ENOSPC (28)
> fs_fill.c:53: INFO: Unlinking mntpoint/thread8/file0
> fs_fill.c:87: PASS: Got 10 ENOSPC runtime 9454ms
> tst_test.c:1308: INFO: Testing on vfat
> tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
> tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
> fs_fill.c:103: INFO: Running 10 writer threads
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Test timeouted, sending SIGKILL!
> Cannot kill test processes!
> Congratulation, likely test hit a kernel bug.
> Exitting uncleanly...
> <<<execution_status>>>
> initiation_status="ok"
> duration=385 termination_type=exited termination_id=1 corefile=no
> cutime=53 cstime=1400
> <<<test_end>>>
> 
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-5.8.0-rc2-00057-g6e6fcbc27e7788 .config
> 	make HOSTCC=gcc-9 CC=gcc-9 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
> 	make HOSTCC=gcc-9 CC=gcc-9 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email

Can you share what the exact ltp test fails?

Also I don't see any failure log in dmesg.xz.

Thanks,
Ming


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
