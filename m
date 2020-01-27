Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9914A62E
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 15:32:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E08DF3C238E
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 15:32:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6F08A3C17C4
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 15:32:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9061D1A00F73
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 15:32:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A016ABED;
 Mon, 27 Jan 2020 14:32:16 +0000 (UTC)
Date: Mon, 27 Jan 2020 15:32:15 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200127143215.GC30831@rei.lan>
References: <2d23f3a542bbd04179aba828e28d37f5c7be7b45.1579859350.git.viresh.kumar@linaro.org>
 <5c8bc1c031ec992f402e009a5ed85f9351ecd7ac.1580122000.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c8bc1c031ec992f402e009a5ed85f9351ecd7ac.1580122000.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/2] syscalls/io_pgetevents
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
> Add tests to check working of io_pgetevents() syscall.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2->V3:
> - Dropped duplicate headers
> - Handle failure tests with global variable
> - All changes were inspired from the reviews of pidfd_open() patchset.
> 
> V1->V2:
> - Do the failure testing with help of array and .tcnt.
> - Use tst_syscall().
> - Removed cleanup() routines.
> - Improved print messages and few more minor changes.
> 
>  configure.ac                                  |   1 +
>  include/lapi/io_pgetevents.h                  |  51 +++++++++
>  runtest/syscalls                              |   4 +
>  .../kernel/syscalls/io_pgetevents/.gitignore  |   2 +
>  .../kernel/syscalls/io_pgetevents/Makefile    |   6 +
>  .../syscalls/io_pgetevents/io_pgetevents01.c  |  61 +++++++++++
>  .../syscalls/io_pgetevents/io_pgetevents02.c  | 103 ++++++++++++++++++
>  7 files changed, 228 insertions(+)
>  create mode 100644 include/lapi/io_pgetevents.h
>  create mode 100644 testcases/kernel/syscalls/io_pgetevents/.gitignore
>  create mode 100644 testcases/kernel/syscalls/io_pgetevents/Makefile
>  create mode 100644 testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
>  create mode 100644 testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
> 
> diff --git a/configure.ac b/configure.ac
> index 1bf0911d88ad..c7cdff1c422c 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -75,6 +75,7 @@ AC_CHECK_FUNCS([ \
>      getdents \
>      getdents64 \
>      kcmp \
> +    io_pgetevents \
>      mkdirat \
>      mknodat \
>      name_to_handle_at \
> diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
> new file mode 100644
> index 000000000000..6ee38c44d419
> --- /dev/null
> +++ b/include/lapi/io_pgetevents.h
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Linaro Limited. All rights reserved.
> + * Author: Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +#ifndef IO_PGETEVENTS_H
> +#define IO_PGETEVENTS_H
> +
> +#include <sys/syscall.h>
> +#include <sys/types.h>
> +
> +#include "config.h"
> +#include "lapi/syscalls.h"
> +#include "tst_test.h"
> +
> +#ifdef HAVE_LIBAIO
> +#include <libaio.h>
> +
> +#ifndef HAVE_IO_SETUP
> +int io_setup(int nr, io_context_t *ctxp)
> +{
> +	return tst_syscall(__NR_io_setup, nr, ctxp);
> +}
> +#endif /* HAVE_IO_SETUP */
> +
> +#ifndef HAVE_IO_DESTROY
> +int io_destroy(io_context_t ctx)
> +{
> +	return tst_syscall(__NR_io_destroy, ctx);
> +}
> +#endif /* HAVE_IO_DESTROY */
> +
> +#ifndef HAVE_IO_SUBMIT
> +int io_submit(io_context_t ctx, long nr, struct iocb **iocbpp)
> +{
> +	return tst_syscall(__NR_io_submit, ctx, nr, iocbpp);
> +}
> +#endif /* HAVE_IO_SUBMIT */

I'm not sure this is correct, the libaio.h does define these wrappers
and the rest of LTP seems to use these syscalls only guarded by
HAVE_LIBAIO, so I guess these cannot be missing if libaio.h is present.

Furthermore there are no checks for io_setup, io_destroy and io_submit
calls in the configure.ac so presumbly this macros are never used
anyway.

> +#ifndef HAVE_IO_PGETEVENTS
> +int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
> +		 struct io_event *events, struct timespec *timeout,
> +		 sigset_t *sigmask)
> +{
> +	return syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events, timeout, sigmask);
> +}
> +#endif /* HAVE_IO_PGETEVENTS */

This is the only function that seems to be missing from the libaio.h
header, so I guess that all we have to do here is to define it if it's
not defined.

> +#endif /* HAVE_LIBAIO */
> +
> +#endif /* IO_PGETEVENTS_H */
> diff --git a/runtest/syscalls b/runtest/syscalls
> index a28a1f2ecd45..0743cf4e3f74 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -556,6 +556,10 @@ ioprio_set03 ioprio_set03
>  io_cancel01 io_cancel01
>  io_destroy01 io_destroy01
>  io_getevents01 io_getevents01
> +
> +io_pgetevents01 io_pgetevents01
> +io_pgetevents02 io_pgetevents02
> +
>  io_setup01 io_setup01
>  io_submit01 io_submit01
>  
> diff --git a/testcases/kernel/syscalls/io_pgetevents/.gitignore b/testcases/kernel/syscalls/io_pgetevents/.gitignore
> new file mode 100644
> index 000000000000..ae02077ba44b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_pgetevents/.gitignore
> @@ -0,0 +1,2 @@
> +io_pgetevents01
> +io_pgetevents02
> diff --git a/testcases/kernel/syscalls/io_pgetevents/Makefile b/testcases/kernel/syscalls/io_pgetevents/Makefile
> new file mode 100644
> index 000000000000..5ea7d67db123
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_pgetevents/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
> new file mode 100644
> index 000000000000..d685adb48759
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic io_pgetevents() test to receive 1 event successfully.
> + */
> +#include "lapi/io_pgetevents.h"
> +
> +#ifdef HAVE_LIBAIO
> +static void run(void)
> +{
> +	struct io_event events[1];
> +	struct iocb cb, *cbs[1];
> +	io_context_t ctx = 0;
> +	sigset_t sigmask;
> +	char data[4096];
> +	int ret, fd;
> +
> +	cbs[0] = &cb;
> +	sigemptyset(&sigmask);
> +
> +	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
> +	io_prep_pwrite(&cb, fd, data, 4096, 0);
> +
> +	ret = io_setup(1, &ctx);
> +	if (ret < 0) {
> +		tst_res(TBROK | TERRNO, "io_setup() failed");
> +		goto exit;
> +	}
> +
> +	ret = io_submit(ctx, 1, cbs);
> +	if (ret != 1) {
> +		tst_res(TBROK | TERRNO, "io_submit() failed");
> +		goto exit;
> +	}
> +
> +	/* get the reply */
> +	ret = io_pgetevents(ctx, 1, 1, events, NULL, &sigmask);
> +
> +	if (ret == 1)
> +		tst_res(TPASS, "io_pgetevents() works as expected");
> +	else
> +		tst_res(TFAIL | TERRNO, "io_pgetevents() failed");
> +
> +	if (io_destroy(ctx) < 0)
> +		tst_res(TBROK | TERRNO, "io_destroy() failed");
> +
> +exit:
> +	SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.min_kver = "4.18",
> +	.test_all = run,
> +	.needs_tmpdir = 1,
> +};
> +
> +#else
> +TST_TEST_TCONF("test requires libaio and it's development packages");
> +#endif
> diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
> new file mode 100644
> index 000000000000..c612c3f0a2b2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic io_pgetevents() test to check various failures.
> + */
> +#include "lapi/io_pgetevents.h"
> +
> +#ifdef HAVE_LIBAIO
> +static sigset_t sigmask;
> +static struct io_event events[1];
> +static io_context_t ctx, invalid_ctx = 0;
> +static int fd;
> +
> +static struct tcase {
> +	char *name;
> +	io_context_t *ctx;
> +	long min_nr;
> +	long max_nr;
> +	struct io_event *events;
> +	struct timespec *timeout;
> +	sigset_t *sigmask;
> +	int exp_errno;
> +} tcases[] = {
> +	{"invalid ctx", &invalid_ctx, 1, 1, events, NULL, &sigmask, EINVAL},
> +	{"invalid min_nr", &ctx, -1, 1, events, NULL, &sigmask, EINVAL},
> +	{"invalid max_nr", &ctx, 1, -1, events, NULL, &sigmask, EINVAL},
> +	{"invalid events", &ctx, 1, 1, NULL, NULL, &sigmask, EFAULT},
> +	{"invalid timeout", &ctx, 1, 1, events, (void *)(0xDEAD), &sigmask, EFAULT},
> +	{"invalid sigmask", &ctx, 1, 1, events, NULL, (void *)(0xDEAD), EFAULT},
> +};
> +
> +static void setup(void)
> +{
> +	struct iocb cb, *cbs[1];
> +	char data[4096];
> +	int ret;
> +
> +	cbs[0] = &cb;
> +
> +	sigemptyset(&sigmask);
> +
> +	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT);
> +	io_prep_pwrite(&cb, fd, data, 4096, 0);
> +
> +	ret = io_setup(1, &ctx);
> +	if (ret < 0) {
> +		tst_res(TBROK | TERRNO, "io_setup() failed");
> +		goto exit;
> +	}
> +
> +	ret = io_submit(ctx, 1, cbs);
> +	if (ret != 1) {
> +		tst_res(TBROK | TERRNO, "io_submit() failed");
> +		goto exit;
> +	}
> +
> +	return;
> +
> +exit:
> +	SAFE_CLOSE(fd);

We do close the fd in test cleanup() so this should be removed.

Also we will attempt to continue the test here even when the io_setup()
or io_submit() have failed.

What we should do here instead is to call tst_brk() in the checks for
io_setup() and io_submit() failures. The fd will be closed in the
cleanup that way.

> +}
> +
> +static void cleanup(void)
> +{
> +	if (io_destroy(ctx) < 0)
> +		tst_res(TBROK | TERRNO, "io_destroy() failed");
> +
> +	SAFE_CLOSE(fd);

The cleanup could be called when any of the SAFE_ calls fails, which
especially means that if SAFE_OPEN() fails we will attempt to destroy
uninitialized context and close fd -1.

What we do in cleanups to cope with this is to check if the fd is valid
fist, i.e.

	if (fd > 0)
		SAFE_CLOSE(fd);

For the io_destroy(ctx) it's probably easiest to create a global flag
ctx_initalized and set it to 1 right after the io_setup(). Then we can
do:

	if (ctx_initialized) {
		if (io_destroy(ctx) < 0)
			...
	}

> +}
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	TEST(io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events,
> +			   tc->timeout, tc->sigmask));
> +
> +	if (TST_RET == 1) {
> +		tst_res(TFAIL, "%s: io_pgetevents() passed unexpectedly",
> +			tc->name);
> +	} else if (tc->exp_errno != TST_ERR) {
> +		tst_res(TFAIL | TTERRNO, "%s: io_pgetevents() should fail with %s",
> +			tc->name, tst_strerrno(tc->exp_errno));
> +	} else {
> +		tst_res(TPASS | TTERRNO, "%s: io_pgetevents() failed as expected",
> +			tc->name);
> +	}

We usually use return to avoid if-else mazes like this one, i.e.

	if (TST_RET == 1) {
		tst_res(TFAIL, ...);
		return;
	}

	if (tc->exp_errno != TST_ERR) {
		tst_res(TFAIL ...);
		return;
	}

	tst_res(TPASS, ...);



I find this a bit more readable.

> +}
> +
> +static struct tst_test test = {
> +	.min_kver = "4.18",
> +	.needs_tmpdir = 1,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> +
> +#else
> +TST_TEST_TCONF("test requires libaio and it's development packages");
> +#endif

Other than the minor issues the rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
