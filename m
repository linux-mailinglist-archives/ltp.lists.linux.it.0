Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EB37F32A
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:42:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30D9F3C4B53
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:42:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0086A3C4AF1
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:42:43 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 264C210011A0
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:42:41 +0200 (CEST)
Received: from dggeml754-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fghn83sckzWhnk
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:38:20 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml754-chm.china.huawei.com (10.1.199.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 13 May 2021 14:42:37 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 13 May 2021 14:42:36 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210512084904.35159-1-xieziyao@huawei.com>
 <YJvdgJCg2ZWq8lWM@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <86694b65-2669-ecc8-f987-26a29027e995@huawei.com>
Date: Thu, 13 May 2021 14:42:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJvdgJCg2ZWq8lWM@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Makefile: Use SPDX in Makefile
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

> Unfortunately patch cannot be applied with 'git am' and even with patch:
> 
> $ patch -p1 <Makefile-Use-SPDX-in-Makefile.patch
> patching file doc/Makefile
> patch: **** malformed patch at line 244: diff --git a/include/Makefile b/include/Makefile
> 
> Line 244 is top_srcdir:
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2009, Cisco Systems Inc.
>   # Ngie Cooper, July 2009
> -#
>   top_srcdir			?= ..
> 
> I suppose you generate patch correctly with 'git format-patch' and send with
> 'git send-email'. I wonder if your mailserver breaks the patch. Could you check
> it and optionally use different mailserver? (you can send mail to ML from e.g.
> gmail and still have Signed-off-by: with huawei.com mail address).
Oops! I made some incorrect changes to the patch by mistake. My bad.

> Unrelated change: you fix also indent here. It'd be better to add it into
> separate patch.
Changed, thanks a lot.

Just re-checked the latest code and submit the v2 version. Please see: 
https://patchwork.ozlabs.org/project/ltp/list/?series=243550

Thanks for your review, Petr.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
