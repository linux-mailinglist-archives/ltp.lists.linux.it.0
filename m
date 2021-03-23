Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D8345A4E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 10:04:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10B4C3C32F8
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 10:04:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 466E03C0788
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 10:04:46 +0100 (CET)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BE748200B62
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 10:04:43 +0100 (CET)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F4QPd0v2WzkddY;
 Tue, 23 Mar 2021 17:03:01 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 23 Mar
 2021 17:04:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Huang Jianan <huangjianan@oppo.com>
References: <20210308072510.GA902@xsang-OptiPlex-9020>
 <87h7llhnfe.fsf@suse.de> <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
 <20210309040144.GH3479805@casper.infradead.org>
 <c84bf5c9-501e-6c25-1728-a7c6281093fd@oppo.com> <YEkw0J9VEg66AgIt@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e2009f2d-253d-264c-53ca-fa644897a952@huawei.com>
Date: Tue, 23 Mar 2021 17:04:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YEkw0J9VEg66AgIt@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: lkp@intel.com, lkp@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kernel test robot <oliver.sang@intel.com>, Weichao Guo <guoweichao@oppo.com>,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2021/3/11 4:49, Jaegeuk Kim wrote:
> On 03/10, Huang Jianan wrote:
>> Hi Richard,
>>
>> On 2021/3/9 12:01, Matthew Wilcox wrote:
>>> On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
>>>> Hi Richard,
>>>>
>>>> On 2021/3/8 19:53, Richard Palethorpe wrote:
>>>>> Hello,
>>>>>
>>>>>> kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not align to section
>>>>>> commit 02eb84b96bc1b382dd138bf60724edbefe77b025
>>>>>> Author: huangjianan@oppo.com <huangjianan@oppo.com>
>>>>>> Date:   Mon Mar 1 12:58:44 2021 +0800
>>>>>>        f2fs: check if swapfile is section-alligned
>>>>>>        If the swapfile isn't created by pin and fallocate, it can't be
>>>>>>        guaranteed section-aligned, so it may be selected by f2fs gc. When
>>>>>>        gc_pin_file_threshold is reached, the address of swapfile may change,
>>>>>>        but won't be synchronized to swap_extent, so swap will write to wrong
>>>>>>        address, which will cause data corruption.
>>>>>>        Signed-off-by: Huang Jianan <huangjianan@oppo.com>
>>>>>>        Signed-off-by: Guo Weichao <guoweichao@oppo.com>
>>>>>>        Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>>>>        Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> The test uses fallocate to preallocate the swap file and writes zeros to
>>>>> it. I'm not sure what pin refers to?
>>>> 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block Address)
>>>> of a file is fixed after pinned. Without this operation before fallocate,
>>>> the LBA may not align with section(F2FS GC unit), some LBA of the file may
>>>> be changed by F2FS GC in some extreme cases.
>>>>
>>>> For this test case, how about pin the swap file before fallocate for F2FS as
>>>> following:
>>>>
>>>> ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);
>>> No special ioctl should be needed.  f2fs_swap_activate() should pin the
>>> file, just like it converts inline inodes and disables compression.
>>
>> Now f2fs_swap_activate() will pin the file. The problem is that when
>> f2fs_swap_activate()
>>
>> is executed, the file has been created and may not be section-aligned.
>>
>> So I think it would be better to consider aligning the swapfile during
>> f2fs_swap_activate()?
> 
> Does it make sense to reallocate blocks like
> in f2fs_swap_activate(),
> 	set_inode_flag(inode, FI_PIN_FILE);
> 	truncate_pagecache(inode, 0);
> 	f2fs_truncate_blocks(inode, 0, true);

It will corrupt swap header info while relocating whole swapfile...

> 	expand_inode_data();
> .
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
