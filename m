Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0220EF8C89
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:12:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B72D03C24DB
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 11:12:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8686C3C0638
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:40:49 +0100 (CET)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32E846019EE
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 09:40:46 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id ADE29583;
 Tue, 12 Nov 2019 03:40:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 12 Nov 2019 03:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 0sw6NGVNSkMgugQB3SyMJOPI1XuB+MQ57NtIWRdvmh0=; b=jLrpEgHMQDJmqgEO
 Iw7m1guQw8IEJ/GXEaJwspOhlyGN75yT8mZ2wc5X1spVZVpbEP7HcmqbZgMghO6a
 OVOe58dj2oql5KphHK0/xOJmpN5uzsjkEUc7m6C3OvhILzxmwmI8uL/h/Vrm7fvi
 gC75BYrNEQ3iZMA8e061LulRMHHgxl9rxYvdQzBqoMsXFSvOlnPlcWmZTHbJtDDj
 lVKE7VlFBcrNFSgknOVlhe1GCe0w3tqEIgaCg+rvx6rBPBtSjwFZewrjSO0WdKzt
 mdTBtK0kO5TtMgaZimq8hidz4tpoMSglYKj2GHK7qqSA1zheiun9Hu3TUVL65zR1
 bSOJWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0sw6NGVNSkMgugQB3SyMJOPI1XuB+MQ57NtIWRdvm
 h0=; b=aRzBUiI/tA+Qob4M+kxeus2lVPy6N/ryKIpMx00lID4e+taSOAOQoPrac
 xn/7pFvWcASA85EFLczzaTQeQKzXbDz4NXVX9uWWATex9o/bB2zGCqYeT1+GiLYS
 BoFx61gdI0iGRak8oQd5n+1pXGaoHmu/Jg6nn+fWclEqxDYKtNDuztM4JTL66Jno
 qudNJyjEQE2WvPPptVzuLmmzGgMkldfaSRjUBnNTpIPQ6ElDbcxNo6ybt+VDIrlk
 2/jWWsrYrUpE7VoAuPG/TzqqNgaQrwZz5VsHkbIVoBWGweo81gMfK42CUzLcDwBw
 o9c9XPpPTPcS0vdYIBpnGVtZ8KU5g==
X-ME-Sender: <xms:CnDKXSYeIN7i1IY1Y0BJ_NhoVfKam5B-K57Rq1iugTuvfTCmZaf5YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvkedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepkffuhffvffgjfhgtofgg
 gfesthejredtredtjeenucfhrhhomhepkfgrnhcumfgvnhhtuceorhgrvhgvnhesthhhvg
 hmrgifrdhnvghtqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhkmhhsghdruggv
 vhdpghhithhhuhgsrdhiohdpghhithhhuhgsrdgtohhmnecukfhppeduudekrddvtdekrd
 dukeelrddukeenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnhesthhhvghmrgif
 rdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:CnDKXdkKPfBB0yCkvuNMSEN1DLWCUC6QCs4PSiHkXfU6viJ7JJwAWQ>
 <xmx:CnDKXYhWQ9mkK7bS2Pe00lhpYDXwvmfj6-hBy5XsFkGZw90vwuqgzg>
 <xmx:CnDKXfSNQhm0bPpYs63wUqtCos0shJKXE3TscG3vcMkNBVFKwwhI_Q>
 <xmx:C3DKXZx7_RTRm5-j87zoNsbMfdh04H4HH6S3sA3Byzcrqau1LK_rdQ>
Received: from centos8 (unknown [118.208.189.18])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65ECF3060060;
 Tue, 12 Nov 2019 03:40:39 -0500 (EST)
Message-ID: <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
From: Ian Kent <raven@themaw.net>
To: kernel test robot <rong.a.chen@intel.com>
Date: Tue, 12 Nov 2019 16:39:50 +0800
In-Reply-To: <20191111010022.GH29418@shao2-debian>
References: <20191111010022.GH29418@shao2-debian>
X-Mailer: Evolution 3.28.5 (3.28.5-6.el8) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:12:22 +0100
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 lkp@lists.01.org, Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-11-11 at 09:00 +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: 73e5fff98b6446de1490a8d7809121b0108d49f4 ("xfs: switch to use
> the new mount-api")
> https://git.kernel.org/cgit/fs/xfs/xfs-linux.git xfs-5.5-merge
> 
> in testcase: ltp
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: xfs
> 	test: fs-03
> 
> test-description: The LTP testsuite contains a collection of tools
> for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> 
> 
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp
> 2 -m 8G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> 
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> [  135.976643] LTP: starting fs_fill
> [  135.993912] /dev/zero: Can't open blockdev

I've looked at the github source but I don't see how to find out what
command was used when this error occurred so I don't know even how to
start to work out what might have caused this.

Can you help me to find the test script source please.

> [  136.020327] raid6: sse2x4   gen() 14769 MB/s
> [  136.037281] raid6: sse2x4   xor()  8927 MB/s
> [  136.054236] raid6: sse2x2   gen() 12445 MB/s
> [  136.071397] raid6: sse2x2   xor()  7441 MB/s
> [  136.089313] raid6: sse2x1   gen() 10089 MB/s
> [  136.107334] raid6: sse2x1   xor()  7201 MB/s
> [  136.108198] raid6: using algorithm sse2x4 gen() 14769 MB/s
> [  136.109320] raid6: .... xor() 8927 MB/s, rmw enabled
> [  136.111966] raid6: using ssse3x2 recovery algorithm
> [  136.122740] xor: automatically using best checksumming
> function   avx       
> [  136.187956] Btrfs loaded, crc32c=crc32c-intel
> [  136.216946] fuse: init (API version 7.31)
> [  136.327654] EXT4-fs (loop0): mounting ext2 file system using the
> ext4 subsystem
> [  136.334974] EXT4-fs (loop0): mounted filesystem without journal.
> Opts: (null)
> [  136.338933] Mounted ext2 file system at /tmp/ltp-
> bl4kncm4Ti/g2oJfj/mntpoint supports timestamps until 2038
> (0x7fffffff)
> [  137.897422] EXT4-fs (loop0): mounting ext3 file system using the
> ext4 subsystem
> [  137.908242] EXT4-fs (loop0): mounted filesystem with ordered data
> mode. Opts: (null)
> [  137.910111] Mounted ext3 file system at /tmp/ltp-
> bl4kncm4Ti/g2oJfj/mntpoint supports timestamps until 2038
> (0x7fffffff)
> 
> 
> To reproduce:
> 
>         # build kernel
> 	cd linux
> 	cp config-5.4.0-rc3-00117-g73e5fff98b644 .config
> 	make HOSTCC=gcc-7 CC=gcc-7 ARCH=x86_64 olddefconfig prepare
> modules_prepare bzImage modules
> 	make HOSTCC=gcc-7 CC=gcc-7 ARCH=x86_64 INSTALL_MOD_PATH=<mod-
> install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> 
> 
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-
> script is attached in this email
> 
> 
> 
> Thanks,
> Rong Chen
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
