Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C347120F1FE
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 11:55:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 540ED3C2AC6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 11:55:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B06E13C2ABB
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 11:55:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3A1CF600058
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 11:54:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AD44AFBB;
 Tue, 30 Jun 2020 09:55:34 +0000 (UTC)
Date: Tue, 30 Jun 2020 11:55:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: pravin <pravinraghul@zilogic.com>
Message-ID: <20200630095554.GB2684@yuki.lan>
References: <20200630054405.6115-1-pravinraghul@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630054405.6115-1-pravinraghul@zilogic.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add a test case for mmap() MAP_GROWSDOWN flag
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
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> We assign the memory region allocated using MAP_GROWSDOWN to a thread,
> as a stack, to test the effect of MAP_GROWSDOWN. This is because the
> kernel only grows the memory region when the stack pointer, is within
> guard page, when the guard page is touched.
> 
>   1. Map an anyonymous memory region of size X, and unmap it.
>   2. Split the unmapped memory region into two.
>   3. The lower memory region is left unmapped.
>   4. The higher memory region is mapped for use as stack, using MAP_FIXED | MAP_GROWSDOWN.
>   5. The higher memory region is provided as stack to a thread, where
>      a recursive function is invoked.
>   6. The stack grows beyond the allocated region, into the lower memory area.
>   7. If this results in the memory region being extended, into the
>      unmapped region, the test is considered to have passed.
> 
> Resolves #300
> Signed-off-by: Pravin Raghul S. <pravinraghul@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>
> 
> ---
>  runtest/syscalls                          |   1 +
>  testcases/kernel/syscalls/mmap/.gitignore |   1 +
>  testcases/kernel/syscalls/mmap/Makefile   |   7 ++
>  testcases/kernel/syscalls/mmap/mmap18.c   | 146 ++++++++++++++++++++++
>  4 files changed, 155 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/mmap/mmap18.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index b4d523319..d8c9dbe92 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -747,6 +747,7 @@ mmap14 mmap14
>  mmap15 mmap15
>  mmap16 mmap16
>  mmap17 mmap17
> +mmap18 mmap18
>  
>  modify_ldt01 modify_ldt01
>  modify_ldt02 modify_ldt02
> diff --git a/testcases/kernel/syscalls/mmap/.gitignore b/testcases/kernel/syscalls/mmap/.gitignore
> index c5c083d4b..4fd90ab5f 100644
> --- a/testcases/kernel/syscalls/mmap/.gitignore
> +++ b/testcases/kernel/syscalls/mmap/.gitignore
> @@ -16,3 +16,4 @@
>  /mmap15
>  /mmap16
>  /mmap17
> +/mmap18
> diff --git a/testcases/kernel/syscalls/mmap/Makefile b/testcases/kernel/syscalls/mmap/Makefile
> index 743ca36e7..bdc49e4be 100644
> --- a/testcases/kernel/syscalls/mmap/Makefile
> +++ b/testcases/kernel/syscalls/mmap/Makefile
> @@ -8,3 +8,10 @@ include $(top_srcdir)/include/mk/testcases.mk
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
>  
>  LDLIBS 			+= -lpthread
> +#
> +# We use recursive calls to to grow the stack, to test the
> +# MAP_GROSWDOWN flag. But tail call optimization by the compiler
> +# can prevent the recusive call and stack growth. Disable tail
> +# call optmization using -fno-optimize-sibling-calls
> +#
> +mmap18: CFLAGS          += -fno-optimize-sibling-calls
> diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
> new file mode 100644
> index 000000000..01a456bfc
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mmap/mmap18.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
> + * Email: code@zilogic.com
> + */
> +
> +/*
> + * Test mmap() MAP_GROWSDOWN flag
> + *
> + * We assign the memory region allocated using MAP_GROWSDOWN to a thread,
> + * as a stack, to test the effect of MAP_GROWSDOWN. This is because the
> + * kernel only grows the memory region when the stack pointer, is within
> + * guard page, when the guard page is touched.
> + *
> + * 1. Map an anyonymous memory region of size X, and unmap it.
> + * 2. Split the unmapped memory region into two.
> + * 3. The lower memory region is left unmapped.
> + * 4. The higher memory region is mapped for use as stack, using 
                                                                   ^
						Trailing whitespace.

You can use the checkpatch.pl from Linux kernel git repostory to check
for minor mistakes like these before sending a patch.

> + *    MAP_FIXED | MAP_GROWSDOWN.
> + * 5. The higher memory region is provided as stack to a thread, where
> + *    a recursive function is invoked.
> + * 6. The stack grows beyond the allocated region, into the lower memory area.
> + * 7. If this results in the memory region being extended, into the
> + *    unmapped region, the test is considered to have passed.
> + */
> +
> +#include <unistd.h>
> +#include <sys/wait.h>
> +#include <pthread.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_pthread.h"
> +
> +#define UNITS(x) ((x) * PTHREAD_STACK_MIN)
> +
> +static void *stack = NULL;

Global variables are zeroed at the program start, there is no point to
set them to NULL like that.

> +bool check_stackgrow_up(int *local_var_1)

Missing static.

> +{
> +	int local_var_2;
> +
> +	if (local_var_1 < &local_var_2)
> +		return false;
> +	else
> +		return true;

Just do return !(local_var_1 < &local_var_2);

> +}
> +
> +void setup(void)

Here as well.

> +{
> +	int local_var_1;
> +	bool stackgrow_up;
> +
> +	stackgrow_up = check_stackgrow_up(&local_var_1);
> +	if (stackgrow_up)

Why not just if (stackgrow_up(&local_var_1)) here instead?

> +		tst_brk(TCONF, "Test can't be performed with stack grows up architecture");
> +}
> +
> +void cleanup(void)

And here as well.

> +{
> +	if (stack != NULL)

Just if (stack)

> +		SAFE_MUNMAP(stack, UNITS(8));
> +}
> +
> +void *find_free_range(size_t size)

Here as well.

> +{
> +	void *mem;
> +
> +	mem = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE,
> +			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	SAFE_MUNMAP(mem, size);
> +
> +	return mem;
> +}
> +
> +void split_unmapped_plus_stack(void *start, size_t size, void **stack)

Here as well.

> +{
> +	/*
> +         * +---------------------+----------------------+
> +         * + unmapped            | stack                |
> +         * +---------------------+----------------------+
> +         */
> +	*stack = SAFE_MMAP(start, size, PROT_READ | PROT_WRITE,
> +			   MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,
> +			   -1, 0);

Why can't this function return void * instead?


Also I do not get what the ascii art means here. We just mmap(0 the
whole thing here with MAP_GROWSDOWN what do we split?

Also why can't we just use multiple of page_size instead of some pthread
magic constant? Why don't we just allocate 10 pages then touch them in
order?

> +}
> +
> +static void *check_depth_recursive(void *limit)
> +{
> +	if ((off_t) &limit < (off_t) limit)
> +		return NULL;
> +
> +	return check_depth_recursive(limit);
> +}
> +
> +void grow_stack(void *stack, size_t size, void *limit)
> +{
> +	pthread_t test_thread;
> +	pthread_attr_t attr;
> +	int ret;
> +
> +	ret = pthread_attr_init(&attr);
> +	if (ret != 0)
> +		tst_brk(TBROK, "pthread_attr_init failed during setup");
> +
> +	ret = pthread_attr_setstack(&attr, stack, size);
> +	if (ret != 0)
> +		tst_brk(TBROK, "pthread_attr_setstack failed during setup");
> +
> +	SAFE_PTHREAD_CREATE(&test_thread, &attr, check_depth_recursive, limit);
> +	SAFE_PTHREAD_JOIN(test_thread, NULL);


Do we really have to use pthreads here? Can't we just touch the guard
page by writing to it? I guess that we can just do for () loop over the
mapping with something as:

	for (i = 0; i < size; i++)
		((char*)stack)[i] = 'a';

> +	exit(0);
> +}
> +
> +static void run_test(void)
> +{
> +	void *mem;
> +	pid_t child_pid;
> +	int wstatus;
> +
> +	mem = find_free_range(UNITS(16));
> +	split_unmapped_plus_stack(mem, UNITS(16), &stack);
> +
> +	child_pid = SAFE_FORK();
> +	if (child_pid == 0) {

Use just if (!child_pid)

> +		grow_stack(stack, UNITS(8), mem + UNITS(1));
> +	} else {

The grow_stack() function calls exit(0) there is no point in having the
else branch here.

> +		SAFE_WAIT(&wstatus);
> +		if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)
> +			tst_res(TPASS, "stack grows in unmapped region");
> +		else
> +			tst_res(TFAIL, "child exited with %d", wstatus);
> +	}

No test result propagation, the child should report the test result
using the tst_res() itself.

> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run_test,
> +	.forks_child = 1,
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
