Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC4293CE6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 15:05:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75E873C31B6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 15:05:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 75F113C253A
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 15:05:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B06C260083E
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 15:05:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D29FACB5;
 Tue, 20 Oct 2020 13:05:31 +0000 (UTC)
Date: Tue, 20 Oct 2020 15:06:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201020130600.GA16294@yuki.lan>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
 <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
 <20201014121343.GD31816@yuki.lan>
 <20201019101048.knbl2w3q2xev6ywc@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019101048.knbl2w3q2xev6ywc@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/3] syscalls: select: Verify that data is
 available to read
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
> Maybe I haven't understood what you meant when you said this earlier:
> 
>   And the coverate in these tests is a bit lacking, we do not have a
>   single tests that would send a data over a pipe to a fd select is
>   watching and check that select was woken up by that. There is no such
>   test in the pselect/ directory either.
> 
> > Also I would like to be more specific. E.g. expecting specific return
> > instead of just non-zero and also making sure the right bits are enabled
> > in the fd sets.
> 
> Something like this ?

This is much better, I suppose that we should as well check the
individual bits in the fd_sets to make it perfect.

> diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
> index e4b5caecbb10..4b33c0a01380 100644
> --- a/testcases/kernel/syscalls/select/select01.c
> +++ b/testcases/kernel/syscalls/select/select01.c
> @@ -38,12 +38,15 @@ static void run(unsigned int n)
>         struct tcases *tc = &tests[n];
>         struct timeval timeout;
>         char buf;
> +       int exp_ret = 1;
>  
>         timeout.tv_sec = 0;
>         timeout.tv_usec = 100000;
>  
> -       if (tc->writefd)
> +       if (tc->writefd) {
>                 SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));
> +               exp_ret++;
> +       }
>  
>         TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
>  
> @@ -51,6 +54,8 @@ static void run(unsigned int n)
>                 tst_res(TFAIL | TTERRNO, "select() failed %s", tc->desc);
>         else if (!TST_RET)
>                 tst_res(TFAIL, "select() timed out %s", tc->desc);
> +       else if (TST_RET != exp_ret)
> +               tst_res(TFAIL, "select() returned incorrect value: %s, expected: %d, got: %lu", tc->desc, exp_ret, TST_RET);
>         else
>                 tst_res(TPASS, "select() passed %s", tc->desc);
>  }
> 
> -- 
> viresh

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
