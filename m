Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E31ED1440A4
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 16:39:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 931C83C24D0
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 16:39:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0B4183C050E
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 16:39:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 98680601B3A
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 16:39:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCFEEB07D;
 Tue, 21 Jan 2020 15:39:31 +0000 (UTC)
Date: Tue, 21 Jan 2020 16:39:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200121153928.GA12370@rei>
References: <b4f5242fdca1659b2f71e1b3290fd32194e7340a.1579259595.git.viresh.kumar@linaro.org>
 <4dd4dabd2cd574dc2657c5926e8e3d1a0c8a8ae6.1579259595.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dd4dabd2cd574dc2657c5926e8e3d1a0c8a8ae6.1579259595.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/pidfd_open
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
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> new file mode 100644
> index 000000000000..b67393bcafa2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * This program opens the PID file descriptor of the child process created with
> + * fork(). It then uses poll to monitor the file descriptor for process exit, as
> + * indicated by an EPOLLIN event.
> + */
> +#include <poll.h>
> +#include <sys/types.h>
> +#include <sys/syscall.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "tst_test.h"
> +#include "lapi/pidfd_open.h"
> +#include "lapi/syscalls.h"
> +
> +static void run(void)
> +{
> +	struct pollfd pollfd;
> +	int p_id, fd, ready;
> +
> +	TEST(fork());
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL, "fork() Failed");
> +		tst_res(TBROK, "unable to continue");
> +	}

We do have SAFE_FORK() make use of that one instead.


> +	if (TST_RET == 0) {
> +		/* child */
> +		usleep(1000);

This is inherently racy, the process should not exit until the parent
has called pidfd_open().

We do have a checkpoints in the test library that can synchronize
between processes, generally it should look like:

child:
	checkpoint_wait()
	exit()

parent:
	pidfd_open()
	checkpoint_wake()

> +		exit(EXIT_SUCCESS);
> +	} else {
> +		/* parent */
> +		p_id = TST_RET;
> +
> +		TEST(pidfd_open(p_id, 0));
> +
> +		fd = TST_RET;
> +		if (fd == -1) {
> +			tst_res(TFAIL, "Cannot retrieve file descriptor to the child process");
                                  ^
			tst_res(TFAIL | TTERRNO, "pidfd_open() failed");
> +			return;
> +		}
> +
> +		pollfd.fd = fd;
> +		pollfd.events = POLLIN;
> +
> +		ready = poll(&pollfd, 1, -1);
> +		if (ready == -1) {
> +			tst_res(TFAIL, "poll() Failed");
> +			tst_res(TBROK, "unable to continue");

There is absolutely no need to print two messages on a failure, so this
should just be tst_brk(TBROK | TERRNO, "poll() failed");

Also note that tst_brk() _EXITS_ the test, which is what you want here.

> +		}
> +
> +		printf("Events (0x%x): POLLIN is %sset\n", pollfd.revents,
> +				(pollfd.revents & POLLIN) ? "" : "not ");

No printf in tests, use tst_res(TINFO, ...) instead.

Also we should check here that we got the event and that the child is
dead at this point, or something along these lines.

There does not seem to be single TPASS in this tests, which itself will
report that the test is broken when it's executed.

> +		SAFE_CLOSE(fd);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.min_kver = "5.3",
> +	.test_all = run,
> +};

And we are also missing third test here, that checks various error
condigitions such as flags != 0, invalid pid, etc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
