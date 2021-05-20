Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BF38AA41
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:11:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72AEC3C8740
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:11:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CC6B3C2FEF
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:11:04 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 55D241A0145F
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:11:01 +0200 (CEST)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fm6RH264mzqTxJ
 for <ltp@lists.linux.it>; Thu, 20 May 2021 19:08:11 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 19:10:57 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 19:10:57 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com> <YKTcWhMGotujEYLK@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <e17ffbb2-2c2a-bd15-9e8c-cd2795e566cd@huawei.com>
Date: Thu, 20 May 2021 19:10:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKTcWhMGotujEYLK@yuki>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

>> + * Testcase copied from sendfile02.c to test the basic functionality of
>> + * the sendfile(2) system call on large file. There is a kernel bug which
>> + * introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
>                              ^
> 	Here as well the commit that introduced the bug should go to
> 	.tags.
Changed for sendfile{08, 09}, thanks a lot.

>> + * [Restrictions]
> 
> So far we had only [Description] and [Algorithm] but adding
> [Restrictions] sounds reasonable.
> 
>>    *
>> - * RESTRICTIONS
>> - *        Only supports 64bit systems and kernel 2.6.33 or above
>> + * Only supports 64bit systems and kernel 2.6.33 or above.
> 
> I guess that there is no point in mentioning the kernel version here, we
> have it in the tst_test structure and it's exported from that structure
> into the metadata as well.Changed and moved [Restrictions] to [Description].

>> +#ifdef TST_ABI32
>> +tst_brkm(TCONF, "This test is only for 64bit");
>> +#endif
> 
> Does this even compile on 32bit?
> 
> HINT: You can compile LTP for 32bit with ./configure CFLAGS=-m32 LDFLAGS=-m32
Sorry about this mistake and I fixed it with modifications above in the 
v2 version.

Please see: https://patchwork.ozlabs.org/project/ltp/list/?series=244863

Thanks for your review, Cyril.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
