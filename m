Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02F17E04D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 13:32:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 232E93C6121
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 13:32:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A5A943C6106
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 13:32:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0E327600C6B
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 13:32:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C516ACD6
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 12:32:52 +0000 (UTC)
References: <20200305134834.16736-1-chrubis@suse.cz>
 <20200305134834.16736-5-chrubis@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20200305134834.16736-5-chrubis@suse.cz>
Date: Mon, 09 Mar 2020 13:32:52 +0100
Message-ID: <87k13tg13f.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/8] syscalls/sysinfo03: Add time namespace test
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

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> This tests that the uptime in sysinfo() is adjusted correctly by the
> namespace offset.
>
> Also check that /proc/uptime is consistent with the uptime from the
> sysinfo() syscall.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/containers                            |  3 +
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/sysinfo/.gitignore  |  1 +
>  testcases/kernel/syscalls/sysinfo/sysinfo03.c | 78 +++++++++++++++++++
>  4 files changed, 83 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/sysinfo/sysinfo03.c
>
> diff --git a/runtest/containers b/runtest/containers
> index 871cd2a42..4dc05af93 100644
> --- a/runtest/containers
> +++ b/runtest/containers
> @@ -85,3 +85,6 @@ userns04 userns04
>  userns05 userns05
>  userns06 userns06
>  userns07 userns07
> +
> +# time namespaces
> +sysinfo03 sysinfo03
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 06d96470c..34bd5c3da 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1441,6 +1441,7 @@ sysfs06 sysfs06
>  
>  sysinfo01 sysinfo01
>  sysinfo02 sysinfo02
> +sysinfo03 sysinfo03
>  
>  syslog01 syslog01
>  syslog02 syslog02
> diff --git a/testcases/kernel/syscalls/sysinfo/.gitignore b/testcases/kernel/syscalls/sysinfo/.gitignore
> index aa7c26946..8ad2279a4 100644
> --- a/testcases/kernel/syscalls/sysinfo/.gitignore
> +++ b/testcases/kernel/syscalls/sysinfo/.gitignore
> @@ -1,2 +1,3 @@
>  /sysinfo01
>  /sysinfo02
> +/sysinfo03
> diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> new file mode 100644
> index 000000000..979e6e0a7
> --- /dev/null
> +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> +  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +/*
> +
> +  Test if CLOCK_BOOTTIME namespace offset is applied to sysinfo uptime and that
> +  it's consistent with /proc/uptime as well.
> +
> +  After a call to unshare(CLONE_NEWTIME) a new timer namespace is created, the
> +  process that has called the unshare() can adjust offsets for CLOCK_MONOTONIC
> +  and CLOCK_BOOTTIME for its children by writing to the '/proc/self/timens_offsets'.
> +
> + */
> +
> +#include <sys/sysinfo.h>
> +#include "lapi/namespaces_constants.h"
> +#include "tst_test.h"
> +
> +static int offsets[] = {
> +	10,
> +	-10,
> +	3600,
> +};
> +
> +static long read_proc_uptime(void)
> +{
> +	long sec, sec_rem;
> +
> +	SAFE_FILE_SCANF("/proc/uptime", "%li.%li", &sec, &sec_rem);
> +
> +	return sec + (sec_rem ? 1 : 0);
> +}
> +
> +static void verify_sysinfo(unsigned int n)
> +{
> +	struct sysinfo si;
> +	long uptime;
> +	int off = offsets[n];
> +
> +	SAFE_UNSHARE(CLONE_NEWTIME);
> +
> +        SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
> +	                 CLOCK_BOOTTIME, off);
> +
> +	sysinfo(&si);
> +
> +	uptime = si.uptime;
> +
> +	if (!SAFE_FORK()) {
> +		sysinfo(&si);
> +		long proc_uptime = read_proc_uptime();
> +
> +		long diff = si.uptime - uptime;
> +
> +		if (diff < off || diff > off + 1)
> +			tst_res(TFAIL, "Wrong sysinfo uptime offset %li", diff);
> +		else
> +			tst_res(TPASS, "Correct sysinfo uptime offset %i", off);
> +
> +		if (si.uptime < proc_uptime || si.uptime > proc_uptime + 1) {
> +			tst_res(TFAIL, "/proc/uptime %li differs from sysinfo %li",
> +			        proc_uptime, si.uptime);
> +		} else {
> +			tst_res(TPASS, "/proc/uptime is consistent with sysinfo");
> +		}
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(offsets),
> +	.test = verify_sysinfo,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_TIME_NS=y"
> +	}
> +};

Will you add a git ref when the fix is in mainline/for-next?

Should be safe to add it as soon as it is in the for-next tree.

> -- 
> 2.23.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
