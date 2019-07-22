Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C66FB8F
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 10:44:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F87B3C1CFD
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 10:44:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C19473C1C70
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 10:44:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 34CE61000CAE
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 10:44:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,294,1559491200"; d="scan'208";a="71942277"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jul 2019 16:44:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id A0ADB4CDDD3F;
 Mon, 22 Jul 2019 16:44:40 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 22 Jul 2019 16:44:45 +0800
Message-ID: <5D357777.9030308@cn.fujitsu.com>
Date: Mon, 22 Jul 2019 16:44:39 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190722083356.10142-1-pvorel@suse.cz>
In-Reply-To: <20190722083356.10142-1-pvorel@suse.cz>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: A0ADB4CDDD3F.AE963
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] syscalls: Remove getcontext01
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

Hi Petr,

gercontext is filtered for uclinux and android in syscalls/Makefile so 
we can remove it as well. :-)

Best Regards,
Xiao Yang
On 2019/07/22 16:33, Petr Vorel write:
> According to man getcontext(3) getcontext was this function from
> POSIX.1-2001 (SUSv2) removed from POSIX.1-2008 (SUSv3).
>
> Given that the test was just a smoke tests (doing nothing) and we don't
> test other functions from this family ({set,swap,make}context) remove it.
>
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
>   runtest/syscalls                              |  2 -
>   .../kernel/syscalls/getcontext/.gitignore     |  1 -
>   testcases/kernel/syscalls/getcontext/Makefile | 23 -----
>   .../kernel/syscalls/getcontext/getcontext01.c | 89 -------------------
>   4 files changed, 115 deletions(-)
>   delete mode 100644 testcases/kernel/syscalls/getcontext/.gitignore
>   delete mode 100644 testcases/kernel/syscalls/getcontext/Makefile
>   delete mode 100644 testcases/kernel/syscalls/getcontext/getcontext01.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 67dfed661..432cd3ac5 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -363,8 +363,6 @@ ftruncate04_64 ftruncate04_64
>   #futimesat test cases
>   futimesat01 futimesat01
>
> -getcontext01 getcontext01
> -
>   getcpu01 getcpu01
>
>   getcwd01 getcwd01
> diff --git a/testcases/kernel/syscalls/getcontext/.gitignore b/testcases/kernel/syscalls/getcontext/.gitignore
> deleted file mode 100644
> index 1e5e14e73..000000000
> --- a/testcases/kernel/syscalls/getcontext/.gitignore
> +++ /dev/null
> @@ -1 +0,0 @@
> -/getcontext01
> diff --git a/testcases/kernel/syscalls/getcontext/Makefile b/testcases/kernel/syscalls/getcontext/Makefile
> deleted file mode 100644
> index bd617d806..000000000
> --- a/testcases/kernel/syscalls/getcontext/Makefile
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#
> -#  Copyright (c) International Business Machines  Corp., 2001
> -#
> -#  This program is free software;  you can redistribute it and/or modify
> -#  it under the terms of the GNU General Public License as published by
> -#  the Free Software Foundation; either version 2 of the License, or
> -#  (at your option) any later version.
> -#
> -#  This program is distributed in the hope that it will be useful,
> -#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
> -#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> -#  the GNU General Public License for more details.
> -#
> -#  You should have received a copy of the GNU General Public License
> -#  along with this program;  if not, write to the Free Software
> -#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> -
> -top_srcdir		?= ../../../..
> -
> -include $(top_srcdir)/include/mk/testcases.mk
> -
> -include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/getcontext/getcontext01.c b/testcases/kernel/syscalls/getcontext/getcontext01.c
> deleted file mode 100644
> index 48e78907f..000000000
> --- a/testcases/kernel/syscalls/getcontext/getcontext01.c
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -/*
> - * Copyright (c) Wipro Technologies Ltd, 2005.  All Rights Reserved.
> - *  Author: Prashant P Yendigeri<prashant.yendigeri@wipro.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - */
> -
> -#include<features.h>
> -
> -#include<stdio.h>
> -#include<unistd.h>
> -#include<errno.h>
> -#include<ucontext.h>
> -
> -#include "test.h"
> -
> -char *TCID = "getcontext01";
> -
> -#if !defined(__UCLIBC__)
> -
> -static void setup(void);
> -static void cleanup(void);
> -
> -int TST_TOTAL = 1;
> -
> -static void test_getcontext(void)
> -{
> -	ucontext_t ptr;
> -
> -	TEST(getcontext(&ptr));
> -
> -	if (TEST_RETURN == -1) {
> -		if (errno == ENOSYS)
> -			tst_resm(TCONF, "getcontext not implemented in libc");
> -		else
> -			tst_resm(TFAIL | TTERRNO, "getcontext failed");
> -	} else if (TEST_RETURN == 0) {
> -		tst_resm(TPASS, "getcontext passed");
> -	} else {
> -		tst_resm(TFAIL, "Unexpected return value %li", TEST_RETURN);
> -	}
> -}
> -
> -int main(int ac, char **av)
> -{
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		test_getcontext();
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> -
> -static void cleanup(void)
> -{
> -}
> -
> -#else /* systems that dont support obsolete getcontext */
> -int main(void)
> -{
> -	tst_brkm(TCONF, NULL, "system doesn't have getcontext support");
> -}
> -#endif




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
