Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6436B267
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:36:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 206383C675A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:36:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 190973C072E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:36:01 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 43320200154
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:35:59 +0200 (CEST)
Received: from dggeml703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FTN7Y1Kj7z5vBL
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 19:33:29 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggeml703-chm.china.huawei.com (10.3.17.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 26 Apr 2021 19:35:55 +0800
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Apr 2021 19:35:55 +0800
Received: from dggpemm500022.china.huawei.com ([7.185.36.162]) by
 dggpemm500022.china.huawei.com ([7.185.36.162]) with mapi id 15.01.2176.012;
 Mon, 26 Apr 2021 19:35:55 +0800
From: xieziyao <xieziyao@huawei.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 2/2] syscalls/tkill: Convert tkill02 to the new API
Thread-Index: AQHXOo0RUd8ePxiY5Uyvin6+52uPHarGqkxA
Date: Mon, 26 Apr 2021 11:35:55 +0000
Message-ID: <eadd5bf5cfc34977b9fc4ccf7cf053fb@huawei.com>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-3-xieziyao@huawei.com> <YIagGNrM6az0oMk6@pevik>
In-Reply-To: <YIagGNrM6az0oMk6@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.109.194]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/tkill: Convert tkill02 to the new API
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

Hi, Petr,

LGTM, thanks for your review.

Best Regards,
Ziyao

-----Original Message-----
From: Petr Vorel [mailto:pvorel@suse.cz] 
Sent: Monday, April 26, 2021 7:12 PM
To: xieziyao <xieziyao@huawei.com>
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/tkill: Convert tkill02 to the new API

Hi,

LGTM with very minor changes.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +static pid_t expired_pid;
>  static pid_t inval_tid = -1;
> -static pid_t unused_tid;

IMHO unused_tid is better describe what the variable holds.

> -
> -void cleanup(void)
> -{
> -	tst_rmdir();
> -}
> -
> -void setup(void)
> -{
> -	TEST_PAUSE;
> -	tst_tmpdir();
> -
> -	unused_tid = tst_get_unused_pid(cleanup);
> -}

>  struct test_case_t {
>  	int *tid;
>  	int exp_errno;
> -} test_cases[] = {
> -	{&inval_tid, EINVAL},
> -	{&unused_tid, ESRCH}
> +	const char *desc;
> +} tc[] = {
> +	{&inval_tid, EINVAL, "inval_tid"},
> +	{&expired_pid, ESRCH, "expired_pid"}
Well, there is no point to print variable name.  Better would be "invalid TID"
and "unused TID". But IMHO just writing what we expect is enough.

It could be:
#define ERRNO_DESC(x) .exp_errno = x, .desc = "exp" #x ...

	{&inval_tid, ERRNO_DESC(EINVAL},
	{&expired_pid, ERRNO_DESC(ESRCH}

But we have tst_strerrno(), thus just:

struct test_case_t {
	int *tid;
	int exp_errno;
} tc[] = {
	{&inval_tid, EINVAL},
	{&unused_tid, ESRCH}
};

...
	TST_EXP_FAIL(tst_syscall(__NR_tkill, *(tc[i].tid), SIGUSR1),
		     tc[i].exp_errno, "tst_syscall(__NR_tkill) expecting %s",
			 tst_strerrno(tc[i].exp_errno));

I'll merge code below.

Kind regards,
Petr

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Copyright (c) Crackerjack Project., 2007
 * Ported from Crackerjack to LTP by Manas Kumar Nayak maknayak@in.ibm.com>  */

/*\
 * [Description]
 *
 * Basic tests for the tkill() errors.
 *
 * [Algorithm]
 *
 * - EINVAL on an invalid thread ID
 * - ESRCH when no process with the specified thread ID exists  */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <signal.h>
#include <sys/syscall.h>

#include "lapi/syscalls.h"
#include "tst_test.h"

static pid_t unused_tid;
static pid_t inval_tid = -1;

struct test_case_t {
	int *tid;
	int exp_errno;
} tc[] = {
	{&inval_tid, EINVAL},
	{&unused_tid, ESRCH}
};

static void setup(void)
{
	unused_tid = tst_get_unused_pid();
}

static void run(unsigned int i)
{
	TST_EXP_FAIL(tst_syscall(__NR_tkill, *(tc[i].tid), SIGUSR1),
		     tc[i].exp_errno, "tst_syscall(__NR_tkill) expecting %s",
			 tst_strerrno(tc[i].exp_errno));
}

static struct tst_test test = {
	.tcnt = ARRAY_SIZE(tc),
	.needs_tmpdir = 1,
	.setup = setup,
	.test = run,
};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
