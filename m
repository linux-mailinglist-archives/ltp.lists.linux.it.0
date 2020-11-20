Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6052BA72B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 11:15:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B52A3C5F4A
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 11:15:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 991643C2DED
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 11:15:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E88B2009A1
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 11:15:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EF29AC23;
 Fri, 20 Nov 2020 10:15:32 +0000 (UTC)
Date: Fri, 20 Nov 2020 11:16:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201120101622.GA4910@yuki.lan>
References: <20201119153116.GA18048@yuki.lan>
 <1605842193-10828-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605842193-10828-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/ptrace11: Add test for tracing init
 process
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
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * Before kernel 2.6.26, we can't trace init(1) process and ptrace() will
> + * get EPERM error. This case just check whether we can trace init(1)
> + * process and doesn't trigger error.
> + */

I've reformatted this comment so that it's picked up by documentation
parser.

> +#include <errno.h>
> +#include <signal.h>
> +#include <sys/wait.h>
> +#include <pwd.h>
> +#include <config.h>
> +#include <stdlib.h>
> +#include "ptrace.h"
> +#include "tst_test.h"
> +
> +static void verify_ptrace(void)
> +{
> +	TEST(ptrace(PTRACE_ATTACH, 1, NULL, NULL));
> +	if (TST_RET == 0)
> +		tst_res(TPASS, "ptrace() traces init process successfully");
> +	else
> +		tst_res(TFAIL | TTERRNO,
> +			"ptrace() returns %ld, failed unexpectedly", TST_RET);
> +
> +	/*
> +	 * As ptrace(2) man-page said, when using PTRACE_ATTACH option, the
> +	 * tracee is sent a SIGSTOP, but will not necessarily have stopped
> +	 * by the completion of this call. Use waitpid(2) to wait for the
> +	 * tracee into stop. Otherwise it may get ESRCH error.
> +	 * As waitpid(2) man-pages said, status for traced children which have
> +	 * stopped is provided even if WUNTRACED option is not specified.
> +	 * So using 0 option is enough.
> +	 */

Simplified this comment.


And pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
