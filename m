Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C07348703
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 03:41:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45E5D3C2E0F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 03:41:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2CC1A3C2B92
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 03:41:40 +0100 (CET)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EC6E9601620
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 03:41:39 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4F5Tnh4D7Cz5ggG
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 10:39:04 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 25 Mar 2021 10:41:36 +0800
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.126]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0513.000;
 Thu, 25 Mar 2021 10:41:31 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/setns: Replace libc function with
 safe_macros
Thread-Index: AdchG1B/oPq7/qkjRcmcesfWKj/A9A==
Date: Thu, 25 Mar 2021 02:41:32 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389C8AA@dggeml531-mbx.china.huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/setns: Replace libc function with
 safe_macros
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

Hi Petr,

I'm sorry! Its my fault, thanks for your review!

I have resubmit the patch.

Best Regards,
Gongyi

> 
> Hi Gongyi,
> 
> thanks for your patchset. While it looks correct, some of changes break
> both tests:
> 
> ./setns01 -i 5
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> setns01.c:153: TCONF: no ns types/proc entries
> 
> ./setns02 -i 5
> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
> setns02.c:160: TCONF: your kernel has CONFIG_IPC_NS, CONFIG_UTS_NS
> or CONFIG_PROC disabled
> setns02.c:175: TWARN: shmctl(0, 0, (nil)) failed: EINVAL (22)
> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
