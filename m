Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B722331393
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:38:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B7533C6BEB
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 17:38:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 804FB3C556C
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:38:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A78551A0034D
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 17:38:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F803AD74;
 Mon,  8 Mar 2021 16:38:42 +0000 (UTC)
Date: Mon, 8 Mar 2021 17:40:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEZTd+CT/Gag1ejK@yuki.lan>
References: <20210308154421.2002-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308154421.2002-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/runtest/smoketest b/runtest/smoketest
> index 0c24fc1fa..ec0c088cb 100644
> --- a/runtest/smoketest
> +++ b/runtest/smoketest
> @@ -11,5 +11,5 @@ symlink01 symlink01
>  stat04 symlink01 -T stat04
>  utime01A symlink01 -T utime01
>  rename01A symlink01 -T rename01
> -splice02 seq 1 20 | splice02
> +splice02 splice02 -n 20

I do wonder if this should be replaced with something that includes a
shell pipe instead. It has been selected here to make sure we pass the
command line correctly to a shell interpreter.

Maybe something as:

shell_test01 echo "SUCCESS" | cat

>  route4-change-dst route-change-dst.sh
> diff --git a/runtest/syscalls b/runtest/syscalls
> index fe22ae5b6..355e71144 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1446,7 +1446,7 @@ socketpair02 socketpair02
>  sockioctl01 sockioctl01
>  
>  splice01 splice01
> -splice02 seq 1 20000 | splice02
> +splice02 splice02 -n 20000

Don't we default to 20000 in the test anyway? What is the point of
passing the default value here?

>  splice03 splice03
>  splice04 splice04
>  splice05 splice05
> diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
> index b579667b9..6e183ac7e 100644
> --- a/testcases/kernel/syscalls/splice/splice02.c
> +++ b/testcases/kernel/syscalls/splice/splice02.c
> @@ -1,9 +1,24 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) Jens Axboe <axboe@kernel.dk>, 2009
> - * http://lkml.org/lkml/2009/4/2/55
> + * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
>   */
>  
> +/*\
> + * [DESCRIPTION]
> + * Original reproducer for kernel fix
> + * bf40d3435caf NFS: add support for splice writes
> + * from v2.6.31-rc1.
> + *
> + * http://lkml.org/lkml/2009/4/2/55
> + *
> + * [ALGORITHM]
> + * - create pipe
> + * - fork(), child replace stdin with pipe
> + * - parent write to pipe
> + * - child slice from pipe
> +\*/
> +
>  #define _GNU_SOURCE
>  
>  #include <stdio.h>
> @@ -15,11 +30,27 @@
>  #include "lapi/splice.h"
>  
>  #define SPLICE_SIZE (64*1024)
> +#define DEFAULT_NARG 20000
>  
> -static void splice_test(void)
> +static char *narg;
> +static int num = DEFAULT_NARG;
> +static int pipe_fd[2];
> +
> +static void setup(void)
> +{
> +	if (tst_parse_int(narg, &num, 1, INT_MAX))
> +		tst_brk(TBROK, "invalid number of input '%s'", narg);
                                        ^
					That does not sound english


Maybe "Invalid number of writes" or "Invalid size" something along these lines.

> +}
> +
> +static void do_child(void)
>  {
>  	int fd;
>  
> +	SAFE_CLOSE(pipe_fd[1]);
> +	close(STDIN_FILENO);
> +	SAFE_DUP2(pipe_fd[0], STDIN_FILENO);

dup2() closed the newfd, no need to close STDIN_FILENO here.

> +	TST_CHECKPOINT_WAIT(0);
>  	fd = SAFE_OPEN("splice02-temp", O_WRONLY | O_CREAT | O_TRUNC, 0644);
>  
>  	TEST(splice(STDIN_FILENO, NULL, fd, NULL, SPLICE_SIZE, 0));
> @@ -31,10 +62,40 @@ static void splice_test(void)
>  	}
>  
>  	SAFE_CLOSE(fd);
> +
> +	exit(0);
> +}
> +
> +static void run(void)
> +{
> +	int i;
> +
> +	SAFE_PIPE(pipe_fd);
> +
> +	if (SAFE_FORK())
> +		do_child();
> +
> +	tst_res(TINFO, "writting %d times", num);
> +
> +	for (i = 0; i < num; i++)
> +		SAFE_WRITE(1, pipe_fd[1], "x", 1);
> +
> +	TST_CHECKPOINT_WAKE(0);

I guess that the test will timeout if the -n parameter is greater than
maximal pipe capacity, since the write would end up blocking.

Note that in the original test excess data was simply ignored.

If we wanted to increase the test coverage we could change the child to
splice in a loop with a proper offset until all data are written. After
that no synchronization would be required. Then we could check if we
ended up with a right file size and if the content is correct as well.

> +	tst_reap_children();
> +
> +	SAFE_CLOSE(pipe_fd[0]);
> +	SAFE_CLOSE(pipe_fd[1]);
>  }
>  
>  static struct tst_test test = {
> -	.test_all = splice_test,
> +	.test_all = run,
> +	.setup = setup,
> +	.needs_checkpoints = 1,
>  	.needs_tmpdir = 1,
> +	.forks_child = 1,
>  	.min_kver = "2.6.17",
> +	.options = (struct tst_option[]) {
> +		{"n:", &narg, "-n x     Number of input"},

Here as well.

> +		{}
> +	},
>  };
> -- 
> 2.30.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
