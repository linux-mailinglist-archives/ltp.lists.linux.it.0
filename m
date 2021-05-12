Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F1737B88F
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:51:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94C6A3C644A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 10:51:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB4543C4E46
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:51:23 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4699C140004A
 for <ltp@lists.linux.it>; Wed, 12 May 2021 10:51:21 +0200 (CEST)
Received: from dggeml708-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fg7h112JWzWSfx
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:46:57 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml708-chm.china.huawei.com (10.3.17.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 16:51:12 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 16:51:12 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210402034612.127912-1-xieziyao@huawei.com>
 <20210402034612.127912-3-xieziyao@huawei.com> <YJokrrfndIMMdvaG@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <d8929fa4-e39c-3b87-cd4e-c9aeea0f9ecb@huawei.com>
Date: Wed, 12 May 2021 16:51:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJokrrfndIMMdvaG@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] kernel/syscalls: Unify the annotation style
 and remove Redundant code
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

> Next time it'd be better to separate these changes - put Makefile changes into
> separate commit and ideally use script to replace all of them.
For all the testsuite that has used SPDX, I've also used script and 
shell commands to modify its Makefile to use SPDX.

Please take a look at this patch: 
https://patchwork.ozlabs.org/project/ltp/patch/20210512084904.35159-1-xieziyao@huawei.com/

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
