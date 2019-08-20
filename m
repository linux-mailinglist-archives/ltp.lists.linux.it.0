Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C663295AAC
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 11:10:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B0163C1D24
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 11:10:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 77BE03C1CE4
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 11:10:15 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A7FA7600875
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 11:10:13 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,407,1559491200"; d="scan'208";a="73940535"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Aug 2019 17:10:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 881754CE03E3;
 Tue, 20 Aug 2019 17:10:06 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 20 Aug 2019 17:10:03 +0800
Message-ID: <5D5BB8DC.6070900@cn.fujitsu.com>
Date: Tue, 20 Aug 2019 17:09:48 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190815083630.26975-1-pvorel@suse.cz>
 <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
 <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
In-Reply-To: <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 881754CE03E3.AD50E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

on 2019/08/19 16:16, Li Wang wrote:

> On Fri, Aug 16, 2019 at 4:53 PM Murphy Zhou<jencce.kernel@gmail.com>  wrote:
>> On Thu, Aug 15, 2019 at 10:36:30AM +0200, Petr Vorel wrote:
>>> Some libc implementations on arm (at least AArch32 target with hard
>>> float (arm-linux-gnueabihf)) or some libc (musl, bionic) does not
>>> export PAGE_SHIFT. Replace it with own inline function.
>>>
>>> This required to replace MAX_LFS_FILESIZE constant with function
>>> tst_max_lfs_filesize(). Given that we must use MAX_OFF in a function,
>>> move dst from tcase struct to verify_copy_file_range().
>>>
>>> Credits for 32 bit MAX_LFS_FILESIZE algorithm: Cyril Hrubis.
>> I got the same results:
>>
>> copy_file_range02.c:120: INFO: dst 9223372036854710270 len 65537
>> copy_file_range02.c:136: FAIL: copy_file_range returned wrong value: 32
> I'm not chanllenge the tst_max_lfs_filesize().
>
> But I don't understand why to define MAX_OFF as (MAX_LEN - MIN_OFF),
> the failure indicates that not to write at a position past the maximum
> allowed offset. Shouldn't we give a dst_off large than
> MAX_LFS_FILESIZE?
Yes, we should use a dst_off large than MAX_LFS_FILESIZE because it used pos to compare
in kernel code as below:

mm/filemap.c
  static int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
...
if (unlikely(pos>= max_size))
   return -EFBIG;
...

I strace xfstest generic/564 code( I follow this test code to ltp), as below:
#max_off=$((8 * 2**60 - 65536 - 1))
#min_off=65537
#xfs_io -f -c "pwrite -S 0x61 0 128k" file
#touch copy
#strace xfs_io -c "copy_range -l $min_off -s 0 -d $max_off file" copy
....
  openat(AT_FDCWD, "file", O_RDONLY)      = 4
  copy_file_range(4, [0], 3, [9223372036854710271], 65537, 0) = 65536
  copy_file_range(4, [65536], 3, [9223372036854775807], 1, 0) = -1 EFBIG (File too large)
....

xfsprogs used a loop to call copy_file_range, and get EFBIG when pos greater than LLONG_MAX.

I think we should  use tst_max_lfs_filesize instead of (tst_max_lfs_filesize -MIN_OFF)
and this case will pass whether xfs,btrfs and ext4.

Thanks for pointing out this.

> if I change the code as below, then it could be passed.
>
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -115,7 +115,7 @@ static void verify_copy_file_range(unsigned int n)
>          }
>
>          if (tc->copy_to_fd ==&fd_copy)
> -               dst = tst_max_lfs_filesize() - MIN_OFF;
> +               dst = tst_max_lfs_filesize();
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
