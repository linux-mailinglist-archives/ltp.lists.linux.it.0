Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E635D830
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 08:43:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7DE13C71F6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 08:43:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D1EA3C721F
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 08:43:08 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BE3471A00703
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 08:43:06 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FKGDF0nHlz14GGx
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 14:39:25 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 DGGEML402-HUB.china.huawei.com ([fe80::fca6:7568:4ee3:c776%31]) with mapi id
 14.03.0513.000; Tue, 13 Apr 2021 14:42:52 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
Thread-Index: AdcwLd3iZhqYiLMrSWikAlKGiMO2gQ==
Date: Tue, 13 Apr 2021 06:42:52 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B3761@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

> > -	kill(getppid(), SIGUSR1);
> > +	if (getppid() == 1) {
> > +		tst_res(TFAIL, "Main test process might have exit!");
>                          ^
> 			 This should be TBROK I guess.
> > +		/*
> > +		 * We need kill the task group immediately since the
> > +		 * main process has exit.
> > +		 */
> > +		kill(0, SIGKILL);
> 
> Shouldn't we call exit here? There is no point in continuing once we
> reached this point.
>

Yes, There is no point in continuing once we reached this point. Considering the test might have created sub processes with system, posix_spawn and so on,

do we need to kill the task group?


Best Regards,
Gongyi


> 
> Hi!
> > When main process has been killed, its son process will be reaped by
> > init, and son process will send SIGUSR1 to the init process.
> >
> > In busybox, send SIGUSR1 to the init process will trigger shutdown.
> >
> > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> > ---
> >  lib/tst_test.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/tst_test.c b/lib/tst_test.c index
> > 45753d1ca..91dfc6bf9 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -1156,7 +1156,15 @@ static void heartbeat(void)
> >  	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
> >  		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
> >
> > -	kill(getppid(), SIGUSR1);
> > +	if (getppid() == 1) {
> > +		tst_res(TFAIL, "Main test process might have exit!");
>                          ^
> 			 This should be TBROK I guess.
> > +		/*
> > +		 * We need kill the task group immediately since the
> > +		 * main process has exit.
> > +		 */
> > +		kill(0, SIGKILL);
> 
> Shouldn't we call exit here? There is no point in continuing once we
> reached this point.
> 
> > +	} else
> > +		kill(getppid(), SIGUSR1);
> >  }
> >
> >  static void testrun(void)
> > --
> > 2.17.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
