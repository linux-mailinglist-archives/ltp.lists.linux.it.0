Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD22374FD7
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:12:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B839B3C569A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 09:12:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10C0A3C00BB
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:12:42 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 54A7F60138B
 for <ltp@lists.linux.it>; Thu,  6 May 2021 09:12:41 +0200 (CEST)
Received: from dggeml713-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FbPpw4GJwz5xFy
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:10:00 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml713-chm.china.huawei.com (10.3.17.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 15:12:35 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 6 May 2021 15:12:29 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210430094513.162499-1-xieziyao@huawei.com>
 <20210430094513.162499-2-xieziyao@huawei.com> <YJAFldREJ1aQBDdh@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <31bca9c3-acd8-7d7d-7c41-152571e8f605@huawei.com>
Date: Thu, 6 May 2021 15:12:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJAFldREJ1aQBDdh@yuki>
Content-Language: en-US
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3 v2] syscalls/chown: Rewrite chown/chown02.c
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

Hi,

Thanks for the modification, Cyril. BTW, the macro definition of 
FILE_MODE is useless and I suggest deleting it.

Please see: 
https://patchwork.ozlabs.org/project/ltp/patch/20210506071118.140135-1-xieziyao@huawei.com/

Kind regards,
Ziyao

On 2021/5/3 22:15, Cyril Hrubis wrote:
> Hi!
> Pushed with minor changes, thanks.
> 
> * I've updated the documentation comment a bit
> * Moved the chmod() to the run() function so that the test
>    changes back the modified permissions with -i parameter
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
