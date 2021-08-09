Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D553E41DE
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:53:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E6243C7151
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 10:53:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 815193C2234
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:53:22 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 809FC1000609
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 10:53:20 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GjqVW5yhfz84LM;
 Mon,  9 Aug 2021 16:48:19 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:53:16 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 16:53:15 +0800
To: <ltp@lists.linux.it>
References: <20210809083903.161596-1-xieziyao@huawei.com>
 <20210809083903.161596-4-xieziyao@huawei.com>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <3241a2d2-af9b-8eca-51d6-cf134d29aa78@huawei.com>
Date: Mon, 9 Aug 2021 16:53:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210809083903.161596-4-xieziyao@huawei.com>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] epoll_wait: Convert epoll_wait03 to the new
 API
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

Hi, Cyril,

> +/*\
> + * [Description]
> + *
> + * Basic test for epoll_wait:
>    *
> - * Expected Result:
> - *  1) epoll_wait(2) should return -1 and set errno to EBADF
> - *  2) epoll_wait(2) should return -1 and set errno to EINVAL
> - *  3) epoll_wait(2) should return -1 and set errno to EINVAL
> - *  4) epoll_wait(2) should return -1 and set errno to EINVAL
> - *  5) epoll_wait(2) should return -1 and set errno to EFAULT
> + * 1. epoll_wait fails with EBADF if epfd is not a valid file descriptor.
> + * 2. epoll_wait fails with EINVAL if epfd is not an epoll file descriptor.
> + * 3. epoll_wait fails with EINVAL if maxevents is less than zero.
> + * 4. epoll_wait fails with EINVAL if maxevents is equal to zero.
> + * 5. epoll_wait fails with EFAULT if the memory area pointed to by events is
> + * not accessible with write permissions.
>    */

As I mentioned in #792, testcases/kernel/syscalls/epoll_wait has some 
test points that can also cover the epoll_pwait/epoll_pwait2 system call 
since their underlying implementations are similar.

Therefore, I suggest that we add tests for different parameters in 
syscalls/epoll_pwait, and implement basic tests in syscalls/epoll_wait.

The case where timeout set to 0 causes the call to return immediately is 
added to epoll_wait04, and new tests for epoll_pwait/epoll_pwait2 will 
be added in syscalls/epoll_pwait.

...
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test = verify_epoll_wait,
> +	.tcnt = ARRAY_SIZE(tc),
> +};
> --
> 2.17.1
> 
> .
> 

Thank you for the suggestion.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
