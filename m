Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93034C202
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:44:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E96FF3C71E5
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:44:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25BBD3C1A28
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:44:27 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A67681A001E2
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:44:26 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F7xgb5gmpz5jxR;
 Mon, 29 Mar 2021 10:42:19 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.126]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0513.000;
 Mon, 29 Mar 2021 10:44:17 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
Thread-Index: AdckRA9OMHYr18qpRVmjJddmstPDJg==
Date: Mon, 29 Mar 2021 02:44:17 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCF2@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu, Li,

On the other hand, we have created a shm in setup, why we query with SHM_INFO and return 0?

Best Regards,
Gongyi

> Hi Gongyi
> 
> The SHM_STAT_ANY cmd was introduced since kernel 4.17. I guess we
> should add check for it.
> > Hi Li,
> >
> > Yes, I find the problem in my testing of qemu with kernel version 4.4
> > and the config is vexpress_defconfig.
> >
> > Specifically as follow:
> >
> > tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
> >
> > shmctl04.c:119: TINFO: Test SHM_STAT_ANY with nobody user
> >
> > TST_RET: 0 SHM_STAT_ANY: 15
> >
> > shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL
> > (22)
> >
> > shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
> >
> > shmctl04.c:85: TPASS: used_ids = 1
> >
> > shmctl04.c:92: TPASS: shm_rss = 0
> >
> > shmctl04.c:99: TPASS: shm_swp = 0
> >
> > shmctl04.c:106: TPASS: shm_tot = 1
> >
> > shmctl04.c:119: TINFO: Test SHM_STAT_ANY with root user
> >
> > TST_RET: 0 SHM_STAT_ANY: 15
> >
> > shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL
> > (22)
> >
> > shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
> >
> > shmctl04.c:85: TPASS: used_ids = 1
> >
> > shmctl04.c:92: TPASS: shm_rss = 0
> >
> > shmctl04.c:99: TPASS: shm_swp = 0
> >
> > shmctl04.c:106: TPASS: shm_tot = 1
> >
> > Summary:
> >
> > passed   8
> >
> > failed   4
> >
> > broken   0
> >
> > skipped  0
> >
> > warnings 0
> >

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
