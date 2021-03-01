Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D26A932761B
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 03:30:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D3803C5783
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 03:30:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CD4073C575B
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 03:30:39 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C57C71400978
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 03:30:37 +0100 (CET)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dpkgk2kvCzWGD8;
 Mon,  1 Mar 2021 10:27:46 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.73]) by
 DGGEML404-HUB.china.huawei.com ([fe80::b177:a243:7a69:5ab8%31]) with mapi id
 14.03.0509.000; Mon, 1 Mar 2021 10:30:20 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH] fanotify13.c/setxattr01.c: Remove requirement of
 needs_tmpdir
Thread-Index: AdcOPfLMeF54wGnRRC600pT7NxgmjQ==
Date: Mon, 1 Mar 2021 02:30:19 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB403883535@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fanotify13.c/setxattr01.c: Remove requirement of
 needs_tmpdir
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

Hi Xu,

> 
> Hi gongyi
> > The testcases aim to run on all_filesystems, so we need remove the
> > requirement of needs_tmpdir.
> >
> This commit message is confusing. See commit dae8427740f(" Remove
> duplicated ".needs_tmpdir=1" when using equivalent flags").
> 
> The needs_tmpdir flag is not needed to be set when use these flags:
> '.all_filesystems', '.format_device', '.mntpoint', '.mount_device'
> '.needs_checkpoints', '.needs_device', '.resource_file'.
>   These flags imply creating temporary directory.
> 
> Does have other case still have this duplicated flag?

	I have resubmit the patch which added 4 testcases that have this duplicated flag and midified the git log.


> 
> > Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> > ---
> >   testcases/kernel/syscalls/fanotify/fanotify13.c | 1 -
> >   testcases/kernel/syscalls/setxattr/setxattr01.c | 1 -
> >   2 files changed, 2 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c
> > b/testcases/kernel/syscalls/fanotify/fanotify13.c
> > index 6d812cdd1..1fb12ae68 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify13.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
> > @@ -289,7 +289,6 @@ static struct tst_test test = {
> >   	.setup = do_setup,
> >   	.cleanup = do_cleanup,
> >   	.needs_root = 1,
> > -	.needs_tmpdir = 1,
> >   	.mount_device = 1,
> >   	.mntpoint = MOUNT_PATH,
> >   	.all_filesystems = 1,
> > diff --git a/testcases/kernel/syscalls/setxattr/setxattr01.c
> > b/testcases/kernel/syscalls/setxattr/setxattr01.c
> > index 8b84dfe0d..8cd2821d0 100644
> > --- a/testcases/kernel/syscalls/setxattr/setxattr01.c
> > +++ b/testcases/kernel/syscalls/setxattr/setxattr01.c
> > @@ -210,7 +210,6 @@ static struct tst_test test = {
> >   	.mntpoint = MNTPOINT,
> >   	.mount_device = 1,
> >   	.all_filesystems = 1,
> > -	.needs_tmpdir = 1,
> >   	.needs_root = 1,
> >   };
> >
> > --
> > 2.17.1
> >
> >
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
