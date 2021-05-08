Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1373C37702B
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 08:48:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97B8A3C5535
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 08:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 23E813C54E7
 for <ltp@lists.linux.it>; Sat,  8 May 2021 08:48:37 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22CBF100145E
 for <ltp@lists.linux.it>; Sat,  8 May 2021 08:48:36 +0200 (CEST)
Received: from dggeml705-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fcd9M4ZPTz5y78
 for <ltp@lists.linux.it>; Sat,  8 May 2021 14:45:11 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml705-chm.china.huawei.com (10.3.17.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 8 May 2021 14:48:29 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Sat, 8 May 2021 14:48:29 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/setfsgid02: Bugfix for running as root
Thread-Index: AddD1iLXl5jYWIctQqmBxNLeAVZtBg==
Date: Sat, 8 May 2021 06:48:29 +0000
Message-ID: <4aa96ba2e4da40cca03556cb7f0e331f@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setfsgid02: Bugfix for running as root
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Thanks for your review!

I have resubmitted the patch and rewrite setfsgid02.c,

please see: https://patchwork.ozlabs.org/project/ltp/patch/20210508064351.10737-1-zhaogongyi@huawei.com/


Thanks so much!

Best Regards,
Gongyi

> 
> Hi!
> > When we run the test as root id, and with the option "-i 2", test will
> > fail.
> 
> Looking at the test there is much more to fix.
> 
> - the description does not match what the test is doing
> - the pass/fail condition and TFAIL message does not make any sense
> 
> And its the same for the rest of the setfsgid tests.
> 
> Looking at the manual pages for this oddball syscall we should check if:
> 
> - unpriviledged process cannot change the value i.e. value that is
>   different from return from ret=setfsgid(-1) is passed as
>   setfsgid(ret+1) followed by setfsgid(-1) and all of these returns the
>   same value and the value also matches process effective group ID
> 
> - priviledged process can change the value i.e. the same as
>   unpriviledged but we expect the last setfsgid(-1) return
>   the new value. We either have to reset the setfsgid() at the end of
>   the test or run it in a fork()-ed process so that we start with a
>   clean plate for each iteration
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
