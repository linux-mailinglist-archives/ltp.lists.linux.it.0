Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBAF4105E7
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:13:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74A243C8801
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:13:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B33BD3C1CD1
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:13:45 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id F318020015D
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=sGv7E
 YBBVCnuDif14HOPTo85EhaaITE7FRVw9GmkHiQ=; b=mDPP9q/RL4PUsiiMOYWjC
 rlidL0Uv46ZM5wlvPJ7+HNHoUIRgoZLnPoIhosjw3YiFtgXIOBObUdqjvSWXkwX5
 +vj6oTu2h4dPUmzFHyxxB8wUWCTNpt4Ylwv0UWgur1COTC8XfyWS5aBEdm5F/Tys
 ZoJC7u1nTpVD4Zm+Ukrqys=
Received: from [172.20.10.4] (unknown [122.96.47.73])
 by smtp5 (Coremail) with SMTP id HdxpCgCX4u7Ru0VhB6a4BQ--.4652S2;
 Sat, 18 Sep 2021 18:13:38 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210918072609.8576-1-qi.fuli@fujitsu.com>
 <20210918072609.8576-2-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <2f65abf3-ed10-0ee4-b863-baa52799b0d5@163.com>
Date: Sat, 18 Sep 2021 18:13:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210918072609.8576-2-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgCX4u7Ru0VhB6a4BQ--.4652S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jry3Kr45uF4xJw4fCFy7GFg_yoW7Ar15pF
 9rZrsrCF48JF1kuF40qw45ZF1rCwn5XF48Kr1DAwsYqr4fJryUta1vg3sruF1kGrZxW3yS
 qa1v9r4rXa13tFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTjgxUUUUU=
X-Originating-IP: [122.96.47.73]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEBISXl8YHW02NQAAs6
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/dup2/dup201: Convert to new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 9/18/21 3:26 PM, QI Fuli wrote:
> From: QI Fuli <qi.fuli@fujitsu.com>
>
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   testcases/kernel/syscalls/dup2/dup201.c | 175 +++++-------------------
>   1 file changed, 33 insertions(+), 142 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
> index 4fa34466a..03f0bb4bd 100644
> --- a/testcases/kernel/syscalls/dup2/dup201.c
> +++ b/testcases/kernel/syscalls/dup2/dup201.c
> @@ -1,163 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * Copyright (c) International Business Machines  Corp., 2001
> + * 07/2001 Ported by Wayne Boyer
> + * 01/2002 Removed EMFILE test - Paul Larson
>    */
> -
> -/*
> - * NAME
> - *	dup201.c
> - *
> - * DESCRIPTION
> - *	Negative tests for dup2() with bad fd (EBADF)
> - *
> - * ALGORITHM
> - * 	Setup:
> - *	a.	Setup signal handling.
> - *	b.	Pause for SIGUSR1 if option specified.
> - *
> - * 	Test:
> - *	a.	Loop if the proper options are given.
> - *	b.	Loop through the test cases
> - * 	c.	Execute dup2() system call
> - *	d.	Check return code, if system call failed (return=-1), test
> - *		for EBADF.
> - *
> - * 	Cleanup:
> - * 	a.	Print errno log and/or timing stats if options given
> +/*\
> + * [Description]
>    *
> - * USAGE:  <for command-line>
> - *  dup201 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> + * Negative tests for dup2() with bad fd (EBADF)

Please add a new line here.

> + * - First fd argument is less than 0
> + * - First fd argument is getdtablesize()
> + * - Second fd argument is less than 0
> + * - Second fd argument is getdtablesize()
>    *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *	01/2002 Removed EMFILE test - Paul Larson
> - *
> - * RESTRICTIONS
> - * 	NONE
>    */
>   
> -#include <sys/types.h>
> -#include <fcntl.h>
>   #include <errno.h>
> -#include <sys/time.h>
> -#include <sys/resource.h>
>   #include <unistd.h>
> -#include <signal.h>
> -#include "test.h"
> -
> -void setup(void);
> -void cleanup(void);
> -
> -char *TCID = "dup201";
> -int TST_TOTAL = 4;
> +#include "tst_test.h"
>   
> -int maxfd;
> -int goodfd = 5;
> -int badfd = -1;
> -int mystdout = 0;
> +static int maxfd, mystdout;
> +static int goodfd = 5;
> +static int badfd = -1;
>   
> -struct test_case_t {
> +static struct tcase {
>   	int *ofd;
>   	int *nfd;
> -	int error;
> -	void (*setupfunc) ();
> -} TC[] = {
> -	/* First fd argument is less than 0 - EBADF */
> -	{&badfd, &goodfd, EBADF, NULL},
> -	    /* First fd argument is getdtablesize() - EBADF */
> -	{&maxfd, &goodfd, EBADF, NULL},
> -	    /* Second fd argument is less than 0 - EBADF */
> -	{&mystdout, &badfd, EBADF, NULL},
> -	    /* Second fd argument is getdtablesize() - EBADF */
> -	{&mystdout, &maxfd, EBADF, NULL},
> +} tcases[] = {
> +	{&badfd, &goodfd},
> +	{&maxfd, &goodfd},
> +	{&mystdout, &badfd},
> +	{&mystdout, &maxfd},
>   };
>   
> -int main(int ac, char **av)
> -{
> -	int lc;
> -	int i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		/* loop through the test cases */
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -
> -			/* call the test case setup routine if necessary */
> -			if (TC[i].setupfunc != NULL)
> -				(*TC[i].setupfunc) ();
> -
> -			TEST(dup2(*TC[i].ofd, *TC[i].nfd));
> -
> -			if (TEST_RETURN != -1) {
> -				tst_resm(TFAIL, "call succeeded unexpectedly");
> -				continue;
> -			}
> -
> -			if (TEST_ERRNO == TC[i].error) {
> -				tst_resm(TPASS,
> -					 "failed as expected - errno = %d : %s",
> -					 TEST_ERRNO, strerror(TEST_ERRNO));
> -			} else {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "failed unexpectedly; "
> -					 "expected %d: %s", TC[i].error,
> -					 strerror(TC[i].error));
> -			}
> -		}
> -	}
> -	cleanup();
> -
> -	tst_exit();
> -}
> -
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
> -void setup(void)
> +static void setup(void)
>   {
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
>   	/* get some test specific values */
>   	maxfd = getdtablesize();
>   }
>   
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *	       completion or premature exit.
> - */
> -void cleanup(void)
> +static void run(unsigned int i)
>   {
> -	tst_rmdir();
> +	struct tcase *tc = tcases + i;
> +
> +	TST_EXP_FAIL2(dup2(*tc->ofd, *tc->nfd), EBADF,
> +			"dup2(%d, %d)", *tc->ofd, *tc->nfd);
>   }
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +};


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
