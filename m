Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABE3F7766
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 16:09:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B20E3C1814
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 16:09:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 373473C0794
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 16:09:33 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A1BDB201355
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 16:09:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6405ACCA;
 Mon, 11 Nov 2019 15:09:30 +0000 (UTC)
Date: Mon, 11 Nov 2019 16:09:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191111150928.GA16894@rei.lan>
References: <18ef4352ad8e03719e5bd470825d912569813aa4.1573476808.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18ef4352ad8e03719e5bd470825d912569813aa4.1573476808.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_cmp_requeue01: fix test expectations
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
> 1. Keeping same uaddr1 value across requeue leads to a side-effect.
> If there is a signal or spurious wakeup, futex_wait() operation can
> be restarted (by kernel) with same input parameters. Which means that
> process requeued for uaddr2, goes back to queueing for uaddr1. Such
> use case is currently not valid as it is expected that uaddr1 value
> changes, so that any late waiter can notice it and goes back with
> -EWOULDBLOCK (-EAGAIN).
> 
> 2. Test doesn't expect possibility of spurious wakeups.
> 
> 3. Test is expecting to get exact values of woken/requeued processes.
> Man page wording like "at most" or "maximum of" does not guarantee
> exact numbers.
> 
> Change futex value before requeue, so child processes can observe
> spurious wakeups.
> 
> Change child process, such that it always sleeps, to guarantee that
> TST_PROCESS_STATE_WAIT() will always succeed finding sleeping process.
> 
> Change default timeout to 5 seconds. Spawning 1000 process on slower
> systems was getting close to 1 second. This doesn't affect runtime in
> PASS-ing case.
> 
> Change checks such that they reflect wording in man page, and don't
> test for absolute values (see comments in code). One exception is
> that we assume futex_wake(tc->num_waiters) will always wake up all
> remaining processes.

Sounds good, a few comments below.

> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../kernel/syscalls/futex/futex_cmp_requeue01.c    | 82 +++++++++++++++++-----
>  1 file changed, 64 insertions(+), 18 deletions(-)
> 
> @Cyril: I'm still testing this, but sending early to see if you'd be
>         OK with this approach.
> 
> diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> index f5264c2ba26f..2bd228a11437 100644
> --- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> +++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
> @@ -20,6 +20,7 @@
>  #include "futextest.h"
>  
>  static futex_t *futexes;
> +static int *spurious, *test_done;

Shouldn't these be volatile? Or does the tst_atomic_load() guarantee
that compiler knows that it could be changed from a different process?

>  static struct tcase {
>  	int num_waiters;
> @@ -37,14 +38,28 @@ static struct tcase {
>  
>  static void do_child(void)
>  {
> -	struct timespec usec = tst_ms_to_timespec(2000);
> +	int max_sleep_ms = 5000, slept_for_ms = 0;

We do have a tst_multiply_timeout() in the test library now, shouldn't
we use it for the max_sleep_ms here as well?

Also if we do that it would make sense to keep the timeout in global and
initialize it in the parent, that would save us some runtime.

> +	struct timespec usec = tst_ms_to_timespec(max_sleep_ms);
>  	int pid = getpid();
> +	int ret = 0;
> +
> +	if (futex_wait(&futexes[0], futexes[0], &usec, 0) == -1) {
> +		if (errno == EAGAIN) {
> +			/* spurious wakeup or signal */
> +			tst_atomic_inc(spurious);
> +		} else {
> +			tst_res(TFAIL | TERRNO, "process %d wasn't woken up", pid);
> +			ret = 1;
> +		}
> +	}
>  
> -	if (!futex_wait(&futexes[0], futexes[0], &usec, 0))
> -		exit(0);
> +	/* make sure TST_PROCESS_STATE_WAIT() can always succeed */
> +	while (!tst_atomic_load(test_done) && (slept_for_ms < max_sleep_ms)) {
> +		usleep(50000);
> +		slept_for_ms += 50;
> +	}
>  
> -	tst_res(TINFO | TERRNO, "process %d wasn't woken up", pid);
> -	exit(1);
> +	exit(ret);
>  }
>  
>  static void verify_futex_cmp_requeue(unsigned int n)
> @@ -55,6 +70,8 @@ static void verify_futex_cmp_requeue(unsigned int n)
>  	int pid[tc->num_waiters];
>  	int exp_ret = tc->set_wakes + tc->set_requeues;
>  
> +	tst_atomic_store(0, spurious);
> +	tst_atomic_store(0, test_done);
>  	for (i = 0; i < tc->num_waiters; i++) {
>  		pid[i] = SAFE_FORK();
>  		if (!pid[i])
> @@ -64,46 +81,69 @@ static void verify_futex_cmp_requeue(unsigned int n)
>  	for (i = 0; i < tc->num_waiters; i++)
>  		TST_PROCESS_STATE_WAIT(pid[i], 'S');
>  
> +	tst_res(TINFO, "Test %d: waiters: %d, wakes: %d, requeues: %d",
> +		n, tc->num_waiters, tc->set_wakes, tc->set_requeues);
> +
> +	/*
> +	 * change futex value, so any spurious wakeups or signals after
> +	 * this point get bounced back to userspace.
> +	 */
> +	futexes[0]++;
> +	futexes[1]++;
> +
> +	/*
> +	 * Wakes up a maximum of tc->set_wakes waiters. tc->set_requeues
> +	 * specifies an upper limit on the number of waiters that are requeued.
> +	 * Returns the total number of waiters that were woken up or requeued.
> +	 */
>  	TEST(futex_cmp_requeue(&futexes[0], futexes[0], &futexes[1],
>  	     tc->set_wakes, tc->set_requeues, 0));
> -	if (TST_RET != exp_ret) {
> -		tst_res(TFAIL, "futex_cmp_requeue() returned %ld, expected %d",
> +
> +	/* Fail if more than requested wakes + requeues were returned */
> +	if (TST_RET > exp_ret) {
> +		tst_res(TFAIL, "futex_cmp_requeue() returned %ld, expected <= %d",
>  			TST_RET, exp_ret);
> +	} else {
> +		tst_res(TINFO, "futex_cmp_requeue() returned %ld", TST_RET);
>  	}
>  
>  	num_requeues = futex_wake(&futexes[1], tc->num_waiters, 0);
>  	num_waits = futex_wake(&futexes[0], tc->num_waiters, 0);
>  
>  	for (i = 0; i < tc->num_waiters; i++) {
> +		tst_atomic_store(1, test_done);

What's the point of storing the value in the loop, shouldn't it suffice
to do it once before the loop?

>  		SAFE_WAITPID(pid[i], &status, 0);
>  		if (WIFEXITED(status) && !WEXITSTATUS(status))
>  			num_total++;
>  	}
>  
> +	tst_res(TINFO, "children woken, futex0: %d, futex1: %d, "
> +		"spurious wakeups: %d",
> +		num_waits, num_requeues, tst_atomic_load(spurious));

I guess that we do not need atomic access once all the children are
waited for.

> +	/* Fail if any waiter timed out */
>  	if (num_total != tc->num_waiters) {
>  		tst_res(TFAIL, "%d waiters were not woken up normally",
>  			tc->num_waiters - num_total);
>  		return;
>  	}
>  
> -	if (num_requeues != tc->set_requeues) {
> +	/* Fail if more than upper limit of tc->set_requeues were found at futex1 */
> +	if (num_requeues > tc->set_requeues) {
>  		tst_res(TFAIL,
> -			"futex_cmp_requeue() requeues %d waiters, expected %d",
> +			"requeued %d waiters, expected <= %d",
>  			num_requeues, tc->set_requeues);
>  		return;
>  	}
>  
> -	if (tc->num_waiters - num_requeues - num_waits != tc->set_wakes) {
> -		tst_res(TFAIL,
> -			"futex_cmp_requeue() woke up %d waiters, expected %d",
> -			tc->num_waiters - num_requeues - num_waits,
> -			tc->set_wakes);
> +	/* Fail if more than tc->set_wakes were woken up by requeue */
> +	exp_ret = tc->num_waiters - TST_RET - tst_atomic_load(spurious);

Here as well, do we really need the atomic load?

> +	if (num_waits < exp_ret) {
> +		tst_res(TFAIL, "woken up %d on futex0, expected >= %d", num_waits, exp_ret);
>  		return;
>  	}
>  
> -	tst_res(TPASS,
> -		"futex_cmp_requeue() woke up %d waiters and requeued %d waiters",
> -		tc->set_wakes, tc->set_requeues);
> +	tst_res(TPASS, "futex_cmp_requeue()");
>  }
>  
>  static void setup(void)
> @@ -112,13 +152,19 @@ static void setup(void)
>  			    MAP_ANONYMOUS | MAP_SHARED, -1, 0);
>  
>  	futexes[0] = FUTEX_INITIALIZER;
> -	futexes[1] = FUTEX_INITIALIZER + 1;
> +	futexes[1] = FUTEX_INITIALIZER + 1000;
> +
> +	spurious = SAFE_MMAP(NULL, sizeof(int) * 2, PROT_READ | PROT_WRITE,
> +			    MAP_ANONYMOUS | MAP_SHARED, -1, 0);
> +	test_done = spurious + 1;
>  }
>  
>  static void cleanup(void)
>  {
>  	if (futexes)
>  		SAFE_MUNMAP((void *)futexes, sizeof(futex_t) * 2);
> +	if (spurious)
> +		SAFE_MUNMAP((void *)spurious, sizeof(int) * 2);

Can't we just use a single page? It should be large enough for both
futexes and counters...

I guess that we can as well define a structure with all the parameters
so that we do only a single mmap() later on.

>  }
>  
>  static struct tst_test test = {
> -- 
> 1.8.3.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
