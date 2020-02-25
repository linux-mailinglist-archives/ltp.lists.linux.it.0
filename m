Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDD16C0A2
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 13:19:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C49E43C25A2
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 13:19:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AFAC13C0EAD
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 13:19:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82D006010CB
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 13:19:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6588AD76;
 Tue, 25 Feb 2020 12:19:14 +0000 (UTC)
Date: Tue, 25 Feb 2020 13:19:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200225121914.GC5077@rei.lan>
References: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pidfd_open: Continue with rest of the
 tests on failure
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

Agree here, also tst_brk(TFAIL, ...) is not working well at this point, see:

https://github.com/linux-test-project/ltp/issues/462

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .../kernel/syscalls/pidfd_open/pidfd_open02.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> index d73b5326b3b1..533270da3dbd 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> @@ -35,17 +35,15 @@ static void run(unsigned int n)
>  
>  	if (TST_RET != -1) {
>  		SAFE_CLOSE(TST_RET);
> -		tst_brk(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
> +		tst_res(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
>  			tc->name, n);
> -	}
> -
> -	if (tc->exp_errno != TST_ERR) {
> -		tst_brk(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
> +	} else if (tc->exp_errno != TST_ERR) {
> +		tst_res(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
>  			tc->name, tst_strerrno(tc->exp_errno));
> -	}

Can we please use return instead of the else if branches?

i.e.

	if (...) {
		tst_res(TFAIL, ...);
		return;
	}

> -	tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
> -		tc->name);
> +	 } else {
> +		 tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
> +			 tc->name);
> +	 }
>  }


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
