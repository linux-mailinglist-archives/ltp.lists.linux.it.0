Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8654105F1
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:38:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D31F3C8806
	for <lists+linux-ltp@lfdr.de>; Sat, 18 Sep 2021 12:38:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 315F53C1CD1
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:38:30 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6AC0660007C
 for <ltp@lists.linux.it>; Sat, 18 Sep 2021 12:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BblFF
 /d8XF7DMH8mYAvatAu1uuKHK5xOSQbwhonO9No=; b=hcRYjxNny4nbCUge3ad8R
 90ttVs/owcQgnYDkTmgh8oz9nDngjprbNKAKJBUT7AspJDpmHXsnuvbI7s+A61Pr
 mqtQxFDjKwWEQKzZEtP7rJ/XeBBhNiPMa4MlLaCLMeijAShvp6TzlMl59G6l0eWS
 G5uI7stkobqny4axgx/kxo=
Received: from [172.20.10.4] (unknown [122.96.47.73])
 by smtp5 (Coremail) with SMTP id HdxpCgAH70WewUVhNE+8BQ--.6103S2;
 Sat, 18 Sep 2021 18:38:23 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210918072609.8576-1-qi.fuli@fujitsu.com>
 <20210918072609.8576-5-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <6a9e0bf7-4ab0-9a3b-40b7-cfde3922b1a9@163.com>
Date: Sat, 18 Sep 2021 18:38:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210918072609.8576-5-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: HdxpCgAH70WewUVhNE+8BQ--.6103S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Gr4xGr1xAF1rKF47Gr13twb_yoW7uw1rpF
 9xZryxXr4kJFy8GF1xXwsrJF15Zws8JrWjqrW8ZasYyr4UZryxJr4vqw18ZFyUGrW8Zw18
 XF4UW3s8J3WDtFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-fHUUUUUU=
X-Originating-IP: [122.96.47.73]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiFh8SXl44Rd4W+QAAsX
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] syscalls/dup2/dup205: Convert to new API
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
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   testcases/kernel/syscalls/dup2/dup205.c | 168 ++++++++----------------
>   1 file changed, 52 insertions(+), 116 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/dup2/dup205.c b/testcases/kernel/syscalls/dup2/dup205.c
> index 0b324531f..9942e63a7 100644
> --- a/testcases/kernel/syscalls/dup2/dup205.c
> +++ b/testcases/kernel/syscalls/dup2/dup205.c
> @@ -1,134 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2002
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
> + * Copyright (c) International Business Machines  Corp., 2002
> + * Ported from SPIE, section2/iosuite/dup6.c, by Airong Zhang
>    */
>   
> -/* Ported from SPIE, section2/iosuite/dup6.c, by Airong Zhang */
> -
> -/*======================================================================
> -	=================== TESTPLAN SEGMENT ===================
> ->KEYS:  < dup2()
> ->WHAT:  < Does dup return -1 on the 21st file?
> ->HOW:   < Create up to _NFILE files and check for -1 return on the
> -	< next attempt
> -	< Should check NOFILE as well as _NFILE.  19-Jun-84 Dale.
> ->BUGS:  <
> -======================================================================*/
> +/*\
> + * [Description]
> + * Negative test for dup2() with max open file descriptors.
> + */
>   
> -#include <sys/param.h>
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <errno.h>
> -#include <fcntl.h>
> +#include <stdlib.h>
>   #include <stdio.h>
>   #include <unistd.h>
> -#include "test.h"
> -
> -char *TCID = "dup205";
> -int TST_TOTAL = 1;
> -int *fildes;
> -int min;
> -int local_flag;
> -
> -#define PASSED 1
> -#define FAILED 0
> -
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char *av[])
> -{
> -	int ifile;
> -	char pfilname[40];
> -	int serrno;
> -
> -	int lc;
> -
> -	ifile = -1;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	local_flag = PASSED;
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
>   
> -		sprintf(pfilname, "./dup205.%d\n", getpid());
> -		unlink(pfilname);
> -		serrno = 0;
> -		if ((fildes[0] = creat(pfilname, 0666)) == -1)
> -			tst_brkm(TBROK | TERRNO, cleanup, "creat failed");
> -		else {
> -			fildes[fildes[0]] = fildes[0];
> -			for (ifile = fildes[0] + 1; ifile < min + 10; ifile++) {
> -				if ((fildes[ifile] = dup2(fildes[ifile - 1],
> -							  ifile)) == -1) {
> -					serrno = errno;
> -					break;
> -				} else {
> -					if (fildes[ifile] != ifile) {
> -						tst_brkm(TFAIL, cleanup,
> -							 "got wrong descriptor "
> -							 "number back (%d != %d)",
> -							 fildes[ifile], ifile);
> -					}
> -				}
> -			}	/* end for */
> -			if (ifile < min) {
> -				tst_resm(TFAIL, "Not enough files duped");
> -				local_flag = FAILED;
> -			} else if (ifile > min) {
> -				tst_resm(TFAIL, "Too many files duped");
> -				local_flag = FAILED;
> -			}
> -			if (serrno != EBADF && serrno != EMFILE &&
> -			    serrno != EINVAL) {
> -				tst_resm(TFAIL, "bad errno on dup2 failure");
> -				local_flag = FAILED;
> -			}
> -		}
> -		unlink(pfilname);
> -		for (ifile = fildes[0]; ifile < min + 10; ifile++)
> -			close(fildes[ifile]);
> -		if (local_flag == PASSED) {
> -			tst_resm(TPASS, "Test passed.");
> -		} else {
> -			tst_resm(TFAIL, "Test failed.");
> -		}
> -
> -	}
> -	cleanup();
> -	tst_exit();
> -}
> +static int *fildes;
> +static int min;
> +static char pfilname[40];
>   
>   static void setup(void)
>   {
> -	tst_tmpdir();
> -
>   	min = getdtablesize();	/* get number of files allowed open */
> -	fildes = malloc((min + 10) * sizeof(int));
> -	if (fildes == NULL)
> -		tst_brkm(TBROK | TERRNO, cleanup, "malloc error");
> +	fildes = SAFE_MALLOC((min + 10) * sizeof(int));
> +	sprintf(pfilname, "./dup205.%d\n", getpid());
dup204?
>   }
>   
>   static void cleanup(void)
>   {
>   	if (fildes != NULL)
>   		free(fildes);
> -	tst_rmdir();
>   }
> +
> +static void run(void)
> +{
> +	int ifile = -1;
> +
> +	fildes[0] = SAFE_CREAT(pfilname, 0666);
> +	fildes[fildes[0]] = fildes[0];
> +	for (ifile = fildes[0] + 1; ifile < min + 10; ifile++) {
> +		TEST(dup2(fildes[ifile - 1], ifile));
> +		if ((fildes[ifile] = TST_RET) == -1)
> +			break;
> +		if (fildes[ifile] != ifile)
> +			tst_brk(TFAIL, "got wrong descriptor number back "
> +				"(%d != %d)", fildes[ifile], ifile);
> +	}
> +
> +	if (TST_ERR != EBADF && TST_ERR != EMFILE && TST_ERR != EINVAL)
> +		tst_res(TFAIL, "bad errno on dup2 failure");
> +
> +	if (ifile < min)
> +		tst_res(TFAIL, "Not enough files duped");
> +	else if (ifile > min)
> +		tst_res(TFAIL, "Too many files duped");
> +	else
> +		tst_res(TPASS, "Test passed.");

The logic is wrong. (You changed the old logic.)

If TST_ERR != either of three errno and ifile == min, dup204 will show 
strange messages:

-------------------------------

tst_res(TFAIL, "bad errno on dup2 failure");
tst_res(TPASS, "Test passed.");

-------------------------------

> +
> +	SAFE_UNLINK(pfilname);
> +	for (ifile = fildes[0]; ifile < min + 10; ifile++)
> +		close(fildes[ifile]);
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
