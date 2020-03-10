Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F7E17F710
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 13:06:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 620263C6027
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 13:06:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9CF823C0428
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 13:06:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE2DC601EEF
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 13:06:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A926AE2E
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 12:06:45 +0000 (UTC)
References: <20200305134834.16736-1-chrubis@suse.cz>
 <20200305134834.16736-8-chrubis@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20200305134834.16736-8-chrubis@suse.cz>
Date: Tue, 10 Mar 2020 13:06:44 +0100
Message-ID: <87eeu0fm7f.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/8] containers/timens: Add basic error test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Cyril Hrubis <chrubis@suse.cz> writes:

> Add basic error handling test for the /proc/$PID/timens_offsets file.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/containers                            |  1 +
>  testcases/kernel/containers/timens/.gitignore |  1 +
>  testcases/kernel/containers/timens/Makefile   |  6 ++
>  testcases/kernel/containers/timens/timens01.c | 75 +++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 testcases/kernel/containers/timens/.gitignore
>  create mode 100644 testcases/kernel/containers/timens/Makefile
>  create mode 100644 testcases/kernel/containers/timens/timens01.c
>
> diff --git a/runtest/containers b/runtest/containers
> index 1006d8d35..23e4a533d 100644
> --- a/runtest/containers
> +++ b/runtest/containers
> @@ -90,3 +90,4 @@ userns07 userns07
>  sysinfo03 sysinfo03
>  clock_nanosleep03 clock_nanosleep03
>  clock_gettime03 clock_gettime03
> +timens01 timens01
> diff --git a/testcases/kernel/containers/timens/.gitignore b/testcases/kernel/containers/timens/.gitignore
> new file mode 100644
> index 000000000..bcd2dd9dd
> --- /dev/null
> +++ b/testcases/kernel/containers/timens/.gitignore
> @@ -0,0 +1 @@
> +timens01
> diff --git a/testcases/kernel/containers/timens/Makefile b/testcases/kernel/containers/timens/Makefile
> new file mode 100644
> index 000000000..5ea7d67db
> --- /dev/null
> +++ b/testcases/kernel/containers/timens/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/containers/timens/timens01.c b/testcases/kernel/containers/timens/timens01.c
> new file mode 100644
> index 000000000..08bc449f9
> --- /dev/null
> +++ b/testcases/kernel/containers/timens/timens01.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> +
> +  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> +
> + */
> +/*
> +
> +  Basic test for timens_offsets error handling.
> +
> +  After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
> +  process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
> +  and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.
> +
> + */
> +
> +#define _GNU_SOURCE
> +#include "lapi/setns.h"
> +#include "lapi/namespaces_constants.h"
> +#include "lapi/posix_clocks.h"
> +#include "tst_test.h"
> +
> +static struct tcase {
> +	const char *offsets;
> +	int exp_err;
> +} tcases[] = {
> +	/* obvious garbage */

You could include these comments in the struct and print them.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
