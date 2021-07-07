Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6203BE4BC
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:52:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81E663C68B9
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:52:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B544E3C6862
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:52:49 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 015CA1401126
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:52:48 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A98719F7F3;
 Wed,  7 Jul 2021 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625647967; bh=219F83duieyOLQXVjCuRO74Iq0HUuczlPHfogl5Iq30=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=YsYkrWJ6S29GJJiz1SFVtlljQnAieSLiwgP4ppdfAUvpAY/Qe0JrV4vcIjNFgTa5O
 wXWQcv1Zodk5uKKENzFNZQo5xGEHVCQ8ujCR/u0YOB0oIQbvX7GK/JavIu9EtvA5X1
 1jPtsmm35F5pg/IGVdOLqg0bdWbkDHZBGDQpz53U=
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210706142325.11347-1-rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <ce948ff6-4115-338c-7990-d27df8658534@jv-coder.de>
Date: Wed, 7 Jul 2021 10:52:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706142325.11347-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

On 7/6/2021 4:23 PM, Richard Palethorpe via ltp wrote:
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   runtest/syscalls                           |  1 +
>   testcases/kernel/syscalls/wait4/.gitignore |  1 +
>   testcases/kernel/syscalls/wait4/wait403.c  | 40 ++++++++++++++++++++++
>   3 files changed, 42 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/wait4/wait403.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 98fe3c02e..128eaadd2 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1663,6 +1663,7 @@ wait02 wait02
>   
>   wait401 wait401
>   wait402 wait402
> +wait403 wait403
>   
>   waitpid01 waitpid01
>   waitpid02 waitpid02
> diff --git a/testcases/kernel/syscalls/wait4/.gitignore b/testcases/kernel/syscalls/wait4/.gitignore
> index 9313eb72c..577f73479 100644
> --- a/testcases/kernel/syscalls/wait4/.gitignore
> +++ b/testcases/kernel/syscalls/wait4/.gitignore
> @@ -1,2 +1,3 @@
>   /wait401
>   /wait402
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
Could this use INT_MIN instead of the literal value? If not a comment 
would be nice, especially because there is already wait4(INT_MIN, ...) 
in the description.
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "dd83c161fbcc"},
> +	}
> +};

Otherwise:

Acked-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>


Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
