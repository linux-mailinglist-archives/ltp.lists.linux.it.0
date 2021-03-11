Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F6336EA5
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 10:16:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D2583C3368
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 10:16:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 380D73C3228
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 10:16:50 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 21758601A3C
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 10:16:48 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AvjCD/KgZgmutogd/d00vaZBuhnBQXjoji2hD?=
 =?us-ascii?q?6mlwRA09T+WzkceykPMHkSLlkTp5YgBFpfmsGomlBUnd+5l8/JULMd6ZMTXOlW?=
 =?us-ascii?q?O0IOhZg7fK7DHtFib3/OwY9YoIScJDIfLqC1wSt6fHyS2ZN/pl/9Wd6qCvgo7l?=
 =?us-ascii?q?vhJQZCVncbtp4Qs8KivzKDwUeCB8CZA0FIWR66N8zlLORV0scs+5CnMZNtKzxe?=
 =?us-ascii?q?HjqZSOW347Li9iwAyPoBft07TiDiWfty10bxp/hZsk7kjJ+jaU2pme?=
X-IronPort-AV: E=Sophos;i="5.81,239,1610380800"; d="scan'208";a="105501560"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Mar 2021 17:16:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0213C4CEA991
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 17:16:39 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 17:16:38 +0800
Message-ID: <6049DFF5.9000609@cn.fujitsu.com>
Date: Thu, 11 Mar 2021 17:16:37 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
References: <20210311080648.311648-1-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210311080648.311648-1-ruansy.fnst@fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0213C4CEA991.AE0B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/chdir04: Convert to the new API
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ruan,

Pushed with three minor changes:
1) Remove space between tcases and [].
2) Printing "chdir(tcases[i].dir )" doesn't make sense so print 
"chdir()" directly.
3) Rename bad_dir to long_dir.

Best Regards,
Xiao Yang
On 2021/3/11 16:06, Shiyang Ruan wrote
> Signed-off-by: Shiyang Ruan<ruansy.fnst@fujitsu.com>
> ---
>   testcases/kernel/syscalls/chdir/chdir04.c | 174 ++++------------------
>   1 file changed, 27 insertions(+), 147 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/chdir/chdir04.c b/testcases/kernel/syscalls/chdir/chdir04.c
> index f0420e4c9..e6b128652 100644
> --- a/testcases/kernel/syscalls/chdir/chdir04.c
> +++ b/testcases/kernel/syscalls/chdir/chdir04.c
> @@ -1,162 +1,42 @@
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
>    */
>
> -/*
> - * NAME
> - * 	chdir04.c
> - *
> - * DESCRIPTION
> - *	Testcase to test whether chdir(2) sets errno correctly.
> - *
> - * ALGORITHM
> - *	1.	Test for ENAMETOOLONG:
> - *		Create a bad directory name with length more than
> - *
> - *		VFS_MAXNAMELEN (Linux kernel variable), and attempt to
> - *		chdir(2) to it.
> - *
> - *	2.	Test for ENOENT:
> - *		Attempt to chdir(2) on a non-existent directory
> - *
> - *	3.	Test for EFAULT:
> - *		Pass an address which lies outside the address space of the
> - *		process, and expect an EFAULT.
> +/*\
> + * [DESCRIPTION]
>    *
> - * USAGE:<for command-line>
> - * chdir04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS
> - *	NONE
> + * Testcase to test whether chdir(2) sets errno correctly.
>    */
>
> -#include<stdio.h>
>   #include<errno.h>
> -#include<sys/stat.h>
> -#include<sys/mman.h>
> -#include "test.h"
> -
> -char *TCID = "chdir04";
> -
> -char bad_dir[] =
> -    "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
> -
> -char noexist_dir[] = "/tmp/noexistdir";
> -
> -struct test_case_t {
> -	char *dname;
> -	int error;
> -} TC[] = {
> -	/*
> -	 * to test whether chdir() is setting ENAMETOOLONG if the
> -	 * directory is more than VFS_MAXNAMELEN
> -	 */
> -	{
> -	bad_dir, ENAMETOOLONG},
> -	    /*
> -	     * to test whether chdir() is setting ENOENT if the
> -	     * directory is not existing.
> -	     */
> -	{
> -	noexist_dir, ENOENT},
> -	    /*
> -	     * to test whether chdir() is setting EFAULT if the
> -	     * directory is an invalid address.
> -	     */
> -	{
> -	(void *)-1, EFAULT}
> +#include "tst_test.h"
> +
> +static char bad_dir[] = "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
> +static char noexist_dir[] = "/tmp/noexistdir";
> +
> +static struct tcase {
> +	char *dir;
> +	int exp_errno;
> +} tcases [] = {
> +	{bad_dir, ENAMETOOLONG},
> +	{noexist_dir, ENOENT},
> +	{0, EFAULT}, // bad_addr
>   };
>
> -int TST_TOTAL = ARRAY_SIZE(TC);
> -
> -int flag;
> -#define	FAILED	1
> -
> -void setup(void);
> -void cleanup(void);
> -
> -char *bad_addr = 0;
> -
> -int main(int ac, char **av)
> +static void verify_chdir(unsigned int i)
>   {
> -	int lc;
> -	int i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		for (i = 0; i<  TST_TOTAL; i++) {
> -
> -			TEST(chdir(TC[i].dname));
> -
> -			if (TEST_RETURN != -1) {
> -				tst_resm(TFAIL, "call succeeded unexpectedly");
> -				continue;
> -			}
> -
> -			if (TEST_ERRNO == TC[i].error)
> -				tst_resm(TPASS | TTERRNO, "failed as expected");
> -			else {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "didn't fail as expected (expected %d)",
> -					 TC[i].error);
> -			}
> -		}
> -	}
> -	cleanup();
> -
> -	tst_exit();
> -
> +	TST_EXP_FAIL(chdir(tcases[i].dir), tcases[i].exp_errno);
>   }
>
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
> -#ifdef UCLINUX
> -	bad_addr = mmap(0, 1, PROT_NONE,
> -			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
> -	if (bad_addr == MAP_FAILED)
> -		tst_brkm(TBROK | TERRNO, cleanup, "mmap() failed");
> -	TC[2].dname = bad_addr;
> -#endif
> +	tcases[2].dir = tst_get_bad_addr(NULL);
>   }
>
> -void cleanup(void)
> -{
> -	tst_rmdir();
> -
> -}
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test = verify_chdir,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.setup = setup,
> +};




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
