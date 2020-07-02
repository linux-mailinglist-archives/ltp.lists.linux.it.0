Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E7421259B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 16:08:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DAA93C1E06
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jul 2020 16:08:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 56C853C074B
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 16:08:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 595DE601CDB
 for <ltp@lists.linux.it>; Thu,  2 Jul 2020 16:08:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB2F2ADAA;
 Thu,  2 Jul 2020 14:08:29 +0000 (UTC)
Date: Thu, 2 Jul 2020 16:08:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: pravinraghul <pravinraghul@zilogic.com>
Message-ID: <20200702140849.GE9101@yuki.lan>
References: <20200630054405.6115-1-pravinraghul@zilogic.com>
 <20200630095554.GB2684@yuki.lan>
 <50c6d8d9-7a79-ab71-1e88-ab693403b25e@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50c6d8d9-7a79-ab71-1e88-ab693403b25e@zilogic.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi!
I've added ltp mailing list back to CC, please always keep it in the CC
when sending patches/discussing testcases.

> >> +static void *check_depth_recursive(void *limit)
> >> +{
> >> +	if ((off_t) &limit < (off_t) limit)
> >> +		return NULL;
> >> +
> >> +	return check_depth_recursive(limit);
> >> +}
> >> +
> >> +void grow_stack(void *stack, size_t size, void *limit)
> >> +{
> >> +	pthread_t test_thread;
> >> +	pthread_attr_t attr;
> >> +	int ret;
> >> +
> >> +	ret = pthread_attr_init(&attr);
> >> +	if (ret != 0)
> >> +		tst_brk(TBROK, "pthread_attr_init failed during setup");
> >> +
> >> +	ret = pthread_attr_setstack(&attr, stack, size);
> >> +	if (ret != 0)
> >> +		tst_brk(TBROK, "pthread_attr_setstack failed during setup");
> >> +
> >> +	SAFE_PTHREAD_CREATE(&test_thread, &attr, check_depth_recursive,
> >> limit);
> >> +	SAFE_PTHREAD_JOIN(test_thread, NULL);
> > Do we really have to use pthreads here? Can't we just touch the guard
> > page by writing to it? I guess that we can just do for () loop over the
> > mapping with something as:
> >
> > 	for (i = 0; i < size; i++)
> > 		((char*)stack)[i] = 'a';
> >
> I have attached a code below for your reference regarding the method that
> you have suggested. Please have a look.

Can you please send v2 patch instead?

> Here we are writing the pages with char 'a' where pages, doesn't
> grow in the unmapped region, thereby doesn't satify the mmap flag
> MAP_GROWSDOWN.
> MAP_GROWSDOWN doesn't work when guard page is touched by the regular
> pointer.we use pthread to grow stacks via stack pointer.

Looks like you are right, we have to move the RSP in order to reserve
stack space before we touch it to cause page fault. So I guess that
setting thread stack may be easiest option.

Also for the tail call, I guess that it would be easier to setup an
array on the stack then fill it with a for loop or something like that.

> >> +		SAFE_WAIT(&wstatus);
> >> +		if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)
> >> +			tst_res(TPASS, "stack grows in unmapped region");
> >> +		else
> >> +			tst_res(TFAIL, "child exited with %d", wstatus);
> >> +	}
> > No test result propagation, the child should report the test result
> > using the tst_res() itself.
> >
> we are the testing the stack growth in unmapped region with child process,
> so test result depends on the child status that's why we are checking
> the exit status. Handling the child report accordingly If the stack grows
> properly in unmapped region the test is considered to be passed, otherwise
> test failed with the return status.
> 
> Please let me know your thoughts..!
> Will update a new patch with changes made regarding other mistakes, after
> yours thoughts.

The results are propagated from the child process automatically, all we
need to do here is to check that the child haven't crashed, i.e. that it
exitted with 0.

We usually do:

	if (!WIFEXITTED(status) || WEXITSTATUS(status) != 0)
		tst_brk(TBROK, "Child %s", tst_strstatus(status));

> /*
>  * Algorithm:
>  * 1) In this test case we allocated 16 pages.
>  * 2) Then we split the stack space into two and mapped the upper region.
>  * 3) The lower region left unmapped.
>  * 4) Now trying to write the pages with character 'a'.
>  * 5) Writing the page on unmapped region as well.
>  *
>  * The result of the output will show the mapped and unmapped region. 
>  *
>  * Here we are writing the pages with char 'a' where pages, doesn't 
>  * grow in the unmapped region, thereby doesn't satify the mmap flag
>  * MAP_GROWSDOWN.
>  *
>  */
> 
> #include <unistd.h>
> #include <sys/wait.h>
> #include <pthread.h>
> #include <sys/mman.h>
> #include <sys/wait.h>
> #include <unistd.h>
> #include <stdlib.h>
> #include <stdbool.h>
> 
> #include "tst_test.h"
> 
> #define PAGESIZE 4096
> #define UNITS(x) ((x) * PAGESIZE)
> 
> static void *stack;
> 
> static bool check_stackgrow_up(int *local_var_1)
> {
> 	int local_var_2;
> 
> 	return !(local_var_1 < &local_var_2);
> }
> 
> static void setup(void)
> {
> 	int local_var_1;
> 
> 	if (check_stackgrow_up(&local_var_1))
> 		tst_brk(TCONF, "Test can't be performed with stack grows up architecture");
> }
> 
> static void cleanup(void)
> {
> 	if (stack)
> 		SAFE_MUNMAP(stack, UNITS(8));
> }
> 
> static void *find_free_range(size_t size)
> {
> 	void *mem;
> 
> 	mem = SAFE_MMAP(NULL, size, PROT_READ | PROT_WRITE,
> 			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 	SAFE_MUNMAP(mem, size);
> 
> 	return mem;
> }
> 
> static void split_unmapped_plus_stack(void *start, size_t size)
> {
> 	/* start           start + size
> 	 * +---------------------+----------------------+
> 	 * + unmapped            | mapped               |
> 	 * +---------------------+----------------------+
> 	 *                       stack
> 	 */
> 	stack = SAFE_MMAP(start + size, size, PROT_READ | PROT_WRITE,
> 			  MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,
> 			  -1, 0);
> 	tst_res(TINFO, "mapped = %p", stack + UNITS(8));
> 	tst_res(TINFO, "mapped = %p", stack);
> }
> 
> static void grow_stack(void *start, size_t size)
> {
>   volatile char *ptr1 = start;
> 	
> 	for (int i = 0; i < size; i++) {
> 		ptr1 -= UNITS(1);
> 		*ptr1 = 'a';
> 		tst_res(TINFO, "addr   = %p", ptr1);
> 	}
> 
> 	exit(0);
> }
> 
> static void run_test(void)
> {
> 	void *mem;
> 	pid_t child_pid;
> 	int wstatus;
> 
> 	mem = find_free_range(UNITS(16));
> 	tst_res(TINFO, "unmap = %p", mem + UNITS(16));
> 	tst_res(TINFO, "unmap = %p", mem);
> 	split_unmapped_plus_stack(mem, UNITS(8));
> 
> 	child_pid = SAFE_FORK();
> 	if (!child_pid)
> 		grow_stack(stack + UNITS(8), UNITS(16) / UNITS(1));
> 
> 	SAFE_WAIT(child_pid, &wstatus, 0);
> 	if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)
> 		tst_res(TPASS, "stack grows in unmapped region");
> 	else
> 		tst_res(TFAIL, "child exited with %d", wstatus);
> }
> 
> static struct tst_test test = {
> 	.setup = setup,
> 	.cleanup = cleanup,
> 	.test_all = run_test,
> 	.forks_child = 1,
> };


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
