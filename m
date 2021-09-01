Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C69483FD179
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 04:46:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CEEF3C9A65
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 04:46:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 433D13C2A68
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 04:46:28 +0200 (CEST)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 408E020035C
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 04:46:24 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="282323653"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="282323653"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:46:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; d="scan'208";a="541298153"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.41])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:46:19 -0700
Date: Wed, 1 Sep 2021 11:03:57 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20210901030357.GD14661@xsang-OptiPlex-9020>
References: <20210825051710.GA5358@xsang-OptiPlex-9020>
 <cf358b73cbda90fd6c023f3a59a8df94698cf0bc.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf358b73cbda90fd6c023f3a59a8df94698cf0bc.camel@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [fs]  f7e33bdbd6: ltp.ftruncate04_64.fail
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
Cc: lkp@lists.01.org, LKML <linux-kernel@vger.kernel.org>, ltp@lists.linux.it,
 lkp@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jeff,

On Wed, Aug 25, 2021 at 06:32:38AM -0400, Jeff Layton wrote:
> On Wed, 2021-08-25 at 13:17 +0800, kernel test robot wrote:
> > 
> > Greeting,
> > 
> > FYI, we noticed the following commit (built with gcc-9):
> > 
> > commit: f7e33bdbd6d1bdf9c3df8bba5abcf3399f957ac3 ("fs: remove mandatory file locking support")
> > https://git.kernel.org/cgit/linux/kernel/git/jlayton/linux.git locks-next
> > 
> > 
> > in testcase: ltp
> > version: ltp-x86_64-14c1f76-1_20210821
> > with following parameters:
> > 
> > 	disk: 1HDD
> > 	fs: ext4
> > 	test: syscalls-07
> > 	ucode: 0xe2
> > 
> > test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> > test-url: http://linux-test-project.github.io/
> > 
> > 
> > on test machine: 4 threads Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz with 32G memory
> > 
> > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> > 
> > 
> > 
> 
> [...]
> 
> > <<<test_start>>>
> > tag=ftruncate04_64 stime=1629792639
> > cmdline="ftruncate04_64"
> > contacts=""
> > analysis=exit
> > <<<test_output>>>
> > tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
> > tst_test.c:916: TINFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
> > mke2fs 1.44.5 (15-Dec-2018)
> > tst_test.c:1348: TINFO: Timeout per run is 0h 25m 00s
> > ftruncate04.c:116: TINFO: Child locks file
> > ftruncate04.c:49: TFAIL: ftruncate() offset before lock succeeded unexpectedly
> > ftruncate04.c:49: TFAIL: ftruncate() offset in lock succeeded unexpectedly
> > ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> > ftruncate04.c:127: TINFO: Child unlocks file
> > ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
> > ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
> > ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
> > 
> > Summary:
> > passed   4
> > failed   2
> > broken   0
> > skipped  0
> > warnings 0
> 
> I think this failed because of the above, which is expected now that we
> ignore the "mand" mount option (and mandatory locking support is gone).
> 
> Oliver, you may need to update the expected test output for this test.

Thanks for the information! we will do the corresponding change ASAP

> 
> Thanks,
> -- 
> Jeff Layton <jlayton@kernel.org>
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
