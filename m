Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA119F031
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 07:57:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 607143C2DE6
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 07:57:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B87963C005E
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 07:57:09 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 001D36008D1
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 07:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=DYGSk
 48WZn2JimzT+2l3BtaIvaD6I7Fz95VUludCEas=; b=d8lT4qbFmAGLKwRgVhr7M
 AgQtJJmvNR3REgYC6YDEm3A2jVMfi3cWFaZdyLw9+9+qRVub7tB3pqjF4ck4Frvm
 QJJmjEXGzwQ5Wt5SnBipvrQl0Zyv8YZxLJqOrnaD9l6PP6lViJyoran63OmZeO1f
 Mhhu4NmbMzkOoCm8N/iZsA=
Received: from [192.168.0.105] (unknown [112.22.73.173])
 by smtp8 (Coremail) with SMTP id DMCowAAnLHyvxIpe9UTtCA--.12S2;
 Mon, 06 Apr 2020 13:57:03 +0800 (CST)
To: laniel_francis@privacyrequired.com
References: <20200404175055.8568-1-laniel_francis@privacyrequired.com>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <279237b0-0ca7-f5cb-d27b-4f963541b587@163.com>
Date: Mon, 6 Apr 2020 13:57:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200404175055.8568-1-laniel_francis@privacyrequired.com>
X-CM-TRANSID: DMCowAAnLHyvxIpe9UTtCA--.12S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF1rWF13XF1DCrWDKw4xXrb_yoW3KF4fpr
 W8t3ZIkryxAry8Cw1xXF1kZrW5u34fXr47Cw1DXF1rZr45J3s3JrsIgFW5GFWUJrsYy34Y
 gF4rGrWrZFyqvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jAXo7UUUUU=
X-Originating-IP: [112.22.73.173]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBzg-9hFQHIVXCrQAAsw
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Increase pipe2() coverage.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi laniel

Thanks for you patch, here are some small nits

Also, I think we can change a accurate subject, ie
"add new test for pipe2 with/without O_NONBLOCK mode"
> From: Francis Laniel <laniel_francis@privacyrequired.com>
> 
> A new test was added (pipe2_03.c), this test checks the following:
> 1. Create a pipe with O_NONBLOCK.
> 2. Check that this flag is set.
> 3. Check that pipe size is 65536B.
16 * page_size
> 4. Reduce pipe size to 4096B.
page_size
> 5. Write buffer bigger than page size and see that second write fails.
we should also check errno num
> 6. Set pipe's flags to default.
> 7. Check that pipe is still full with select.
IMO, we can move this function into child process, so we can check its 
status(it should be in s status when we write data into full pipe with 
block mode). And then we can kill it.
> ---
>   testcases/kernel/syscalls/pipe2/.gitignore |   1 +
>   testcases/kernel/syscalls/pipe2/pipe2_03.c | 215 +++++++++++++++++++++
>   2 files changed, 216 insertions(+)It miss runtest/syscalls file.
>   create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c
> 
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
> index cd38bb309..01d980dba 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1,2 +1,3 @@
>   /pipe2_01
>   /pipe2_02
> +/pipe2_03
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> new file mode 100644
> index 000000000..ea225fddc
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> @@ -0,0 +1,215 @@
> +// SPDX-License-Iventifier: GPL-2.0
It should use SPDX-License-Identifier: GPL-2.0-or-later.
> +/* Copyright (c) Francis Laniel, 2020                                         */
> +/******************************************************************************/
> +/******************************************************************************/
> +/*                                                                            */
> +/* File:        pipe2_03.c                                                    */
> +/*                                                                            */
> +/* Description: This Program tests getting and setting the pipe size.         */
> +/*              It also tests what happen when you write to a full pipe       */
> +/*              depending on whether O_NONBLOCK is or not.                    */
> +/*                                                                            */
> +/* Usage:  <for command-line>                                                 */
> +/* pipe2_03 [-c n] [-e][-i n] [-I x] [-p x] [-t]                              */
> +/*      where,  -c n : Run n copies concurrently.                             */
> +/*              -e   : Turn on errno logging.                                 */
> +/*              -i n : Execute test n times.                                  */
> +/*              -I x : Execute test for x seconds.                            */
> +/*              -P x : Pause for x seconds between iterations.                */
> +/*              -t   : Turn on syscall timing.                                */
> +/*
This is old style. I have mentioned that you may see pipe12.c for 
reference. In this case, option has been hanlded by ltp library, ie -i 
-t option. So we don't need this info.
 
     */
> +/* Total Tests: 1                                                             */
> +/*                                                                            */
> +/* Test Name:   pipe2_03                                                      */
> +/*                                                                            */
> +/* Author:      Francis Laniel                                                */
> +/*                                                                            */
> +/* History:     Created - Mar 28 2020 - Francis Laniel                        */
> +/******************************************************************************/
> +#define _GNU_SOURCE
> +#include <stdlib.h>
> +#include <features.h>
> +#include <fcntl.h>
We should use lapi/fcntl.h to avoid undefined error(F_GETPIPE_SZ)  on 
centos6.
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <assert.h>
> +#include <sys/select.h>
> +
> +#include "tst_test.h"
> +
> +#define PAGE_NR 16
> +#define READ_SIDE 0
> +#define WRITE_SIDE 1
I guess we can drop READ_SIDE and WRITE_SIDE macro. We all know
fd[0] represent read side and fd[1] represent write side.
> +#define SECONDS 3
> +#define MICROSECONDS 0
> +
> +/**
> + * The two file descriptors of the pipe.
> + */
the comment is surplus.
> +static int fds[2];
> +
> +/**
> + * This variable will contain the system page size after setup.
> + */
here as well
> +static long page_size;
> +
> +/**
> + * Setup everything.
> + * This function will:
> + * 1. Create the pipe with O_NONBLOCK.
> + * 2. Get system page size with sysconf().
> + */
here as well
> +static void setup(void)
> +{
> +	/*
> +	 * Check that Linux version is greater than 2.6.35 to be able to use
> +	 * F_GETPIPE_SZ and F_SETPIPE_SZ.
> +	 */
> +	if (tst_kvercmp(2, 6, 35) < 0)
> +		tst_brk(TCONF, "This test can only run on kernels that are 2.6.35 and higher");
> +       
AFAIK, now linux kernel has reached to 5.7, 2.6.35 is so old that we 
don't need to compare this. Only ensuring this case can be compile is 
ok. ltp community has a discussion about minimal supported kernel and 
glibc version, more info see[1]

[1]https://github.com/linux-test-project/ltp/issues/657
> +	/*
> +	 * Create the pip with O_NONBLOCK.
> +	 */
> +	if (pipe2(fds, O_NONBLOCK))
> +		tst_brk(TBROK | TERRNO, "pipe2() failed");
I guess we can add SAFE_PIPE2 macro for this like SAFE_PIPE.
> +
> +	/*
> +	 * Get the system page size.
> +	 */
> +	page_size = SAFE_SYSCONF(_SC_PAGESIZE);
> +}
> +
> +/**
> + * Test everything.
> + */
remove this comment.
> +static void test_pipe2(void)
> +{
> +	int ret;
> +
> +	long flags;
> +	long pipe_size;
> +
> +	char *buf;
> +
> +	fd_set set;
> +	struct timeval timeout;
> +
> +	/*
> +	 * Get the flags of the pipe.
> +	 */
remove...
> +	flags = SAFE_FCNTL(fds[0], F_GETFL);
> +
> +	if (!(flags & O_NONBLOCK))
> +		tst_res(TFAIL, "O_NONBLOCK flag must be set.");
> +
> +	/*
> +	 * Get the size of the pipe.
> +	 */
remove
> +	pipe_size = SAFE_FCNTL(fds[0], F_GETPIPE_SZ);
> +
> +	if (pipe_size != page_size * PAGE_NR)
> +		tst_res(TFAIL, "Default pipe page is 16 * 4096 = 65536B.");
> +
> +	/*
> +	 * A pipe has two file descriptors.
> +	 * But in the kernel these two file descriptors point to the same pipe.
> +	 * So setting size from first file handle set size for the pipe.
> +	 *
> +	 * Moreover, the size of a pipe is exprimed in page.
> +	 * So the minimal size of a pipe is a page size, setting its size to 0
> +	 * leads to a pipe whom size is 4096B.
> +	 */Remove...
We all know if we set a size less than page size, it will round up to a 
page size not 4096b.
> +	SAFE_FCNTL(fds[0], F_SETPIPE_SZ, 0);
> +
> +	/*
> +	 * So getting size from the second file descriptor return the size of
> +	 * the pipe which was changed before with first file descriptor.
> +	 */
> +	pipe_size = SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
> +
> +	if (pipe_size != page_size)
> +		tst_res(TFAIL, "Pipe size (%ld) must be page size (%ld)",
> +			pipe_size, page_size);
> +
> +	/*
> +	 * Create a buffer of page size.
> +	 * We create it in stack because we do not care of its lifetime.
> +	 */
Remove...
> +	buf = alloca(page_size);
Maybe we can use tst_alloc function. more info see[2]

https://githuber/doc/test-writing-g.com/linux-test-project/ltp/blob/mastuidelines.txt
> +
> +	SAFE_WRITE(1, fds[WRITE_SIDE], buf, page_size);
> +
> +	/*
> +	 * This write should return -1 because pipe is already full.
> +	 */
> +	if (write(fds[WRITE_SIDE], buf, page_size) != -1)
> +		tst_res(TFAIL | TERRNO, "write() succeeded and should not");
> +
> +	/*
> +	 * Remove the O_NONBLOCK parameter for the pipe.
> +	 * After this call write to the pipe will be blocking.
> +	 */
remove...
> +	SAFE_FCNTL(fds[0], F_SETFL, flags & ~O_NONBLOCK);
> +
> +	/*
> +	 * Get again the flags of the pipe.
> +	 */
remove...
> +	flags = SAFE_FCNTL(fds[0], F_GETFL);
> +
> +	if (flags & O_NONBLOCK)
> +		tst_res(TFAIL, "O_NONBLOCK flag must not be set.");
> +
> +	/*
> +	 * Empty the set so no garbage value is in it.
> +	 */
> +	FD_ZERO(&set);
> +
> +	/*
> +	 * Add the write side of the pipe to the set.
> +	 */
> +	FD_SET(fds[WRITE_SIDE], &set);
> +
> +	if (!FD_ISSET(fds[WRITE_SIDE], &set))
> +		tst_res(TFAIL, "Pipe must be in the set.");
> +
> +	timeout.tv_sec = SECONDS;
> +	timeout.tv_usec = MICROSECONDS;
> +
> +	/*
> +	 * Since writes are now blocking we use select to check if the pipe is
> +	 * available to receive write.
> +	 * Wait SECONDS seconds and MICROSECONDS microseconds on write side of
> +	 * the pipe.
> +	 */
> +	ret = select(1, NULL, &set, NULL, &timeout);
> +
> +	if (ret == -1)
> +		tst_res(TFAIL | TERRNO, "select() failed");
> +
> +	/*
> +	 * The pipe is still full so select should return after the waiting time
> +	 * returning 0 because write side of the pipe is not available because
> +	 * it is full.
> +	 */
> +	if (ret)
> +		tst_res(TFAIL, "Pipe is not full.");
> +	else
> +		tst_res(TPASS, "Pipe is still full.");
> +}
> +
> +/**
> + * Clean everything either if test is finished or if something failed.
> + */
> +static void cleanup(void)
> +{
> +	for (int i = 0; i < 2; i++)
> +		if (fds[i])
it should be if (fds[i] > 0)
> +			SAFE_CLOSE(fds[i]);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = test_pipe2,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> \ No newline at end of file
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
