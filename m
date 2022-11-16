Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7E762B1FC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Nov 2022 04:57:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AECF3CD19D
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Nov 2022 04:57:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CCD73CAFBA
 for <ltp@lists.linux.it>; Wed, 16 Nov 2022 04:57:52 +0100 (CET)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8954F6008E6
 for <ltp@lists.linux.it>; Wed, 16 Nov 2022 04:57:50 +0100 (CET)
Received: from canpemm100006.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NBq1V079TzJnkL
 for <ltp@lists.linux.it>; Wed, 16 Nov 2022 11:54:38 +0800 (CST)
Received: from canpemm500005.china.huawei.com (7.192.104.229) by
 canpemm100006.china.huawei.com (7.192.104.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 11:57:46 +0800
Received: from canpemm500005.china.huawei.com ([7.192.104.229]) by
 canpemm500005.china.huawei.com ([7.192.104.229]) with mapi id 15.01.2375.031; 
 Wed, 16 Nov 2022 11:57:46 +0800
To: "rpalethorpe@suse.de" <rpalethorpe@suse.de>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/nice05: new test for nice()
Thread-Index: AdjpFbStm5foqevKRHyK7TYpHe8STAQWYXrQ
Date: Wed, 16 Nov 2022 03:57:46 +0000
Message-ID: <79ad7aa50e204033afa1edb70fb83d96@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/nice05: new test for nice()
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

Hi!

> 
> Hi,
> 
> >
> > Hello,
> >
> > Zhao Gongyi via ltp <ltp@lists.linux.it> writes:
> >
> > > Verify that user of root can decrease the nice value of the process
> > > successfully by passing a lower increment value (< min. applicable
> > > limits) to nice() system call.
> > >
> > > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> > > ---
> > >  runtest/syscalls                          |  1 +
> > >  testcases/kernel/syscalls/nice/.gitignore |  1 +
> > >  testcases/kernel/syscalls/nice/nice05.c   | 54
> > +++++++++++++++++++++++
> > >  3 files changed, 56 insertions(+)
> > >  create mode 100644 testcases/kernel/syscalls/nice/nice05.c
> > >
> > > diff --git a/runtest/syscalls b/runtest/syscalls index
> > > bd74373a4..7db399375 100644
> > > --- a/runtest/syscalls
> > > +++ b/runtest/syscalls
> > > @@ -902,6 +902,7 @@ nice01 nice01
> > >  nice02 nice02
> > >  nice03 nice03
> > >  nice04 nice04
> > > +nice05 nice05
> >
> > 05 has already been taken. Also this test is very similar to nice01.
> > Maybe it could be added to that?
> 
> It seems better that move to nice01, thanks!
> 
> >
> > >
> > >  open01 open01
> > >  open01A symlink01 -T open01
> > > diff --git a/testcases/kernel/syscalls/nice/.gitignore
> > > b/testcases/kernel/syscalls/nice/.gitignore
> > > index 9d7a1bb43..58d64779e 100644
> > > --- a/testcases/kernel/syscalls/nice/.gitignore
> > > +++ b/testcases/kernel/syscalls/nice/.gitignore
> > > @@ -2,3 +2,4 @@
> > >  /nice02
> > >  /nice03
> > >  /nice04
> > > +/nice05
> > > diff --git a/testcases/kernel/syscalls/nice/nice05.c
> > > b/testcases/kernel/syscalls/nice/nice05.c
> > > new file mode 100644
> > > index 000000000..85f10fadf
> > > --- /dev/null
> > > +++ b/testcases/kernel/syscalls/nice/nice05.c
> > > @@ -0,0 +1,54 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright(c) 2022 Huawei Technologies Co., Ltd
> > > + * Author: Zhao Gongyi <zhaogongyi@huawei.com>  */
> > > +
> > > +/*\
> > > + * [Description]
> > > + *
> > > + * Verify that user of root can decrease the nice value of
> > > + * the process successfully by passing a lower increment
> > > + * value (< min. applicable limits) to nice() system call.
> > > + */
> > > +#include <unistd.h>
> > > +#include "tst_test.h"
> > > +
> > > +#define	NICEINC -50
> > > +#define MIN_PRIO  -20
> > > +#define DEFAULT_PRIO 0
> > > +
> > > +static void verify_nice(void)
> > > +{
> > > +	int new_nice;
> > > +
> > > +	TEST(nice(NICEINC));
> >
> > Why not use one of the TST_EXP* macros?
> 
> The errno seems difficult to check in TST_EXP*, TST_EXP_PASS have no
> checking of errno.
> 
> >
> > > +	if (TST_RET == -1) {
> > > +		tst_res(TFAIL | TTERRNO, "nice(%d) returned -1", NICEINC);
> > > +		return;
> > > +	}
> > > +
> > > +	if (TST_ERR) {
> > > +		tst_res(TFAIL | TTERRNO, "nice(%d) failed", NICEINC);
> > > +		return;
> > > +	}
> > > +
> > > +	new_nice = SAFE_GETPRIORITY(PRIO_PROCESS, 0);
> > > +
> > > +	if (new_nice != MIN_PRIO) {
> > > +		tst_res(TFAIL,
> > > +			"Process priority %i, expected %i", new_nice,
> MIN_PRIO);
> > > +		return;
> > > +	}
> > > +
> > > +	tst_res(TPASS, "nice(%d) passed", NICEINC);
> > > +
> > > +	TEST(nice(DEFAULT_PRIO));
> > > +	if (TST_ERR)
> > > +		tst_brk(TBROK | TTERRNO, "nice(%d) failed",
> > > DEFAULT_PRIO);
> >
> > Again, could use TST_EXP* macro. Also just checking TST_ERR is not
> > strictly correct.
> 
> Similialy, TST_EXP_PASS has no checking of errno also, and it seems that
> check the return value is enough since the return value is not -1.
> 
> Regards,
> Gongyi


I have submit a new patch that move the test to nice01.c, please see: https://patchwork.ozlabs.org/project/ltp/patch/20221116034910.37030-1-zhaogongyi@huawei.com/

Regards,
Gongyi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
