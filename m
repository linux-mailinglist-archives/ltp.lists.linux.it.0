Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9EA97478
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:14:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83AB33C1CFB
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:14:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7C8EC3C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:14:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 9F51A600C2B
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:14:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,412,1559491200"; d="scan'208";a="73995725"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2019 16:14:52 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 252674CE03E7;
 Wed, 21 Aug 2019 16:14:45 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 21 Aug 2019 16:14:48 +0800
Message-ID: <5D5CFD75.3050506@cn.fujitsu.com>
Date: Wed, 21 Aug 2019 16:14:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190815083630.26975-1-pvorel@suse.cz>
 <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
 <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
 <5D5BB8DC.6070900@cn.fujitsu.com>
 <CAEemH2d_CKOwE3mHEXZKi1BkMBw5dn95aMJtkrSRciH2PU6NJA@mail.gmail.com>
In-Reply-To: <CAEemH2d_CKOwE3mHEXZKi1BkMBw5dn95aMJtkrSRciH2PU6NJA@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 252674CE03E7.AC244
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/fs.h: Replace MAX_LFS_FILESIZE constant with
 own implementation
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

on 2019/08/21 15:27, Li Wang wrote:

> On Tue, Aug 20, 2019 at 5:10 PM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
> ...
>>> But I don't understand why to define MAX_OFF as (MAX_LEN - MIN_OFF),
>>> the failure indicates that not to write at a position past the maximum
>>> allowed offset. Shouldn't we give a dst_off large than
>>> MAX_LFS_FILESIZE?
>> Yes, we should use a dst_off large than MAX_LFS_FILESIZE because it used pos to compare
>> in kernel code as below:
>>
>> mm/filemap.c
>>    static int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
>> ...
>> if (unlikely(pos>= max_size))
>>     return -EFBIG;
>> ...
>>
>> I strace xfstest generic/564 code( I follow this test code to ltp), as below:
>> #max_off=$((8 * 2**60 - 65536 - 1))
>> #min_off=65537
>> #xfs_io -f -c "pwrite -S 0x61 0 128k" file
>> #touch copy
>> #strace xfs_io -c "copy_range -l $min_off -s 0 -d $max_off file" copy
>> ....
>>    openat(AT_FDCWD, "file", O_RDONLY)      = 4
>>    copy_file_range(4, [0], 3, [9223372036854710271], 65537, 0) = 65536
>>    copy_file_range(4, [65536], 3, [9223372036854775807], 1, 0) = -1 EFBIG (File too large)
>> ....
>>
>> xfsprogs used a loop to call copy_file_range, and get EFBIG when pos greater than LLONG_MAX.
>>
>> I think we should  use tst_max_lfs_filesize instead of (tst_max_lfs_filesize -MIN_OFF)
>> and this case will pass whether xfs,btrfs and ext4.
> Good job, Xu. I think you can format a new patch to fix this problem.
> Because Petr's patch is used for solving the cross-compiling issue and
> looks good.
Hi Li

OK. I will send a new patch to fix this problem. But copy_file_range02.c still has a problem as Murphy found,
we set all_filesystem but use the same tmpdir instead of mntpoint.  I think we can remove all_filesystem and mountpoint.

@Murphy Zhou  Hi Murphy, would you like to send a new patch to remove useless all_filesystem or I do it in my
new patch by adding your signed-off-by tag? What do you think about it?

> @Petr Vorel Hi Petr, what do you think? any more comments?
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
