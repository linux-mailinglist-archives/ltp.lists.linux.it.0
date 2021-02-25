Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F0324F52
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:40:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BBF303C58B2
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:40:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 52EBD3C0BAF
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:40:32 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 78B6B1001175
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:40:31 +0100 (CET)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4DmW4D3tvMz13x4p
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 19:37:48 +0800 (CST)
Received: from DGGEML423-HUB.china.huawei.com (10.1.199.40) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 25 Feb 2021 19:40:23 +0800
Received: from DGGEML511-MBS.china.huawei.com ([169.254.4.151]) by
 dggeml423-hub.china.huawei.com ([10.1.199.40]) with mapi id 14.03.0509.000;
 Thu, 25 Feb 2021 19:40:15 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalss/timer_settime03.c: Add kconfig
 requirement info in file header.
Thread-Index: AdcLatbh+pXj7GY4Trmedxan2hdLFA==
Date: Thu, 25 Feb 2021 11:40:13 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40387A3EC@dggeml511-mbs.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalss/timer_settime03.c: Add kconfig
 requirement info in file header.
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

I have resubmit the patch.

Thanks very much!


> 
> Hi!
> > Test will fail when CONFIG_HIGH_RES_TIMERS is not set to y, because
> > the return value of timer_getoverrun is equal to
> > expiry_time_values/interval. When CONFIG_HIGH_RES_TIMERS is set to
> y, interval is equal to 1.
> > When CONFIG_HIGH_RES_TIMERS is not set to y, interval is equal to
> > HZ*1000000, and the return value of timer_getoverrun will not be
> > greater than or equal to {DELAYTIMER_MAX} in this testcase. See
> https://nvd.nist.gov/vuln/detail/CVE-2018-12896.
> 
> If the test causes false possitives without high resolution timers enabled
> then the requirement should be added to the needs_kconfigs arrary in
> the tst_test structure instead.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
