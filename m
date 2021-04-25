Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3436A45F
	for <lists+linux-ltp@lfdr.de>; Sun, 25 Apr 2021 05:28:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECFAA3C6974
	for <lists+linux-ltp@lfdr.de>; Sun, 25 Apr 2021 05:28:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35F453C1AB5
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 05:28:18 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A0AF4600472
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 05:28:16 +0200 (CEST)
Received: from dggeml707-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FSYKX1GFZzWbX7
 for <ltp@lists.linux.it>; Sun, 25 Apr 2021 11:24:16 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml707-chm.china.huawei.com (10.3.17.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sun, 25 Apr 2021 11:28:08 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Sun, 25 Apr 2021 11:28:08 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/getdents01: Add close() and open() at the
 end of run()
Thread-Index: Adc5gv7k4Oqd+WolYk6YGz0t4CPvow==
Date: Sun, 25 Apr 2021 03:28:08 +0000
Message-ID: <808aa8a561fa469b9eedda4f29196c6a@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getdents01: Add close() and open() at
 the end of run()
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

I have re-submitted the patch according you review, please see: https://patchwork.ozlabs.org/project/ltp/patch/20210425012240.6328-1-zhaogongyi@huawei.com/

Thanks so much!

Best Regards,
Gongyi

> 
> Hi!
> >  testcases/kernel/syscalls/getdents/getdents01.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/getdents/getdents01.c
> > b/testcases/kernel/syscalls/getdents/getdents01.c
> > index ef8f4e864..7982691a6 100644
> > --- a/testcases/kernel/syscalls/getdents/getdents01.c
> > +++ b/testcases/kernel/syscalls/getdents/getdents01.c
> > @@ -92,6 +92,9 @@ static void run(void)
> >  	} while (rval > 0);
> >
> >  	check_flags();
> > +
> > +	SAFE_CLOSE(fd);
> > +	fd = SAFE_OPEN(".", O_RDONLY|O_DIRECTORY);
> >  }
> 
> Good catch but I guess that it would be a bit cleaner if we opened the fd at
> the start of the run() and closed it at the end instead of opening it in setup()
> and reopening it for each iteration.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
