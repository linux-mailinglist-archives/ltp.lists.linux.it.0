Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DE5F6AF
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 12:35:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F7853C1DD2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 12:35:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F3D333C1D4E
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 12:35:12 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id AAA4B600429
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 12:35:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,450,1557158400"; d="scan'208";a="70760728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Jul 2019 18:35:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 8DC3A4CDD98D;
 Thu,  4 Jul 2019 18:35:07 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 4 Jul 2019 18:35:07 +0800
Message-ID: <5D1DD658.8050303@cn.fujitsu.com>
Date: Thu, 4 Jul 2019 18:35:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Amir Goldstein <amir73il@gmail.com>
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
 <CAOQ4uxjE6RC_60SR0KZk7dJvU12pxPXEq56-tz840rDCQth1Xg@mail.gmail.com>
 <5D147856.5040709@cn.fujitsu.com>
 <CAOQ4uxjxOWCOBV1OQVg9B5D2eT4jUdQfOAaxTSJgFkqQDUVapg@mail.gmail.com>
In-Reply-To: <CAOQ4uxjxOWCOBV1OQVg9B5D2eT4jUdQfOAaxTSJgFkqQDUVapg@mail.gmail.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 8DC3A4CDD98D.AF580
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

on 2019/06/27 16:39, Amir Goldstein wrote:
> On Thu, Jun 27, 2019 at 11:03 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
>> on 2019/05/31 21:02, Amir Goldstein wrote:
>>
>>> On Fri, May 31, 2019 at 3:03 PM Li Wang<liwang@redhat.com>   wrote:
>>>>
>>>> On Fri, May 31, 2019 at 6:15 PM Xiao Yang<yangx.jy@cn.fujitsu.com>   wrote:
>>>>> On 2019/05/31 16:44, Jinhui huang wrote:
>>>>>> On new kernels, copy_file_range() returned EISDIR when copyed contents
>>>>>> to directory, but on old kernels, it returned EBADF, we should accept
>>>>>> EBADF to be compatible with new and old kernels.
>>>>>>
>>>>>> The patch as follows:
>>>>>> commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
>>>>> Hi,
>>>>>
>>>>>   From description of commit, I wonder if we can add more tests for some
>>>>> non regular files(e.g. block, pipe)?
>>>> I have no objection on this. But, is there really make sense to test some more non regular files which not being mentioned by Linux Manual Page?
>>>>
>>> FYI, more changes to copy_file_range checks are in the works:
>>> https://lore.kernel.org/linux-fsdevel/20190526061100.21761-1-amir73il@gmail.com/T/#me34d4363449118bd3b2ec8421d282a77e9a7d2d1
>> Hi Amir
>>
>>       Meet again.  We can increase ltp copy_file_range02 coverage include( swapfile ->ETXTBUSY,  immutable file->EPERM) as same as xfstests generic/553[4].
>> Also the two other checks(overlaping and offset wrap).  I am glad to do it.
> That would be great!

Hi Amir

I have tried it.  swapfile and immutable file has no problem, but when I try to reproduce EINVAL(same file overlaping) without xfs_io, I got EFAULT error.
It look likes we must depend on the new xfs_io feature patch.  Right?

ps: If it must xfs_io command, I think we can not check this situation because we should only check by copy_file_range syscall.
what do you think about it?

another question:
I have seen copy_file_range manpage,  it says fd_out data can be overwriting, but I got EFAULT when I use the following code.

open(src_path, O_RDWR|O_CREAT, 0644) = fd_copy
open(copy_path, O_RDWR|O_CREAT, 0644) = fd_src
SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
SAFE_WRITE(1, fd_copy,  CONTENT,  CONTSIZE);
copy_file_range(fd_src,0, fd_copy, CONTSIZE/4, CONTSIZE/2, 0) = -1 EFAULT

fs/read_write.c copy_file_range function copy_from_user reports this error. If off_out or off_in isn't equal to 0, the error occurs.
  
---------------------
ret= -EFAULT;
....
if (off_out) {
                copy_from_user(&pos_out, off_out, sizeof(loff_t));

                         goto out;
              }
----------------------

Is it a bug or I miss something?

Thanks
Yang Xu

>
>> PS: Why we don't have test for overlaping and offset wrap check on xfstests? Or, I miss it?
> The bounds check test was posted to xfstests:
> https://marc.info/?l=linux-xfs&m=155947929219690&w=2
>
> But because the test requires a new feature from xfs_io:
> https://marc.info/?l=linux-xfs&m=156152984109774&w=2
>
> I recommended that xfstests maintainer will hold off merging the test,
> before the
> required change is at least in xfsprogs for-next branch.
>
> Thanks,
> Amir.
>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
