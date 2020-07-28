Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D92230ADC
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 15:02:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A237C3C5DA5
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 15:02:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BF2503C0194
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 15:01:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7355060070E
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 15:01:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0FF7AD80;
 Tue, 28 Jul 2020 13:02:04 +0000 (UTC)
Date: Tue, 28 Jul 2020 15:02:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200728130215.GA15351@yuki.lan>
References: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] libs: sigwait: Fix compilation warning
 around sigprocmask()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> sigwait.c: In function ???test_masked_matching???:
> sigwait.c:157:42: warning: passing argument 3 to restrict-qualified parameter aliases with argument 2 [-Wrestrict]
>   157 |  TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
> 
> Fix these by using different pointers for new and old masks.
> 
> Reported-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2: New patch
> 
>  libs/libltpsigwait/sigwait.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/libs/libltpsigwait/sigwait.c b/libs/libltpsigwait/sigwait.c
> index dbd33a61f2b1..0a34e6cc3deb 100644
> --- a/libs/libltpsigwait/sigwait.c
> +++ b/libs/libltpsigwait/sigwait.c
> @@ -156,11 +156,11 @@ void test_masked_matching(swi_func sigwaitinfo, int signo,
>  			    && si.si_code == SI_USER
>  			    && si.si_signo == signo, "Struct siginfo mismatch");
>  
> -	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
> +	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
>  	if (TST_RET == -1)
>  		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");

It says "restoring the original signal mask" so shouldn't that be
sigprocmask(SIG_SETMASK, &oldmask, &sigs) ?

> -	if (sigismember(&oldmask, signo))
> +	if (sigismember(&sigs, signo))
>  		tst_res(TPASS, "sigwaitinfo restored the original mask");
>  	else
>  		tst_res(TFAIL,
> @@ -214,11 +214,11 @@ void test_masked_matching_rt(swi_func sigwaitinfo, int signo,
>  			    && si.si_signo == signo + 1,
>  			    "Struct siginfo mismatch");
>  
> -	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
> +	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
>  	if (TST_RET == -1)
>  		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");
>  
> -	if (sigismember(&oldmask, signo))
> +	if (sigismember(&sigs, signo))
>  		tst_res(TPASS, "sigwaitinfo restored the original mask");
>  	else
>  		tst_res(TFAIL,
> @@ -250,11 +250,11 @@ void test_masked_matching_noinfo(swi_func sigwaitinfo, int signo,
>  	TEST(sigwaitinfo(&sigs, NULL, NULL));
>  	REPORT_SUCCESS(signo, 0);
>  
> -	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
> +	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
>  	if (TST_RET == -1)
>  		tst_brk(TBROK | TTERRNO, "restoring original signal mask failed");

Here as well?

> -	if (sigismember(&oldmask, signo))
> +	if (sigismember(&sigs, signo))
>  		tst_res(TPASS, "sigwaitinfo restored the original mask");
>  	else
>  		tst_res(TFAIL,
> @@ -289,7 +289,7 @@ void test_bad_address(swi_func sigwaitinfo, int signo,
>  	TEST(sigwaitinfo(&sigs, (void *)1, NULL));
>  	REPORT_SUCCESS(-1, EFAULT);
>  
> -	TEST(sigprocmask(SIG_SETMASK, &oldmask, &oldmask));
> +	TEST(sigprocmask(SIG_SETMASK, &sigs, &oldmask));
>  	if (TST_RET == -1)
>  		tst_brk(TBROK | TTERRNO, "sigprocmask() failed");

And here?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
