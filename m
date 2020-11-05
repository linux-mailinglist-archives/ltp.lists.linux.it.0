Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5162A7EA2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:33:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 075703C2FE2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:33:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AE11C3C239E
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:33:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1B4B2003A7
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:33:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8A6BACF1;
 Thu,  5 Nov 2020 12:33:39 +0000 (UTC)
Date: Thu, 5 Nov 2020 13:34:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
Message-ID: <20201105123425.GA10395@yuki.lan>
References: <1604575034-17799-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604575034-17799-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] sycalls: select03: Make nfds use the correct
 value
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
> When running select03 with runltp in /opt/ltp, this case failed as below:
> select03.c:52: TFAIL: Invalid readfds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid writefds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid exceptfds: select() passed unexpectedly with 0
> 
> Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/select/select03.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
> index ca1b7a5..099b622 100644
> --- a/testcases/kernel/syscalls/select/select03.c
> +++ b/testcases/kernel/syscalls/select/select03.c
> @@ -29,21 +29,21 @@ static struct tcases {
>  	struct timeval **timeout;
>  	int exp_errno;
>  } tests[] = {
> -	{ "Negative nfds", -1, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
> -	{ "Invalid readfds", 6, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
> -	{ "Invalid writefds", 6, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
> -	{ "Invalid exceptfds", 6, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
> -	{ "Faulty readfds", 6, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
> -	{ "Faulty writefds", 6, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
> -	{ "Faulty exceptfds", 6, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
> -	{ "Faulty timeout", 6, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
> +	{ "Negative nfds", 0, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
> +	{ "Invalid readfds", 1, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
> +	{ "Invalid writefds", 1, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
> +	{ "Invalid exceptfds", 1, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
> +	{ "Faulty readfds", 1, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
> +	{ "Faulty writefds", 1, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
> +	{ "Faulty exceptfds", 1, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
> +	{ "Faulty timeout", 1, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },

Can we make it a pointer to integer value set in the setup instead?

>  };
>  
>  static void run(unsigned int n)
>  {
>  	struct tcases *tc = &tests[n];
>  
> -	TEST(do_select_faulty_to(tc->nfds, *tc->readfds, *tc->writefds,
> +	TEST(do_select_faulty_to(tc->nfds ? fd[1] + 1 : -1, *tc->readfds, *tc->writefds,
>  				 *tc->exceptfds, *tc->timeout,
>  				 tc->timeout == &invalid_to));
>  
> -- 
> 1.8.3.1
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
