Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBF657CD
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 15:18:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 900F03C1C95
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 15:18:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6DF0D3C1B49
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 15:18:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 470461000B00
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 15:18:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 838AFAF18
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 13:18:43 +0000 (UTC)
Date: Thu, 11 Jul 2019 15:18:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Michael Moese <mmoese@suse.de>
Message-ID: <20190711131842.GC8709@rei>
References: <20190711125055.9289-1-mmoese@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711125055.9289-1-mmoese@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add a regression test for CVE-2017-1000380
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
> +LDLIBS 			+= -pthread
         ^
	 Space before tabs
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/sound/snd_timer01.c b/testcases/kernel/sound/snd_timer01.c
> new file mode 100644
> index 000000000..80b03022a
> --- /dev/null
> +++ b/testcases/kernel/sound/snd_timer01.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/* Copyright (c) 2019 Michael Moese <mmoese@suse.com>
> + * Regression test for CVE-2017-1000380 based on the original PoC exploit
> + * by Alexander Potapenko <glider@google.com>
> + *
> + * Be careful! This test may crash your kernel!
> + *
> + * The test performs several ioctl() parallel with readv() on the same
> + * file descriptor to /dev/snd/timer. A buggy kernel will leak memory
> + * to the process, which may contain information from the the kernel or
> + * any other process on the system.
> + *
> + * The issue was fixed with
> + *   http://git.kernel.org/linus/d11662f4f798b50d8c8743f433842c3e40fe3378
> + *   http://git.kernel.org/linus/ba3021b2c79b2fa9114f92790a99deb27a65b728
> + */
> +
> +#include "config.h"
> +#include "tst_test.h"
> +#include "tst_taint.h"
> +#include "tst_fuzzy_sync.h"
> +#include "tst_safe_macros.h"
> +#include "tst_safe_pthread.h"
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/uio.h>
> +#include <sys/ioctl.h>
> +#include <sound/asound.h>
> +
> +#define MAX_BUFSIZE 1024
> +
> +static int snd_fd;
> +static struct tst_fzsync_pair fzsync_pair;
> +
> +static void *ioctl_thread(void *unused)
> +{
> +	(void) unused;
          ^
	  Leftover?

> +	int tread_arg = 1;
> +	struct snd_timer_select ts;
> +	struct snd_timer_params tp;
> +
> +	memset(&ts, 0, sizeof(ts));
> +	ts.id.dev_class = 1;
> +
> +	memset(&tp, 0, sizeof(tp));
> +	tp.ticks = 1;
> +	tp.filter = 0xf;
> +
> +	while (tst_fzsync_run_b(&fzsync_pair)) {
> +
> +		ioctl(snd_fd, SNDRV_TIMER_IOCTL_TREAD, &tread_arg);
> +
> +		ioctl(snd_fd, SNDRV_TIMER_IOCTL_SELECT, &ts);
> +
> +		ioctl(snd_fd, SNDRV_TIMER_IOCTL_PARAMS, &tp);
> +
> +		ioctl(snd_fd, SNDRV_TIMER_IOCTL_START, 0);
> +
> +		tst_fzsync_end_race_b(&fzsync_pair);
> +	}
> +	return unused;
> +}
> +
> +static void setup(void)
> +{
> +	tst_fzsync_pair_init(&fzsync_pair);
> +	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> +	snd_fd = SAFE_OPEN("/dev/snd/timer",
> +			O_RDONLY|O_CREAT|O_NOCTTY|O_SYNC|O_LARGEFILE, 0);
> +}
> +
> +static void cleanup(void)
> +{
> +	tst_fzsync_pair_cleanup(&fzsync_pair);
> +	SAFE_CLOSE(snd_fd);
> +}
> +
> +static void run(void)
> +{
> +	size_t len;
> +	int size;
> +	struct iovec iov;
> +	pthread_t th;
> +	char read_buf[MAX_BUFSIZE];
> +	int i, nz;
> +	pthread_attr_t thread_attr;
> +
> +	pthread_attr_init(&thread_attr);
> +	pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED);
> +	SAFE_PTHREAD_CREATE(&th, &thread_attr, ioctl_thread, NULL);
> +
> +	iov.iov_base = read_buf;
> +	iov.iov_len = sizeof(read_buf);
> +
> +	while (tst_fzsync_run_a(&fzsync_pair)) {
> +		nz = 0;
> +		memset(read_buf, 0, sizeof(read_buf));
> +		size = readv(snd_fd, &iov, 1);
> +
> +		tst_fzsync_end_race_a(&fzsync_pair);
> +
> +		/* check if it could be a valid ioctl result */
> +		if (size == 0)
> +			continue;
> +
> +		/* check if the buffer is non-empty */
> +		for (i = 0; i < size; i++) {
> +			if (read_buf[i]) {
> +				nz = 1;
> +				break;
> +			}
> +		}
> +		if (!nz)
> +			continue;
> +
> +		len = strlen(read_buf);

The point still stands, strlen() on random buffer here is not safe. I
guess that the easies option would be shortening the iov_len by 1 since
we do memset() for the buffer it will be guaranteed that it's
null-terminated.

> +		/* the kernel's struct snd_timer_read is two unsigned integers*/
> +		if (len <= 2 * sizeof(unsigned int))
> +			continue;
> +
> +		tst_res(TFAIL, "kernel seems vulnerable");
> +		return;
> +	}
> +
> +	if (tst_taint_check() != 0)
> +		tst_res(TFAIL, "kernel seems vulnerable");
> +	else
> +		tst_res(TPASS, "kernel seems not vulnerable");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> -- 
> 2.22.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
