Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A42335DE1D
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:55:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 945433C7206
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:55:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83FB83C1DBD
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:55:05 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 17A80200758
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:55:04 +0200 (CEST)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FKPB023dlzRcBV
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 19:52:56 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 DGGEML403-HUB.china.huawei.com ([fe80::74d9:c659:fbec:21fa%31]) with mapi id
 14.03.0513.000; Tue, 13 Apr 2021 19:54:55 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
Thread-Index: AdcwW8lTeA1YEL0ZTiS65b2nJAsKow==
Date: Tue, 13 Apr 2021 11:54:54 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B49AE@dggeml531-mbx.china.huawei.com>
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

Thanks so much!

I have resubmit the patch according your review.

Best Regards,
Gongyi

> 
> Hi!
> > Thanks for your review!
> >
> > > > +       } else
> > > > +               kill(getppid(), SIGUSR1);
> > >
> > > No need for the else branch here now that we do exit() a the end of
> the if
> > > () block.
> > >
> >
> > Generally speaking, It seems that we also need the else branch since we
> need to send heart beat to the main process.
> 
> What I meant was that the code could be structured as:
> 
> 
> 	if (getppid() == 1) {
> 		...
> 		exit(TBROK);
> 	}
> 
> 	kill(getppid(), SIGUSR1);
> 
> Hence there is no need for the else branch.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
