Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FAB6CC8B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 12:09:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED8CA3C1D0F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 12:09:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3A0633C1A4E
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 12:09:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AFB786009FE
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 12:09:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D0B6AC84;
 Thu, 18 Jul 2019 10:09:13 +0000 (UTC)
Date: Thu, 18 Jul 2019 12:09:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20190718100848.GA24931@rei.lan>
References: <20190718073941.13153-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718073941.13153-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioprio: Add test cases for I/O
 priority
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
Cc: Jens Axboe <axboe@kernel.dk>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The ioprio_get/ioprio_set syscalls are used primarily by the
> userspace tool "ionice" to set priority of a process, user or
> process group toward the I/O (block layer) scheduler.
> 
> This adds a simple iprio_get test and two more verbose tests
> for ioprio_set.

Generally looks fine, some comments below.

> Cc: Anders Roxell <anders.roxell@linaro.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Use the new test fixture "tst_test.h"
> - Fix up legalese in the Makefile to a simple SPDX tag.
> - Test from v2.6.13 when the syscall was introduced
> ---
>  testcases/kernel/syscalls/ioprio/.gitignore   |   3 +
>  testcases/kernel/syscalls/ioprio/Makefile     |   6 +
>  testcases/kernel/syscalls/ioprio/ioprio.h     |  44 ++++++
>  .../kernel/syscalls/ioprio/ioprio_get01.c     |  48 ++++++
>  .../kernel/syscalls/ioprio/ioprio_set01.c     |  98 ++++++++++++
>  .../kernel/syscalls/ioprio/ioprio_set02.c     | 142 ++++++++++++++++++
>  6 files changed, 341 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ioprio/.gitignore
>  create mode 100644 testcases/kernel/syscalls/ioprio/Makefile
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio.h
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_get01.c
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set01.c
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set02.c

You are missing runtest entries here, see runtest/syscalls

> diff --git a/testcases/kernel/syscalls/ioprio/.gitignore b/testcases/kernel/syscalls/ioprio/.gitignore
> new file mode 100644
> index 000000000000..890081d8c625
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/.gitignore
> @@ -0,0 +1,3 @@
> +ioprio_get01
> +ioprio_set01
> +ioprio_set02
> diff --git a/testcases/kernel/syscalls/ioprio/Makefile b/testcases/kernel/syscalls/ioprio/Makefile
> new file mode 100644
> index 000000000000..5ea7d67db123
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio.h b/testcases/kernel/syscalls/ioprio/ioprio.h
> new file mode 100644
> index 000000000000..3a0f068a053a
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio.h
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + */
> +
> +#ifndef LTP_IOPRIO_H
> +#define LTP_IOPRIO_H
> +
> +enum {
> +	IOPRIO_CLASS_NONE = 0,
> +	IOPRIO_CLASS_RT,
> +	IOPRIO_CLASS_BE,
> +	IOPRIO_CLASS_IDLE,
> +};
> +
> +enum {
> +	IOPRIO_WHO_PROCESS = 1,
> +	IOPRIO_WHO_PGRP,
> +	IOPRIO_WHO_USER,
> +};
> +
> +#define IOPRIO_CLASS_SHIFT	(13)
> +#define IOPRIO_PRIO_MASK	((1UL << IOPRIO_CLASS_SHIFT) - 1)
> +
> +#define IOPRIO_PRIO_CLASS(data)	((data) >> IOPRIO_CLASS_SHIFT)
> +#define IOPRIO_PRIO_LEVEL(data)	((data) & IOPRIO_PRIO_MASK)
> +#define IOPRIO_PRIO_VALUE(class, data)	(((class) << IOPRIO_CLASS_SHIFT) | data)
> +
> +static const char *to_class_str[] = {
> +	[IOPRIO_CLASS_NONE] = "NONE",
> +	[IOPRIO_CLASS_RT]   = "REALTIME",
> +	[IOPRIO_CLASS_BE]   = "BEST-EFFORT",
> +	[IOPRIO_CLASS_IDLE] = "IDLE"
> +};
> +
> +/* Priority range from 0 (highest) to 7 (lowest) */
> +static inline int prio_in_range(int prio)
> +{
> +	if ((prio < 0) || (prio > 7))
> +		return 0;
> +	return 1;
> +}
> +
> +#endif
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_get01.c b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> new file mode 100644
> index 000000000000..79807763a5f3
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linaro Limited
> + */

We usually write a short comment paragraph about the test purpose here.

Given that this test is very basic it should be something as:

/*
 * Basic ioprio_get() test. Gets the current process I/O priority and
 * checks that the values are sane.
 */

> +#include <sys/types.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "ioprio.h"
> +
> +static int ioprio_get(int which, int who)
> +{
> +	return syscall(SYS_ioprio_get, which, who);
> +}

These wrappers should go to the ioprio.h header so that we don't have to
repeat then in each test.

> +static void run(void)
> +{
> +	int prio, class;
> +
> +	/* Get the I/O priority for the current process */
> +	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
> +		return;
> +	}
> +
> +	class = IOPRIO_PRIO_CLASS(TST_RET);
> +	prio = IOPRIO_PRIO_LEVEL(TST_RET);
> +
> +	if (!prio_in_range(prio)) {
> +		tst_res(TFAIL, "ioprio out of range (%d)", prio);
> +		return;
> +	}

Shouldn't we check that the class is valid as well here?

If we got garbage in the result we still have more than half of the bits
in the integer that will overflow the to_class_str array below.

> +	tst_res(TPASS, "ioprio_get returned class %s prio %d",
> +		to_class_str[class], prio);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.min_kver = "2.6.13",
> +};
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
> new file mode 100644
> index 000000000000..9f2c9f4b3d48
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + */

Here as well, comment please.

> +#include <sys/types.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "ioprio.h"
> +
> +static int ioprio_get(int which, int who)
> +{
> +	return syscall(SYS_ioprio_get, which, who);
> +}
> +
> +static int ioprio_set(int which, int who, int ioprio)
> +{
> +	return syscall(SYS_ioprio_set, which, who, ioprio);
> +}
> +
> +static void ioprio_check_setting(int class, int prio)
> +{
> +	int res;
> +	int newclass, newprio;
> +
> +	res = ioprio_get(IOPRIO_WHO_PROCESS, 0);
> +	if (res == -1) {
> +		tst_res(TFAIL | TTERRNO,
> +			"reading back prio failed");
> +		return;
> +	}
> +
> +	newclass = IOPRIO_PRIO_CLASS(res);
> +	newprio = IOPRIO_PRIO_LEVEL(res);
> +	if (newclass != class)
> +		tst_res(TFAIL,
> +			"wrong class after setting, expected %s got %s",
> +			to_class_str[class],
> +			to_class_str[newclass]);
> +	else if (newprio != prio)
> +		tst_res(TFAIL,
> +			"wrong prio after setting, expected %d got %d",
> +			prio, newprio);
> +	else
> +		tst_res(TPASS, "ioprio_set new class %s, new prio %d",
> +			to_class_str[newclass],
> +			newprio);
> +}
> +
> +static void run(void)
> +{
> +	int class, prio;
> +
> +	/* Get the I/O priority for the current process */
> +	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
> +		/* Try to continue anyway */
> +		class = IOPRIO_CLASS_NONE;
> +		prio = 4;
> +	} else {
> +		class = IOPRIO_PRIO_CLASS(TST_RET);
> +		prio = IOPRIO_PRIO_LEVEL(TST_RET);
> +		tst_res(TPASS, "ioprio_get returned class %s prio %d",
> +			 to_class_str[class], prio);
> +	}
> +
> +	/* Bump prio to what it was + 1 */
> +	class = IOPRIO_CLASS_BE;
> +	prio++;

Looking into a documentation the default io_nice for IOPRIO_CLASS_BE is
(cpu_nice + 20)/5 so the default is 4 and +1 and -1 is safe operation on
default settings. But I guess that a call to prio_in_range(prio+1) to
check the value wouldn't harm.

> +	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			IOPRIO_PRIO_VALUE(class, prio)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
> +	else
> +		ioprio_check_setting(class, prio);
> +
> +	/* Bump prio down two notches */
> +	prio -= 2;

Here as well.

> +	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			IOPRIO_PRIO_VALUE(class, prio)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
> +	else
> +		ioprio_check_setting(class, prio);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.min_kver = "2.6.13",
> +};
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set02.c b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
> new file mode 100644
> index 000000000000..7cec8538254d
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + */

Here as well, comment please.

> +#include <sys/types.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "ioprio.h"
> +
> +static int ioprio_get(int which, int who)
> +{
> +	return syscall(SYS_ioprio_get, which, who);
> +}
> +
> +static int ioprio_set(int which, int who, int ioprio)
> +{
> +	return syscall(SYS_ioprio_set, which, who, ioprio);
> +}
> +
> +static void ioprio_check_setting(int class, int prio, int report)
> +{
> +	int res;
> +	int newclass, newprio;
> +
> +	res = ioprio_get(IOPRIO_WHO_PROCESS, 0);
> +	if (res == -1) {
> +		tst_res(TFAIL | TTERRNO,
> +			 "reading back prio failed");
> +		return;
> +	}
> +
> +	newclass = IOPRIO_PRIO_CLASS(res);
> +	newprio = IOPRIO_PRIO_LEVEL(res);
> +	if (newclass != class)
> +		tst_res(TFAIL,
> +			"wrong class after setting, expected %s got %s",
> +			to_class_str[class],
> +			to_class_str[newclass]);
> +	else if (newprio != prio)
> +		tst_res(TFAIL,
> +			"wrong prio after setting, expected %d got %d",
> +			prio, newprio);
> +	else if (report)
> +		tst_res(TPASS, "ioprio_set new class %s, new prio %d",
> +			to_class_str[newclass],
> +			newprio);
> +}

This is nearly the same as in the previous test, can we put this into
the hearder as well?

> +static void run(void)
> +{
> +	int class, prio;
> +	int fail_in_loop;
> +
> +	/* Get the I/O priority for the current process */
> +	TEST(ioprio_get(IOPRIO_WHO_PROCESS, 0));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "ioprio_get failed");
> +		/* Try to continue anyway */
> +		class = IOPRIO_CLASS_NONE;
> +		prio = 4;
> +	} else {
> +		class = IOPRIO_PRIO_CLASS(TST_RET);
> +		prio = IOPRIO_PRIO_LEVEL(TST_RET);
> +		tst_res(TPASS, "ioprio_get returned class %s prio %d",
> +			 to_class_str[class], prio);
> +	}

Why do we get the priority here? We set both the class and prio down
there.

> +	/* Bump to best effort scheduling, all 8 priorities */
> +	class = IOPRIO_CLASS_BE;
> +
> +	fail_in_loop = 0;
> +	for (prio = 0; prio < 8; prio++) {
> +		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +				IOPRIO_PRIO_VALUE(class, prio)));
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
> +			fail_in_loop = 1;
> +		}
> +	}
> +	if (!fail_in_loop)
> +		tst_res(TPASS, "tested all 8 prios in class %s",
> +			 to_class_str[class]);

Just btw, we don't have to have the fail_in_loop variable here
(fail_in_loop) == (prio < 8)

> +	/* Test to fail with prio 8, first set prio 4 */
> +	ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +		   IOPRIO_PRIO_VALUE(class, 4));
> +	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			IOPRIO_PRIO_VALUE(class, 8)));
> +	if (TST_RET == -1) {
> +		ioprio_check_setting(class, 4, 1);
> +		prio = 5;
> +	}
> +	else
> +		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio %d should not work", prio);

That's a GNU-style else and LTP follows LKML.


Also we usually tend to put all negative tests into a separate testcase
and also assert that the errno is correct.

> +	/* Bump down to idle scheduling */
> +	class = IOPRIO_CLASS_IDLE;
> +
> +	fail_in_loop = 0;
> +	for (prio = 0; prio < 8; prio++) {
> +		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +				IOPRIO_PRIO_VALUE(class, prio)));
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_IDLE failed");
> +			fail_in_loop = 1;
> +		}
> +	}
> +	if (!fail_in_loop)
> +		tst_res(TPASS, "tested all 8 prios in class %s",
> +			 to_class_str[class]);
> +
> +	/* Test NONE scheduling */
> +	class = IOPRIO_CLASS_NONE;
> +	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			IOPRIO_PRIO_VALUE(class, 0)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_NONE failed");
> +	else
> +		ioprio_check_setting(class, 0, 1);
> +
> +	/* Any other prio than 0 should not work with NONE */
> +	class = IOPRIO_CLASS_NONE;
> +	TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			IOPRIO_PRIO_VALUE(class, 4)));
> +	if (TST_RET == -1)
> +		tst_res(TPASS, "tested illegal priority with class %s",
> +			 to_class_str[class]);
> +	else
> +		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_NONE should fail");

Here as well, we should assert the errno as well.

> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.min_kver = "2.6.13",
> +};
> -- 
> 2.21.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
