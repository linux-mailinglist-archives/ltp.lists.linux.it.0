Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EEAEDF93
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 15:51:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23D443C5F49
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Jun 2025 15:51:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A14B3C58A7
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 15:51:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8AB691400E5E
 for <ltp@lists.linux.it>; Mon, 30 Jun 2025 15:51:36 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D22AE1F397;
 Mon, 30 Jun 2025 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751291496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qC0INEifwgMbP2Hl3RFF0I+IAPwvL+5mnsWOgIf7Kzw=;
 b=B5HMXX/BPgLyqxxRmoGb7znY84jQM0R4bBp7Uxh+QQQTIbqao5udl7wJlcc6SBENEPmWSn
 yBJ4NVzMyGIa1hK7FjphhwsfHtM81sb3UMm9mPQvWSmodFuf9FCavvuxY9LGg/vXv18d7R
 OMOLYIb6NWf2DBEPqPntqx2ENqIAWUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751291496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qC0INEifwgMbP2Hl3RFF0I+IAPwvL+5mnsWOgIf7Kzw=;
 b=Jddn4qni+yolExoZemn9E1RvjO/DREd7vAk01dDpDCTQsrgzUldcj3l3Dtp8hG+olRUqId
 2dG73dsHpAciibAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1751291495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qC0INEifwgMbP2Hl3RFF0I+IAPwvL+5mnsWOgIf7Kzw=;
 b=qooZ2O0Ki64X9NiGrJm6xrbvz44s52XRort310OjNvGWaJOBQCV2N98WLPNEeeBL7CyCwK
 D6lEcqNSuYcj2fW8Dw1I8x/KjJDwFwpVNW8T8DiWXuWk4YQQ/LHqAWJQ5dOTeaFPeRsf5C
 SVaFO4A1mIMXiBX9mnGd/p+i1TieUwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1751291495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qC0INEifwgMbP2Hl3RFF0I+IAPwvL+5mnsWOgIf7Kzw=;
 b=3HYhl0+7l2QBMM2ds0Ox54/g16G2HpfypKZtsYxdTg9OmpqYfXbjyW3ZV5PW6+3TiENOBL
 r8Q8Sk1pbS9LqPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACC8F13983;
 Mon, 30 Jun 2025 13:51:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id t68tKWeWYmgnZQAAD6G6ig
 (envelope-from <mdoucha@suse.cz>); Mon, 30 Jun 2025 13:51:35 +0000
Message-ID: <39406791-8bbd-4447-bbcd-0b25710a55e8@suse.cz>
Date: Mon, 30 Jun 2025 15:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it
References: <20250624-crash02_rewrite-v2-1-c4eaeee8598f@suse.com>
Content-Language: en-US
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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 ag==
In-Reply-To: <20250624-crash02_rewrite-v2-1-c4eaeee8598f@suse.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.cz:mid,
 suse.cz:email, suse.com:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] misc: rewrite crash02 test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
some suggestions below.

On 24. 06. 25 16:29, Andrea Cervesato wrote:
> From: Andrea Cervesato <andrea.cervesato@suse.com>
> 
> Rewrite the crash02 test, introducing new API but maintaining the logic
> behind it. The test generates random syscall executions with random data
> and it verifies that system didn't crash.
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
> Changes in v2:
> - simplify number generator
> - take seed with -s parameter or use time(NULL)
> - move loop inside child, so we can use the same seed  via srand()
> - take back in_blacklist() method
> - Link to v1: https://lore.kernel.org/r/20250611-crash02_rewrite-v1-1-1becd9dc163d@suse.com
> ---
>   testcases/misc/crash/crash02.c | 553 ++++++++---------------------------------
>   1 file changed, 104 insertions(+), 449 deletions(-)
> 
> diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
> index c68f580ef62ad3b3c644093f72646a8908e55076..5cd7d05808e97b0a7a67842723310fd3462944df 100644
> --- a/testcases/misc/crash/crash02.c
> +++ b/testcases/misc/crash/crash02.c
> @@ -1,497 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * crash02.c - Test OS robustness by executing syscalls with random args.
> - *
> - * Copyright (C) 2001 Stephane Fillod <f4cfe@free.fr>
> - *
> - * This test program was inspired from crashme, by GEORGE J. CARRETT.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version 2
> - * of the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA	02111-1307, USA.
> + * Copyright (C) 2025 SUSE LLC <andrea.cervesato@suse.com>
>    */
>   
> -/*
> -A signal handler is set up so that in most cases the machine exception
> -generated by the illegal syscall, bad operands, etc in the procedure
> -made up of random data are caught; and another round of randomness may
> -be tried. Eventually a random syscall may corrupt the program or
> -the machine state in such a way that the program must halt. This is
> -a test of the robustness of the hardware/software for instruction
> -fault handling.
> -
> -Note: Running this program just a few times, using total CPU time of
> -less than a few seconds SHOULD NOT GIVE YOU ANY CONFIDENCE in system
> -robustness. Having it run for hours, with tens of thousands of cases
> -would be a different thing. It would also make sense to run this
> -stress test at the same time you run other tests, like a multi-user
> -benchmark.
> -
> -CAUTION: running this program may crash your system, your disk and all
> -	your data along! DO NOT RUN IT ON PRODUCTION SYSTEMS!
> -	CONSIDER YOUR DISK FRIED.
> -	REMEMBER THE DISCLAIMER PART OF THE LICENSE.
> -
> -	Running as user nobody and with all your filesystems
> -	remounted to readonly may be wise..
> -
> -TODO:
> -	* in rand_long(), stuff in some real pointers to random data
> -	* Does a syscall is supposed to send SIGSEGV?
> -*/
> +/*\
> + * Test the robustness of the system generating random syscalls execution
> + * with random data and expecting that the current system is not crashing.
> + */
>   
> -#define _GNU_SOURCE
> -#include <sys/syscall.h>
> -#include <stdio.h>
>   #include <stdlib.h>
> -#include <string.h>
> -#include <signal.h>
> -#include <setjmp.h>
> -#include <time.h>
> -#include <unistd.h>
> -#include <errno.h>
> -#include <sys/types.h>
> -#include <sys/wait.h>
> -
> -#include "test.h"
> -
> -char *TCID = "crash02";
> -int TST_TOTAL = 1;
> -
> -static int x_opt = 0;
> -static int v_opt = 0;
> -static char *v_copt;
> -static int s_opt = 0;
> -static char *s_copt;
> -static int l_opt = 0;
> -static char *l_copt;
> -static int n_opt = 0;
> -static char *n_copt;
> -
> -int verbose_level = 2;
> -
> -/* depends on architecture.. */
> -unsigned int sysno_max = 127;
> -
> -int nseed;
> -int ntries = 100;
> -
> -/* max time allowed per try, in seconds */
> -#define MAX_TRY_TIME 5
> +#include <limits.h>
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +
> +#define MAX_SYSCALLS 465
> +
> +static int *num_errors;
> +static char *str_num_tries;
> +static char *str_seed;
> +static int num_tries = 1000;
> +static int seed;
> +
> +static int blacklist[] = {
> +	__NR_vfork,
> +	__NR_fork,
> +	__NR_clone,

__NR_clone2 should be included, even though it doesn't exist on most 
platforms. It's still needed for IA64.

> +	__NR_clone3,
> +	__NR_vhangup,		/* terminal logout */
> +	__NR_pause,		/* sleep indefinitely */
> +	__NR_read,		/* sleep indefinitely if the first argument is 0 */
> +	__NR_kill,		/* might kill test */
> +	__NR_restart_syscall,	/* restart random syscalls */
> +	__LTP__NR_INVALID_SYSCALL,
> +};
>   
> -void cleanup(void)
> +static long rand_number(void)
>   {
> +	int64_t num = 0;
>   
> -	tst_rmdir();
> +	for (int i = 0; i < 4; i++)
> +		num |= ((rand() & 0xFF) << (i * 8));

This algorithm has two problems:
1. Undefined behavior if i == 3 && (rand() & 0xFF) > 0x7f
2. Except as a result of the above undefined behavior, the algorithm 
will never generate a negative value nor a value larger than INT_MAX.

>   
> +	return (long)num;
>   }
>   
> -void setup(void)
> +static int in_blacklist(const int sysno)
>   {
> -	/*
> -	 * setup a default signal hander and a
> -	 * temporary working directory.
> -	 */
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	for (size_t i = 0; i < ARRAY_SIZE(blacklist); i++)
> +		if (sysno == blacklist[i])
> +			return 1;
>   
> -	tst_tmpdir();
> +	return 0;
>   }
>   
> -void help(void)
> +static void try_crash(const int num)
>   {
> -	printf
> -	    ("	-x		dry run, hexdump random code instead\n");
> -	printf("	-l x		max syscall no\n");
> -	printf("	-v x		verbose level\n");
> -	printf("	-s x		random seed\n");
> -	printf("	-n x		ntries\n");
> -}
> -
> -/*
> - */
> -option_t options[] = {
> -	{"v:", &v_opt, &v_copt},
> -	{"l:", &l_opt, &l_copt},
> -	{"s:", &s_opt, &s_copt},
> -	{"n:", &n_opt, &n_copt},
> -	{"x", &x_opt, NULL},
> -
> -	{NULL, NULL, NULL}
> -};
> -
> -void badboy_fork();
> -void badboy_loop();
> +	long sysno, arg0, arg1, arg2, arg3, arg4, arg5, arg6;
> +	int ret;
>   
> -void summarize_errno();
> -void record_errno(unsigned int n);
> -
> -int main(int argc, char *argv[])
> -{
> -	int lc;
> -
> -	tst_parse_opts(argc, argv, options, help);
> -
> -	if (v_opt)
> -		verbose_level = atoi(v_copt);
> -
> -	if (n_opt)
> -		ntries = atoi(n_copt);
> -
> -	if (l_opt)
> -		sysno_max = atoi(l_copt);
> -
> -	if (s_opt)
> -		nseed = atoi(s_copt);
> -	else
> -		nseed = time(NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> +	do {
> +		sysno = rand() % MAX_SYSCALLS;
> +	} while (in_blacklist(sysno));
>   
> -		tst_resm(TINFO, "crashme02 %d %d %d", sysno_max, nseed, ntries);
> +	arg0 = rand_number();
> +	arg1 = rand_number();
> +	arg2 = rand_number();
> +	arg3 = rand_number();
> +	arg4 = rand_number();
> +	arg5 = rand_number();
> +	arg6 = rand_number();
>   
> -		srand(nseed);
> -		badboy_fork();
> +	tst_res(TDEBUG,
> +		"%d: syscall(%ld, %#lx, %#lx, %#lx, %#lx, %#lx, %#lx, %#lx)",
> +		num, sysno, arg0, arg1, arg2, arg3, arg4, arg5, arg6);
>   
> -		/* still there? */
> -		tst_resm(TPASS, "we're still here, OS seems to be robust");
> +	ret = syscall(sysno, arg0, arg1, arg2, arg3, arg4, arg5, arg6);
> +	if (ret == -1) {
> +		(*num_errors)++;
>   
> -		nseed++;
> +		tst_res(TDEBUG, "syscall error: %s", strerror(errno));
>   	}
> -	cleanup();
> -	tst_exit();
>   }
>   
> -/* ************************* */
> -int badboy_pid;
> -
> -void my_signal(int sig, void (*func) ());
> -
> -void monitor_fcn(int sig)
> +static void run(void)
>   {
> +	pid_t pid;
>   	int status;
> +	int num_signals = 0;
>   
> -	if (verbose_level >= 3)
> -		printf("time limit reached on pid. using kill.\n");
> -
> -	status = kill(badboy_pid, SIGKILL);
> -	if (status < 0) {
> -		if (verbose_level >= 3)
> -			printf("failed to kill process\n");
> -	}
> -}
> -
> -void badboy_fork(void)
> -{
> -	int status, pid;
> -	pid_t child = fork();
> +	pid = SAFE_FORK();
> +	if (!pid) {
> +		for (int i = 0; i < num_tries; i++)
> +			try_crash(i);
>   
> -	switch (child) {
> -	case -1:
> -		perror("fork");
> -	case 0:
> -#ifdef DEBUG_LATE_BADBOY
> -		sleep(ntries * MAX_TRY_TIME + 10);
> -#else
> -		badboy_loop();
> -#endif
>   		exit(0);
> -	default:
> -		badboy_pid = child;
> -		if (verbose_level > 3)
> -			printf("badboy pid = %d\n", badboy_pid);
> -
> -		/* don't trust the child to return at night */
> -		my_signal(SIGALRM, monitor_fcn);
> -		alarm(ntries * MAX_TRY_TIME);
> -
> -		pid = waitpid(-1, &status, WUNTRACED);
> -		if (pid <= 0)
> -			perror("wait");
> -		else {
> -			if (verbose_level > 3)
> -				printf("pid %d exited with status %d\n",
> -				       pid, status);
> -#if 0
> -			record_status(status);
> -#endif
> -		}
>   	}
> -	alarm(0);
> -}
>   
> -/* *************** status recording ************************* */
> +	SAFE_WAITPID(pid, &status, 0);
>   
> -/* errno status table (max is actually around 127) */
> -#define STATUS_MAX 256
> -static int errno_table[STATUS_MAX];
> -
> -void record_errno(unsigned int n)
> -{
> -	if (n >= STATUS_MAX)
> -		return;
> +	if (WIFSIGNALED(status)) {
> +		num_signals++;
>   
> -	errno_table[n]++;
> -}
> -
> -/* may not work with -c option */
> -void summarize_errno(void)
> -{
> -	int i;
> -
> -	if (x_opt || verbose_level < 2)
> -		return;
> -
> -	printf("errno status ... number of cases\n");
> -	for (i = 0; i < STATUS_MAX; i++) {
> -		if (errno_table[i])
> -			printf("%12d ... %5d\n", i, errno_table[i]);
> -	}
> -}
> -
> -/* ************* badboy ******************************************* */
> -
> -jmp_buf again_buff;
> -
> -unsigned char *bad_malloc(int n);
> -void my_signal(int sig, void (*func) ());
> -void again_handler(int sig);
> -void try_one_crash(int try_num);
> -void set_up_signals();
> -int in_blacklist(int sysno);
> -
> -/* badboy "entry" point */
> -
> -/*
> - * Unlike crashme, faulty syscalls are not supposed to barf
> - */
> -void badboy_loop(void)
> -{
> -	int i;
> -
> -	for (i = 0; i < ntries; ++i) {
> -		/* level 5 */
> -
> -		if (!x_opt && verbose_level >= 5) {
> -			printf("try %d\n", i);
> -		}
> -
> -		if (setjmp(again_buff) == 3) {
> -			if (verbose_level >= 5)
> -				printf("Barfed\n");
> -		} else {
> -			set_up_signals();
> -			alarm(MAX_TRY_TIME);
> -			try_one_crash(i);
> -		}
> -	}
> -	summarize_errno();
> -}
> -
> -void again_handler(int sig)
> -{
> -	char *ss;
> -
> -	switch (sig) {
> -	case SIGILL:
> -		ss = " illegal instruction";
> -		break;
> -#ifdef SIGTRAP
> -	case SIGTRAP:
> -		ss = " trace trap";
> -		break;
> -#endif
> -	case SIGFPE:
> -		ss = " arithmetic exception";
> -		break;
> -#ifdef SIGBUS
> -	case SIGBUS:
> -		ss = " bus error";
> -		break;
> -#endif
> -	case SIGSEGV:
> -		ss = " segmentation violation";
> -		break;
> -#ifdef SIGIOT
> -	case SIGIOT:
> -		ss = " IOT instruction";
> -		break;
> -#endif
> -#ifdef SIGEMT
> -	case SIGEMT:
> -		ss = " EMT instruction";
> -		break;
> -#endif
> -#ifdef SIGALRM
> -	case SIGALRM:
> -		ss = " alarm clock";
> -		break;
> -#endif
> -	case SIGINT:
> -		ss = " interrupt";
> -		break;
> -	default:
> -		ss = "";
> +		tst_res(TDEBUG, "syscall signaled: %s",
> +			strsignal(WTERMSIG(status)));
>   	}
> -	if (verbose_level >= 5)
> -		printf("Got signal %d%s\n", sig, ss);
>   
> -	longjmp(again_buff, 3);
> -}
> -
> -void my_signal(int sig, void (*func) ())
> -{
> -	struct sigaction act;
> +	tst_res(TINFO, "Detected errors: %d", *num_errors);
> +	tst_res(TINFO, "Detected signals: %d", num_signals);
>   
> -	act.sa_handler = func;
> -	memset(&act.sa_mask, 0x00, sizeof(sigset_t));
> -	act.sa_flags = SA_NOMASK | SA_RESTART;
> -	sigaction(sig, &act, 0);
> +	tst_res(TPASS, "System is still up and running");
>   }
>   
> -void set_up_signals(void)
> +static void setup(void)
>   {
> -	my_signal(SIGILL, again_handler);
> -#ifdef SIGTRAP
> -	my_signal(SIGTRAP, again_handler);
> -#endif
> -	my_signal(SIGFPE, again_handler);
> -#ifdef SIGBUS
> -	my_signal(SIGBUS, again_handler);
> -#endif
> -	my_signal(SIGSEGV, again_handler);
> -#ifdef SIGIOT
> -	my_signal(SIGIOT, again_handler);
> -#endif
> -#ifdef SIGEMT
> -	my_signal(SIGEMT, again_handler);
> -#endif
> -#ifdef SIGALRM
> -	my_signal(SIGALRM, again_handler);
> -#endif
> -	my_signal(SIGINT, again_handler);
> -}
> +	if (tst_parse_int(str_num_tries, &num_tries, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid number of entries '%s'", str_num_tries);
>   
> -/*
> - * NB: rand() (ie. RAND_MAX) might be on 31bits only!
> - *
> - * FIXME: 64-bit systems
> - *
> - * TODO: improve arg mixing (16bits and 8bits values, NULLs, etc.).
> - *	big values as returned by rand() are no so interresting
> - *	(except when used as pointers) because they may fall too
> - *	quickly in the invalid parameter sieve. Smaller values,
> - *	will be more insidious because they may refer to existing
> - *	objects (pids, fd, etc.).
> - */
> -long int rand_long(void)
> -{
> -	int r1, r2;
> +	if (tst_parse_int(str_seed, &seed, 0, INT_MAX))
> +		tst_brk(TBROK, "Invalid seed number '%s'", str_num_tries);
>   
> -	r1 = rand();
> -	r2 = rand();
> +	num_errors = SAFE_MMAP(
> +		NULL, sizeof(int),
> +		PROT_READ | PROT_WRITE,
> +		MAP_SHARED | MAP_ANONYMOUS,
> +		-1, 0);
>   
> -	if (r1 & 0x10000L)
> -		r1 = 0;
> -	if (!r1 && (r2 & 0x50000L))
> -		r2 = 0;
> -	else if (!r1 && (r2 & 0x20000L))
> -		r2 &= 0x00ffL;
> +	seed = str_seed ? seed : time(NULL);
> +	srand(seed);
>   
> -	return (long int)((r1 & 0xffffL) << 16) | (r2 & 0xffffL);
> +	tst_res(TINFO, "Random seed: %d", seed);
>   }
>   
> -void try_one_crash(int try_num)
> +static void cleanup(void)
>   {
> -	long int sysno, arg1, arg2, arg3, arg4, arg5, arg6, arg7;
> -
> -	do {
> -		sysno = rand() % sysno_max;
> -	} while (in_blacklist(sysno));
> -
> -	arg1 = rand_long();
> -	arg2 = rand_long();
> -	arg3 = rand_long();
> -	arg4 = rand_long();
> -	arg5 = rand_long();
> -	arg6 = rand_long();
> -	arg7 = rand_long();
> -
> -	if (x_opt || verbose_level >= 1)
> -		printf("%04d: syscall(%ld, %#lx, %#lx, %#lx, %#lx, %#lx, "
> -		       "%#lx, %#lx)\n", try_num, sysno, arg1, arg2, arg3,
> -		       arg4, arg5, arg6, arg7);
> -
> -	if (!x_opt) {
> -		syscall(sysno, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
> -		record_errno(errno);
> -	}
> +	if (num_errors)
> +		SAFE_MUNMAP(num_errors, sizeof(int));
>   }
>   
> -/* The following syscalls create new processes which may cause the test
> -	 unable to finish. */
> -int in_blacklist(int sysno)
> -{
> -	int i;
> -	const int list[] = {
> -#if defined(__ia64__)
> -		SYS_clone2,
> -#else
> -		/*
> -		 * No SYS_fork(vfork) on IA-64. Instead, it uses,
> -		 * clone(child_stack=0, flags=CLONE_VM|CLONE_VFORK|SIGCHLD)
> -		 * clone2()
> -		 */
> -
> -		/*
> -		 * NOTE (garrcoop):
> -		 * Could not find reference to SYS_fork(vfork) on mips32
> -		 * with the Montavista / Octeon toolchain. Need to develop an
> -		 * autoconf check for this item.
> -		 */
> -#if defined(__NR_vfork) && __NR_vfork
> -		SYS_vfork,
> -#endif
> -#if defined(__NR_fork) && __NR_fork
> -		SYS_fork,
> -#endif
> -#endif /* __ia64__ */
> -#if defined(__NR_clone) && __NR_clone
> -		SYS_clone,
> -#endif
> -#if defined(__NR_vhangup) && __NR_vhangup
> -		__NR_vhangup,	/* int vhangup(void); - terminal logout */
> -#endif
> -#if defined(__NR_pause) && __NR_pause
> -		__NR_pause,	/* int pause(void); - sleep indefinitely */
> -#endif
> -#if defined(__NR_read) && __NR_read
> -		/*
> -		 * ssize_t read(int fd, void *buf, size_t count); - will sleep
> -		 * indefinitely if the first argument is 0
> -		 */
> -		__NR_read,
> -#endif
> -		-1
> -	};
> -
> -	for (i = 0; list[i] != -1; i++) {
> -		if (sysno == list[i])
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,

I still don't think .needs_root is needed here.

> +	.forks_child = 1,
> +	.runtime = 40,

Runtime should be calculated from num_tries. The default 1000 tries 
probably don't need .runtime at all.

> +	.options = (struct tst_option []) {
> +		{"n:", &str_num_tries, "Number of retries (default: 1000)"},
> +		{"s:", &str_seed, "Initial seed for random generator"},
> +		{}
> +	},
> +};
> 
> ---
> base-commit: 747cbc6b461b64975282e1fb998cf8cea5454267
> change-id: 20250611-crash02_rewrite-b84ec3d0d22a
> 
> Best regards,


-- 
Martin Doucha   mdoucha@suse.cz
SW Quality Engineer
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
