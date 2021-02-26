Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE44325D98
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 07:37:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 451763C4E6B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 07:37:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 991B53C0F5F
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 07:37:55 +0100 (CET)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AFD3B60068F
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 07:37:53 +0100 (CET)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Dn0KG4sgMz5Tnd;
 Fri, 26 Feb 2021 14:35:46 +0800 (CST)
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.151]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0509.000; Fri, 26 Feb 2021 14:37:42 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Thread-Topic: [LTP] [PATCH] syscalls/ioctl: Remove requirement of loop driver
Thread-Index: AdcMCROvY1/S+1wwQ+qjS0G0bYJBgg==
Date: Fri, 26 Feb 2021 06:37:42 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40387A866@dggeml511-mbs.china.huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/ioctl: Remove requirement of loop driver
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

Hi Yang,

> 1) I think .needs_driver can parse either CONFIG_BLK_DEV_LOOP=y or
> CONFIG_BLK_DEV_LOOP=m correctly.
>      Do you have any issue that .needs_driver cannot parse

I known the reason why test fail and report TCONF, there is no file modules.builtin on my system.

> CONFIG_BLK_DEV_LOOP=y correctly?
> 2) If CONFIG_BLK_DEV_LOOP is not set, we would like to report TCONF
> by .needs_driver rather than TBROK by tst_find_free_loopdev().
>

It looks like good.


Thanks!

----------------------------------------------------------------------------------------------------

> 
> On 2021/2/26 12:00, Zhao Gongyi wrote:
> > There is no loop driver when config CONFIG_BLK_DEV_LOOP is set to y,
> > and we have check the loop device in tst_find_free_loopdev. So we can
> > remove the requirement of loop driver.
> Hi Zhongyi,
> 
> 1) I think .needs_driver can parse either CONFIG_BLK_DEV_LOOP=y or
> CONFIG_BLK_DEV_LOOP=m correctly.
>      Do you have any issue that .needs_driver cannot parse
> CONFIG_BLK_DEV_LOOP=y correctly?
> 2) If CONFIG_BLK_DEV_LOOP is not set, we would like to report TCONF
> by .needs_driver rather than TBROK by tst_find_free_loopdev().
> 
> Best Regards,
> Xiao Yang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
