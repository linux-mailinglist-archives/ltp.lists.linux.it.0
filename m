Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C730D7E2
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 11:46:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B01DE3C5E24
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Feb 2021 11:46:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5D9F83C2682
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 11:46:05 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 43E4620096A
 for <ltp@lists.linux.it>; Wed,  3 Feb 2021 11:46:03 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="104146912"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Feb 2021 18:46:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 491514CE546D;
 Wed,  3 Feb 2021 18:45:57 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Feb 2021 18:45:56 +0800
Message-ID: <601A7EF7.2070603@cn.fujitsu.com>
Date: Wed, 3 Feb 2021 18:46:15 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1611654925-8994-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <YBLaQvt2g3z8Xy1A@yuki.lan> <601A713F.7020301@cn.fujitsu.com>
In-Reply-To: <601A713F.7020301@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 491514CE546D.AC02C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/3] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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

Hi Cyril
> Hi Cyril
>> Hi!
>>> "The number of bytes in blocks currently allocated using mmap(2).".
>>> For allocations greater than or equal to 128K and that can't be
>>> satisfied from
>>> the free list, the memory-allocation functions employ mmap(2) instead
>>> of increasing
>>> the program break using sbrk(2).
>>>
>>> In this case, we test 20k size to use sbrk and 128k size to use mmap.
>>
>> The size when glibc uses mmap() instead of heap is libc implementation
>> detail. I'm not sure that we want to have that value hardcoded in a
>> LTP test.
> Here has some wrong description, I use "MAX(info.fordblks, 131072) +
> reuse_size" size to test instead of 128K.
>>
>> Also glibc documentation says:
>>
>> The default value is set to `131072' bytes and the threshold is adjusted
>> dynamically to suit the allocation patterns of the program.
>
> IMO, the threshold is adjusted dynamically because of two things if we
> don't use mallopt with M_MMAP_THRESHOLD
> 1) fordblks; /* Total free space (bytes) */
> 2) the previous mmap regin space
>
>
>  From mallopt man-page for M_MMAP_THRESHOLD option, it said
> " For allocations greater than or equal to the limit specified (in
> bytes) by M_MMAP_THRESHOLD that can't be satisfied from the free list,
> the memory-allocation functions employ mmap(2) instead of increasing the
> program break using sbrk(2)."
>
> So I use this code "MAX(info.fordblks, 131072)" to get the right value
> to trigger mmap.
>
> mallopt man-page for M_MMAP_THRESHOLD option also said "On the
> other hand, there are some disadvantages to the use of mmap(2):
> deallocated space is not placed on the free list for reuse by later
> allocations; " .
>
> I guess it means mmap area is not counted int info.fordblks(free list )
> and can be used for the next sbrk(increase the heap). That is why I add
> reuse_size when I get the corrcet mmap size. Or, I miss something?
>
> If we can't ensure it , I will remove this patch. Or, other advise?
For glibc malloc mmap dynamic threshhold , here[1] has a detailed 
description.

[1]https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/malloc.c;h=1f4bbd8edf8b97701b779f183475565c7d0a6762;hb=d5c8f98c5e6de207790d3e9edadf5bda4aa2521f#l1043
>
>
> Best Regards
> Yang Xu
>
>>
>
>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
