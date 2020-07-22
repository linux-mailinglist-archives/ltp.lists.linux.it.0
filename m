Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F4095229288
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 09:51:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E11F3C28B8
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 09:51:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DBBA43C266B
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 09:51:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 21BDF600903
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 09:50:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="96735848"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jul 2020 15:51:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0CA954CE4BDF;
 Wed, 22 Jul 2020 15:51:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Jul 2020 15:51:42 +0800
To: Shwetha Subramanian <shwetha@zilogic.com>, <ltp@lists.linux.it>
References: <20200709155929.13269-1-shwetha@zilogic.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <bd802a1d-d683-c2c0-2303-b72665e0b1c3@cn.fujitsu.com>
Date: Wed, 22 Jul 2020 15:51:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709155929.13269-1-shwetha@zilogic.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0CA954CE4BDF.A1B54
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add mincore() test for pages cached by another
 process
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
Cc: vijaykumar@zilogic.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

HI!


> 
> It tests the result of mincore when memory is mapped and cached by
> another process. A file is mapped in both parent and child
> process.Then the mapped memory is accessed in the child process. The
> results of mincore are tested in the parent process.
> 
> References:#460
> 
> Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
> Reviewed-by:Vijay Kumar B. <vijaykumar@zilogic.com>
> ---
>   runtest/syscalls                              |   1 +
>   testcases/kernel/syscalls/mincore/.gitignore  |   2 +
>   testcases/kernel/syscalls/mincore/mincore04.c | 119 ++++++++++++++++++
>   3 files changed, 122 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/mincore/mincore04.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 2e535abf6..cfcab6708 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -880,6 +880,7 @@ open_tree02 open_tree02
>   mincore01 mincore01
>   mincore02 mincore02
>   mincore03 mincore03
> +mincore04 mincore04
>   
>   madvise01 madvise01
>   madvise02 madvise02
> diff --git a/testcases/kernel/syscalls/mincore/.gitignore b/testcases/kernel/syscalls/mincore/.gitignore
> index 71c3e9864..470eba94e 100644
> --- a/testcases/kernel/syscalls/mincore/.gitignore
> +++ b/testcases/kernel/syscalls/mincore/.gitignore
> @@ -1,3 +1,5 @@
>   /mincore01
>   /mincore02
>   /mincore03
> +/mincore04
> +
remove the last new blank line
> diff --git a/testcases/kernel/syscalls/mincore/mincore04.c b/testcases/kernel/syscalls/mincore/mincore04.c
> new file mode 100644
> index 000000000..0fd386699
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mincore/mincore04.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
> + * Email: code@zilogic.com
> + */
> +
> +/*
> + * mincore04
> + * Test shows that pages mapped in one process(parent) and
> + * faulted in another(child) results in mincore(in parent) reporting
> + * that all mapped pages are resident.
> + */
> +
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/mman.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/wait.h>
> +#include <fcntl.h>
> +#include "tst_test.h"
> +
> +#define NUM_PAGES 3
> +
> +static int fd;
> +static int size;
> +static void *ptr;
> +
> +static void cleanup(void)
> +{
> +	SAFE_CLOSE(fd);
we should use
         if (fd > 0)
		SAFE_CLOSE(fd);
> +	SAFE_MUNLOCK(ptr, size);
I guess we should move this into child process.
> +	SAFE_MUNMAP(ptr, size);
as well as SAFE_CLOSE(fd)
> +}
> +
> +static void file_setup(void)
> +{
> +	int PS;
I prefer to use page_size variable name instead of PS.
> +
> +	PS = getpagesize();
> +	size = PS * NUM_PAGES;
> +	fd = SAFE_OPEN("FILE", O_CREAT | O_RDWR, 0600);
> +	SAFE_FTRUNCATE(fd, size);
> +}
> +
> +static void mem_sync(void)
> +{
> +	int ret;
> +
> +	/* File pages from file creation are cleared from cache. */
> +	SAFE_FSYNC(fd);
> +	ret = posix_fadvise(fd, 0, size, POSIX_FADV_DONTNEED);
> +	if (ret == -1)
> +		tst_brk(TBROK | TERRNO, "fadvise failed");
> +}
> +
> +static void setup(void)
> +{
> +	file_setup();
> +	mem_sync();
The two fuctions are simple and not reused. Can we put their code into 
setup?
> +}
> +
> +static void mmap_lock_file(void)
> +{
> +	ptr = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
> +	SAFE_MLOCK(ptr, size);
> +	TST_CHECKPOINT_WAKE(1);
For TST_CHECKPOINT_WAKE(id) api , this 'id' is a unsigned integer, so we 
can start with 0.
> +	TST_CHECKPOINT_WAIT(2);
Here we should use munlock and munmap.
> +}
> +
> +static int count_pages_in_cache(void)
> +{
> +	int locked_pages = 0;
> +	int count, ret;
> +	unsigned char vec[NUM_PAGES];
> +
> +	TST_CHECKPOINT_WAIT(1);
> +	ptr = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
> +
> +	ret = mincore(ptr, size, vec);
> +	if (ret == -1)
> +		tst_brk(TBROK | TERRNO, "mincore failed");
> +	for (count = 0; count < NUM_PAGES; count++) {
> +		if (vec[count] & 1)
> +			locked_pages++;
> +	}
> +
> +	TST_CHECKPOINT_WAKE(2);
> +	return locked_pages;
> +}
> +
> +static void test_mincore(void)
> +{
> +	int  locked_pages;
> +
> +	pid_t child_pid = SAFE_FORK();
> +
> +	if (child_pid == 0) {
> +		mmap_lock_file();
> +	} else {
> +		locked_pages = count_pages_in_cache();
> +		tst_reap_children();
> +
> +		if (locked_pages == NUM_PAGES)
> +			tst_res(TPASS, "mincore reports all pages locked by child process are resident");
> +		else
> +			tst_res(TFAIL, "mincore reports %d pages resident but %d pages locked by child process",
> +				locked_pages, NUM_PAGES);
> +	}
I prefer to use the following code stype because it seems more clear
	if (child_pid == 0) {
		/*child do*/
		exit(0);
	}
	/*partent do*/

Also, I guess we should printf how many pages locked if passed.
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.forks_child = 1,
> +	.test_all = test_mincore,
> +	.needs_checkpoints = 1,
> +};
> +
remove the last new blank line
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
