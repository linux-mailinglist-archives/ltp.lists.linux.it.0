Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0163BE3F1
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:52:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4F7B3C6878
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:52:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEF463C6843
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:52:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 372A11000F54
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:52:05 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9FE4622234;
 Wed,  7 Jul 2021 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625644324;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wnozwW1Sow5qMEKlQvKTYeTT361uYpkl6N/7pYQK34Q=;
 b=kRekuMu0beX6rFOvB0BfH17PA2sDoI7HTjYH0oLmB/sBMhzbJ5NmTHVTVrqkkYvy8cFYrK
 O7rkdoRIlYe2SOIqjhaAlqgK/NEBUsVZC3eAcv5eeA8E3Q5Nx3r69H5D4uJYfh+dUH4qTU
 QJgzLTMaTb+V0BOYRr1NqWiGlaqydzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625644324;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wnozwW1Sow5qMEKlQvKTYeTT361uYpkl6N/7pYQK34Q=;
 b=4QJuVJ5CBtO4Sbu7nMexBYdznvc9gsjDWBbWONcXkSwI97BOrKQtm6B43hyAR/AgjpdcDR
 lo+GTacbpN2syjCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 61224A3B8A;
 Wed,  7 Jul 2021 07:52:04 +0000 (UTC)
References: <20210706142325.11347-1-rpalethorpe@suse.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20210706142325.11347-1-rpalethorpe@suse.com>
Date: Wed, 07 Jul 2021 08:52:03 +0100
Message-ID: <87im1m7e8s.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] wait403: Reproduce undefined INT_MIN negation
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
Reply-To: rpalethorpe@suse.de
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Richard Palethorpe <rpalethorpe@suse.com> writes:

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Fixes: https://github.com/linux-test-project/ltp/issues/322

> ---
>  runtest/syscalls                           |  1 +
>  testcases/kernel/syscalls/wait4/.gitignore |  1 +
>  testcases/kernel/syscalls/wait4/wait403.c  | 40 ++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/wait4/wait403.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 98fe3c02e..128eaadd2 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1663,6 +1663,7 @@ wait02 wait02
>  
>  wait401 wait401
>  wait402 wait402
> +wait403 wait403
>  
>  waitpid01 waitpid01
>  waitpid02 waitpid02
> diff --git a/testcases/kernel/syscalls/wait4/.gitignore b/testcases/kernel/syscalls/wait4/.gitignore
> index 9313eb72c..577f73479 100644
> --- a/testcases/kernel/syscalls/wait4/.gitignore
> +++ b/testcases/kernel/syscalls/wait4/.gitignore
> @@ -1,2 +1,3 @@
>  /wait401
>  /wait402
> +/wait403
> diff --git a/testcases/kernel/syscalls/wait4/wait403.c b/testcases/kernel/syscalls/wait4/wait403.c
> new file mode 100644
> index 000000000..262351b7c
> --- /dev/null
> +++ b/testcases/kernel/syscalls/wait4/wait403.c
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
> + */
> +
> +/*
> + * [Description]
> + *
> + * Check wait4(INT_MIN, ...) is not allowed. The pid is negated before
> + * searching for a group with that pid. Negating INT_MIN is not
> + * defined so UBSAN will be triggered if enabled.
> + *
> + * If the bug is present, but UBSAN is not enabled, then it should
> + * result in ECHILD.
> + */
> +
> +#include <stdlib.h>
> +#include <errno.h>
> +#define _USE_BSD
> +#include <sys/types.h>
> +#include <sys/resource.h>
> +#include <sys/wait.h>
> +#include "tst_test.h"
> +
> +static void run(void)
> +{
> +	int status = 1;
> +	struct rusage rusage;
> +
> +	TST_EXP_FAIL2(wait4(-2147483648, &status, 0, &rusage), ESRCH,
> +		      "wait4 fails with ESRCH");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "dd83c161fbcc"},

Possibly needs {}

> +	}
> +};


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
