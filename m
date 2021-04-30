Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354236F7A9
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:16:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC2EC3C60C8
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 11:16:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3D753C19C3
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 03:48:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A1A022003AF
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 03:48:41 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB7AD613D8;
 Fri, 30 Apr 2021 01:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619747319;
 bh=R+Br+ByigmFx8GICfJM2Z3csLqKD2/XlBGg2xyizbhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eVOOZh0eukyoXkjzWytUDenxV7bez2Y4Eee3JLk/SP3d3cZkGnsKPlh9c31qRTXGa
 Xo7p8L7zrFJvJqa4E5yPr/1Q+rW9CxraFPFzKDJL6dqGSdz/3IYI7dg6h2MNH+bKRL
 lTIwIvg+o+EIYDaru1B4gBy8J6darKe8151Sd3MB/0HNJlZueNjzg0ayIJKoOnTlE/
 KNG3P4A+UCmSGtuShws4x1ZAxmn4u8oeq670kUfiTNYryOwc65/0pnRU+o6qKMKWI1
 IHdHLaQGXKWJOon49HwGe9EP2cBBpPv/Z0b7yskfG9G0iBXtwzVwe0ykIaRATaJn9b
 DKlYWvwGZI5dA==
Date: Fri, 30 Apr 2021 09:48:23 +0800
From: Gao Xiang <xiang@kernel.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <20210430014823.GA3132@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20210308072510.GA902@xsang-OptiPlex-9020> <87h7llhnfe.fsf@suse.de>
 <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
 <20210309040144.GH3479805@casper.infradead.org>
 <c84bf5c9-501e-6c25-1728-a7c6281093fd@oppo.com>
 <YEkw0J9VEg66AgIt@google.com>
 <e2009f2d-253d-264c-53ca-fa644897a952@huawei.com>
 <cf28837a-9558-b00c-bca3-601a70b752ea@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf28837a-9558-b00c-bca3-601a70b752ea@oppo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 30 Apr 2021 11:16:14 +0200
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
 Huang Jianan <huangjianan@oppo.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Apr 29, 2021 at 09:08:42PM +0800, Weichao Guo wrote:
> 
> On 2021/3/23 17:04, Chao Yu wrote:
> > On 2021/3/11 4:49, Jaegeuk Kim wrote:
> > > On 03/10, Huang Jianan wrote:
> > > > Hi Richard,
> > > > 
> > > > On 2021/3/9 12:01, Matthew Wilcox wrote:
> > > > > On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
> > > > > > Hi Richard,
> > > > > > 
> > > > > > On 2021/3/8 19:53, Richard Palethorpe wrote:
> > > > > > > Hello,
> > > > > > > 
> > > > > > > > kern  :err   : [  187.461914] F2FS-fs (sda1):
> > > > > > > > Swapfile does not align to section
> > > > > > > > commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> > > > > > > > Author: huangjianan@oppo.com <huangjianan@oppo.com>
> > > > > > > > Date:   Mon Mar 1 12:58:44 2021 +0800
> > > > > > > >        f2fs: check if swapfile is section-alligned
> > > > > > > >        If the swapfile isn't created by pin and
> > > > > > > > fallocate, it can't be
> > > > > > > >        guaranteed section-aligned, so it may be
> > > > > > > > selected by f2fs gc. When
> > > > > > > >        gc_pin_file_threshold is reached, the
> > > > > > > > address of swapfile may change,
> > > > > > > >        but won't be synchronized to swap_extent,
> > > > > > > > so swap will write to wrong
> > > > > > > >        address, which will cause data corruption.
> > > > > > > >        Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > > > > > > >        Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > > > > > > >        Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > > > > > > >        Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > > The test uses fallocate to preallocate the swap file
> > > > > > > and writes zeros to
> > > > > > > it. I'm not sure what pin refers to?
> > > > > > 'pin' refers to pinned file feature in F2FS, the
> > > > > > LBA(Logical Block Address)
> > > > > > of a file is fixed after pinned. Without this operation
> > > > > > before fallocate,
> > > > > > the LBA may not align with section(F2FS GC unit), some
> > > > > > LBA of the file may
> > > > > > be changed by F2FS GC in some extreme cases.
> > > > > > 
> > > > > > For this test case, how about pin the swap file before
> > > > > > fallocate for F2FS as
> > > > > > following:
> > > > > > 
> > > > > > ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);
> > > > > No special ioctl should be needed.  f2fs_swap_activate()
> > > > > should pin the
> > > > > file, just like it converts inline inodes and disables compression.
> > > > 
> > > > Now f2fs_swap_activate() will pin the file. The problem is that when
> > > > f2fs_swap_activate()
> > > > 
> > > > is executed, the file has been created and may not be section-aligned.
> > > > 
> > > > So I think it would be better to consider aligning the swapfile during
> > > > f2fs_swap_activate()?
> > > 
> > > Does it make sense to reallocate blocks like
> > > in f2fs_swap_activate(),
> > >     set_inode_flag(inode, FI_PIN_FILE);
> > >     truncate_pagecache(inode, 0);
> > >     f2fs_truncate_blocks(inode, 0, true);
> > 
> > It will corrupt swap header info while relocating whole swapfile...
> How about back up the header page, and recover it after expand_inode_data()
> ?

That sounds somewhat hacky, since I don't think fs should take care of swap
detailed format.

My premature suggesttion, how about
 a) for non-pinned files, f2fs_swap_activate() pins the file and move
    (reallocate) pre-fallocated data blocks if needed;
 b) for already pinned files and not section-aligned when
    f2fs_swap_activate(), just reject it.

I think it would pass the test since pinned operation is f2fs-specific only.
Or am I still missing something?

Thanks,
Gao Xiang

> > 
> > >     expand_inode_data();
> > > .
> > > 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
