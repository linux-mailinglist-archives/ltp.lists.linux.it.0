Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C0F31CF
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 15:54:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17D303C2078
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 15:54:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 282573C1D56
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 15:54:20 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 151691A0091A
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 15:54:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 193E1B4B9;
 Thu,  7 Nov 2019 14:54:18 +0000 (UTC)
Date: Thu, 7 Nov 2019 15:54:17 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191107145416.GA25608@rei.lan>
References: <20191101084933.GA14639@dell5510>
 <1572613170-20757-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572613170-20757-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl02: add more error tests
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
>  #include <errno.h>
>  #include <signal.h>
>  #include <sys/prctl.h>
> -
> +#include <linux/filter.h>
> +#include <linux/capability.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stddef.h>
> +#include "config.h"
> +#include "lapi/prctl.h"
> +#include "lapi/seccomp.h"
> +#include "lapi/syscalls.h"
>  #include "tst_test.h"
> +#include "tst_capability.h"
>  
>  #define OPTION_INVALID 999
>  #define INVALID_ARG 999
>  
> +static const struct sock_filter  strict_filter[] = {
> +	BPF_STMT(BPF_LD | BPF_W | BPF_ABS, (offsetof (struct seccomp_data, nr))),
> +
> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_close, 5, 0),
> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_exit,  4, 0),
> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_wait4, 3, 0),
> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_write, 2, 0),
> +	BPF_JUMP(BPF_JMP | BPF_JEQ, __NR_clone, 1, 0),
> +
> +	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
> +	BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW)
> +};
> +
> +static const struct sock_fprog  strict = {
> +	.len = (unsigned short)ARRAY_SIZE(strict_filter),
> +	.filter = (struct sock_filter *)strict_filter
> +};

We do have the exact same bytecode in the prctl04.c, can we put it to a
header and include it in both tests?

Or alternatively do we need more than just one-liner with
BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW) here?

>  static struct tcase {
>  	int option;
>  	unsigned long arg2;
> +	unsigned long arg3;
>  	int exp_errno;
> +	int bad_addr;
>  } tcases[] = {
> -	{OPTION_INVALID, 0, EINVAL},
> -	{PR_SET_PDEATHSIG, INVALID_ARG, EINVAL},
> +	{OPTION_INVALID, 0, 0, EINVAL, 0},
> +	{PR_SET_PDEATHSIG, INVALID_ARG, 0, EINVAL, 0},
> +	{PR_SET_DUMPABLE, 2, 0, EINVAL, 0},
> +	{PR_SET_NAME, 0, 0, EFAULT, 1},
> +	{PR_SET_SECCOMP, 2, 0, EFAULT, 1},
> +	{PR_SET_SECCOMP, 2, 2, EACCES, 0},
> +	{PR_SET_TIMING, 1, 0, EINVAL, 0},
> +#ifdef HAVE_DECL_PR_SET_NO_NEW_PRIVS
> +	{PR_SET_NO_NEW_PRIVS, 0, 0, EINVAL, 0},
> +	{PR_SET_NO_NEW_PRIVS, 1, 1, EINVAL, 0},
> +	{PR_GET_NO_NEW_PRIVS, 1, 0, EINVAL, 0},
> +#endif
> +#ifdef HAVE_DECL_PR_SET_THP_DISABLE
> +	{PR_SET_THP_DISABLE, 0, 1, EINVAL, 0},
> +	{PR_GET_THP_DISABLE, 1, 0, EINVAL, 0},
> +#endif
> +#ifdef HAVE_DECL_PR_CAP_AMBIENT
> +	{PR_CAP_AMBIENT, 2, 1, EINVAL, 0},
> +#endif
> +#ifdef HAVE_DECL_PR_GET_SPECULATION_CTR
> +	{PR_GET_SPECULATION_CTRL, 1, 0, EINVAL, 0},
> +#endif
> +	{PR_SET_SECUREBITS, 0, 0, EPERM, 0},
> +	{PR_CAPBSET_DROP, 1, 0, EPERM, 0},
>  };
>  
>  static void verify_prctl(unsigned int n)
>  {
>  	struct tcase *tc = &tcases[n];
>  
> -	TEST(prctl(tc->option, tc->arg2));
> +	if (tc->arg3 == 2)
> +		tc->arg3 = (unsigned long)&strict;
> +	if (tc->bad_addr) {
> +		if (tc->arg2)
> +			tc->arg3 = (unsigned long)tst_get_bad_addr(NULL);
> +		else
> +			tc->arg2 = (unsigned long)tst_get_bad_addr(NULL);
> +	}

I do not like this hackery, can't we just change the test to use
pointers to pointers and initialize global variables in the test setup
as we usually do?

> +	TEST(prctl(tc->option, tc->arg2, tc->arg3));
>  	if (TST_RET == 0) {
>  		tst_res(TFAIL, "prctl() succeeded unexpectedly");
>  		return;
> @@ -38,7 +123,10 @@ static void verify_prctl(unsigned int n)
>  	if (tc->exp_errno == TST_ERR) {
>  		tst_res(TPASS | TTERRNO, "prctl() failed as expected");
>  	} else {
> -		tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
> +		if (tc->option == PR_SET_SECCOMP && TST_ERR == EINVAL)
> +			tst_res(TCONF, "current system was not built with CONFIG_SECCOMP.");
> +		else
> +			tst_res(TFAIL | TTERRNO, "prctl() failed unexpectedly, expected %s",
>  				tst_strerrno(tc->exp_errno));
>  	}
>  }
> @@ -46,4 +134,9 @@ static void verify_prctl(unsigned int n)
>  static struct tst_test test = {
>  	.tcnt = ARRAY_SIZE(tcases),
>  	.test = verify_prctl,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +		TST_CAP(TST_CAP_DROP, CAP_SETPCAP),
> +		{}
> +	},
>  };
> -- 
> 2.18.0
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
