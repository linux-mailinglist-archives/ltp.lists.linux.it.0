Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6C24063B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:57:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E62443C3155
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:57:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 55E6A3C0515
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:57:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 577921400051
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:57:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B55B0AC7C;
 Mon, 10 Aug 2020 12:57:26 +0000 (UTC)
Date: Mon, 10 Aug 2020 14:57:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <20200810125719.GC11869@yuki.lan>
References: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
 <20200807113950.69052-3-Filip.Bozuta@syrmia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807113950.69052-3-Filip.Bozuta@syrmia.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] syscalls/clock_nanosleep: add a test case
 for bad timespec address
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
Cc: laurent@vivier.eu, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This patch introduces test cases for already existing test
> for syscall 'clock_nanosleep()' (clock_nanosleep01). These test
> cases are for situations when bad timespec addresses are passed
> for arguments 'request' and 'remain' in which case errno
> EFAULT ('Bad address') is expected to be set.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  .../clock_nanosleep/clock_nanosleep01.c       | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
> index 4542995f2..66108ed8e 100644
> --- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
> +++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
> @@ -20,6 +20,8 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
>  enum test_type {
>  	NORMAL,
>  	SEND_SIGINT,
> +	BAD_TS_ADDR_REQ,
> +	BAD_TS_ADDR_REM,
>  };
>  
>  #define TYPE_NAME(x) .ttype = x, .desc = #x
> @@ -78,6 +80,22 @@ static struct test_case tcase[] = {
>  		.exp_ret = -1,
>  		.exp_err = EINTR,
>  	},
> +	{
> +		TYPE_NAME(BAD_TS_ADDR_REQ),
> +		.clk_id = CLOCK_REALTIME,
> +		.flags = 0,
> +		.exp_ret = -1,
> +		.exp_err = EFAULT,
> +	},
> +	{
> +		TYPE_NAME(BAD_TS_ADDR_REM),
> +		.clk_id = CLOCK_REALTIME,
> +		.flags = 0,
> +		.tv_sec = 10,
> +		.tv_nsec = 0,
> +		.exp_ret = -1,
> +		.exp_err = EFAULT,
> +	},
>  };
>  
>  static struct tst_ts *rq;
> @@ -106,24 +124,37 @@ void setup(void)
>  	SAFE_SIGNAL(SIGINT, sighandler);
>  }
>  
> +void cleanup(void) {}

Please just pass NULL to the tst_get_bad_addr() instead.

Also it should be called only once in the test setup, as I explained for
the previous patch.

>  static void do_test(unsigned int i)
>  {
>  	struct test_variants *tv = &variants[tst_variant];
>  	struct test_case *tc = &tcase[i];
>  	pid_t pid = 0;
> +	void *request, *remain;
>  
>  	memset(rm, 0, sizeof(*rm));
>  	rm->type = rq->type;
>  
>  	tst_res(TINFO, "case %s", tc->desc);
>  
> -	if (tc->ttype == SEND_SIGINT)
> +	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
>  		pid = create_sig_proc(SIGINT, 40, 500000);

Does the kernel access the remaining time only if the call gets
interrupted by a signal?

I guess that this would be better written down in comment.

Generally LTP testcases usually have short documentation in a comment
just after the license and copyright. In this case it should be
something as:

/*
 * EINVAL - negative tv_nsec
 * EINVAL - tv_nsec > 1s
 * ...
 * EFAULT - invalid request pointer
 * EFAULT - invalid remain pointer while interrupted by a signal
 */

>  	tst_ts_set_sec(rq, tc->tv_sec);
>  	tst_ts_set_nsec(rq, tc->tv_nsec);
>  
> -	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
> +	if (tc->ttype == BAD_TS_ADDR_REQ)
> +		request = tst_get_bad_addr(cleanup);
> +	else
> +		request = tst_ts_get(rq);
> +
> +	if (tc->ttype == BAD_TS_ADDR_REM)
> +		remain = tst_get_bad_addr(cleanup);
> +	else
> +		remain = tst_ts_get(rm);
> +
> +	TEST(tv->func(tc->clk_id, tc->flags, request, remain));
>  
>  	if (tv->func == libc_clock_nanosleep) {
>  		/*
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
