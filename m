Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A10AD3B5A4B
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:13:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5922C3C8D9B
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:13:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BBC33C6DEE
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:13:08 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1AD271A00980
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:13:03 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GD0dZ6X9NzZkjt
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:09:54 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:12:52 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 16:12:52 +0800
To: <ltp@lists.linux.it>
References: <20210628080424.245911-1-xieziyao@huawei.com>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <6ae18b1d-6363-3dbc-0696-f0c7115aeb67@huawei.com>
Date: Mon, 28 Jun 2021 16:12:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210628080424.245911-1-xieziyao@huawei.com>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme719-chm.china.huawei.com (10.1.199.115) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] epoll_pwait2: Add test for epoll_pwait2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Xie Ziyao (3):
>    lapi/syscalls: Add syscall number for epoll_pwait2
>    epoll_pwait2: Add test for epoll_pwait201
>    epoll_pwait2: Add test for epoll_pwait202
Sorry for testing only under several archs (like arm, x86) on QEMU due 
to environmental limitations.

If possible, I would recommend testing it on other platforms as well.

Kind Regards,
Ziyao
> 
>   include/lapi/syscalls/aarch64.in              |  1 +
>   include/lapi/syscalls/arc.in                  |  1 +
>   include/lapi/syscalls/arm.in                  |  1 +
>   include/lapi/syscalls/hppa.in                 |  3 +-
>   include/lapi/syscalls/i386.in                 |  1 +
>   include/lapi/syscalls/ia64.in                 |  1 +
>   include/lapi/syscalls/powerpc.in              |  1 +
>   include/lapi/syscalls/powerpc64.in            |  1 +
>   include/lapi/syscalls/s390.in                 |  1 +
>   include/lapi/syscalls/s390x.in                |  1 +
>   include/lapi/syscalls/sh.in                   |  1 +
>   include/lapi/syscalls/sparc.in                |  1 +
>   include/lapi/syscalls/sparc64.in              |  1 +
>   include/lapi/syscalls/x86_64.in               |  1 +
>   runtest/syscalls                              |  2 +
>   .../kernel/syscalls/epoll_pwait2/.gitignore   |  2 +
>   .../kernel/syscalls/epoll_pwait2/Makefile     |  9 +++
>   .../syscalls/epoll_pwait2/epoll_pwait201.c    | 62 +++++++++++++++
>   .../syscalls/epoll_pwait2/epoll_pwait202.c    | 76 +++++++++++++++++++
>   19 files changed, 166 insertions(+), 1 deletion(-)
>   create mode 100644 testcases/kernel/syscalls/epoll_pwait2/.gitignore
>   create mode 100644 testcases/kernel/syscalls/epoll_pwait2/Makefile
>   create mode 100644 testcases/kernel/syscalls/epoll_pwait2/epoll_pwait201.c
>   create mode 100644 testcases/kernel/syscalls/epoll_pwait2/epoll_pwait202.c
> 
> --
> 2.17.1
> 
> .
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
