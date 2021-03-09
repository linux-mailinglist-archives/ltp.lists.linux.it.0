Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D928331DC3
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 05:02:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0E123C655C
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 05:02:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EB9BB3C176A
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 05:02:46 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 024CB6009EC
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 05:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iM+/dn+YhIAlWAYAVQcoqGr6ZVF7ceWPf6AbVrGnBfA=; b=OUj945fp0c25Ck1x1CORIjI7y6
 uxhLXajEd83UoACqAIgCF/aJsafBbA3E/oQxWukhEUctxbGmAFCJxd1UETGApes1n/nBXjkTCOxeF
 KvlOQzcwbKscc3/4essTpANC3nKPpZBq3Nk5G+zLCmWKBYA1wnh+pkJfOVwsa87mksG4tCv5lMwUo
 SLh+TtNEb5/W4aJE5T0m4Mf4FlysP1hlG5LPoUJthuk793Ckev5Dr2je4AsMRb1FKF4xOhp3M39TY
 SAOO61+7sbjuCE8nZyUCAkGdDxur8vlS0cplB9nFuFUgenR3eHzQW3dmWrwiOlScZSRRu7nx5JIvj
 S0bINp6w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lJTZ2-00HLCQ-Bk; Tue, 09 Mar 2021 04:01:53 +0000
Date: Tue, 9 Mar 2021 04:01:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Weichao Guo <guoweichao@oppo.com>
Message-ID: <20210309040144.GH3479805@casper.infradead.org>
References: <20210308072510.GA902@xsang-OptiPlex-9020> <87h7llhnfe.fsf@suse.de>
 <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
 LKML <linux-kernel@vger.kernel.org>,
 "huangjianan@oppo.com" <huangjianan@oppo.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
> Hi Richard,
> 
> On 2021/3/8 19:53, Richard Palethorpe wrote:
> > Hello,
> > 
> > > kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not align to section
> > > commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> > > Author: huangjianan@oppo.com <huangjianan@oppo.com>
> > > Date:   Mon Mar 1 12:58:44 2021 +0800
> > >      f2fs: check if swapfile is section-alligned
> > >      If the swapfile isn't created by pin and fallocate, it can't be
> > >      guaranteed section-aligned, so it may be selected by f2fs gc. When
> > >      gc_pin_file_threshold is reached, the address of swapfile may change,
> > >      but won't be synchronized to swap_extent, so swap will write to wrong
> > >      address, which will cause data corruption.
> > >      Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > >      Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > >      Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > >      Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > The test uses fallocate to preallocate the swap file and writes zeros to
> > it. I'm not sure what pin refers to?
> 
> 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block Address)
> of a file is fixed after pinned. Without this operation before fallocate,
> the LBA may not align with section(F2FS GC unit), some LBA of the file may
> be changed by F2FS GC in some extreme cases.
> 
> For this test case, how about pin the swap file before fallocate for F2FS as
> following:
> 
> ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);

No special ioctl should be needed.  f2fs_swap_activate() should pin the
file, just like it converts inline inodes and disables compression.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
