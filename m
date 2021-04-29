Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97036E322
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 04:02:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DF2D3C6C4A
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 04:02:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CE223C096D
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 04:02:42 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4429600D0F
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 04:02:41 +0200 (CEST)
Received: from dggeml751-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FVzDv36QtzWKGH
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 09:58:39 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (7.185.36.93) by
 dggeml751-chm.china.huawei.com (10.1.199.150) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:02:37 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:02:37 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Thu, 29 Apr 2021 10:02:37 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
Thread-Index: AQHXOodtHJQpDaXDiE2dlym0ml+YgarJVCSAgABilYCAAQpSEA==
Date: Thu, 29 Apr 2021 02:02:36 +0000
Message-ID: <23fa24747c7a410b9f52f0c34dfc0628@huawei.com>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-2-xieziyao@huawei.com> <YIaWnt5ksxVyBvxk@pevik>
 <YIlRAanTIk9uKVEP@yuki> <YImjs5KVqFFjDqw/@pevik>
In-Reply-To: <YImjs5KVqFFjDqw/@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
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

Hi, Petr, Cyril,

Learned a lot. Thanks for your review and modifications to the code.

Kind regards,
Ziyao

-----Original Message-----
From: Petr Vorel [mailto:pvorel@suse.cz] 
Sent: Thursday, April 29, 2021 2:05 AM
To: Cyril Hrubis <chrubis@suse.cz>
Cc: xieziyao <xieziyao@huawei.com>; ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API

Hi Cyril, Xie,

> > > +int sig_flag = 0;

> > It should be
> > static int sig_flag;

> It has to be volatile as well, if we are waiting in a bussy loop on it 
> and it's changed ansynchronously from a signal handler, otherwise 
> compiler may misoptimize the code.

> Generally the code that waits for a signal should look like:

> static volatile sig_atomic_t sig_flag;

Oh, yes, volatile. Thanks for other hints, code adjusted and whole patchset merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
