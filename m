Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C02245F727
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 13:15:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C1943C1DD0
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 13:15:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 22EBA3C1D27
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 13:15:24 +0200 (CEST)
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C10911000A04
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 13:15:18 +0200 (CEST)
Received: by mail-yb1-xb41.google.com with SMTP id x32so1150451ybh.1
 for <ltp@lists.linux.it>; Thu, 04 Jul 2019 04:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7KKgcIwYmvtjrSUh//MEA0G1ES6AjnMyUqGJggQP18=;
 b=PWjB8XlNLhp0zSQkpzHJx5u2NMt5xMhN5GaY+fso6DAbiG/qN0CwhXbRPNHXhVbeay
 iln7cb1pdO1B1aef2RWXkHvtiOaxjzz8oCD0i5PjAIA5rtbmmUy2zkJ5+R/Sb2RrZwZy
 Emw374zO4WA3BmkvuQ4HG0qKDkHGcJR1mwpIIYDVYvJnGTFA3kbWbaPhYJs6NpxkVqXT
 FVYYqxnfI64bC3d0izC0KcCqfggQD5J5k82kv2hbnHO6M5sQm/95jvMchN/XV+F42IRo
 PV9jKMlQ8VPAnH1poxMBW4+7T9pfPrG+S0djl/mWTGoRJ2mjmQ4fw3SQYYUGBmXpzXek
 vFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7KKgcIwYmvtjrSUh//MEA0G1ES6AjnMyUqGJggQP18=;
 b=kgz/UjoL+V+AiWMYHZNv9cvz+bjKe1CW7upuL53Sltn587r/66/yXVVv99J0UNCcYF
 GtxN9W133E/xckd2WqSgpSypliJQQ2/UxrMyqire8ykcGVX0WPYgLt2/Rz7iPqNjpZ5c
 gl6qHyg0lnjdPld2YIhNGmM9ZLehmJRVU9diuj7ZJHpZlUxZWvE8GVUdyqkx3VetzdzJ
 AAifiemig8n0WZhInAolloRI+WbiGVYOpG9hccYtfWuevkG0l6vGHHDa134CErTStnTP
 73u+5gpDue5I+VULWPYxAbOnIAf9+2Xvzwt/r2vRtyLoE/Msx9vOQJLESr25RQR0iP4w
 +jEQ==
X-Gm-Message-State: APjAAAXizFAjsBiz61p2LB3CSqTEKITtZt6sqW1DIP50LK5qFSTuJpjf
 +o6QeKeGn+S+Fucj38qTWMntgBnCfJx++fb9UR8=
X-Google-Smtp-Source: APXvYqzCWKHkSc2+Jsypxl/FkAV5iNZishcwPX1draK4GsGzsJQZ0g5FJovhuPtcTzVBQQmjBDOutLIYHa9qeuXkQ+k=
X-Received: by 2002:a25:c486:: with SMTP id
 u128mr12016247ybf.428.1562238922207; 
 Thu, 04 Jul 2019 04:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
 <CAOQ4uxjE6RC_60SR0KZk7dJvU12pxPXEq56-tz840rDCQth1Xg@mail.gmail.com>
 <5D147856.5040709@cn.fujitsu.com>
 <CAOQ4uxjxOWCOBV1OQVg9B5D2eT4jUdQfOAaxTSJgFkqQDUVapg@mail.gmail.com>
 <5D1DD658.8050303@cn.fujitsu.com>
In-Reply-To: <5D1DD658.8050303@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 4 Jul 2019 14:15:10 +0300
Message-ID: <CAOQ4uxjq110UMEvT6xhp+-T-D0u9SX6ty9E6wBn67Z8aYphjcA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 4, 2019 at 1:35 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> on 2019/06/27 16:39, Amir Goldstein wrote:
> > On Thu, Jun 27, 2019 at 11:03 AM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
> >> on 2019/05/31 21:02, Amir Goldstein wrote:
> >>
> >>> On Fri, May 31, 2019 at 3:03 PM Li Wang<liwang@redhat.com>   wrote:
> >>>>
> >>>> On Fri, May 31, 2019 at 6:15 PM Xiao Yang<yangx.jy@cn.fujitsu.com>   wrote:
> >>>>> On 2019/05/31 16:44, Jinhui huang wrote:
> >>>>>> On new kernels, copy_file_range() returned EISDIR when copyed contents
> >>>>>> to directory, but on old kernels, it returned EBADF, we should accept
> >>>>>> EBADF to be compatible with new and old kernels.
> >>>>>>
> >>>>>> The patch as follows:
> >>>>>> commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
> >>>>> Hi,
> >>>>>
> >>>>>   From description of commit, I wonder if we can add more tests for some
> >>>>> non regular files(e.g. block, pipe)?
> >>>> I have no objection on this. But, is there really make sense to test some more non regular files which not being mentioned by Linux Manual Page?
> >>>>
> >>> FYI, more changes to copy_file_range checks are in the works:
> >>> https://lore.kernel.org/linux-fsdevel/20190526061100.21761-1-amir73il@gmail.com/T/#me34d4363449118bd3b2ec8421d282a77e9a7d2d1
> >> Hi Amir
> >>
> >>       Meet again.  We can increase ltp copy_file_range02 coverage include( swapfile ->ETXTBUSY,  immutable file->EPERM) as same as xfstests generic/553[4].
> >> Also the two other checks(overlaping and offset wrap).  I am glad to do it.
> > That would be great!
>
> Hi Amir
>
> I have tried it.  swapfile and immutable file has no problem, but when I try to reproduce EINVAL(same file overlaping) without xfs_io, I got EFAULT error.
> It look likes we must depend on the new xfs_io feature patch.  Right?
>
> ps: If it must xfs_io command, I think we can not check this situation because we should only check by copy_file_range syscall.
> what do you think about it?
>


I don't understand how xfs_io is related.
LTP should use only copy_file_range() syscall.
Do you have patches I can look at?

> another question:
> I have seen copy_file_range manpage,  it says fd_out data can be overwriting, but I got EFAULT when I use the following code.
>
> open(src_path, O_RDWR|O_CREAT, 0644) = fd_copy
> open(copy_path, O_RDWR|O_CREAT, 0644) = fd_src
> SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> SAFE_WRITE(1, fd_copy,  CONTENT,  CONTSIZE);
> copy_file_range(fd_src,0, fd_copy, CONTSIZE/4, CONTSIZE/2, 0) = -1 EFAULT
>
> fs/read_write.c copy_file_range function copy_from_user reports this error. If off_out or off_in isn't equal to 0, the error occurs.
>
> ---------------------
> ret= -EFAULT;
> ....
> if (off_out) {
>                 copy_from_user(&pos_out, off_out, sizeof(loff_t));
>
>                          goto out;
>               }
> ----------------------
>
> Is it a bug or I miss something?
>

You know off_out/off_out are either NULL or pointer to loff_t offset variable?

If you have a sample code you may post it for review.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
