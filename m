Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE15B56E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 08:58:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E91873C1D8A
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 08:58:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3E1523C1D68
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 08:58:38 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9D2C41400B9A
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 08:58:37 +0200 (CEST)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hhqGq-0003h4-BR
 for ltp@lists.linux.it; Mon, 01 Jul 2019 06:58:36 +0000
Received: by mail-wr1-f71.google.com with SMTP id s18so5309969wru.16
 for <ltp@lists.linux.it>; Sun, 30 Jun 2019 23:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DrEHR4jFF8iGIzRiwVm6c/oFDxxp7DNtgMVcX8WRpwU=;
 b=qZ0fFkGhrT7Wwg8NvD0zapeyvy6KB9oOM/m/HtelNvm8Loc8IsqN4q8UmcT/FOQDpb
 ClQH0dDcU24ekv/bHxE8j/ZJBhLqqn6zIVGl1A5v2q1MjsTZiekppDIV2FRSW6l7e0vI
 K0ooNi8o3OU9PldZKMfX7AGOlg4nlY3fvgjaN3sK4r1aigQwWrXydFEYkpPVVZ7rtJiu
 5YrRZmhw61sQCdNELx590sDqG6j/I0yN0pIq5jJXQiTI/BcArBNp1W9sh4uwoqDBqD9v
 /ovTRNSO0pb0oqHKqe8RSf7vJNv7t8jAHY0aTT15Gm/n2AgirA7RngeOS1VLskPYx65k
 jS9A==
X-Gm-Message-State: APjAAAXdtwzwKKV+QtZmou18TswOhLfgkXsQ/Yl5ZOoLmY2EcyhdvJe5
 dd4ghfLXNrZ/zl03YPwbbQEhNxvYwV8N1mgLz+2D1Z22MBCziJYpsu7vW9YyPc75j1sp7ywR+f5
 8EW35CWSRShBqcNMa7mCgQ+5ekh0YNv1AHA/YsqNsM9k=
X-Received: by 2002:adf:f589:: with SMTP id f9mr18065719wro.90.1561964316088; 
 Sun, 30 Jun 2019 23:58:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq4Q2N3bn7m6uO37+ueJuFAS1cFsrcr8URR4YqJ19KQ4NvlzBZk2ZnyCNQlvO/tkK3Jlqh7JL5ZfxKPPcC364=
X-Received: by 2002:adf:f589:: with SMTP id f9mr18065706wro.90.1561964315878; 
 Sun, 30 Jun 2019 23:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103900.10113-1-po-hsu.lin@canonical.com>
 <5D19A7E1.10607@cn.fujitsu.com>
In-Reply-To: <5D19A7E1.10607@cn.fujitsu.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Mon, 1 Jul 2019 14:58:24 +0800
Message-ID: <CAMy_GT96S3dVkevTkE2GUwyz_ugFjb1RsHd_ATARUB-BaYQo6Q@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] scenario_groups/default: run the kernel_misc test
 after the cve test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

I am not sure if we can restore the value in /proc/sys/kernel/tainted,
which can be changed manually:
    # cat  /proc/sys/kernel/tainted
    0
    # echo 12800 > /proc/sys/kernel/tainted
    # cat  /proc/sys/kernel/tainted
    12800
But it can't be reset back to 0.

From the Documentation/admin-guide/tainted-kernels.rst, it states that:
"Note the kernel will remain tainted even after you undo what caused the taint
(i.e. unload a proprietary kernel module), to indicate the kernel remains not
trustworthy."

Thanks

On Mon, Jul 1, 2019 at 2:27 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:
>
> Hi,
>
> Your patch just workarounds the issue for now, because it still happens
> if a new test designed to taint
> kernel is added to the group before cve group in future.
>
> Could we save the value of tainted before running block_dev and then
> restore it after running block_dev?
>
> Best Regards,
> Xiao Yang
> On 2019/06/28 18:39, Po-Hsu Lin wrote:
> > The block_dev test in kernel_misc will taint kernel with a warning flag,
> > this is an expected behaviour.
> >
> > However, if you run the cve-2017-17053 after it, as the test is looking
> > for a warning / died flag for a tainted kernel, it will cause false
> > alarm with:
> >    tst_taint.c:88: BROK: Kernel is already tainted: 14849
> >
> > The kernel_misc test was executed before the cve test in the default
> > test plan. Move the kernel_misc test to the end of the list to
> > workaround this issue.
> >
> > Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
> > ---
> >   scenario_groups/default | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scenario_groups/default b/scenario_groups/default
> > index 1f3e5b27f..e5b34782c 100644
> > --- a/scenario_groups/default
> > +++ b/scenario_groups/default
> > @@ -22,7 +22,6 @@ power_management_tests
> >   hugetlb
> >   commands
> >   hyperthreading
> > -kernel_misc
> >   fs_ext4
> >   can
> >   cpuhotplug
> > @@ -30,3 +29,4 @@ net.ipv6_lib
> >   input
> >   cve
> >   crypto
> > +kernel_misc
>
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
