Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5974435D9DB
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 10:19:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1371D3C1C7C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 10:19:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B05CC3C1C13
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 10:19:16 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0CD9F20025A
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 10:19:14 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FKJNx5jT1zRc0y
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 16:17:05 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0513.000;
 Tue, 13 Apr 2021 16:19:02 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
Thread-Index: AdcwPZ2vvlw7bCrUQiyOlMUVfaddHA==
Date: Tue, 13 Apr 2021 08:19:02 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B47B3@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

According to your review, is there any problems in the patch as follows:

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 45753d1ca..0a096d666 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1156,7 +1156,16 @@ static void heartbeat(void)
        if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
                tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");

-       kill(getppid(), SIGUSR1);
+       if (getppid() == 1) {
+               tst_res(TFAIL, "Main test process might have exit!");
+               /*
+                * We need kill the task group immediately since the
+                * main process has exit.
+                */
+               kill(0, SIGKILL);
+               exit(-1);
+       } else
+               kill(getppid(), SIGUSR1);
 }

Thanks so much!

Best Regards,
Gongyi


> 
> Hi!
> > > > +		/*
> > > > +		 * We need kill the task group immediately since the
> > > > +		 * main process has exit.
> > > > +		 */
> > > > +		kill(0, SIGKILL);
> > >
> > > Shouldn't we call exit here? There is no point in continuing once we
> > > reached this point.
> > >
> >
> > Yes, There is no point in continuing once we reached this point.
> > Considering the test might have created sub processes with system,
> > posix_spawn and so on,
> >
> > do we need to kill the task group?
> 
> Yes, I think this is the right course of action, we do the same if the test
> timeouts as well.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
