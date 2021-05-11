Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95B37A248
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:37:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 339C03C64AA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:37:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 583233C4E1C
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:37:13 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A514D600ACF
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:37:11 +0200 (CEST)
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FfWSG09dQzYgpw
 for <ltp@lists.linux.it>; Tue, 11 May 2021 16:34:38 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 16:37:04 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 16:37:04 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210402034612.127912-1-xieziyao@huawei.com>
 <20210402034612.127912-2-xieziyao@huawei.com> <YJolByrF7vYDiY5/@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <bf3d85c1-fd9b-e7fd-c522-21b4fb7d5b44@huawei.com>
Date: Tue, 11 May 2021 16:37:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJolByrF7vYDiY5/@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] kernel/syscalls: Modify incorrect use of
 TERRNO and replace functions with safe_macros
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

Hi, Petr,

>> - modify some incorrect use of TERRNO/TTERRNO in kernel/syscalls;
I just re-checked the latest code and submit the v2 version.

Please see: 
https://patchwork.ozlabs.org/project/ltp/patch/20210511082644.110124-1-xieziyao@huawei.com/

>> - replace functions with safe_macros to check the return value in kernel/syscalls.
As for this type of modification, I'll try to use script to replace all 
of them.

> These two would be really better to put 2 commits.
> 
> Kind regards,
> Petr
> .
> 

Thanks for your review.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
