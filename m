Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B73A20F1A5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 11:31:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D61F73C2AC2
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jun 2020 11:31:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 616DE3C2AAB
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 11:31:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BAF5F1A011D5
 for <ltp@lists.linux.it>; Tue, 30 Jun 2020 11:31:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B45BEAF36;
 Tue, 30 Jun 2020 09:31:18 +0000 (UTC)
Date: Tue, 30 Jun 2020 11:31:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Shwetha Subramanian <shwetha@zilogic.com>
Message-ID: <20200630093138.GA2684@yuki.lan>
References: <20200629154821.13349-1-shwetha@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629154821.13349-1-shwetha@zilogic.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add mincore() test for anonymous mappings
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
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/kernel/syscalls/mincore/mincore03.c b/testcases/kernel/syscalls/mincore/mincore03.c
> new file mode 100644
> index 000000000..53b05e57c
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mincore/mincore03.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
> + * Email: code@zilogic.com
> + */
> +
> +/*
> + * mincore03
> + * Testcase 1 : Tests mincore result for anonymous mapping
> + * Memory is mapped as anonymous.
> + * Mapped memory is not touched.
> + * Mincore is executed.
> + * Number of pages in cache is counted and compared to expected number of pages

This describes what the test does but that can be easily seen from the
code. Rather it should explain why we are doing this. E.g. somethign as:

* Test that anonymous pages that haven't been faulted yet are reported as
  not resident by mincore()

> + * Testcase 2 : Tests mincore result for pages mapped but not cached yet
> + * Memory is mapped as anonymous.
> + * Mapped memory is touched.
> + * Mincore is executed.
> + * Number of pages in cache is counted and compared to expected number of pages

Here as well.

> + */
> +
> +#include <stdbool.h>
> +#include <unistd.h>
> +#include <sys/mman.h>
> +#include "tst_test.h"
> +
> +#define NUM_PAGES 3
> +
> +static struct tcase {
> +	bool mlock;
> +	int expected_pages;
> +} tcases[] = {
> +	{ false, 0 },
> +	{ true, NUM_PAGES },
> +};
> +
> +static int size;
> +static void *ptr;
> +
> +static void cleanup(void)
> +{
> +	SAFE_MUNMAP(ptr, size);
> +}

We unmap the mapping in the main loop so we should do this only if we
exitted the test_mincore() prematurely. Maybe we should do:

	if (ptr)
		SAFE_MUNMAP(ptr, size);

And set the ptr to NULL in the test_mincore() right after we have
unmapped it.

> +static void test_mincore(unsigned int test_nr)
> +{
> +	const struct tcase *tc = &tcases[test_nr];
> +	unsigned char vec[NUM_PAGES];
> +	int locked_pages;
> +	int count, mincore_ret;
> +	int result, page_size;
> +
> +	page_size = getpagesize();

I guess that we can do this once in the test setup.

> +	size = page_size * NUM_PAGES;
> +	ptr = SAFE_MMAP(NULL, size,  PROT_WRITE | PROT_READ, MAP_PRIVATE |  MAP_ANONYMOUS, 0, 0);
> +	if (tc->mlock == true)

Just do if (tc->mlock)

> +		SAFE_MLOCK(ptr, size);
> +	
   ^
Trailing whitespace.

You can use the checkpatch.pl from Linux kernel git repostory to check
for minor mistakes like these before sending a patch.

> +	mincore_ret = mincore(ptr, size, vec);
> +	if (mincore_ret == -1)
> +		tst_brk(TBROK | TERRNO, "mincore failed");
> +	locked_pages = 0;
> +	for (count = 0; count < NUM_PAGES; count++)
> +		if (vec[count] & 1)
> +			locked_pages++;
> +	
> +	if (locked_pages == tc->expected_pages)
> +		result = TPASS;
> +	else
> +		result = TFAIL;
> +	tst_res(result, "no of pages in memory : %d no of pages expected in memory : %d",
> +		locked_pages, tc->expected_pages);

Can we please print different messages for PASS/FAIL here? This message
as it is is a bit confusing.

> +	if (tc->mlock == true)

Here as well just if (tc->mlock)

> +		SAFE_MUNLOCK(ptr, size);
> +	SAFE_MUNMAP(ptr, size);
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.cleanup = cleanup,
> +	.test = test_mincore,
> +};
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
