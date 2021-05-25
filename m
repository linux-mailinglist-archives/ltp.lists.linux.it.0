Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975838FF99
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 12:56:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 953883C77C0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 12:56:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7D9F3C2B64
 for <ltp@lists.linux.it>; Tue, 25 May 2021 12:56:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 321CC1000482
 for <ltp@lists.linux.it>; Tue, 25 May 2021 12:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621940206;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1u3PP5NE9GSWgu7ntAP4aDXeiLz6kvRksEiGqawzRU=;
 b=bl6Q8J95sEGaUUesZvV5Te/Y7AchKewykh4TvuSHATtr6mx1DgGdfIeuHolTnmVbsH3XPS
 bITCy4DZxKpbodJoiuyphSE2M0jkQJbJ8TnA6//b+47Xn0r2/6K8ccFDQ51acun8T9aF8V
 Z1QTZ4IRDIfgy4QCmDhVvP7kyDrc+Ps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621940206;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G1u3PP5NE9GSWgu7ntAP4aDXeiLz6kvRksEiGqawzRU=;
 b=goFC0d1ZjW2T0MoZ2EF82eXVfUCnxyIPANc3cCawXHqklcxdKUXmicWISQncec6bYkXtbu
 Tlpe24rlfNpyvrCQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74929AEA3;
 Tue, 25 May 2021 10:56:46 +0000 (UTC)
Date: Tue, 25 May 2021 12:56:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YKzX7FPWGGROn6kR@pevik>
References: <1620372638-25690-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1620372638-25690-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallinfo201: Add a basic test for
 mallinfo2 when setting 2G size
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> Since these members of mallinfo struct use int data type, it will overflow
> when allocating 2G size. mallinfo() is deprecated and we should use mallinfo2()
> in the future. So we test mallinfo2 whether works well.

> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  configure.ac                                  |  1 +
>  runtest/syscalls                              |  2 +
>  .../syscalls/mallinfo/mallinfo_common.h       | 18 +++++++
>  .../kernel/syscalls/mallinfo2/.gitignore      |  1 +
>  testcases/kernel/syscalls/mallinfo2/Makefile  |  8 ++++
>  .../kernel/syscalls/mallinfo2/mallinfo201.c   | 47 +++++++++++++++++++
nit: Maybe rename test: mallinfo201.c => mallinfo2_01.c ?
Now it looks like mallinfo() 201st test.

>  6 files changed, 77 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/mallinfo2/.gitignore
>  create mode 100644 testcases/kernel/syscalls/mallinfo2/Makefile
>  create mode 100644 testcases/kernel/syscalls/mallinfo2/mallinfo201.c

...
> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
> index a00cc7a64..e7737b270 100644
> --- a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
> @@ -28,4 +28,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
>  }
>  #endif

> +#ifdef HAVE_MALLINFO2
> +static inline void print_mallinfo2(const char *msg, struct mallinfo2 *m)
> +{
> +	tst_res(TINFO, "%s...", msg);
> +#define P2(f) tst_res(TINFO, "%s: %ld", #f, m->f)
> +	P2(arena);
> +	P2(ordblks);
> +	P2(smblks);
> +	P2(hblks);
> +	P2(hblkhd);
> +	P2(usmblks);
> +	P2(fsmblks);
> +	P2(uordblks);
> +	P2(fordblks);
> +	P2(keepcost);
> +}
> +#endif

BTW did you copy this from glibc? (and previously in 7eb7a97a1)?
Code is similar as that one in malloc/tst-mallinfo2.c in glibc,
which you modified.

I guess we should also add glibc copyright to mallinfo_common.h
Copyright (C) 2020 Free Software Foundation, Inc.
(+ probably keep our)

...
> diff --git a/testcases/kernel/syscalls/mallinfo2/Makefile b/testcases/kernel/syscalls/mallinfo2/Makefile
> new file mode 100644
> index 000000000..044619fb8
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mallinfo2/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) International Business Machines  Corp., 2001
Here should be your or LTP copyright with 2021.

> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
CFLAGS += -I../mallinfo
(see description below)

> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
...
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mallinfo2/mallinfo201.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic mallinfo2() test. Test the member of struct mallinfo2
> + * whether overflow when setting 2G size. mallinfo() is deprecated
> + * since the type used for the fields is too small. We should use
> + * mallinfo2() and it was added since glibc 2.33.
> + */

I'd format it a bit and remove info which is not related to the test and people
can find in man page.

/*\
 * [DESCRIPTION]
 *
 * Basic mallinfo2() test.
 *
 * Test members of struct mallinfo2() whether overflow when setting 2G size.
 */

> +#include "../mallinfo/mallinfo_common.h"
Please use
#include "mallinfo_common.h"

and add include path to to Makefile
CFLAGS += -I../mallinfo

> +#include "tst_safe_macros.h"
> +
> +#ifdef HAVE_MALLINFO2
> +
> +void test_mallinfo2(void)
> +{
> +	struct mallinfo2 info;
> +	char *buf;
> +	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
> +
> +	buf = malloc(size);
> +	if (!buf) {
> +		tst_res(TCONF, "Current system can not malloc 2G space, skip it");
> +		return;
> +	}
BTW sometimes I wonder if we should have something like SAFE_*() functions which
would result with TCONF, not with TBROK.

> +	info = mallinfo2();
> +	if (info.hblkhd < size) {
> +		print_mallinfo2("Test malloc 2G", &info);
> +		tst_brk(TFAIL, "The member of struct mallinfo2 overflow?");
> +	}
> +	tst_res(TPASS, "The member of struct mallinfo2 doesn't overflow");
> +	free(buf);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = test_mallinfo2,
> +};
> +
> +#else
> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo2()");
> +#endif

The rest LGTM.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
