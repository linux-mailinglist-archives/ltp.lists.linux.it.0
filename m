Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40775361FC0
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 14:27:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93BAE3C3108
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 14:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 82DB53C1B3C
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 14:27:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5107614044B4
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 14:27:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F4F4B038;
 Fri, 16 Apr 2021 12:27:13 +0000 (UTC)
Date: Fri, 16 Apr 2021 14:16:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zenghui Gao <gaozh.jy@fujitsu.com>
Message-ID: <YHmAGuzPDdN2gzKj@yuki>
References: <20210415140552.15762-1-gaozh.jy@fujitsu.com>
 <20210415140552.15762-2-gaozh.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415140552.15762-2-gaozh.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/wait02.c: Convert to new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Take use of macros and clean up.
> 
> Signed-off-by: Zenghui Gao <gaozh.jy@fujitsu.com>
> Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>
> ---
>  testcases/kernel/syscalls/wait/wait02.c | 106 ++++++------------------
>  1 file changed, 25 insertions(+), 81 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/wait/wait02.c b/testcases/kernel/syscalls/wait/wait02.c
> index 5695c071c..111849f2a 100644
> --- a/testcases/kernel/syscalls/wait/wait02.c
> +++ b/testcases/kernel/syscalls/wait/wait02.c
> @@ -1,103 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
>   *    AUTHOR		: William Roske
>   *    CO-PILOT		: Dave Fenner
> + *\

I'm not sure that starting sequence in the middle of comment would be
picked up by the docparser. Either way the documentation comment should
really be a separate comment.

> + * [Description]
>   *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

Since this is SGI copyright we have to keep GPL-2.0 for the SPDX as
well.

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
> + * For a terminated child, test whether wait(2) can get its pid
> + * and exit status correctly.
>   */
>  
>  #include <errno.h>
> -#include <string.h>
> -#include <signal.h>
> -#include <stdlib.h>
>  #include <sys/types.h>
>  #include <sys/wait.h>
> -#include "test.h"
> -
> -static void setup(void);
> -static void cleanup(void);
> -
> -char *TCID = "wait02";
> -int TST_TOTAL = 1;
> -
> -static void wait_verify(void);
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
> -		tst_count = 0;
> -		wait_verify();
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> +#include <stdlib.h>
> +#include "tst_test.h"
>  
> -static void wait_verify(void)
> +static void verify_wait(void)
>  {
> -	int fork_pid, status, exit_child = 1;
> +	int status, exit_child = 1;
> +	pid_t fpid;
>  
> -	fork_pid = FORK_OR_VFORK();
> -	if (fork_pid == -1) {
> -		tst_brkm(TBROK | TERRNO, cleanup, "fork() Failure");
> -	} else if (fork_pid == 0) {
> -		sleep(1);
> +	fpid = SAFE_FORK();
> +	if (fpid == 0)
>  		exit(exit_child);
> -	}
>  
>  	TEST(wait(&status));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "wait() failed");
> +		return;
> +	}

I guess that we should add TST_EXP_PID(), I guess that it would be
basically the same as TST_EXP_FD(). Can you add it or should I do that?

> -	if (TEST_RETURN == -1) {
> -		tst_resm(TFAIL | TTERRNO, "wait(1) Failed");
> +	if (fpid != TST_RET) {
> +		tst_res(TFAIL, "wait() returned wrong pid %ld, expected %d",
> +			TST_RET, fpid);
>  	} else if (WIFEXITED(status) && WEXITSTATUS(status) == exit_child) {
> -		tst_resm(TPASS, "wait(&status) returned %ld", TEST_RETURN);
> +		tst_res(TPASS, "wait() succeeded");
>  	} else {
> -		tst_resm(TFAIL,
> -			 "wait(1) Failed, exit_child - 0x%x, status - 0x%x",
> -			 exit_child, status);
> +		tst_res(TFAIL, "wait() got wrong exit status 0x%x", status);
>  	}
>  }

This could be made a bit simpler by using return instead of else as:

	if (foo) {
		tst_res(TFAIL, ...);
		return;
	}

	if (bar) {
		tst_res(TPASS, ...);
		return;
	}

	tst_res(...);

At least I find this style more readable.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
