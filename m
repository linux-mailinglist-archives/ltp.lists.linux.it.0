Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64C36BD24
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 04:07:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF5BC3C6774
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 04:07:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04C423C1935
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 04:07:51 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD73D140099D
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 04:07:49 +0200 (CEST)
Received: from dggeml765-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FTlSj5TdKz5vFW
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 10:04:37 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggeml765-chm.china.huawei.com (10.1.199.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 10:07:43 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 10:07:43 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Tue, 27 Apr 2021 10:07:43 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP][PATCH 2/2] syscalls/sendfile: Convert sendfile07 to the
 new API
Thread-Index: AQHXOngO1r9US9XrHEysxpZBQMK8uKrGReiAgAFX5VA=
Date: Tue, 27 Apr 2021 02:07:43 +0000
Message-ID: <469bfcb3d03f4380859b8bb3b0dfcc64@huawei.com>
References: <20210426084215.259071-1-xieziyao@huawei.com>
 <20210426084215.259071-3-xieziyao@huawei.com> <YIbAtwDn4YGukFGE@yuki>
In-Reply-To: <YIbAtwDn4YGukFGE@yuki>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile07 to the
 new API
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

Hi, Cyril,

Nice modification, thank you. I'll look at this type of interface function and pay attention next time.

Best Regards,
Ziyao

-----Original Message-----
From: Cyril Hrubis [mailto:chrubis@suse.cz] 
Sent: Monday, April 26, 2021 9:32 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it
Subject: Re: [LTP][PATCH 2/2] syscalls/sendfile: Convert sendfile07 to the new API

Hi!
I've simplified the code a bit and pushed, thanks.

* The socketpair() can be opened with SOCKET_NONBLOCK
* Made use of tst_fill_file()
* Moved tst_brk() out of the for() loop
* Fixed some typos and simplified the doc comment

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
