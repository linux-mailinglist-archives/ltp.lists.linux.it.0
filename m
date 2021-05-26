Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD7390ED3
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 05:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66C963C94FA
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 05:24:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 15A263C2B52
 for <ltp@lists.linux.it>; Wed, 26 May 2021 05:24:02 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A7E2D60091E
 for <ltp@lists.linux.it>; Wed, 26 May 2021 05:24:00 +0200 (CEST)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fqbmf6NyXzQskB;
 Wed, 26 May 2021 11:20:18 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 11:23:54 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 11:23:54 +0800
To: Petr Vorel <pvorel@suse.cz>, <ltp@lists.linux.it>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com> <YKbbCLUlaICqSIK5@pevik>
 <88d2297a-58f1-2ee3-0db4-6686ffbf4de2@huawei.com> <YKeXHtPOexQr8Iic@pevik>
 <YK0UA1wzaROqJDD7@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <ea9ff360-540a-527c-83d4-44e8ad1c1b68@huawei.com>
Date: Wed, 26 May 2021 11:23:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK0UA1wzaROqJDD7@pevik>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
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
Cc: hanpt@linux.vnet.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> 
> BTW I wonder if test could be run with less than 5GB, which is quite a lot.
> 
According to the kernel commit 5d73320a96fcc,testcase for the sendfile 
of lengths greater than 2G (maybe offset+count) is OK.

IMHO, maybe we can reduce the size, but still a lot.

Kind regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
