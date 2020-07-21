Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C82283B2
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 17:25:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A42273C4DCD
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 17:25:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4A78C3C1D32
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 17:25:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C5CE92013C7
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 17:25:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0680BAE2B;
 Tue, 21 Jul 2020 15:25:52 +0000 (UTC)
Date: Tue, 21 Jul 2020 17:26:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Erico Nunes <ernunes@redhat.com>
Message-ID: <20200721152606.GA13733@yuki.lan>
References: <20200720194920.22784-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720194920.22784-1-ernunes@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
> Some syscalls are not available if the kernel is booted using the
> 'lockdown' feature. That can cause some tests to report fail, showing
> a message like:
> 
>   Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7
> 
> This patch adds a function that can be used by tests to check for this
> case, so tests can be skipped rather than reporting a test failure.
> 
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
>  include/tst_lockdown.h |  8 ++++++++
>  include/tst_test.h     |  1 +
>  lib/tst_lockdown.c     | 28 ++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 include/tst_lockdown.h
>  create mode 100644 lib/tst_lockdown.c
> 
> diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
> new file mode 100644
> index 000000000..8db26d943
> --- /dev/null
> +++ b/include/tst_lockdown.h
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#ifndef TST_LOCKDOWN_H
> +#define TST_LOCKDOWN_H
> +
> +void tst_lockdown_skip(void);
> +
> +#endif /* TST_LOCKDOWN_H */
> diff --git a/include/tst_test.h b/include/tst_test.h
> index b84f7b9dd..b02de4597 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -40,6 +40,7 @@
>  #include "tst_hugepage.h"
>  #include "tst_assert.h"
>  #include "tst_cgroup.h"
> +#include "tst_lockdown.h"
>  
>  /*
>   * Reports testcase result.
> diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
> new file mode 100644
> index 000000000..d57a6bdf3
> --- /dev/null
> +++ b/lib/tst_lockdown.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#define TST_NO_DEFAULT_MAIN
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +#include "tst_safe_stdio.h"
> +#include "tst_lockdown.h"
> +
> +void tst_lockdown_skip(void)
> +{
> +	char line[BUFSIZ];
> +	FILE *file;
> +
> +	if (access("/sys/kernel/security/lockdown", F_OK) != 0)
> +		return;
> +
> +	file = SAFE_FOPEN("/sys/kernel/security/lockdown", "r");
> +	fgets(line, sizeof(line), file);

The compiler complains that we haven't checked the return value here I
guess that we can silence it with:

	if (!fgets(line, sizeof(line), file)
		return;

> +	SAFE_FCLOSE(file);
> +
> +	if (strstr(line, "[none]") == NULL)
> +		tst_brk(TCONF, "Kernel is locked down, skip this test.");
> +}
> -- 
> 2.26.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
