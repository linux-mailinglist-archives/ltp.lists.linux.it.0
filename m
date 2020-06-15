Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC31F989A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 15:31:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EECF3C6017
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 15:31:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 578263C00A6
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 15:31:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9D8B6232F1B
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 15:31:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B671DADE5;
 Mon, 15 Jun 2020 13:31:15 +0000 (UTC)
Date: Mon, 15 Jun 2020 15:31:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200615133125.GC25279@yuki.lan>
References: <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
 <7d7363384b5719fa48a5a5ba71b0aa581ebc91bd.1590131635.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d7363384b5719fa48a5a5ba71b0aa581ebc91bd.1590131635.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 3/5] syscalls: semctl: Add new test to verify
 the _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2: Remove stale file.
> 
>  configure.ac                                  |   1 +
>  include/sembuf.h                              | 234 ++++++++++++++++++
>  runtest/syscalls                              |   1 +
>  runtest/syscalls-ipc                          |   1 +
>  .../kernel/syscalls/ipc/semctl/.gitignore     |   1 +
>  testcases/kernel/syscalls/ipc/semctl/Makefile |   5 +-
>  .../kernel/syscalls/ipc/semctl/semctl08.c     |  52 ++++
>  7 files changed, 294 insertions(+), 1 deletion(-)
>  create mode 100644 include/sembuf.h
>  create mode 100644 testcases/kernel/syscalls/ipc/semctl/semctl08.c
> 
> diff --git a/configure.ac b/configure.ac
> index eaf33dd60350..c513fdf440c2 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -151,6 +151,7 @@ AC_CHECK_TYPES([struct fs_quota_statv],,,[#include <xfs/xqm.h>])
>  AC_CHECK_TYPES([struct if_nextdqblk],,,[#include <linux/quota.h>])
>  AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
>  AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
> +AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
>  
>  AC_CHECK_TYPES([struct mmsghdr],,,[
>  #define _GNU_SOURCE
> diff --git a/include/sembuf.h b/include/sembuf.h
> new file mode 100644
> index 000000000000..00263abca995
> --- /dev/null
> +++ b/include/sembuf.h
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Linaro Limited. All rights reserved.
> + * Author: Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +#ifndef IPC_SEMBUF_H
> +#define IPC_SEMBUF_H
> +
> +#include <linux/posix_types.h>
> +#include <sys/sem.h>
> +#include "tst_timer.h"
> +#include "ipcbuf.h"
> +
> +#ifndef HAVE_SEMID64_DS
> +
> +#if defined(__mips__)
> +#define HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for the MIPS architecture.
> + * Note extra padding because this structure is passed back and forth
> + * between kernel and user space.
> + *
> + * Pad space is left for 2 miscellaneous 64-bit values on mips64,
> + * but used for the upper 32 bit of the time values on mips32.
> + */
> +#if defined(__arch64__)
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> +	long		 sem_otime;		/* last semop time */
> +	long		 sem_ctime;		/* last change time */
> +	unsigned long	sem_nsems;		/* no. of semaphores in array */
> +	unsigned long	__unused1;
> +	unsigned long	__unused2;
> +};
> +#else
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> +	unsigned long   sem_otime;		/* last semop time */
> +	unsigned long   sem_ctime;		/* last change time */
> +	unsigned long	sem_nsems;		/* no. of semaphores in array */
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_ctime_high;
> +};
> +#endif
> +#endif /* __mips__ */
> +
> +#if defined(__hppa__)
> +#define HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for parisc architecture.
> + * Note extra padding because this structure is passed back and forth
> + * between kernel and user space.
> + *
> + * Pad space is left for:
> + * - 2 miscellaneous 32-bit values
> + */
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> +#if __BITS_PER_LONG == 64
> +	long		sem_otime;		/* last semop time */
> +	long		sem_ctime;		/* last change time */
> +#else
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_otime;		/* last semop time */
> +	unsigned long	sem_ctime_high;
> +	unsigned long	sem_ctime;		/* last change time */
> +#endif
> +	unsigned long	sem_nsems;		/* no. of semaphores in array */
> +	unsigned long	__unused1;
> +	unsigned long	__unused2;
> +};
> +#endif /* __hppa__ */
> +
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +#define HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for PPC architecture.
> + * Note extra padding because this structure is passed back and forth
> + * between kernel and user space.
> + *
> + * Pad space is left for:
> + * - 2 miscellaneous 32/64-bit values
> + */
> +
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
> +#ifndef __powerpc64__
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_otime;	/* last semop time */
> +	unsigned long	sem_ctime_high;
> +	unsigned long	sem_ctime;	/* last change time */
> +#else
> +	long		sem_otime;	/* last semop time */
> +	long		sem_ctime;	/* last change time */
> +#endif
> +	unsigned long	sem_nsems;	/* no. of semaphores in array */
> +	unsigned long	__unused3;
> +	unsigned long	__unused4;
> +};
> +#endif /* defined(__powerpc__) || defined(__powerpc64__) */
> +
> +#if defined(__sparc__)
> +#define HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for sparc architecture.
> + * Note extra padding because this structure is passed back and forth
> + * between kernel and user space.
> + *
> + * Pad space is left for:
> + * - 2 miscellaneous 32-bit values
> + */
> +
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> +#if defined(__arch64__)
> +	long		sem_otime;		/* last semop time */
> +	long		sem_ctime;		/* last change time */
> +#else
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_otime;		/* last semop time */
> +	unsigned long	sem_ctime_high;
> +	unsigned long	sem_ctime;		/* last change time */
> +#endif
> +	unsigned long	sem_nsems;		/* no. of semaphores in array */
> +	unsigned long	__unused1;
> +	unsigned long	__unused2;
> +};
> +#endif /* __sparc__ */
> +
> +#if defined(__x86_64__)
> +#define HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for x86 architecture.
> + * Note extra padding because this structure is passed back and forth
> + * between kernel and user space.
> + *
> + * Pad space is left for:
> + * - 2 miscellaneous 32-bit values
> + *
> + * x86_64 and x32 incorrectly added padding here, so the structures
> + * are still incompatible with the padding on x86.
> + */
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
> +#ifdef __i386__
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +	unsigned long	sem_otime;	/* last semop time */
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_ctime;	/* last change time */
> +	unsigned long	sem_ctime_high;
> +#else
> +	__kernel_long_t sem_otime;	/* last semop time */
> +	__kernel_ulong_t __unused1;
> +	__kernel_long_t sem_ctime;	/* last change time */
> +	__kernel_ulong_t __unused2;
> +#endif
> +	__kernel_ulong_t sem_nsems;	/* no. of semaphores in array */
> +	__kernel_ulong_t __unused3;
> +	__kernel_ulong_t __unused4;
> +};
> +#endif /* defined(__x86_64__) */
> +
> +#if defined(__xtensa__)
> +#define HAVE_SEMID64_DS
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
> +#ifdef __XTENSA_EL__
> +	unsigned long	sem_otime;		/* last semop time */
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_ctime;		/* last change time */
> +	unsigned long	sem_ctime_high;
> +#else
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_otime;		/* last semop time */
> +	unsigned long	sem_ctime_high;
> +	unsigned long	sem_ctime;		/* last change time */
> +#endif
> +	unsigned long	sem_nsems;		/* no. of semaphores in array */
> +	unsigned long	__unused3;
> +	unsigned long	__unused4;
> +};
> +
> +#endif /* __xtensa__ */
> +
> +#ifndef HAVE_SEMID64_DS
> +/*
> + * The semid64_ds structure for most architectures (though it came
> + * from x86_32 originally). Note extra padding because this structure
> + * is passed back and forth between kernel and user space.
> + *
> + * semid64_ds was originally meant to be architecture specific, but
> + * everyone just ended up making identical copies without specific
> + * optimizations, so we may just as well all use the same one.
> + *
> + * 64 bit architectures use a 64-bit long time field here, while
> + * 32 bit architectures have a pair of unsigned long values.
> + *
> + * On big-endian systems, the padding is in the wrong place for
> + * historic reasons, so user space has to reconstruct a time_t
> + * value using
> + *
> + * user_semid_ds.sem_otime = kernel_semid64_ds.sem_otime +
> + *		((long long)kernel_semid64_ds.sem_otime_high << 32)
> + *
> + * Pad space is left for 2 miscellaneous 32-bit values
> + */
> +struct semid64_ds {
> +	struct ipc64_perm sem_perm;	/* permissions .. see ipc.h */
> +#if __BITS_PER_LONG == 64
> +	long		sem_otime;	/* last semop time */
> +	long		sem_ctime;	/* last change time */
> +#else
> +#define HAVE_SEMID64_DS_TIME_HIGH
> +	unsigned long	sem_otime;	/* last semop time */
> +	unsigned long	sem_otime_high;
> +	unsigned long	sem_ctime;	/* last change time */
> +	unsigned long	sem_ctime_high;
> +#endif
> +	unsigned long	sem_nsems;	/* no. of semaphores in array */
> +	unsigned long	__unused3;
> +	unsigned long	__unused4;
> +};
> +#endif /* semid64_ds */
> +
> +#endif /* HAVE_SEMID64_DS */
> +
> +#endif /* IPC_SEMBUF_H */

Can we please put the header into the lapi/ and also split this patch
so that we have one for the the fallback definition and one for the
actuall test?

> diff --git a/runtest/syscalls b/runtest/syscalls
> index edd3e8de7861..db14ba4baf9e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1156,6 +1156,7 @@ semctl04 semctl04
>  semctl05 semctl05
>  semctl06 semctl06
>  semctl07 semctl07
> +semctl08 semctl08
>  
>  semget01 semget01
>  semget02 semget02
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index 54d8622d4223..f912cb067f74 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -33,6 +33,7 @@ semctl04 semctl04
>  semctl05 semctl05
>  semctl06 semctl06
>  semctl07 semctl07
> +semctl08 semctl08
>  
>  semget01 semget01
>  semget02 semget02
> diff --git a/testcases/kernel/syscalls/ipc/semctl/.gitignore b/testcases/kernel/syscalls/ipc/semctl/.gitignore
> index b6899acf5da6..6189a04cc3c6 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/semctl/.gitignore
> @@ -5,3 +5,4 @@
>  /semctl05
>  /semctl06
>  /semctl07
> +/semctl08
> diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
> index aa211d37f8ee..150f581825c5 100644
> --- a/testcases/kernel/syscalls/ipc/semctl/Makefile
> +++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
> @@ -5,7 +5,10 @@ top_srcdir              ?= ../../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> -LDLIBS  += -lltpipc
> +semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
> +semctl08: LDLIBS += -lltpnewipc
> +
>  LDFLAGS += -L$(top_builddir)/libs/libltpipc
> +LDFLAGS += -L$(top_builddir)/libs/libltpnewipc

This does not apply anymore after my fix. This should be:

LTPLIBS = ltpipc ltpnewipc

Which would add a dependency on these libraries in the build system and
also append the LDFLAGS, then all we need to do is to add the LDLIBS.

>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
> new file mode 100644
> index 000000000000..90a88989f2d3
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Cross verify the _high fields being set to 0 by the kernel.
> + */
> +#include "lapi/semun.h"
> +#include "tst_test.h"
> +#include "libnewipc.h"
> +#include "sembuf.h"
> +
> +#ifdef HAVE_SEMID64_DS_TIME_HIGH
> +
> +static void run(void)
> +{
> +	struct semid64_ds buf_ds = {
> +		.sem_otime_high = 0x0A0A,
> +		.sem_ctime_high = 0x0A0A,
> +	};
> +	int semid;
> +	union semun arg;
> +	key_t key;
> +
> +	/* get an IPC resource key */
> +	key = GETIPCKEY();
> +
> +	semid = semget(key, 1, SEM_RA | IPC_CREAT);
> +	if (semid == -1)
> +		tst_brk(TBROK | TERRNO, "couldn't create semaphore");
> +
> +	arg.buf = (struct semid_ds *)&buf_ds;
> +	TEST(semctl(semid, 0, IPC_STAT, arg));
> +	if (TST_RET == -1)
> +		tst_brk(TFAIL | TTERRNO, "semctl() failed");
> +
> +	if (buf_ds.sem_otime_high || buf_ds.sem_ctime_high)
> +		tst_res(TFAIL, "time_high fields aren't cleared by the kernel");
> +	else
> +		tst_res(TPASS, "time_high fields cleared by the kernel");
> +
> +	if (semctl(semid, 0, IPC_RMID, arg) == -1)
> +		tst_res(TINFO, "WARNING: semaphore deletion failed.");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.needs_tmpdir = 1,
> +};
> +#else
> +TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
> +#endif

Other than that the patch looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
