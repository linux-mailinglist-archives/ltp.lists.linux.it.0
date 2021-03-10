Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF663388A8
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 10:29:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44EB23C6835
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 10:29:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4CDC03C1A9E
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 21:49:28 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AAD4F140120A
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 21:49:27 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 208F664FC6;
 Wed, 10 Mar 2021 20:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615409362;
 bh=8Lubpt2RtIi1IKD8AnfhhcFsPyM8ZlZWqojFGL66AEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQhX5z72m4tWNc1wPcJL4+eNCCqDixQzxar0vIqh+ktQmQmEMsYW2KARrqaR/sQz4
 xpu0uPizxIRDEbDLwNJkkihaImSz+OqHzM6htvp4AHC9W4ll/3jEg2WbWoZ4tyAOl7
 XkRO6Dg4iZygdESiVlzkh5G4V3li+h3I0Uc84TN4rj3JWGIf9McWsQP4FCfYvLSofw
 5I86XkYXRXb76K/gPmswQCXUYxkai7RHD5vZ+HhgNvAVVe3QWJcbOZ2uzdhuntCUMp
 kAy8FBMwT8QmYbaoMNw70iSw8ElSfrOJ14GwFobOzWND+101iubMUZkqpDuoL4TXua
 2uqd9ngJtrxig==
Date: Wed, 10 Mar 2021 12:49:20 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Huang Jianan <huangjianan@oppo.com>
Message-ID: <YEkw0J9VEg66AgIt@google.com>
References: <20210308072510.GA902@xsang-OptiPlex-9020> <87h7llhnfe.fsf@suse.de>
 <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
 <20210309040144.GH3479805@casper.infradead.org>
 <c84bf5c9-501e-6c25-1728-a7c6281093fd@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c84bf5c9-501e-6c25-1728-a7c6281093fd@oppo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 12 Mar 2021 10:28:59 +0100
Subject: Re: [LTP] [f2fs] 02eb84b96b: ltp.swapon03.fail
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
Cc: lkp@intel.com, lkp@lists.01.org, Chao Yu <yuchao0@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Weichao Guo <guoweichao@oppo.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 03/10, Huang Jianan wrote:
> Hi Richard,
> 
> On 2021/3/9 12:01, Matthew Wilcox wrote:
> > On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
> > > Hi Richard,
> > > 
> > > On 2021/3/8 19:53, Richard Palethorpe wrote:
> > > > Hello,
> > > > 
> > > > > kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not align to section
> > > > > commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> > > > > Author: huangjianan@oppo.com <huangjianan@oppo.com>
> > > > > Date:   Mon Mar 1 12:58:44 2021 +0800
> > > > >       f2fs: check if swapfile is section-alligned
> > > > >       If the swapfile isn't created by pin and fallocate, it can't be
> > > > >       guaranteed section-aligned, so it may be selected by f2fs gc. When
> > > > >       gc_pin_file_threshold is reached, the address of swapfile may change,
> > > > >       but won't be synchronized to swap_extent, so swap will write to wrong
> > > > >       address, which will cause data corruption.
> > > > >       Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > > > >       Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > > > >       Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > > > >       Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > The test uses fallocate to preallocate the swap file and writes zeros to
> > > > it. I'm not sure what pin refers to?
> > > 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block Address)
> > > of a file is fixed after pinned. Without this operation before fallocate,
> > > the LBA may not align with section(F2FS GC unit), some LBA of the file may
> > > be changed by F2FS GC in some extreme cases.
> > > 
> > > For this test case, how about pin the swap file before fallocate for F2FS as
> > > following:
> > > 
> > > ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);
> > No special ioctl should be needed.  f2fs_swap_activate() should pin the
> > file, just like it converts inline inodes and disables compression.
> 
> Now f2fs_swap_activate() will pin the file. The problem is that when
> f2fs_swap_activate()
> 
> is executed, the file has been created and may not be section-aligned.
> 
> So I think it would be better to consider aligning the swapfile during
> f2fs_swap_activate()?

Does it make sense to reallocate blocks like
in f2fs_swap_activate(),
	set_inode_flag(inode, FI_PIN_FILE);
	truncate_pagecache(inode, 0);
	f2fs_truncate_blocks(inode, 0, true);
	expand_inode_data();

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
