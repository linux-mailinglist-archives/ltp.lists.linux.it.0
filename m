Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D422A4CC
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 03:42:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA5203C23E6
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 03:42:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2DC7E3C1CB4
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 03:42:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 91C641000926
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 03:42:27 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,383,1589212800"; d="scan'208";a="96772805"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 09:42:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8F30A4CE505C;
 Thu, 23 Jul 2020 09:42:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 09:42:23 +0800
To: Martin Doucha <mdoucha@suse.cz>
References: <20200722151951.21909-1-mdoucha@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7706b4e4-429e-2db0-a911-cde4241ec200@cn.fujitsu.com>
Date: Thu, 23 Jul 2020 09:42:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722151951.21909-1-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8F30A4CE505C.A15B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Port setsockopt01 to the new API
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

HI Martin

Looks good to me,
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> Changes since v1:
> - Use SAFE_CLOSE() instead of close() in EBADF testcase setup
> - Improve setsockopt() result checks
> 
>   .../kernel/syscalls/setsockopt/setsockopt01.c | 243 +++++-------------
>   1 file changed, 69 insertions(+), 174 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt01.c b/testcases/kernel/syscalls/setsockopt/setsockopt01.c
> index 743c6be14..4c48a0d95 100644
> --- a/testcases/kernel/syscalls/setsockopt/setsockopt01.c
> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt01.c
> @@ -1,72 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - *
>    *   Copyright (c) International Business Machines  Corp., 2001
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
> + *	07/2001 John George
> + *   Copyright (c) 2020 Martin Doucha <mdoucha@suse.cz>
>    */
>   
>   /*
> - * Test Name: setsockopt01
> - *
>    * Test Description:
>    *  Verify that setsockopt() returns the proper errno for various failure cases
> - *
> - * Usage:  <for command-line>
> - *  setsockopt01 [-c n] [-e] [-i n] [-I x] [-p x] [-t]
> - *	where,  -c n : Run n copies concurrently.
> - *		-e   : Turn on errno logging.
> - *		-i n : Execute test n times.
> - *		-I x : Execute test for x seconds.
> - *		-P x : Pause for x seconds between iterations.
> - *		-t   : Turn on syscall timing.
> - *
> - * History
> - *	07/2001 John George
> - *		-Ported
> - *
> - * Restrictions:
> - *  None.
> - *
>    */
>   
> -#include <stdio.h>
>   #include <unistd.h>
> -#include <errno.h>
> -#include <fcntl.h>
> -
>   #include <sys/types.h>
>   #include <sys/socket.h>
> -#include <sys/signal.h>
>   #include <sys/ioctl.h>
> -
>   #include <netinet/in.h>
>   
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
>   
> -char *TCID = "setsockopt01";
> -int testno;
> +static struct sockaddr_in addr;
> +static int optval;
>   
> -int s;				/* socket descriptor */
> -struct sockaddr_in sin0, fsin1;
> -int optval;
> -
> -void setup(void), setup0(void), setup1(void),
> -cleanup(void), cleanup0(void), cleanup1(void);
> -
> -struct test_case_t {		/* test case structure */
> +static struct test_case {	/* test case structure */
>   	int domain;		/* PF_INET, PF_UNIX, ... */
>   	int type;		/* SOCK_STREAM, SOCK_DGRAM ... */
>   	int proto;		/* protocol number (usually 0 = default) */
> @@ -74,140 +29,80 @@ struct test_case_t {		/* test case structure */
>   	int optname;
>   	void *optval;
>   	int optlen;
> -	struct sockaddr *sin;
> -	int salen;
> -	int retval;		/* syscall return value */
>   	int experrno;		/* expected errno */
> -	void (*setup) (void);
> -	void (*cleanup) (void);
>   	char *desc;
> -} tdat[] = {
> -	{
> -	PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, EBADF, setup0, cleanup0,
> -		    "bad file descriptor"}
> -	, {
> -	PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, ENOTSOCK, setup0, cleanup0,
> -		    "bad file descriptor"}
> -	,
> -#if !defined(UCLINUX)
> -	{
> -	PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, 0,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, EFAULT, setup1, cleanup1,
> -		    "invalid option buffer"}
> -	,
> -#endif
> -	{
> -	PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, &optval, 0,
> -		    (struct sockaddr *)&fsin1, sizeof(fsin1), -1,
> -		    EINVAL, setup1, cleanup1, "invalid optlen"}
> -	, {
> -	PF_INET, SOCK_STREAM, 0, 500, SO_OOBINLINE, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, ENOPROTOOPT, setup1, cleanup1,
> -		    "invalid level"}
> -	, {
> -	PF_INET, SOCK_STREAM, 0, IPPROTO_UDP, SO_OOBINLINE, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, ENOPROTOOPT, setup1, cleanup1,
> -		    "invalid option name (UDP)"}
> -	, {
> -	PF_INET, SOCK_STREAM, 0, IPPROTO_IP, -1, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, ENOPROTOOPT, setup1, cleanup1,
> -		    "invalid option name (IP)"}
> -	, {
> -	PF_INET, SOCK_STREAM, 0, IPPROTO_TCP, -1, &optval,
> -		    sizeof(optval), (struct sockaddr *)&fsin1,
> -		    sizeof(fsin1), -1, ENOPROTOOPT, setup1, cleanup1,
> -		    "invalid option name (TCP)"}
> -,};
> -
> -int TST_TOTAL = sizeof(tdat) / sizeof(tdat[0]);
> -
> -int main(int argc, char *argv[])
> +} testcase_list[] = {
> +	{-1, -1, -1, SOL_SOCKET, SO_OOBINLINE, &optval, sizeof(optval),
> +		EBADF, "invalid file descriptor"},
> +	{-1, -1, -1, SOL_SOCKET, SO_OOBINLINE, &optval, sizeof(optval),
> +		ENOTSOCK, "non-socket file descriptor"},
> +	{PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, NULL,
> +		sizeof(optval), EFAULT, "invalid option buffer"},
> +	{PF_INET, SOCK_STREAM, 0, SOL_SOCKET, SO_OOBINLINE, &optval, 0,
> +		EINVAL, "invalid optlen"},
> +	{PF_INET, SOCK_STREAM, 0, 500, SO_OOBINLINE, &optval, sizeof(optval),
> +		ENOPROTOOPT, "invalid level"},
> +	{PF_INET, SOCK_STREAM, 0, IPPROTO_UDP, SO_OOBINLINE, &optval,
> +		sizeof(optval), ENOPROTOOPT, "invalid option name (UDP)"},
> +	{PF_INET, SOCK_STREAM, 0, IPPROTO_IP, -1, &optval, sizeof(optval),
> +		ENOPROTOOPT, "invalid option name (IP)"},
> +	{PF_INET, SOCK_STREAM, 0, IPPROTO_TCP, -1, &optval, sizeof(optval),
> +		ENOPROTOOPT, "invalid option name (TCP)"}
> +};
> +
> +static void setup(void)
>   {
> -	int lc;
> -
> -	tst_parse_opts(argc, argv, NULL, NULL);
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); ++lc) {
> -		tst_count = 0;
> -		for (testno = 0; testno < TST_TOTAL; ++testno) {
> -			tdat[testno].setup();
> -
> -			TEST(setsockopt(s, tdat[testno].level,
> -					tdat[testno].optname,
> -					tdat[testno].optval,
> -					tdat[testno].optlen));
> -
> -			if (TEST_RETURN == -1) {
> -			}
> -
> -			if (TEST_RETURN != tdat[testno].retval ||
> -			    (TEST_RETURN < 0 &&
> -			     TEST_ERRNO != tdat[testno].experrno)) {
> -				tst_resm(TFAIL, "%s ; returned"
> -					 " %ld (expected %d), errno %d (expected"
> -					 " %d)", tdat[testno].desc,
> -					 TEST_RETURN, tdat[testno].retval,
> -					 TEST_ERRNO, tdat[testno].experrno);
> -			} else {
> -				tst_resm(TPASS, "%s successful",
> -					 tdat[testno].desc);
> -			}
> -			tdat[testno].cleanup();
> -		}
> -	}
> -	cleanup();
> -	tst_exit();
> +	/* initialize local sockaddr */
> +	addr.sin_family = AF_INET;
> +	addr.sin_port = 0;
> +	addr.sin_addr.s_addr = INADDR_ANY;
>   }
>   
> -void setup(void)
> +static void run(unsigned int n)
>   {
> +	struct test_case *tc = testcase_list + n;
> +	int tmpfd, fd;
>   
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +	tst_res(TINFO, "Testing %s", tc->desc);
>   
> -	TEST_PAUSE;
> +	if (tc->domain == -1) {
> +		tmpfd = fd = SAFE_OPEN("/dev/null", O_WRONLY);
> +	} else {
> +		tmpfd = fd = SAFE_SOCKET(tc->domain, tc->type, tc->proto);
> +		SAFE_BIND(fd, (struct sockaddr *)&addr, sizeof(addr));
> +	}
>   
> -	/* initialize local sockaddr */
> -	sin0.sin_family = AF_INET;
> -	sin0.sin_port = 0;
> -	sin0.sin_addr.s_addr = INADDR_ANY;
> -}
> +	/* Use closed file descriptor rather than -1 */
> +	if (tc->experrno == EBADF)
> +		SAFE_CLOSE(tmpfd);
>   
> -void cleanup(void)
> -{
> -}
> +	TEST(setsockopt(fd, tc->level, tc->optname, tc->optval, tc->optlen));
>   
> -void setup0(void)
> -{
> -	if (tdat[testno].experrno == EBADF)
> -		s = 400;	/* anything not an open file */
> -	else if ((s = open("/dev/null", O_WRONLY)) == -1)
> -		tst_brkm(TBROK, cleanup, "error opening /dev/null - "
> -			 "errno: %s", strerror(errno));
> -}
> +	if (tc->experrno != EBADF)
> +		SAFE_CLOSE(fd);
>   
> -void cleanup0(void)
> -{
> -	s = -1;
> -}
> +	if (TST_RET == 0) {
> +		tst_res(TFAIL, "setsockopt() succeeded unexpectedly");
> +		return;
> +	}
>   
> -void setup1(void)
> -{
> -	s = SAFE_SOCKET(cleanup, tdat[testno].domain, tdat[testno].type,
> -			tdat[testno].proto);
> -	SAFE_BIND(cleanup, s, (struct sockaddr *)&sin0, sizeof(sin0));
> -}
> +	if (TST_RET != -1) {
> +		tst_res(TFAIL | TTERRNO,
> +			"Invalid setsockopt() return value %ld", TST_RET);
> +		return;
> +	}
>   
> -void cleanup1(void)
> -{
> -	(void)close(s);
> -	s = -1;
> +	if (TST_ERR != tc->experrno) {
> +		tst_res(TFAIL | TTERRNO,
> +			"setsockopt() returned unexpected error");
> +		return;
> +	}
> +
> +	tst_res(TPASS | TTERRNO, "setsockopt() returned the expected error");
>   }
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(testcase_list),
> +	.setup = setup
> +};
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
