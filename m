Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E779502022
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Apr 2022 03:27:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A7973CA5F9
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Apr 2022 03:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A5133CA119
 for <ltp@lists.linux.it>; Fri, 15 Apr 2022 03:27:42 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0738160067B
 for <ltp@lists.linux.it>; Fri, 15 Apr 2022 03:27:39 +0200 (CEST)
Received: from canpemm500008.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KfdwK4pSLz1HBJx
 for <ltp@lists.linux.it>; Fri, 15 Apr 2022 09:26:57 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm500008.china.huawei.com (7.192.105.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Apr 2022 09:27:35 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.024; 
 Fri, 15 Apr 2022 09:27:35 +0800
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] futex_waitv04: Add test for futex_waitv syscall
Thread-Index: AdhQZCvF0w198cEtQCSZC/G4mQVHUQ==
Date: Fri, 15 Apr 2022 01:27:35 +0000
Message-ID: <c9aee645b8c146aa9b87b2cb26a6dfd1@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_waitv04: Add test for futex_waitv syscall
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
From: zhaogongyi via ltp <ltp@lists.linux.it>
Reply-To: zhaogongyi <zhaogongyi@huawei.com>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

I also wondered whether to add these two testcases into futex_waitv01.c, there is a consideration that there are alse two other testcases need to be added according to linux manual:

1. A signal was sent to the sleeping task, returning -ERESTARTSYS.
2. Some futex at the list was woken, returning the index of some waked futex.

Best wishes!

Gongyi

> Hi!
> > diff --git a/testcases/kernel/syscalls/futex/futex_waitv04.c
> > b/testcases/kernel/syscalls/futex/futex_waitv04.c
> > new file mode 100644
> > index 000000000..783d481e9
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/futex/futex_waitv04.c
> > @@ -0,0 +1,83 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2022 Zhao Gongyi <zhaogongyi@huawei.com>  */
> > +
> > +/*\
> > + * [Description]
> > + *
> > + * This test verifies EAGIN and ETIMEDOUT for futex_waitv syscall.
>                          ^
>                          EAGAIN
> 
> Is there a reason why can't we add these two testcases into
> futex_waitv01.c?
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
