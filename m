Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E218365358
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:36:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 200AF3C6C84
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 09:36:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3BD673C25D0
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:36:31 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E6C0F600065
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 09:36:29 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FPb5L54x9z5rc9
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 15:33:26 +0800 (CST)
Received: from dggpemm100002.china.huawei.com (7.185.36.179) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 20 Apr 2021 15:36:25 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100002.china.huawei.com (7.185.36.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 20 Apr 2021 15:36:25 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Tue, 20 Apr 2021 15:36:25 +0800
From: xieziyao <xieziyao@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH 2/2] syscalls/unshare: convert unshare02 to the new
 API
Thread-Index: AQHXNSdC4YWozGtzBEW9XWraRQNIC6q9BPOg
Date: Tue, 20 Apr 2021 07:36:25 +0000
Message-ID: <96d27b37fa9245978e69679822916089@huawei.com>
References: <20210419122246.7706-1-xieziyao@huawei.com>
 <20210419122246.7706-3-xieziyao@huawei.com> <YH2OrwsqdO231sNB@yuki>
In-Reply-To: <YH2OrwsqdO231sNB@yuki>
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
Subject: Re: [LTP] [PATCH 2/2] syscalls/unshare: convert unshare02 to the
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

Hi,

I just re-checked the latest code and made changes on your suggestions:
1. Add setup() and cleanup() to set uid to "nobody" for EPERM tests;
2. Modify the incorrect code style.

Please see: https://patchwork.ozlabs.org/project/ltp/patch/20210420072939.202584-1-xieziyao@huawei.com/

Thanks so much for your review!

Best Regards,
Ziyao

-----Original Message-----
From: Cyril Hrubis [mailto:chrubis@suse.cz] 
Sent: Monday, April 19, 2021 10:08 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/unshare: convert unshare02 to the new API

Hi!
> 1. Convert unshare02 to the new API;
> 2. Check whether the returned value is correct in the child process 
> instead of the parent process; 3. Add a test case: use the CLONE_NEWNS 
> parameter as a non-root user and the expected return value is EPERM.

The EPERM check fails if the test is executed by a root. LTP tests usually setuid() to "nobody" for EPERM tests if executed as a root.

The TC should be lowercase but that is very minor.

Apart from these it's a really good cleanup.

--
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
