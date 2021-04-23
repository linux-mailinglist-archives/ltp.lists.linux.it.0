Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DCE369028
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:14:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15E913C69EB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 12:14:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E68593C19D6
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 12:14:45 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B4E1B14011BF
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 12:14:43 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FRVTQ0Yg2zRgrS
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 18:12:26 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (7.185.36.93) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 23 Apr 2021 18:14:39 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Apr 2021 18:14:39 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Fri, 23 Apr 2021 18:14:39 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic
 in do_child()
Thread-Index: AQHXNqzhkQ4kV6jC00i15PoE37a8aKrAHtFwgAHGSWA=
Date: Fri, 23 Apr 2021 10:14:38 +0000
Message-ID: <6ff9d783d70a4c4f91fe3dca0a948833@huawei.com>
References: <20210420133839.145408-1-xieziyao@huawei.com>
 <YIAcC1DaWciwSypB@yuki> 
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
Subject: Re: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic
 in do_child()
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

I just made changes to sendfile04 and sendfile05 on your suggestions:
1. Convert sendfile04 to the new API;
2. Remove the socket code of server/client and use SAFE_SOCKETPAIR() instead, which can simplify the code logic.

And I think the other testcases of the sendfile testsuite have the same problem. Can we please modify other testcases in the same way?

Please see: https://patchwork.ozlabs.org/project/ltp/list/?series=240489

Best Regards,
Ziyao

-----Original Message-----
From: xieziyao 
Sent: Thursday, April 22, 2021 3:13 PM
To: 'Cyril Hrubis' <chrubis@suse.cz>
Cc: ltp@lists.linux.it
Subject: RE: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic in do_child()

Of course, I'm interested in modifying the testcases that way, and I'll submit another version to fix the problem.

Thanks for your review, Cyril.

Best Regards,
Ziyao

-----Original Message-----
From: Cyril Hrubis [mailto:chrubis@suse.cz] 
Sent: Wednesday, April 21, 2021 8:35 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic in do_child()

Hi!
Looking at the code the sendfile04 and sendfile05 does not need 99% of the code in the tests, as a matter of fact it even breaks the tests with sufficiently large -i parameter.

Can we please instead remove all the server and socket code from
sendfile04 and sendfile05? We can just easily pass in_fd and out_fd pointing to a regular files to the sendfile() syscall instead.

--
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
