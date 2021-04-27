Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45636BD04
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:49:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EA7C3C674D
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:49:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E0C93C6745
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:49:15 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B97791A00A43
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:49:13 +0200 (CEST)
Received: from dggeml712-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FTl4170Dqz5vqd
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 09:46:41 +0800 (CST)
Received: from dggpemm100004.china.huawei.com (7.185.36.189) by
 dggeml712-chm.china.huawei.com (10.3.17.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 09:49:09 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm100004.china.huawei.com (7.185.36.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 09:49:09 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Tue, 27 Apr 2021 09:49:09 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
Thread-Index: AQHXOodtHJQpDaXDiE2dlym0ml+YgarGo6xg//+YAwCAAU/2wA==
Date: Tue, 27 Apr 2021 01:49:08 +0000
Message-ID: <a4618c19e3934127ad6ea9fd6afd233c@huawei.com>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-2-xieziyao@huawei.com> <YIaWnt5ksxVyBvxk@pevik>
 <ae16017b01474cbb9d4d0e74e473a7c4@huawei.com> <YIa4PuDonH1Jwnlc@pevik>
In-Reply-To: <YIa4PuDonH1Jwnlc@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
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

Hi, Petr, Cyril,

I think adding usleep(1000) in while loop is a good idea, thanks.

Best Regards,
Ziyao

-----Original Message-----
From: Petr Vorel [mailto:pvorel@suse.cz] 
Sent: Monday, April 26, 2021 8:55 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it; Cyril Hrubis <chrubis@suse.cz>
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API

> Hi,

> Thanks for your review, Petr.

> > +	TEST(tst_syscall(__NR_tkill, tid, SIGUSR1));
> > +	if (TST_RET == 0) {
> > +		while (!sig_flag);

> This while loop is written to check whether the sighandler function captures the SIGUSR1 signal and set sig_flag to 1.

Oh, correct. But not sure if it's good to use plain while.
Maybe using usleep(1000) in while loop?

TST_EXP_PASS(tst_syscall(__NR_tkill, tid, SIGUSR1));

while (!sig_flag)
	usleep(1000);

Kind regards,
Petr

> > +		tst_res(TPASS, "tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> > +	} else {
> > +		tst_res(TFAIL | TTERRNO,
> > +			"tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> >  	}
> > -	cleanup();
> > -	tst_exit();
> >  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
