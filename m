Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13954367AB7
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 09:13:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAA243C6A83
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 09:13:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CEDF3C1966
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 09:13:20 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6FC5260087B
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 09:13:18 +0200 (CEST)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FQpVY5YY7zYYwS
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:11:01 +0800 (CST)
Received: from dggpemm100003.china.huawei.com (7.185.36.68) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 22 Apr 2021 15:13:07 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100003.china.huawei.com (7.185.36.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Apr 2021 15:13:07 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Thu, 22 Apr 2021 15:13:07 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/sendfile: Delete unnecessary loop logic
 in do_child()
Thread-Index: AQHXNqzhkQ4kV6jC00i15PoE37a8aKrAHtFw
Date: Thu, 22 Apr 2021 07:13:07 +0000
Message-ID: <6a0e879465f943fb8f2f09af3326adfc@huawei.com>
References: <20210420133839.145408-1-xieziyao@huawei.com>
 <YIAcC1DaWciwSypB@yuki>
In-Reply-To: <YIAcC1DaWciwSypB@yuki>
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
