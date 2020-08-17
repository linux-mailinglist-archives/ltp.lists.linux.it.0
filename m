Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0A246875
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 16:32:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C61483C58D9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 16:32:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 99D793C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 16:32:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 06B50600704
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 16:32:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72075B131;
 Mon, 17 Aug 2020 14:33:07 +0000 (UTC)
Date: Mon, 17 Aug 2020 16:33:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200817143309.GD8445@yuki.lan>
References: <20200815051312.25002-1-yangx.jy@cn.fujitsu.com>
 <20200815051312.25002-2-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815051312.25002-2-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sigsuspend01.c: Convert to the new
 API
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
Pushed with a few fixes, thanks.

> +static void setup(void)
>  {
> +	struct sigaction sa_new;
>  
> +	SAFE_SIGEMPTYSET(&signalset);
> +	SAFE_SIGEMPTYSET(&sigset1);
> +	SAFE_SIGADDSET(&sigset1, SIGALRM);
> +
> +	sa_new.sa_handler = sig_handler;
> +	SAFE_SIGACTION(SIGALRM, &sa_new, 0);

Here you were passing random data to the sigaction() function, as the
sa_new was created on a stack and only sa_handler was set.

Which, for instance, breaks the test in a case of the -i 2 option, since
if you were unlucky the SA_RESETHAND was set in the sa_new and the
signal handler was uninstalled after the first signal was handled and
the test process was killed by SIGALRM when the signal arrived for a
second time.

In short there was all kind of mess passed down the call, on strace it
looked as:

[pid 3245] rt_sigaction(SIGALRM, {sa_handler=0x557469b59c20, sa_mask=[HUP INT QUIT ILL ABRT USR1 ALRM TERM CHLD TSTP TTOU URG VTALRM PROF WINCH PWR SYS RT_1 RT_2 RT_3 RT_4 RT_6 RT_10 RT_12 RT_13 RT_14 RT_18 RT_20 RT_21 RT_22], sa_flags=SA_RESTORER|SA_ONSTACK|SA_RESTART|SA_NODEFER|SA_RESETHAND|0xe9e4e8, sa_restorer=0x7f26dc368b40}, NULL, 8) = 0

So I changed it to:

	struct sigaction sa_new = {
		.sa_handler = sig_handler
	};

Which will clears the rest of the structure.

> +	/* Block SIGALRM */
> +	SAFE_SIGPROCMASK(SIG_SETMASK, &sigset1, NULL);
>  }
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = verify_sigsuspend,
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
