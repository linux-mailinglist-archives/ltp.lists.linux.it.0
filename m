Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9E375063
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:50:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B23B3C56AD
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:50:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 750A93C3157
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:50:01 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E0AF3100053B
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:50:00 +0200 (CEST)
Received: from dggeml715-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FbQcC2zx7z19MKM
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:45:47 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml715-chm.china.huawei.com (10.3.17.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 15:49:54 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 6 May 2021 15:49:54 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210430094513.162499-1-xieziyao@huawei.com>
 <20210430094513.162499-3-xieziyao@huawei.com> <YJAFz/tdPN6GWCWl@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <e6bc2969-eab8-a333-49a6-f2577ff75444@huawei.com>
Date: Thu, 6 May 2021 15:49:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJAFz/tdPN6GWCWl@yuki>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3 v2] syscalls/chown: Rewrite chown/chown04.c
 with the new api
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Cyril,

I just re-checked the latest code and submit the v3 version based on 
your suggestions.

Please see: 
https://patchwork.ozlabs.org/project/ltp/patch/20210506074621.167505-1-xieziyao@huawei.com/

Thanks very much!

Kind Regards,
Ziyao

On 2021/5/3 22:16, Cyril Hrubis wrote:
> Hi!
>> 2. Add MAP_PRIVATE_EXCEPT_UCLINUX to SAFE_MMAP() for uClinux systems:
>>     mmap() doesn't support MAP_PRIVATE on uClinux systems, so use
>>     MAP_PRIVATE_EXCEPT_UCLINUX instead, which will skip the option on uClinux.
>>     If MAP_PRIVATE really is required, the test can not be run on uClinux.
> 
> We no longer support uClinux, just remove the support from the test as
> well.
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
