Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8046A28E059
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 14:13:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37E303C3295
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 14:13:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 388903C25D7
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 14:13:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 859D46009E2
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 14:13:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC744AC3C;
 Wed, 14 Oct 2020 12:13:16 +0000 (UTC)
Date: Wed, 14 Oct 2020 14:13:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201014121343.GD31816@yuki.lan>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
 <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb31dd18ad396ab602ba8957ee01a666f79ad9bb.1599558175.git.viresh.kumar@linaro.org>
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
> select() returns a positive value on success if timeout hasn't happened,
> else returns 0. Check that and send some data to the write file
> descriptor for the same.
> 
> Acked-by: Li Wang <liwang@redhat.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  testcases/kernel/syscalls/select/select01.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/select/select01.c b/testcases/kernel/syscalls/select/select01.c
> index 1213aa931251..c6b30aa67dd7 100644
> --- a/testcases/kernel/syscalls/select/select01.c
> +++ b/testcases/kernel/syscalls/select/select01.c
> @@ -25,25 +25,32 @@ static struct select_info {
>  	int *nfds;
>  	fd_set *readfds;
>  	fd_set *writefds;
> +	int *writefd;
>  	char *desc;
>  } tests[] = {
> -	{&fd_reg, &readfds_reg, NULL, "with regular file"},
> -	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, "with system pipe"},
> -	{&fd_npipe, &readfds_npipe, &writefds_npipe, "with named pipe (FIFO)"},
> +	{&fd_reg, &readfds_reg, NULL, NULL, "with regular file"},
> +	{&fds_pipe[1], &readfds_pipe, &writefds_pipe, &fds_pipe[1], "with system pipe"},
> +	{&fd_npipe, &readfds_npipe, &writefds_npipe, &fd_npipe, "with named pipe (FIFO)"},
>  };
>  
>  static void run(unsigned int n)
>  {
>  	struct select_info *tc = &tests[n];
>  	struct timeval timeout;
> +	char buf;
>  
>  	timeout.tv_sec = 0;
>  	timeout.tv_usec = 100000;
>  
> +	if (tc->writefd)
> +		SAFE_WRITE(0, *tc->writefd, &buf, sizeof(buf));

I'm not sure why we are writing data here. For both the pipe and fifo
the select() will return that we can write there, hence the return would
be non-zero regardless.

Also I would like to be more specific. E.g. expecting specific return
instead of just non-zero and also making sure the right bits are enabled
in the fd sets.

>  	TEST(do_select(*tc->nfds + 1, tc->readfds, tc->writefds, 0, &timeout));
>  
>  	if (TST_RET == -1)
>  		tst_res(TFAIL | TTERRNO, "select() failed %s", tc->desc);
> +	else if (!TST_RET)
> +		tst_res(TFAIL, "select() timed out %s", tc->desc);
>  	else
>  		tst_res(TPASS, "select() passed %s", tc->desc);
>  }
> -- 
> 2.25.0.rc1.19.g042ed3e048af
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
