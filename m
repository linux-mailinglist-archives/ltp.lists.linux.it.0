Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B3359C95
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 13:04:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ACF63C7F3F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 13:04:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2037F3C1D7B
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 13:04:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 569EB600A85
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 13:04:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A91BCAFEF;
 Fri,  9 Apr 2021 11:04:12 +0000 (UTC)
Date: Fri, 9 Apr 2021 12:58:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YHAzc8cpBVJFsuJZ@yuki>
References: <20210408184503.28414-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408184503.28414-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] splice02: Generate input in C
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
> changes v1->v2:
> * writing in loop (Cyril), that allowed to drop TST_CHECKPOINT_*()
> * default number of writes is 2x max pipe size
> * fixed problems reported by Cyril (drop redundant close(STDIN_FILENO),
>   better phrase error message).
> 
> NOTE: I kept verbose output to make behavior easier for reviewers.
> Mainly to see if write size and whole behavior is ok (please do run the
> test). But before merge I guess I should then delete:
> tst_res(TINFO, "splice() wrote %ld, remaining %d", TST_RET, to_write);
> 
> I haven't compared file content (Cyril), only checked size.
> 
> Kind regards,
> Petr
> 
>  runtest/smoketest                           |   2 +-
>  runtest/syscalls                            |   2 +-
>  testcases/kernel/syscalls/splice/splice02.c | 102 +++++++++++++++++---
>  3 files changed, 92 insertions(+), 14 deletions(-)
> 
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
>  route4-change-dst route-change-dst.sh
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 2d1e7b648..b89c545f0 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1451,7 +1451,7 @@ socketpair02 socketpair02
>  sockioctl01 sockioctl01
>  
>  splice01 splice01
> -splice02 seq 1 20000 | splice02
> +splice02 splice02
>  splice03 splice03
>  splice04 splice04
>  splice05 splice05
> diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
> index b579667b9..20bf91fb1 100644
> --- a/testcases/kernel/syscalls/splice/splice02.c
> +++ b/testcases/kernel/syscalls/splice/splice02.c
> @@ -1,40 +1,118 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) Jens Axboe <axboe@kernel.dk>, 2009
> + * Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + * Original reproducer for kernel fix
> + * bf40d3435caf NFS: add support for splice writes
> + * from v2.6.31-rc1.
> + *
>   * http://lkml.org/lkml/2009/4/2/55
> + *
> + * [ALGORITHM]
> + * - create pipe
> + * - fork(), child replace stdin with pipe
> + * - parent write to pipe
> + * - child slice from pipe
> + * - check resulted file size
>   */
>  
>  #define _GNU_SOURCE
>  
> +#include <fcntl.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <sys/stat.h>
>  #include <unistd.h>
> -#include <fcntl.h>
>  
>  #include "tst_test.h"
>  #include "lapi/splice.h"
>  
> -#define SPLICE_SIZE (64*1024)
> +#define WRITE_SIZE 1024
> +#define TEST_FILENAME "splice02-temp"
> +
> +static char *narg;
> +static int num_writes = -1;
> +static int pipe_fd[2];
> +
> +static void setup(void)
> +{
> +	if (tst_parse_int(narg, &num_writes, 1, INT_MAX))
> +		tst_brk(TBROK, "invalid number of writes '%s'", narg);
> +}
>  
> -static void splice_test(void)
> +static void do_child(void)
>  {
> -	int fd;
> +	int fd, to_write = num_writes;
> +	struct stat st;
> +
> +	SAFE_CLOSE(pipe_fd[1]);
> +	SAFE_DUP2(pipe_fd[0], STDIN_FILENO);
>  
> -	fd = SAFE_OPEN("splice02-temp", O_WRONLY | O_CREAT | O_TRUNC, 0644);
> +	fd = SAFE_OPEN(TEST_FILENAME, O_WRONLY | O_CREAT | O_TRUNC, 0644);
>  
> -	TEST(splice(STDIN_FILENO, NULL, fd, NULL, SPLICE_SIZE, 0));
> -	if (TST_RET < 0) {
> -		tst_res(TFAIL, "splice failed - errno = %d : %s",
> -			TST_ERR, strerror(TST_ERR));
> -	} else {
> -		tst_res(TPASS, "splice() system call Passed");
> +	while (to_write > 0) {
> +		TEST(splice(STDIN_FILENO, NULL, fd, NULL, WRITE_SIZE, 0));
> +		tst_res(TINFO, "splice() wrote %ld, remaining %d", TST_RET, to_write);
> +		if (TST_RET < 0) {
> +			tst_res(TFAIL | TTERRNO, "splice failed");
> +			goto cleanup;
> +		} else {
> +			to_write -= TST_RET;
> +		}
>  	}

Shouldn't we break the cycle here if get 0 from splice()?

If I'm reading the manual right it will return with 0 if the other end
of the pipe gets closed.

You can try to increase to_write by 1 here, I guess that we would end up
in an infinite loop here.

And maybe we can just loop here until splice() returns 0 to make things
simpler.

> +	stat(TEST_FILENAME, &st);
> +	if (st.st_size != num_writes) {
> +		tst_res(TFAIL, "file size is different from expected: %d (%d)",
> +				st.st_size, num_writes);
> +		return;
> +	}
> +
> +	tst_res(TPASS, "splice() system call passed");
> +
> +cleanup:
>  	SAFE_CLOSE(fd);
> +	exit(0);
> +}
> +
> +static void run(void)
> +{
> +	int i, max_pipe_size;
> +
> +	SAFE_PIPE(pipe_fd);
> +
> +	if (num_writes == -1) {

Btw we can let the num_writes initialized to 0 and do if (!num_writes)
here instead.

> +		max_pipe_size = SAFE_FCNTL(pipe_fd[1], F_GETPIPE_SZ);
> +		num_writes = max_pipe_size << 2;
                                           ^
					   This is 4x btw, bit shift by
					   1 is 2x
> +	}
> +
> +	if (SAFE_FORK())
> +		do_child();

	if (!SAFE_FORK()) ?

It's mildly confusing that the parent executes do_child() here, not that
it matters that much though.

> +	tst_res(TINFO, "writting %d times", num_writes);
> +
> +	for (i = 0; i < num_writes; i++)
> +		SAFE_WRITE(1, pipe_fd[1], "x", 1);
> +
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
> +		{"n:", &narg, "-n x     Number of writes (default 2x max pipe size)"},
> +		{}
> +	},
>  };
> -- 
> 2.30.2
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
