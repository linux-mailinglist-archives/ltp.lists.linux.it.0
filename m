Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 524461A2DF7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 05:30:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 624943C2D2C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 05:30:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 63E3D3C21E8
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 05:30:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A26101A0089B
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 05:30:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; d="scan'208";a="88724788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 11:30:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 46121406AB15;
 Thu,  9 Apr 2020 11:20:00 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 11:30:24 +0800
To: <laniel_francis@privacyrequired.com>
References: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
 <20200408211700.7958-3-laniel_francis@privacyrequired.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <63ad5770-b2e4-2b85-1755-ff804eb14ad5@cn.fujitsu.com>
Date: Thu, 9 Apr 2020 11:30:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200408211700.7958-3-laniel_francis@privacyrequired.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 46121406AB15.A9582
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add new test for pipe2 with/without
 O_NONBLOCK mode.
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

> From: Francis Laniel <laniel_francis@privacyrequired.com>
> 
> The new test (pipe2_03.c) checks the following:
> 1. Create a pipe with O_NONBLOCK.
> 2. Check that this flag is set.
> 3. Check that pipe size is 16 * PAGE_SIZE.
> 4. Reduce pipe size to PAGE_SIZE.
> 5. Write buffer bigger than page size and see that second write fails.
> 6. Set pipe's flags to default.
> 7. Fork and do a write in the child, its state must be 'S' and is checked from
> the father.
> ---
>   testcases/kernel/syscalls/pipe2/.gitignore |   1 +
>   testcases/kernel/syscalls/pipe2/pipe2_03.c | 128 +++++++++++++++++++++
We should add pipe2_03 into runtest/syscalls file, so we can use runltp 
command to run this case when make install.  Also see Contribution 
Checklist in ltp/doc/test-writing-guidelines.txt

4. Test Contribution Checklist
------------------------------

1. Test compiles and runs fine (check with -i 10 too)
2. Checkpatch does not report any errors
3. The runtest entires are in place
4. Test files are added into corresponding .gitignore files
5. Patches apply over the latest git

>   2 files changed, 129 insertions(+)
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
> index 000000000..c2b182e02
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Francis Laniel. All rights reserved.
> + * Author: Francis Laniel <laniel_francis@privacyrequired.com>
> + *
> + * Test Description:
> + * This Program tests getting and setting the pipe size.
> + * It also tests what happen when you write to a full pipe depending on whether
> + * O_NONBLOCK is set or not.
> + */
> +#define _GNU_SOURCE
> +#include <stdlib.h>
> +#include <features.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <assert.h>
> +#include <sys/select.h>
> +
> +#include "lapi/fcntl.h"
> +#include "tst_test.h"
> +
> +#define PAGE_NR 16
> +#define SECONDS 3
> +#define MICROSECONDS 0
The two variables is useless.
> +
> +static int fds[2];
> +static long page_size;
> +
> +static void setup(void)
> +{
> +	/*
> +	 * Create the pipe with O_NONBLOCK.
> +	 */
> +	SAFE_PIPE2(fds, O_NONBLOCK);
> +
> +	/*
> +	 * Get the system page size.
> +	 */
> +	page_size = SAFE_SYSCONF(_SC_PAGESIZE);
> +}
> +
> +static void test_pipe2(void)
> +{
> +	long flags;
> +	long pipe_size;
> +
> +	char *buf;
> +
> +	pid_t pid;
> +	int status;
> +
> +	flags = SAFE_FCNTL(fds[0], F_GETFL);
> +
> +	if (!(flags & O_NONBLOCK))
> +		tst_res(TFAIL, "O_NONBLOCK flag must be set.");
> +
> +	pipe_size = SAFE_FCNTL(fds[0], F_GETPIPE_SZ);
> +
> +	if (pipe_size != page_size * PAGE_NR)
> +		tst_res(TFAIL, "Default pipe page is 16 * 4096 = 65536B.");
I guess we can remove this check. We can not ensure kernel will keep 
default pipe size is equal to 16 pagesize in future. We only ensure this 
pipe is full is ok. We can fill this pipe in setup parse.
> +
> +	/*
> +	 * A pipe has two file descriptors.
> +	 * But in the kernel these two file descriptors point to the same pipe.
> +	 * So setting size from first file handle set size for the pipe.
> +	 */
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
> +	buf = alloca(page_size);
> +
> +	SAFE_WRITE(1, fds[1], buf, page_size);
> +
> +	/*
> +	 * This write should return -1 because pipe is already full.
> +	 */
> +	if (write(fds[1], buf, page_size) != -1)
> +		tst_res(TFAIL | TERRNO, "write() succeeded and should not");
> +
> +	SAFE_FCNTL(fds[1], F_SETFL, flags & ~O_NONBLOCK);
> +
> +	flags = SAFE_FCNTL(fds[1], F_GETFL);
> +
> +	if (flags & O_NONBLOCK)
> +		tst_res(TFAIL, "O_NONBLOCK flag must not be set.");
> +
> +	pid = SAFE_FORK();
> +
> +	/*
> +	 * Since writes are now blocking the child must wait forever on this
> +	 * write.
> +	 */
> +	if (!pid)
> +		SAFE_WRITE(1, fds[1], buf, page_size);
> +
> +	if (TST_PROCESS_STATE_WAIT(pid, 'S', 1000))
> +		tst_res(TFAIL, "Child must be stopped.");
> +	else
> +		tst_res(TPASS, "Child is stopped.");
> +
> +	SAFE_KILL(pid, SIGKILL);
> +
> +	SAFE_WAIT(&status);
> +}
> +
> +static void cleanup(void)
> +{
> +	for (int i = 0; i < 2; i++)
> +		if (fds[i] > 0)
> +			SAFE_CLOSE(fds[i]);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = test_pipe2,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.forks_child = 1,
> +};
> \ No newline at end of file
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
