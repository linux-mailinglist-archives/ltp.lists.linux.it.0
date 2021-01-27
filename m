Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B74304F62
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:09:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D748A3C01F4
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:09:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 718E43C00BB
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:09:14 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 233F91A0079A
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:09:12 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,378,1602518400"; d="scan'208";a="103878688"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Jan 2021 11:09:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4645D4CE6026
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:09:06 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 27 Jan 2021 11:09:06 +0800
Message-ID: <6010D950.30002@cn.fujitsu.com>
Date: Wed, 27 Jan 2021 11:09:04 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
References: <20210127025112.1226584-1-ruansy.fnst@cn.fujitsu.com>
In-Reply-To: <20210127025112.1226584-1-ruansy.fnst@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4645D4CE6026.A845A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/times01: Convert to new API
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

On 2021/1/27 10:51, Shiyang Ruan wrote:
> Signed-off-by: Shiyang Ruan<ruansy.fnst@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/times/times01.c | 168 +++-------------------
>   1 file changed, 20 insertions(+), 148 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/times/times01.c b/testcases/kernel/syscalls/times/times01.c
> index 293a52957..87a0f6144 100644
> --- a/testcases/kernel/syscalls/times/times01.c
> +++ b/testcases/kernel/syscalls/times/times01.c
> @@ -1,162 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
>    * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
>    *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it is
> - * free of the rightful claim of any third person regarding infringement
> - * or the like.  Any license provided herein, whether implied or
> - * otherwise, applies only to this software file.  Patent licenses, if
> - * any, provided herein do not apply to combinations of this program with
> - * other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
> - * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
> - * Mountain View, CA  94043, or:
> - *
> - * http://www.sgi.com
> - *
> - * For further information regarding this notice, see:
> - *
> - * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
> - *
> - */
> -/* $Id: times01.c,v 1.6 2009/10/26 14:55:48 subrata_modak Exp $ */
> -/**********************************************************
> - *
> - *    OS Test - Silicon Graphics, Inc.
> - *
> - *    TEST IDENTIFIER	: times01
> - *
> - *    EXECUTED BY	: anyone
> - *
> - *    TEST TITLE	: Basic test for times(2)
> - *
> - *    PARENT DOCUMENT	: usctpl01
> - *
> - *    TEST CASE TOTAL	: 1
> - *
> - *    WALL CLOCK TIME	: 1
> - *
> - *    CPU TYPES		: ALL
> - *
> - *    AUTHOR		: William Roske
> - *
> - *    CO-PILOT		: Dave Fenner
> - *
> - *    DATE STARTED	: 03/30/92
> - *
> - *    INITIAL RELEASE	: UNICOS 7.0
> - *
> - *    TEST CASES
> - *
> - * 	1.) times(2) returns...(See Description)
> - *
> - *    INPUT SPECIFICATIONS
> - * 	The standard options for system call tests are accepted.
> - *	(See the parse_opts(3) man page).
> - *
> - *    OUTPUT SPECIFICATIONS
> - *$
> - *    DURATION
> - * 	Terminates - with frequency and infinite modes.
> - *
> - *    SIGNALS
> - * 	Uses SIGUSR1 to pause before test if option set.
> - * 	(See the parse_opts(3) man page).
> - *
> - *    RESOURCES
> - * 	None
> - *
> - *    ENVIRONMENTAL NEEDS
> - *      No run-time environmental needs.
> - *
> - *    SPECIAL PROCEDURAL REQUIREMENTS
> - * 	None
> - *
> - *    INTERCASE DEPENDENCIES
> - * 	None
> - *
> - *    DETAILED DESCRIPTION
> + * DESCRIPTION
>    *	This is a Phase I test for the times(2) system call.  It is intended
> - *	to provide a limited exposure of the system call, for now.  It
> - *	should/will be extended when full functional tests are written for
> - *	times(2).
> - *
> - * 	Setup:
> - * 	  Setup signal handling.
> - *	  Pause for SIGUSR1 if option specified.
> - *
> - * 	Test:
> - *	 Loop if the proper options are given.
> - * 	  Execute system call
> - *	  Check return code, if system call failed (return=-1)
> - *		Log the errno and Issue a FAIL message.
> - *	  Otherwise, Issue a PASS message.
> + *	to provide a limited exposure of the system call.
>    *
> - * 	Cleanup:
> - * 	  Print errno log and/or timing stats if options given

Hi Ruan,

Please use the following format of description comment so that it can be 
picked up by docparser:
--------------------------------------
/*\
   * [DESCRIPTION]
...
\*/
--------------------------------------

> - *
> - *
> - *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
> + * ALGORITHM:
> + *	Execute system call
> + *	Check return code, if system call failed (return=-1)
> + *	    Log the errno and Issue a FAIL message.
> + *	Otherwise, Issue a PASS message.
> + */

This test is very easy so remove the algorithm comment directly.

>
> -#include<sys/types.h>
>   #include<sys/times.h>
>   #include<errno.h>
> -#include<string.h>
> -#include<signal.h>
> -#include "test.h"
> -
> -void setup();
> -void cleanup();
> -
> -char *TCID = "times01";
> -int TST_TOTAL = 1;
> -
> -struct tms mytimes;
> +#include "tst_test.h"
>
> -int main(int ac, char **av)
> +static void verify_times(void)
>   {
> -	int lc;
> +	struct tms mytimes;
>
> -	tst_parse_opts(ac, av, NULL, NULL);
> +	TEST(times(&mytimes));
>
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(times(&mytimes));
> -
> -		if (TEST_RETURN == -1)
> -			tst_resm(TFAIL | TTERRNO, "times failed");
> -		else
> -			tst_resm(TPASS, "times(&mytimes) returned %ld",
> -				 TEST_RETURN);
> -
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "times failed");
> +	else
> +		tst_res(TPASS, "times(&mytimes) returned %ld", TST_RET);
It is simpler to use TST_EXP_PASS() here (replace TEST()).

Best Regards,
Xiao Yang
>   }
>
> -void setup(void)
> -{
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> -
> -void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = verify_times,
> +};




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
