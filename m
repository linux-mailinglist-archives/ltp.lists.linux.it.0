Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F032CA5D
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:14:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F1333C6E42
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:14:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EE75C3C5A30
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:14:45 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 72746601370
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:14:44 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DrZB20j78z141Xm
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 10:11:54 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 4 Mar 2021 10:14:38 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.181]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0513.000;
 Thu, 4 Mar 2021 10:14:32 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
Thread-Index: AdcQm8kuoKMx5fagQKijFCg7PNqW3A==
Date: Thu, 4 Mar 2021 02:14:32 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40388B77D@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
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

Hi Cyril,

I have resubmit the patch according to your review.

Thanks so much!

> 
> Hi!
> > > But there is another problem there, since the code still mounts
> > > tmpfs on tmpdir for a short while, which is temporary directory used
> > > by all LTP tests, which may potentially break tests that runs in parallel.
> >
> > 	In general, when all_filesystems has been set to 1,  the
> needs_tmpdir would be set to 1 and the mntpoint must has been set to
> some path, so the test run in /tmp/tmpxxxxxx/mntpoint and
> > 	other LTP tests would run in another tmpdir. So it has no problem for
> running in parallel.
> >
> > 	I don't know if I understand it right.
> 
> The has_kernel_support() uses TMPDIR as the mount point, which is the
> parent directory for all LTP tests, moreover it often points to just "/tmp". If
> you mount anything over that directory, even for a short while, the whole
> system will get different and empty "/tmp" which will possibly break many
> things.
> 
> We may get over this with using "." instead, in a case that testcase has
> created temporary directory and changed the PWD to it, but it's not that
> simple either, since tst_test.c is not the only place that calls
> has_kernel_support().
> 
> We have testcases/lib/tst_supported_fs.c helper as well that is used by
> shell tests. This is a standalone binary that does not create a temporary
> directory and should work even without TMPDIR being set, which is the
> reason we have the if (!tmpdir) tmpdir = "/tmp"; check in the
> has_kernel_support() function to begin with.
> 
> So all in all I guess that safest option would be to create a unique
> temporary directory under TMPDIR and use it as a mount point in the
> has_kernel_support() function.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
