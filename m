Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9735FAFCC
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 11:59:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2D0A3CAE8B
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Oct 2022 11:59:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2436D3C3030
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 11:59:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6463F14001E5
 for <ltp@lists.linux.it>; Tue, 11 Oct 2022 11:59:15 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BE0F71F8D1;
 Tue, 11 Oct 2022 09:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665482354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDkeL3Asj8AzbOqndMZECec14jCvuejXwllaeo1h3Es=;
 b=bco/1bWkg7d8XE2YajCQIv8UYVCHHgBdiX1haoRDPpayjrrPpPnZ8cQThAjp1rt/1jbw3m
 Y/qVXd5uG7+ug9h3C36l222WwKHGt3a3rLOcqnwssYVnbI0519HjKpctUHeqW3Ix6PTpXE
 Dhgkxn/tht4gllFv2ujSP4hl6UwrstA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665482354;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDkeL3Asj8AzbOqndMZECec14jCvuejXwllaeo1h3Es=;
 b=alBPPEp2uTqYFZ2U1prxKcSsuTTZIMDXVEspo2qDXEU81yoVyUUUSEvNXk/QJ9YVU9t0CN
 qewhAxGauTHAR/BA==
Received: from g78 (unknown [10.100.228.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 473332C141;
 Tue, 11 Oct 2022 09:59:14 +0000 (UTC)
References: <20220805091353.27230-1-andrea.cervesato@suse.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 11 Oct 2022 10:59:02 +0100
In-reply-to: <20220805091353.27230-1-andrea.cervesato@suse.com>
Message-ID: <87zge27kb2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Refactor pidns06 test using new LTP API
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/containers/pidns/pidns06.c | 152 +++++---------------
>  1 file changed, 38 insertions(+), 114 deletions(-)
>
> diff --git a/testcases/kernel/containers/pidns/pidns06.c b/testcases/kernel/containers/pidns/pidns06.c
> index d6623941a..b561c055f 100644
> --- a/testcases/kernel/containers/pidns/pidns06.c
> +++ b/testcases/kernel/containers/pidns/pidns06.c
> @@ -1,133 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
> -* Copyright (c) International Business Machines Corp., 2008
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License as published by
> -* the Free Software Foundation; either version 2 of the License, or
> -* (at your option) any later version.
> -* This program is distributed in the hope that it will be useful
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
> -* the GNU General Public License for more details.
> -* You should have received a copy of the GNU General Public License
> -* along with this program; if not, write to the Free Software
> -* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> -
> -*************************************************************************
> -* Description:
> -*  Testcase tries killing of the parent namespace pid by the container-init.
> -*  It also tries killing of non-existent PID, by the container-init.
> -*  Returns Success if Unable to kill, and proper error number is set.
> -*  else Returns Failure
> -*
> -* Steps:
> -* 1. Parent process clone a process with flag CLONE_NEWPID
> -* 2. The pid of the parent namespace is passed to the container.
> -* 3. Container receieves the PID and passes SIGKILL to this PID.
> -* 4. If kill() is unsuccessful and the errno is set to 'No Such process'
> -*	then sets PASS
> -*    else,
> -*	sets FAIL
> -* 5. It also verifies by passing SIGKILL to FAKE_PID
> -* 6. If kill() is unsuccessful and the errno is set to 'No Such process'
> -*	then sets PASS
> -*    else,
> -*	sets FAIL
> -*
> -*******************************************************************************/
> -#define _GNU_SOURCE 1
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <sys/wait.h>
> -#include <assert.h>
> -#include <unistd.h>
> -#include <errno.h>
> -#include <signal.h>
> -#include "pidns_helper.h"
> -#include "test.h"
> + * Copyright (C) International Business Machines Corp., 2008
> + * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
>  
> -#define CINIT_PID       1
> -#define PARENT_PID      0
> -#define FAKE_PID	-1
> +/*\
> + * [Description]
> + *
> + * Clone a process with CLONE_NEWPID flag and check that parent process can't
> + * be killed from child namespace.
> + */
>  
> -char *TCID = "pidns06";
> -int TST_TOTAL = 1;
> +#include "tst_test.h"
> +#include "lapi/namespaces_constants.h"
>  
> -/*
> - * kill_pid_in_childfun()
> - *      Cont-init tries to kill the parent-process using parent's global Pid.
> - *	Also checks passing SIGKILL to non existent PID in the container.
> - */
> -static int kill_pid_in_childfun(void *vtest)
> +static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
>  {
> -	int cpid, ppid, *par_pid;
> -	int ret = 0;
> +	pid_t cpid, ppid;
> +	int ret;
> +
>  	cpid = getpid();
>  	ppid = getppid();
> -	par_pid = (int *)vtest;
>  
> -	/* Checking the values to make sure pidns is created correctly */
> -	if (cpid != CINIT_PID || ppid != PARENT_PID) {
> -		printf("Unexpected result for Container: init "
> -		       "pid=%d ppid=%d\n", cpid, ppid);
> -		exit(1);
> +	if (cpid != 1 || ppid != 0) {
> +		tst_res(TFAIL, "Got unexpected result of cpid=%d ppid=%d", cpid, ppid);
> +		return 1;
>  	}
>  
> -	/*
> -	 * While trying kill() of the pid of the parent namespace..
> -	 * Check to see if the errno was set to the expected, value of 3 : ESRCH
> -	 */
> -	ret = kill(*par_pid, SIGKILL);
> -	if (ret == -1 && errno == ESRCH) {
> -		printf("Container: killing parent pid=%d failed as expected "
> -		       "with ESRCH\n", *par_pid);
> -	} else {
> -		printf("Container: killing parent pid=%d, didn't fail as "
> -		       "expected with ESRCH (%d) and a return value of -1. Got "
> -		       "%d (\"%s\") and a return value of %d instead.\n",
> -		       *par_pid, ESRCH, errno, strerror(errno), ret);
> -		exit(1);
> -	}
> -	/*
> -	 * While killing non-existent pid in the container,
> -	 * Check to see if the errno was set to the expected, value of 3 : ESRCH
> -	 */
> -	ret = kill(FAKE_PID, SIGKILL);
> -	if (ret == -1 && errno == ESRCH) {
> -		printf("Container: killing non-existent pid failed as expected "
> -		       "with ESRCH\n");
> -	} else {
> -		printf("Container: killing non-existent pid, didn't fail as "
> -		       "expected with ESRCH (%d) and a return value of -1. Got "
> -		       "%d (\"%s\") and a return value of %d instead.\n",
> -		       ESRCH, errno, strerror(errno), ret);
> -		exit(1);
> +	ret = kill(*(int *)arg, SIGKILL);
> +
> +	if (ret != -1 || errno != ESRCH) {
> +		tst_res(TFAIL, "kill() didn't fail with ESRCH");
> +		return 1;
>  	}
>  
> -	exit(0);
> -}
> +	tst_res(TPASS, "Can't kill parent process from child namespace");
>  
> -static void setup(void)
> -{
> -	tst_require_root();
> -	check_newpid();
> +	return 0;
>  }
>  
> -int main(void)
> +static void run(void)
>  {
> -	int status;
> -
> -	setup();
> +	int ret;
> +	pid_t pid;
>  
> -	pid_t pid = getpid();
> +	pid = getpid();
>  
> -	tst_resm(TINFO, "Parent: Passing the pid of the process %d", pid);
> -	TEST(do_clone_unshare_test(T_CLONE, CLONE_NEWPID, kill_pid_in_childfun,
> -				   (void *)&pid));
> -	if (TEST_RETURN == -1) {
> -		tst_brkm(TFAIL | TTERRNO, NULL, "clone failed");
> -	} else if (wait(&status) == -1) {
> -		tst_brkm(TFAIL | TERRNO, NULL, "wait failed");
> -	}
> -
> -	tst_exit();
> +	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, &pid);

tst_clone

> +	if (ret < 0)
> +		tst_brk(TBROK | TERRNO, "clone failed");
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.needs_root = 1,
> +};
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
