Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6826A5721
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 11:49:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 999333CBA1D
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 11:49:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7A5A3C01AA
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 11:49:01 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 00FE3600429
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 11:49:00 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 18FA321A5D;
 Tue, 28 Feb 2023 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677581340;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxXoY3c/s0L13E+WlC14gx4AyPq31y6Ox1DkjMfrbNE=;
 b=nNO01oBRpcoBrsJ3NqilwUsWYUM8vgVzCTtKDDTjH6+nlAk2mU26QmSRMEZMAgOwG8hOMt
 f/M6SvGXDwoL8xskZYjyKfmYA3KVB5My9vhziPbThGvulU+Jn54YlmSlFNKFvIh0EVSCUh
 6mgXmpqrBUMRztXD4GsxpJkZFk5Jxwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677581340;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jxXoY3c/s0L13E+WlC14gx4AyPq31y6Ox1DkjMfrbNE=;
 b=B0pqIwh+t3rMTv48LxFJx8mJfNu/dp5Y3Rn6Cplb/ssQMoA+aFVHifCPTGa6rlD9zN3Cwt
 d1NxNbbRNvNwy/CA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E131D2C141;
 Tue, 28 Feb 2023 10:48:59 +0000 (UTC)
References: <20230215101615.27534-1-andrea.cervesato@suse.com>
 <20230215101615.27534-2-andrea.cervesato@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 28 Feb 2023 10:46:12 +0000
Organization: Linux Private Site
In-reply-to: <20230215101615.27534-2-andrea.cervesato@suse.com>
Message-ID: <87wn42t696.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 01/10] Refactor userns01 test
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

Hello,

Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/containers/userns/userns01.c | 27 +++++++------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/testcases/kernel/containers/userns/userns01.c b/testcases/kernel/containers/userns/userns01.c
> index 8ed7a9f41..cbe0da245 100644
> --- a/testcases/kernel/containers/userns/userns01.c
> +++ b/testcases/kernel/containers/userns/userns01.c
> @@ -20,9 +20,9 @@
>  #define _GNU_SOURCE
>  
>  #include <stdio.h>
> -#include "common.h"
>  #include "config.h"
>  #include <sys/capability.h>
> +#include "lapi/sched.h"
>  
>  #define OVERFLOWUIDPATH "/proc/sys/kernel/overflowuid"
>  #define OVERFLOWGIDPATH "/proc/sys/kernel/overflowgid"
> @@ -30,10 +30,7 @@
>  static long overflowuid;
>  static long overflowgid;
>  
> -/*
> - * child_fn1() - Inside a new user namespace
> - */
> -static int child_fn1(LTP_ATTRIBUTE_UNUSED void *arg)
> +static void child_fn1(void)
>  {
>  	int uid, gid;
>  	cap_t caps;
> @@ -45,10 +42,8 @@ static int child_fn1(LTP_ATTRIBUTE_UNUSED void *arg)
>  
>  	tst_res(TINFO, "USERNS test is running in a new user namespace.");
>  
> -	if (uid != overflowuid || gid != overflowgid)
> -		tst_res(TFAIL, "got unexpected uid=%d gid=%d", uid, gid);
> -	else
> -		tst_res(TPASS, "got expected uid and gid");
> +	TST_EXP_EQ_LI(uid, overflowuid);
> +	TST_EXP_EQ_LI(gid, overflowgid);
>  
>  	caps = cap_get_proc();
>  
> @@ -68,31 +63,29 @@ static int child_fn1(LTP_ATTRIBUTE_UNUSED void *arg)
>  		tst_res(TFAIL, "unexpected effective/permitted caps at %d", i);
>  	else
>  		tst_res(TPASS, "expected capabilities");
> -
> -	return 0;
>  }
>  
>  static void setup(void)
>  {
> -	check_newuser();

User namespaces have been in the kernel a long time, but they can be
disabled at compile time.

So we need to check for CONFIG_USER_NS in the kernel config.

> -
>  	SAFE_FILE_SCANF(OVERFLOWUIDPATH, "%ld", &overflowuid);
>  	SAFE_FILE_SCANF(OVERFLOWGIDPATH, "%ld", &overflowgid);
>  }
>  
>  static void run(void)
>  {
> -	int pid;
> +	const struct tst_clone_args args = { CLONE_NEWUSER, SIGCHLD };
>  
> -	pid = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, child_fn1, NULL);
> -	if (pid < 0)
> -		tst_brk(TBROK | TTERRNO, "clone failed");
> +	if (!SAFE_CLONE(&args)) {
> +		child_fn1();
> +		return;
> +	}
>  }
>  
>  static struct tst_test test = {
>  	.setup = setup,
>  	.test_all = run,
>  	.needs_root = 1,
> +	.forks_child = 1,
>  	.caps = (struct tst_cap []) {
>  		TST_CAP(TST_CAP_DROP, CAP_NET_RAW),
>  		{}
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
