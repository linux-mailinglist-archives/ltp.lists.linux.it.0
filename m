Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA10636B250
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:24:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A0253C66ED
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:24:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C79CD3C5E5D
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:24:18 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C81711400B8A
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:24:16 +0200 (CEST)
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FTMt96kFGzYZlx
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 19:21:53 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 26 Apr 2021 19:24:09 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Apr 2021 19:24:09 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Mon, 26 Apr 2021 19:24:09 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
Thread-Index: AQHXOodtHJQpDaXDiE2dlym0ml+YgarGo6xg
Date: Mon, 26 Apr 2021 11:24:08 +0000
Message-ID: <ae16017b01474cbb9d4d0e74e473a7c4@huawei.com>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-2-xieziyao@huawei.com> <YIaWnt5ksxVyBvxk@pevik>
In-Reply-To: <YIaWnt5ksxVyBvxk@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

Hi,

Thanks for your review, Petr.

> +	TEST(tst_syscall(__NR_tkill, tid, SIGUSR1));
> +	if (TST_RET == 0) {
> +		while (!sig_flag);

This while loop is written to check whether the sighandler function captures the SIGUSR1 signal and set sig_flag to 1.

> +		tst_res(TPASS, "tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> +	} else {
> +		tst_res(TFAIL | TTERRNO,
> +			"tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
>  	}
> -	cleanup();
> -	tst_exit();
>  }

Other comments are fine to me.

Best Regards,
Ziyao

-----Original Message-----
From: Petr Vorel [mailto:pvorel@suse.cz] 
Sent: Monday, April 26, 2021 6:32 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API

Hi,

> 1. Convert tkill01 to the new API;
> 2. Capture signals to verify success, while the previous code didn't 
> make it work.

Generally LGTM, with comments below.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -48,59 +24,37 @@
>  #include <linux/unistd.h>
>  #include <sys/types.h>
I removed these as not needed. The only one which is still relevant is <signal.h> (I kept it although it's not needed to be included, as it's included in tst_safe_macros.h which are included in tst_test.h).

> -#include "test.h"
>  #include "lapi/syscalls.h"
> +#include "tst_test.h"

> +int sig_flag = 0;

It should be
static int sig_flag;

...
> +static void run(void)
...
> +	SAFE_SIGNAL(SIGUSR1, sighandler);
> +	TEST(tid = tst_syscall(__NR_gettid));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "tst_syscall(__NR_gettid) failed");
gettid() manpage says "ERRORS: This call is alway successful". I suppose this is true also for raw syscall. And it's certainly true for tst_syscall(__NR_gettid).

BTW if it really needed to be checked, tst_brk() or tst_res() with return would need to be used.
> +
> +	TEST(tst_syscall(__NR_tkill, tid, SIGUSR1));
> +	if (TST_RET == 0) {
> +		while (!sig_flag);
Not sure why you required this.
> +		tst_res(TPASS, "tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
> +	} else {
> +		tst_res(TFAIL | TTERRNO,
> +			"tst_syscall(__NR_tkill, %d, SIGUSR1)", tid);
>  	}
> -	cleanup();
> -	tst_exit();
>  }
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test_all = run,
> +};
In the end going to merge code below.

Kind regards,
Petr

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Copyright (c) Linux Test Project, 2009-2021
 * Copyright (c) Crackerjack Project., 2007
 * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>  */

/*\
 * [Description]
 *
 * Basic tests for the tkill syscall.
 *
 * [Algorithm]
 *
 * Calls tkill and capture signals to verify success.
 */

#include <signal.h>

#include "lapi/syscalls.h"
#include "tst_test.h"

static int sig_flag;

static void sighandler(int sig)
{
	if (sig == SIGUSR1)
		sig_flag = 1;
}

static void run(void)
{
	int tid;

	SAFE_SIGNAL(SIGUSR1, sighandler);

	tid = tst_syscall(__NR_gettid);

	TST_EXP_PASS(tst_syscall(__NR_tkill, tid, SIGUSR1)); }

static struct tst_test test = {
	.needs_tmpdir = 1,
	.test_all = run,
};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
