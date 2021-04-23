Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E246369219
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 14:28:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7D4D3C6A0B
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Apr 2021 14:28:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FB1A3C1DFC
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 14:28:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 97E3C601CC0
 for <ltp@lists.linux.it>; Fri, 23 Apr 2021 14:28:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5E7CB1AE;
 Fri, 23 Apr 2021 12:28:14 +0000 (UTC)
Date: Fri, 23 Apr 2021 14:11:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YIK5iw5DBC9YQSpl@yuki>
References: <20210407081415.8353-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210407081415.8353-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getdtablesize: Update to the new api
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
> --- a/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> +++ b/testcases/kernel/syscalls/getdtablesize/getdtablesize01.c
> @@ -1,119 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) International Business Machines  Corp., 2005
>   * Copyright (c) Wipro Technologies Ltd, 2005.  All Rights Reserved.
>   *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

This is GPL-2.0 so the SPDX has to be without the -or-later part here.

> +#define TESTFILE "getdtablesize01_testfile"

This can be just "testfile" the test teporary directory is already
unique enough and has getdtablesize in it's name.

> +#define FILE_OPEN_MAX SAFE_SYSCONF(_SC_OPEN_MAX)
> 
> -char *TCID = "getdtablesize01";
> -int TST_TOTAL = 1;
> +static int *fd, count;
> 
> -int main(void)
> +static void run(void)
>  {
> -	int table_size, fd = 0, count = 0;
> +	int temp_fd;
>  	int max_val_opfiles;
>  	struct rlimit rlp;
> 
> -	setup();
> -	table_size = getdtablesize();
> -	getrlimit(RLIMIT_NOFILE, &rlp);
> -	max_val_opfiles = (rlim_t) rlp.rlim_cur;
> -
> -	tst_resm(TINFO,
> -		 "Maximum number of files a process can have opened is %d",
> -		 table_size);
> -	tst_resm(TINFO,
> -		 "Checking with the value returned by getrlimit...RLIMIT_NOFILE");
> -
> -	if (table_size == max_val_opfiles)
> -		tst_resm(TPASS, "got correct dtablesize, value is %d",
> -			 max_val_opfiles);
> -	else {
> -		tst_resm(TFAIL, "got incorrect table size, value is %d",
> -			 max_val_opfiles);
> -		cleanup();
> -	}
> +	TEST(getdtablesize());
> +	tst_res(TINFO,
> +		"Maximum number of files a process can have opened is %d",
> +		TST_RET);
> 
> -	tst_resm(TINFO,
> -		 "Checking Max num of files that can be opened by a process.Should be: RLIMIT_NOFILE - 1");
> -	for (;;) {
> -		fd = open("/etc/hosts", O_RDONLY);
> +	tst_res(TINFO, "Checking with the value returned by getrlimit");
> 
> -		if (fd == -1)
> -			break;
> -		count = fd;
> +	if (getrlimit(RLIMIT_NOFILE, &rlp))
> +		max_val_opfiles = FILE_OPEN_MAX;
> +	else
> +		max_val_opfiles = (rlim_t)rlp.rlim_cur;

Why do we fallback to sysconf() here? Does hte getrlmit() fail in some
cases? The original test just called getrlimit() and I do not remmeber
it failing.

> -#ifdef DEBUG
> -		printf("Opened file num %d\n", fd);
> -#endif
> -	}
> +	if (TST_RET == max_val_opfiles)
> +		tst_res(TPASS, "got correct dtablesize, value is %d "
> +			"max_val_opfiles value is %d",
> +			TST_RET, max_val_opfiles);
> +	else
> +		tst_res(TFAIL, "got incorrect dtablesize, value is %d"
> +			 "max_val_opfiles value is %d",
> +			 TST_RET, max_val_opfiles);

The LKML coding style says that we shouldn't break strings even if they
are over 80 characters.

> -//Now the max files opened should be RLIMIT_NOFILE - 1 , why ? read getdtablesize man page
> +	tst_res(TINFO,
> +		"Checking Max num of files that can be opened by a process."
> +		"Should be: RLIMIT_NOFILE - 1");
> 
> -	if (count > 0)
> -		close(count);
> -	if (count == (max_val_opfiles - 1))
> -		tst_resm(TPASS, "%d = %d", count, (max_val_opfiles - 1));
> -	else if (fd < 0 && errno == ENFILE)
> -		tst_brkm(TCONF, cleanup, "Reached maximum number of open files for the system");
> -	else
> -		tst_resm(TFAIL, "%d != %d", count, (max_val_opfiles - 1));
> +	while (1) {
> +		temp_fd = open(TESTFILE, O_CREAT | O_RDONLY, 0755);
> +		if (temp_fd == -1)
> +			break;
> +		fd[count++] = temp_fd;
> +	}

Here we blindly assume that the file descriptors will fit into the
table, which may not be true if the system is broken.

Also why do we need the array in the first place? The file descriptors
_are_ allocated continuously so the last fd we get from the open() call
is the maximal number of fds - 1, since the standard streams start at 0.
Technically we can even close the these descriptors if we store the
first fd we got from the open() call since the rest of fds will be in
the range, [first_fd, last_fd].

> -	cleanup();
> -	tst_exit();
> +	if (fd[count - 1] == (max_val_opfiles - 1))
> +		tst_res(TPASS,
> +			"max open file fd is correct, %d = %d",
> +			fd[count - 1], (max_val_opfiles - 1));
> +	else if (temp_fd < 0 && errno == ENFILE)
> +		tst_brk(TCONF,
> +			"Reached maximum number of open files for the system");
> +	else
> +		tst_res(TFAIL | TERRNO, "%d != %d", fd[count - 1], (max_val_opfiles - 1));
>  }
> 
> -void setup(void)
> +static void setup(void)
>  {
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	fd = SAFE_MALLOC(FILE_OPEN_MAX * sizeof(int));
>  }
> 
> -void cleanup(void)
> +static void cleanup(void)
>  {
> +	int i;
> +	for (i = 0; i < count; i++)
> +		SAFE_CLOSE(fd[i]);
> +
> +	free(fd);
> +	fd = NULL;
>  }
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> +
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
