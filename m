Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C067039
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 15:38:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56A8D3C1D00
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 15:38:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 59B4C3C1CA0
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 15:38:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4272960CB86
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 15:38:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02984AEFB;
 Fri, 12 Jul 2019 13:38:49 +0000 (UTC)
Date: Fri, 12 Jul 2019 15:38:49 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20190712133849.GB14566@rei>
References: <20190712102409.12906-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712102409.12906-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioprio: Add test cases for I/O priority
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
> The ioprio_get/ioprio_set syscalls are used primarily by the
> userspace tool "ionice" to set priority of a process, user or
> process group toward the I/O (block layer) scheduler.
> 
> This adds a simple iprio_get test and two more verbose tests
> for ioprio_set.
> 
> Cc: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I never did LTP work before. Reviews appreciated.
> If this proves worthwhile I will add test cases for
> real-time and other scheduling requireing root access
> and possibly look into testing user or process group
> scheduling as well.
> ---
>  testcases/kernel/syscalls/ioprio/.gitignore   |   1 +
>  testcases/kernel/syscalls/ioprio/Makefile     |  22 +++
>  testcases/kernel/syscalls/ioprio/ioprio.h     |  44 +++++
>  .../kernel/syscalls/ioprio/ioprio_get01.c     |  72 ++++++++
>  .../kernel/syscalls/ioprio/ioprio_set01.c     | 123 +++++++++++++
>  .../kernel/syscalls/ioprio/ioprio_set02.c     | 166 ++++++++++++++++++
>  6 files changed, 428 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ioprio/.gitignore
>  create mode 100644 testcases/kernel/syscalls/ioprio/Makefile
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio.h
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_get01.c
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set01.c
>  create mode 100644 testcases/kernel/syscalls/ioprio/ioprio_set02.c
> 
> diff --git a/testcases/kernel/syscalls/ioprio/.gitignore b/testcases/kernel/syscalls/ioprio/.gitignore
> new file mode 100644
> index 000000000000..fc1c236053a4
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/.gitignore
> @@ -0,0 +1 @@
> +/ioprio_get01.c
        ^
This looks like a mistake.

> diff --git a/testcases/kernel/syscalls/ioprio/ioprio_get01.c b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> new file mode 100644
> index 000000000000..62183ebcf856
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioprio/ioprio_get01.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Linaro Limited
> + */
> +#include <sys/types.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +
> +#include "test.h"

So first of all you have picked the deprecated test library that is kept
around only for old tests that haven't been converted to the new library
yet.

Have a look at:

https://github.com/linux-test-project/ltp/wiki/C-Test-Case-Tutorial
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
