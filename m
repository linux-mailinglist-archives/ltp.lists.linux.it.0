Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB8323A91
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 11:31:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B207C3C5991
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 11:31:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 32F543C4E27
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 11:31:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BFC2E1A000F1
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 11:31:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A417B03A;
 Wed, 24 Feb 2021 10:31:44 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:33:08 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
Message-ID: <YDYrZN59g4h96JIJ@yuki.lan>
References: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
 <20210224031227.151844-2-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224031227.151844-2-ruansy.fnst@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/getpid02: Convert to new API
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

On Wed, Feb 24, 2021 at 11:12:27AM +0800, Shiyang Ruan wrote:
> Signed-off-by: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/getpid/getpid02.c | 152 +++++---------------
>  1 file changed, 34 insertions(+), 118 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/getpid/getpid02.c b/testcases/kernel/syscalls/getpid/getpid02.c
> index 6c44ea96a..6b5dd0a63 100644
> --- a/testcases/kernel/syscalls/getpid/getpid02.c
> +++ b/testcases/kernel/syscalls/getpid/getpid02.c
> @@ -1,136 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
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
> + * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
         ^
	 Huh? This should be the IBM copyright that was remove above.

>   */
>  
> -/*
> - * Test Name: getpid02
> - *
> - * Test Description:
> - *  Verify that getpid() system call gets the process ID of the of the
> - *  calling process.
> - *
> - * Expected Result:
> - *  getpid() should return pid of the process on success.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Pause for SIGUSR1 if option specified.
> +/*\
> + * [DESCRIPTION]
>   *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *   	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *   	Verify the Functionality of system call
> - *      if successful,
> - *      	Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *
> - * Usage:  <for command-line>
> - *  getpid02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS:
> - *  None.
> - */
> + * Verify that getpid() system call gets the process ID of the of the calling
> + * process.

This should be a more concrete. Something as:

Check that getppid() in child returns the same pid as getpid() in
parent.

> +\*/
>  
> -#include <unistd.h>
> -#include <sys/types.h>
> +#include <stdlib.h>
>  #include <errno.h>
> -#include <unistd.h>
> -#include <string.h>
> -#include <signal.h>
> +#include <sys/types.h>
>  #include <sys/wait.h>
>  
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -void setup();			/* Main setup function of test */
> -void cleanup();			/* cleanup function for the test */
> -
> -char *TCID = "getpid02";
> -int TST_TOTAL = 1;
> +#include "tst_test.h"
>  
> -int main(int ac, char **av)
> +	TEST(getpid());
> +
> +	proc_id = TST_RET;

There is no point in using the TEST() macro here, getpid() cannot fail
so there is no point in storing the errno. So this should be just

	proc_pid = getpid();

> +	if ((pid = SAFE_FORK()) == -1)
> +		tst_res(TFAIL | TERRNO, "fork failed");

SAFE_FORK() cannot fail, that is the whole point of safe macros.

> +	else if (pid == 0) {
> +		pproc_id = getppid();
> +
> +		if (pproc_id != proc_id)
> +			exit(1);
> +		exit(0);

We don't have to propagate the exit value like this anymore.

You should use the tst_res(TFAIL/TPASS, ...) in the child process
directly instead.

> +	} else {
> +		SAFE_WAIT(&status);
> +		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
> +			tst_res(TFAIL, "getpid() returned invalid pid %d",
> +				proc_id);
> +		else
> +			tst_res(TPASS, "getpid() functionality is correct");
>  	}
> -
> -	cleanup();
> -	tst_exit();
>  }
>  
> -void setup(void)
> -{
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> -
> -void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.forks_child = 1,
> +	.test_all = verify_getpid,
> +};
> -- 
> 2.30.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
