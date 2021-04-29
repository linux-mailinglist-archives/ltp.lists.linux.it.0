Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D736E337
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 04:22:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2A103C6741
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 04:22:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5F313C096D
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 04:22:08 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D6DF9600A6D
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 04:22:06 +0200 (CEST)
Received: from dggeml763-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FVzj049y2z5wVx
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 10:19:32 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggeml763-chm.china.huawei.com (10.1.199.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:22:01 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Apr 2021 10:21:55 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Thu, 29 Apr 2021 10:21:55 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP][PATCH v3] syscalls/close: Delete close08 and convert
 close01 to the new API
Thread-Index: AQHXPA+pIp4WR2FO30SlvQXV1f7M/KrJV4GAgAFsWMA=
Date: Thu, 29 Apr 2021 02:21:55 +0000
Message-ID: <cf03bcebc3cc47708ca7aca0c4ff7294@huawei.com>
References: <20210428092006.80460-1-xieziyao@huawei.com>
 <YIlWZc3j8esnndJP@yuki>
In-Reply-To: <YIlWZc3j8esnndJP@yuki>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/close: Delete close08 and convert
 close01 to the new API
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

Thank you, Cyril. I'll pay attention to that next time.

Kind regards,
Ziyao

-----Original Message-----
From: Cyril Hrubis [mailto:chrubis@suse.cz] 
Sent: Wednesday, April 28, 2021 8:35 PM
To: 20210426125224.150268-2-xieziyao@huawei.com
Cc: ltp@lists.linux.it; xieziyao <xieziyao@huawei.com>
Subject: Re: [LTP][PATCH v3] syscalls/close: Delete close08 and convert close01 to the new API

Hi!
I've updated the .gitignore file and runtest/syscalls file as well and pushed, thanks.

--
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
