Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D2B8B7E2
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:02:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A95973C1D63
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:02:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8B53B3C025A
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:02:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B2597600A77
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:02:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 510A5B116;
 Tue, 13 Aug 2019 12:02:46 +0000 (UTC)
Date: Tue, 13 Aug 2019 14:02:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20190813120244.GA16005@rei.lan>
References: <20190811075915.11608-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811075915.11608-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/ioprio: Add test cases for I/O
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
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
> new file mode 100644
> index 000000000000..3cc1e51fc5c0
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + *
> + * Description:
> + * Basic ioprio_set() test. Gets the current process I/O priority and
> + * bumps it up one notch, then down two notches and checks that the
> + * new priority is reported back correctly.
> + */
> +#include <sys/types.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +#include "ioprio.h"
> +
> +static void run(void)
> +{
> +	int class, prio;
> +
> +	/* Get the I/O priority for the current process */
> +	TEST(sys_ioprio_get(IOPRIO_WHO_PROCESS, 0));
> +
> +	if (TST_RET == -1)
> +		tst_brk(TBROK | TTERRNO, "ioprio_get failed");
> +
> +	class = IOPRIO_PRIO_CLASS(TST_RET);
> +	prio = IOPRIO_PRIO_LEVEL(TST_RET);
> +	tst_res(TINFO, "ioprio_get returned class %s prio %d",
> +		to_class_str[class], prio);
> +
> +	/* Bump prio to what it was + 1 */
> +	class = IOPRIO_CLASS_BE;
> +	if (!prio_in_range(prio + 1)) {
> +		tst_res(TFAIL, "ioprio increase out of range (%d)", prio + 1);
> +		return;
> +	}
> +	prio = (prio + 1) % IOPRIO_PRIO_NUM;

I guess that the % IOPRION_PRIO_NUM is not needed here since we already
checked that the prio+1 is in range, or do I miss something?

> +	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			    IOPRIO_PRIO_VALUE(class, prio)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
> +	else
> +		ioprio_check_setting(class, prio, 1);
> +
> +	/* Bump prio down two notches */
> +	if (!prio_in_range(prio - 2)) {
> +		tst_res(TFAIL, "ioprio increase out of range (%d)", prio - 2);
> +		return;
> +	}
> +	prio = (prio - 2) % IOPRIO_PRIO_NUM;

Here as well.

> +	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			    IOPRIO_PRIO_VALUE(class, prio)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set failed");
> +	else
> +		ioprio_check_setting(class, prio, 1);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +};
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set02.c b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
> new file mode 100644
> index 000000000000..5472b549a268
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_set02.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + *
> + * Description:
> + * Extended ioprio_set() test. Gets the current process I/O priority and
                                   ^
				   We are not getting anything here.
> + * tests to set all 8 priority levels for best effort prioritym then
> + * switches to test all 8 priority levels for idle priority. Also test
> + * some non-working priorities to make sure they don't work.
> + */
> +#include <sys/types.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +#include "ioprio.h"
> +
> +static void run(void)
> +{
> +	int class, prio;
> +	int fail_in_loop;
> +
> +	/* Bump to best effort scheduling, all 8 priorities */
> +	class = IOPRIO_CLASS_BE;
> +
> +	fail_in_loop = 0;
> +	for (prio = 0; prio < IOPRIO_PRIO_NUM; prio++) {
> +		TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +				    IOPRIO_PRIO_VALUE(class, prio)));
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
> +			fail_in_loop = 1;
> +		}
> +	}
> +	if (!fail_in_loop)
> +		tst_res(TPASS, "tested all prios in class %s",
> +			 to_class_str[class]);
> +
> +	/* Bump down to idle scheduling */
> +	class = IOPRIO_CLASS_IDLE;
> +
> +	fail_in_loop = 0;
> +	for (prio = 0; prio < IOPRIO_PRIO_NUM; prio++) {
> +		TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +				    IOPRIO_PRIO_VALUE(class, prio)));
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_IDLE prio %d failed", prio);
> +			fail_in_loop = 1;
> +		}
> +	}
> +	if (!fail_in_loop)
> +		tst_res(TPASS, "tested all prios in class %s",
> +			 to_class_str[class]);
> +
> +	/* Test NONE scheduling */
> +	class = IOPRIO_CLASS_NONE;
> +	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			    IOPRIO_PRIO_VALUE(class, 0)));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_NONE failed");
> +	else
> +		ioprio_check_setting(class, 0, 1);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +};
> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set03.c b/testcases/kernel/syscalls/ioprio/ioprio_set03.c
> new file mode 100644
> index 000000000000..66d61b67e8c1
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_set03.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linus Walleij <linus.walleij@linaro.org>
> + *
> + * Description:
> + * Negative ioprio_set() test. Test some non-working priorities to make
> + * sure they don't work.
> + */
> +#include <sys/types.h>
> +#include <sys/syscall.h>
> +
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +#include "ioprio.h"
> +
> +static void run(void)
> +{
> +	int class;
> +
> +	class = IOPRIO_CLASS_BE;
> +
> +	/* Test to fail with prio 8, first set prio 4 */
> +	sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +		       IOPRIO_PRIO_VALUE(class, 4));

What do we need this for?

> +	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			    IOPRIO_PRIO_VALUE(class, 8)));
> +	if (TST_RET == -1) {
> +		ioprio_check_setting(class, 4, 1);
> +		if (errno == EINVAL)
> +			tst_res(TPASS | TTERRNO, "returned correct error for wrong prio");
> +		else
> +			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
> +				TST_ERR);
> +	} else {
> +		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_BE prio 8 should not work");
> +	}
> +
> +	/* Any other prio than 0 should not work with NONE */
> +	class = IOPRIO_CLASS_NONE;
> +	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
> +			    IOPRIO_PRIO_VALUE(class, 4)));
> +	if (TST_RET == -1) {
> +		tst_res(TINFO, "tested illegal priority with class %s",
> +			to_class_str[class]);
> +		if (errno == EINVAL)
> +			tst_res(TPASS | TTERRNO, "returned correct error for wrong prio");
> +		else
> +			tst_res(TFAIL, "ioprio_set returns wrong errno %d",
> +				TST_ERR);
> +	} else {
> +		tst_res(TFAIL, "ioprio_set IOPRIO_CLASS_NONE should fail");
> +	}

This is almost copy&pasted I would consider putting it into a
function...

> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +};

Other than the minor issues this looks good.

Also I can fix these and apply the patch myself, no need to resend v5.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
