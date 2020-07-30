Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E74233584
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 17:34:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D10C3C3149
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 17:34:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 707C63C220D
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 17:33:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E595D2014C1
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 17:33:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2320AC4C;
 Thu, 30 Jul 2020 15:34:08 +0000 (UTC)
Date: Thu, 30 Jul 2020 17:34:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200730153417.GA17418@yuki.lan>
References: <53c9ed8dc17ea6fa0b46502cd1c724a3a8539c8c.1595842740.git.viresh.kumar@linaro.org>
 <ec86df91b3664ff7555717ac547d9e2c579d236a.1596035606.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec86df91b3664ff7555717ac547d9e2c579d236a.1596035606.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 resend 2/2] libs: sigwait: Get rid of
 REPORT_SUCCESS() macro
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
>  	SAFE_KILL(child, SIGTERM);
>  	SAFE_WAIT(NULL);
> @@ -78,7 +52,14 @@ void test_timeout(swi_func sigwaitinfo, int signo, enum tst_ts_type type)
>  	child = create_sig_proc(signo, INT_MAX, 100000);
>  
>  	TEST(sigwaitinfo(&sigs, &si, tst_ts_get(&ts)));
> -	REPORT_SUCCESS(-1, EAGAIN);
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EAGAIN)
> +			tst_res(TPASS, "Wait interrupted by a signal");

Can we please fix these messages as well so that it's not copy & paste
of the same message all over?

This one should say "Wait interrupted by a timeout"

> +		else
> +			tst_res(TFAIL | TTERRNO, "Expected error number EAGAIN, got");
> +	} else {
> +		tst_res(TFAIL, "Expected return value -1, got: %ld", TST_RET);
> +	}
>  
>  	SAFE_KILL(child, SIGTERM);
>  	SAFE_WAIT(NULL);
> @@ -101,9 +82,15 @@ void test_unmasked_matching(swi_func sigwaitinfo, int signo,
>  	child = create_sig_proc(signo, INT_MAX, 100000);
>  
>  	TEST(sigwaitinfo(&sigs, &si, NULL));
> -	REPORT_SUCCESS_COND(signo, 0, si.si_pid == child
> -			    && si.si_code == SI_USER
> -			    && si.si_signo == signo, "Struct siginfo mismatch");
> +	if (TST_RET == signo) {
> +		if (si.si_pid == child && si.si_code == SI_USER &&
> +		    si.si_signo == signo)
> +			tst_res(TPASS, "Wait interrupted by a signal");

And this one "struct siginfo is correct"


etc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
