Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35A307A0B
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 16:49:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A8163C7924
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 16:49:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 240413C5E78
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 16:48:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 78C8D600C81
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 16:48:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C25EFAC41;
 Thu, 28 Jan 2021 15:48:54 +0000 (UTC)
Date: Thu, 28 Jan 2021 16:50:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YBLdKsBkrLuyvbjA@yuki.lan>
References: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611654925-8994-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/3] syscalls/mallinfo01: Add a basic test for
 mallinfo
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

> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
> new file mode 100644
> index 000000000..1a2a30af1
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic mallinfo() test. Refer to glibc test
> + * https://sourceware.org/git/?p=glibc.git;a=blob;f=malloc/tst-mallinfo2.c
> +\*/
> +
> +#include <malloc.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +
> +#ifdef HAVE_MALLINFO
> +static char *buf;
> +static struct mallinfo info1;
> +
> +static void
> +print_mallinfo(const char *msg, struct mallinfo *m)
> +{
> +	tst_res(TINFO, "%s...", msg);
> +#define P(f) tst_res(TINFO, "%s: %d", #f, m->f)
> +	P(arena);
> +	P(ordblks);
> +	P(smblks);
> +	P(hblks);
> +	P(hblkhd);
> +	P(usmblks);
> +	P(fsmblks);
> +	P(uordblks);
> +	P(fordblks);
> +	P(keepcost);
> +}
> +
> +void test_mallinfo(void)
> +{
> +	struct mallinfo info2;
> +	int i;
> +	int total = 0;
> +
> +	for (i = 1; i < 20; i++) {
> +		buf = SAFE_MALLOC(160 * i);

The buf here has to be array and we have to free the buffers at the end
of this function, otherwise the malloc() will fail sooner or later when
the test_mallinfo() function runs in a loop.

> +		total += 16 * i;
> +	}
> +
> +	info2 = mallinfo();
> +	print_mallinfo("Test", &info2);
> +	if (info2.uordblks > info1.uordblks + total)
> +		tst_res(TPASS, "mallinfo() passed");
> +	else
> +		tst_res(TFAIL, "mallinfo() failed");
> +
> +	info1 = info2;

And then we cannot do this either.

> +}
> +
> +static void setup(void)
> +{
> +	if (sizeof(info1.arena) != sizeof(int))
> +		tst_res(TFAIL, "The member of mallinfo struct is not int");
> +
> +	info1 = mallinfo();
> +	print_mallinfo("Start", &info1);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (buf)
> +		free(buf);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = test_mallinfo,
> +	.cleanup = cleanup,
> +};
> +
> +#else
> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
> +#endif
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
