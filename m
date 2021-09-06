Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 791124018D3
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 11:29:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 304A23C268D
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Sep 2021 11:29:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D66253C24BE
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 11:29:18 +0200 (CEST)
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 51E8D10009E2
 for <ltp@lists.linux.it>; Mon,  6 Sep 2021 11:29:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=M6E+0
 n/fsdc0FO4pX7j5itM+LGptirELFTROpGoWolY=; b=DTlmsAJOoOcD0On/t0fo1
 iklhe+i8Zrxnx+fmJBDgZQZ3rRimai0zVkIfXhanRPAk3gj7Tdaa8Y+p/ewjHo2O
 DcwzbSqUogffcpranyyffcWgUHv/k/BmM2akj+MF0+jxMTEchIMqbkSo8sNogOf4
 X0jHsLYEoU3Z/f/f7ylLKg=
Received: from [172.20.10.4] (unknown [122.96.46.176])
 by smtp1 (Coremail) with SMTP id GdxpCgB3p21j3zVh0zJHAQ--.1841S2;
 Mon, 06 Sep 2021 17:29:09 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210902115849.72382-1-qi.fuli@fujitsu.com>
 <20210902115849.72382-2-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <169c8ba3-fbc3-f628-f5cc-b157d4aada85@163.com>
Date: Mon, 6 Sep 2021 17:29:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210902115849.72382-2-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: GdxpCgB3p21j3zVh0zJHAQ--.1841S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jry3Kr4xXw1xur1DXw4DXFb_yoW7ArWxpF
 9rAwsFkF4kJF109a1Ivw4UZFW8Zrn5try8Kr45ZwsYvF13Jry7trsYgasxWFykGrZIg3yf
 Xa1v9rs5Ja1UtF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jm6wtUUUUU=
X-Originating-IP: [122.96.46.176]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBIw8GXl3l-PycMAABsh
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] syscalls/dup2/dup201: Convert dup201 to the
 new API
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

On 9/2/21 7:58 PM, QI Fuli wrote:
> From: QI Fuli <qi.fuli@fujitsu.com>
>
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   testcases/kernel/syscalls/dup2/dup201.c | 161 +++++-------------------
>   1 file changed, 34 insertions(+), 127 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
> index 4fa34466a..231c262bf 100644
> --- a/testcases/kernel/syscalls/dup2/dup201.c
> +++ b/testcases/kernel/syscalls/dup2/dup201.c
> @@ -1,87 +1,30 @@
> -/*
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
> - */
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   
>   /*
> - * NAME
> - *	dup201.c
> + * Copyright (c) International Business Machines  Corp., 2001
>    *
> - * DESCRIPTION
> + * DESCRIPTION:
>    *	Negative tests for dup2() with bad fd (EBADF)
>    *
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
> - *
> - * USAGE:  <for command-line>
> - *  dup201 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *	01/2002 Removed EMFILE test - Paul Larson
> - *
> - * RESTRICTIONS
> - * 	NONE
> + * HISTORY:
> + * 	07/2001 Ported by Wayne Boyer
> + * 	01/2002 Removed EMFILE test - Paul Larson
>    */
>   
> -#include <sys/types.h>
> -#include <fcntl.h>
>   #include <errno.h>
> -#include <sys/time.h>
> -#include <sys/resource.h>
> -#include <unistd.h>

Hi Qi,

Please keep <unistd.h> for dup2() and getdtablesize().

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
>   int maxfd;
>   int goodfd = 5;
>   int badfd = -1;
>   int mystdout = 0;
Please add static prefix.
>   
> -struct test_case_t {
> +static struct tcase {
>   	int *ofd;
>   	int *nfd;
>   	int error;
>   	void (*setupfunc) ();
> -} TC[] = {
> +} tcases[] = {
>   	/* First fd argument is less than 0 - EBADF */
>   	{&badfd, &goodfd, EBADF, NULL},
>   	    /* First fd argument is getdtablesize() - EBADF */
> @@ -92,72 +35,36 @@ struct test_case_t {
>   	{&mystdout, &maxfd, EBADF, NULL},
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
>   void setup(void)
>   {
Please add static prefix.
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
> +	if (tc->setupfunc)
> +		tc->setupfunc();

tc->setupfunc always NULL so you can remove it directly.

> +
> +	TEST(dup2(*tc->ofd, *tc->nfd));
> +
> +	if (TST_RET == -1) {
> +		if (TST_ERR == tc->error)
> +			tst_res(TPASS, "failed as expected - errno = %d : %s",
> +				TST_ERR, strerror(TST_ERR));
> +		else
> +			tst_res(TFAIL | TTERRNO, "failed unexpectedly; "
> +				"expected %d: %s", tc->error,
> +				strerror(tc->error));
> +	} else
> +		tst_res(TFAIL, "call succeeded unexpectedly");
It is simpler to call TST_EXP_FAIL2() here.
>   }
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,

It seems that we don't need any temp file.

Best Regards,

Xiao Yang

> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +};


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
