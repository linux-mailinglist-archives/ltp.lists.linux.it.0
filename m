Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E63F8040
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 04:03:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD1813C4D50
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 04:02:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 260123C3099
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 04:02:50 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0D64060074A
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 04:02:48 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gw5gz05xSz19Vc0
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 10:02:07 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 26 Aug 2021 10:02:33 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 26 Aug 2021 10:02:33 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210817064924.127970-1-xieziyao@huawei.com>
 <20210817064924.127970-4-xieziyao@huawei.com> <YSUSj8qaWPfMF1/w@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <c4cfffb4-c58a-8f34-5254-fbfadcc68ab8@huawei.com>
Date: Thu, 26 Aug 2021 10:02:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YSUSj8qaWPfMF1/w@yuki>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme712-chm.china.huawei.com (10.1.199.108) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] epoll_ctl: Add test for epoll_ctl03
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Cyril,

>> +static void run_all(void)
>> +{
>> +	unsigned int index, events_bitmap;
>> +
>> +	for (index = 0; index < WIDTH_EPOLL_EVENTS; index++) {
>> +		events_bitmap = ((EPOLLIN * ((index & 0x01) >> 0)) |
>> +				(EPOLLOUT * ((index & 0x02) >> 1)) |
>> +				(EPOLLPRI * ((index & 0x04) >> 2)) |
>> +				(EPOLLERR * ((index & 0x08) >> 3)) |
>> +				(EPOLLHUP * ((index & 0x10) >> 4)) |
>> +				(EPOLLET * ((index & 0x20) >> 5)) |
>> +				(EPOLLONESHOT * ((index & 0x40) >> 6)) |
>> +				(EPOLLRDHUP * ((index & 0x80) >> 7)));
> 
> I guess that we can as well add a IS_BIT_SET() macro that would do:
> 
> #define IS_BIT_SET(val, bit) (((val) & (1<<(bit))) >> (bit))
Looks good, thanks. I've added this macro to include/tst_bitmap.h in the 
v2 patchset, other changes have also been applied.

Besides, I've used a different outlook email to submit and hope it 
doesn't cause misunderstandings.

> 
> And use that here instead.
> 
> Otherwise it looks good.
> 

Please see: https://patchwork.ozlabs.org/project/ltp/list/?series=259628

Thanks for your review.

-- 
Best Regards,
Xie Ziyao
E-mail:ziyaoxie@outlook.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
