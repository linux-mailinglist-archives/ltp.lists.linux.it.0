Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FB23EE28
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 15:26:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 582EE3C320D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 15:26:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 149F23C260F
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 15:26:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EC07E600197
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 15:26:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06D5FAD3C;
 Fri,  7 Aug 2020 13:26:58 +0000 (UTC)
Date: Fri, 7 Aug 2020 15:27:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200807132700.GB9851@yuki.lan>
References: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
 <c1ca12b5df0510279a8b2f0a93106b1ca153c4a7.1596008484.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1ca12b5df0510279a8b2f0a93106b1ca153c4a7.1596008484.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V8 5/5] syscalls/semtimedop: Add support for
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
> +	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},

I'm pretty sure semop will never be vDSO :-).

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
> +		struct sembuf *sops, size_t nsops, struct tst_ts *timeout)
> +{
> +	if (tv->semop)
> +		return tv->semop(semid, sops, nsops);
> +
> +	return tv->semtimedop(semid, sops, nsops, tst_ts_get(timeout));
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
> index 19607ee6d653..c3443da58af4 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop01.c
> +++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
> @@ -12,6 +12,7 @@
>  #include "tst_test.h"
>  #include "libnewipc.h"
>  #include "lapi/semun.h"
> +#include "semop.h"
>  
>  #define NSEMS	4		/* the number of primitive semaphores to test */
>  
> @@ -23,11 +24,17 @@ static struct sembuf sops[PSEMS];
>  
>  static void run(void)
>  {
> +	struct test_variants *tv = &variants[tst_variant];
>  	union semun arr = { .val = 0 };
> +	struct tst_ts timeout;
>  	int fail = 0;
>  	int i;
>  
> -	TEST(semop(sem_id, sops, NSEMS));
> +	timeout.type = tv->type;
> +	tst_ts_set_sec(&timeout, 1);
> +	tst_ts_set_nsec(&timeout, 10000);

Can't we just set the timeout once in the test setup?


Other than these we really lack semtimedop testcases that really utilize
the timeout.

We need at least:

* Tests with NULL timeout

* A test that we get EAGAIN if semtimedop() timeouted either with:
  - semop == 0 and non-zero semaphore
  - semop < 0 and semaphore less than abs value of semop

* An EFAULT test for semtimedop() with bad address for timeout

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
