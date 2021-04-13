Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BA35DCD8
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 12:53:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 484373C7210
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 12:53:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11C6B3C1C44
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 12:53:01 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD4DE10006C6
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 12:52:59 +0200 (CEST)
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FKMmZ3JTvzWYgH
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 18:49:18 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 13 Apr 2021 18:52:55 +0800
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0513.000;
 Tue, 13 Apr 2021 18:52:47 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
Thread-Index: AdcwUxsxhSehNkrzSVmJ1l87exzQLg==
Date: Tue, 13 Apr 2021 10:52:47 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B4974@dggeml531-mbx.china.huawei.com>
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
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
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

> > +       } else
> > +               kill(getppid(), SIGUSR1);
> 
> No need for the else branch here now that we do exit() a the end of the if
> () block.
>

Generally speaking, It seems that we also need the else branch since we need to send heart beat to the main process.

Best Regards,
Gongyi

> 
> Hi!
> > According to your review, is there any problems in the patch as follows:
> >
> > diff --git a/lib/tst_test.c b/lib/tst_test.c index
> > 45753d1ca..0a096d666 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -1156,7 +1156,16 @@ static void heartbeat(void)
> >         if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
> >                 tst_res(TWARN | TERRNO, "tst_clock_gettime()
> failed");
> >
> > -       kill(getppid(), SIGUSR1);
> > +       if (getppid() == 1) {
> > +               tst_res(TFAIL, "Main test process might have exit!");
> > +               /*
> > +                * We need kill the task group immediately since the
> > +                * main process has exit.
> > +                */
> > +               kill(0, SIGKILL);
> > +               exit(-1);
> 
> Not that it matters that much, but I would do exit(TBROK);
> 
> > +       } else
> > +               kill(getppid(), SIGUSR1);
> 
> No need for the else branch here now that we do exit() a the end of the if
> () block.
> 
> Other than that it looks good.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
