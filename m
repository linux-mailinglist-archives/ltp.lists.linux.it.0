Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DA25AAA6
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 13:58:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 607AC3C5505
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 13:58:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AD4BD3C2218
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 13:58:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E113B6008DB
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 13:58:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 415C5AD88;
 Wed,  2 Sep 2020 11:58:27 +0000 (UTC)
Date: Wed, 2 Sep 2020 13:58:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200902115853.GA16448@yuki.lan>
References: <551441b4bce2d9dfd1567ffcd536f50f14a049d0.1599041148.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <551441b4bce2d9dfd1567ffcd536f50f14a049d0.1599041148.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V10 1/2] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V10:
> - Update comment in semop02.c.
> - Let callers call tst_ts_get() on the timeout.
> 
>  testcases/kernel/syscalls/ipc/semop/semop.h   | 55 +++++++++++++++++++
>  testcases/kernel/syscalls/ipc/semop/semop01.c | 26 ++++++++-
>  testcases/kernel/syscalls/ipc/semop/semop02.c | 44 +++++++++++----
>  testcases/kernel/syscalls/ipc/semop/semop03.c | 15 ++++-
>  4 files changed, 125 insertions(+), 15 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h
> 
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
> new file mode 100644
> index 000000000000..1fac31818108
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/semop/semop.h
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#ifndef SEMOP_VAR__
> +#define SEMOP_VAR__
> +
> +#include <sys/sem.h>
> +#include "tst_timer.h"
> +
> +static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
> +		void *timeout)
> +{
> +	return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
> +}
> +
> +static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
> +					size_t nsops, void *timeout)
> +{
> +	return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
> +}
> +
> +struct test_variants {
> +	int (*semop)(int semid, struct sembuf *sops, size_t nsops);
> +	int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
> +	enum tst_ts_type type;
> +	char *desc;
> +} variants[] = {
> +	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: syscall"},
> +
> +#if (__NR_semtimedop != __LTP__NR_INVALID_SYSCALL)
> +	{ .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
> +#endif
> +
> +#if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
> +	{ .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
> +#endif
> +};
> +
> +static inline int call_semop(struct test_variants *tv, int semid,
> +		struct sembuf *sops, size_t nsops, void *timeout)
> +{
> +	if (tv->semop)
> +		return tv->semop(semid, sops, nsops);
> +
> +	return tv->semtimedop(semid, sops, nsops, timeout);
> +}
> +
> +static inline void semop_supported_by_kernel(struct test_variants *tv)
> +{
> +       /* Check if the syscall is implemented on the platform */
> +       TEST(call_semop(tv, 0, NULL, 0, NULL));
> +       if (TST_RET == -1 && TST_ERR == ENOSYS)
> +               tst_brk(TCONF, "Test not supported on kernel/platform");
> +}
> +
> +#endif /* SEMOP_VAR__ */
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
> index 2daf6bbc5c4e..0524a8098e23 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop01.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
> @@ -12,6 +12,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>  
>  #define NSEMS 4
>  
> @@ -21,14 +22,23 @@ static key_t semkey;
>  static unsigned short int sarr[PSEMS];
>  static union semun get_arr = {.array = sarr};
>  static struct sembuf sops[PSEMS];
> +static struct tst_ts timeout;
>  
> -static void run(void)
> +static struct test_case_t {
> +	struct tst_ts *to;
> +} tc[] = {
> +	{NULL},
> +	{&timeout}
> +};
> +
> +static void run(unsigned int n)
>  {
> +	struct test_variants *tv = &variants[tst_variant];
>  	union semun arr = { .val = 0 };
>  	int fail = 0;
>  	int i;
>  
> -	TEST(semop(sem_id, sops, NSEMS));
> +	TEST(call_semop(tv, sem_id, sops, NSEMS, tst_ts_get(tc[n].to)));
>  	if (TST_RET == -1) {
>  		tst_res(TFAIL | TTERRNO, "semop() failed");
>  		return;
> @@ -56,8 +66,16 @@ static void run(void)
>  
>  static void setup(void)
>  {
> +	struct test_variants *tv = &variants[tst_variant];
>  	int i;
>  
> +	tst_res(TINFO, "Testing variant: %s", tv->desc);
> +	semop_supported_by_kernel(tv);
> +
> +	timeout.type = tv->type;
> +	tst_ts_set_sec(&timeout, 1);
> +	tst_ts_set_nsec(&timeout, 10000);
> +
>  	semkey = GETIPCKEY();
>  
>  	sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
> @@ -80,7 +98,9 @@ static void cleanup(void)
>  }
>  
>  static struct tst_test test = {
> -	.test_all = run,
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(tc),
> +	.test_variants = ARRAY_SIZE(variants),
>  	.setup = setup,
>  	.cleanup = cleanup,
>  	.needs_tmpdir = 1,
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
> index 0dff8e537719..22fdb5cbef4c 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop02.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
> @@ -10,6 +10,8 @@
>   * EFBIG   - sem_num > number of semaphores in a set
>   * EAGAIN  - semop = 0 for non-zero semaphore and IPC_NOWAIT passed in flags
>   * EAGAIN  - semop = -1 for zero semaphore and IPC_NOWAIT passed in flags
> + * EAGAIN  - semop = 0 and timeout happens
> + * EAGAIN  - semop = -1 and timeout happens
>   *
>   * Copyright (c) International Business Machines  Corp., 2001
>   *	03/2001 - Written by Wayne Boyer
> @@ -23,17 +25,20 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>  
>  static int valid_sem_id = -1;
>  static int noperm_sem_id = -1;
>  static int bad_sem_id = -1;
>  static short sem_op_max, sem_op_1 = 1, sem_op_negative = -1, sem_op_zero = 0;
>  static struct sembuf *faulty_buf;
> +static struct tst_ts timeout;
>  
>  #define NSOPS	1
>  #define	BIGOPS	1024
>  
>  static struct test_case_t {
> +	int all_variants;

Something as needs_timeout, or semtimedop_only would be a bit more
descriptive.

>  	int *semid;
>  	struct sembuf **buf;
>  	short *sem_op;
> @@ -44,25 +49,35 @@ static struct test_case_t {
>  	int arr_val;
>  	int error;
>  } tc[] = {
> -	{&valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
> -	{&noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
> -	{&valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
> -	{&valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
> -	{&bad_sem_id,   NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
> -	{&valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
> -	{&valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
> -	{&valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
> -	{&valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
> -	{&valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN}
> +	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
> +	{1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
> +	{1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
> +	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
> +	{1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
> +	{1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
> +	{1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
> +	{1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
> +	{1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
> +	{1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},
> +	{0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, EAGAIN},
> +	{0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, EAGAIN},
>  };
>  
>  static void setup(void)
>  {
> +	struct test_variants *tv = &variants[tst_variant];
>  	struct passwd *ltpuser;
>  	key_t semkey;
>  	union semun arr;
>  	struct seminfo ipc_buf;
>  
> +	tst_res(TINFO, "Testing variant: %s", tv->desc);
> +	semop_supported_by_kernel(tv);
> +
> +	timeout.type = tv->type;
> +	tst_ts_set_sec(&timeout, 1);
> +	tst_ts_set_nsec(&timeout, 10000);

One second is way too much, can we please make it just 10000ns ?

LTP runs on many automated labs, adding a useless second to a test adds
up to years of wasted runtime.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
