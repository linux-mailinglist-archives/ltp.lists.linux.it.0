Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B041FCD6E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 14:30:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD55C3C2CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 14:30:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9F4BF3C2CA7
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 14:30:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 42818600974
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 14:29:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D786AFE8;
 Wed, 17 Jun 2020 12:30:18 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:30:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200617123029.GC8389@yuki.lan>
References: <c5428a9c88d18fac80e364281cfd4e3aefa38d2c.1590130423.git.viresh.kumar@linaro.org>
 <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c47220ecab3c7570f5387cd71894c977009ad3d8.1590572545.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 5/6] syscalls: Don't pass struct timespec to
 tst_syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3:
> - Run the syscalls at least once to verify they are supported by the
>   hardware.
> 
>  lib/tst_clocks.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index 2eaa73b11abe..ddf54b903133 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -7,23 +7,107 @@
>  
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
> +#include "tst_timer.h"
>  #include "tst_clocks.h"
>  #include "lapi/syscalls.h"
>  #include "lapi/posix_clocks.h"
>  
> +typedef int (*mysyscall)(clockid_t clk_id, void *ts);
> +
> +int syscall_supported_by_kernel(mysyscall func)
> +{
> +	int ret;
> +
> +	ret = func(0, NULL);
> +	if (ret == ENOSYS)
> +		return 0;

I guess that we will get -1 here and errno == ENOSYS instead since the
tst_syscall() calls syscall() that passes the error in errno.

> +	return 1;
> +}
> +
>  int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>  {
> -	return tst_syscall(__NR_clock_getres, clk_id, res);
> +	static struct tst_ts tts = { 0, };
> +	static mysyscall func;
> +	int ret;
> +
> +#if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
> +	if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
> +		func = sys_clock_getres64;
> +		tts.type = TST_KERN_TIMESPEC;
> +	}
> +#endif
> +
> +	if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
> +		func = sys_clock_getres;
> +		tts.type = TST_KERN_OLD_TIMESPEC;
> +	}
> +
> +	if (!func) {
> +		tst_res(TCONF, "clock_getres() not available");
> +		return ENOSYS;

Here as well, the callers expects the error in errno, so we have to set
the errno to ENOSYS and return -1 instead.

> +	}
> +
> +	ret = func(clk_id, tst_ts_get(&tts));
> +	res->tv_sec = tst_ts_get_sec(tts);
> +	res->tv_nsec = tst_ts_get_nsec(tts);
> +	return ret;
>  }
>  
>  int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>  {
> -	return tst_syscall(__NR_clock_gettime, clk_id, ts);
> +	struct tst_ts tts = { 0, };
> +	static mysyscall func;
> +	int ret;
> +
> +#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
> +	if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
> +		func = sys_clock_gettime64;
> +		tts.type = TST_KERN_TIMESPEC;
> +	}
> +#endif
> +
> +	if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
> +		func = sys_clock_gettime;
> +		tts.type = TST_KERN_OLD_TIMESPEC;
> +	}
> +
> +	if (!func) {
> +		tst_res(TCONF, "clock_gettime() not available");
> +		return ENOSYS;

Here as well.

> +	}
> +
> +	ret = func(clk_id, tst_ts_get(&tts));
> +	ts->tv_sec = tst_ts_get_sec(tts);
> +	ts->tv_nsec = tst_ts_get_nsec(tts);
> +	return ret;
>  }
>
>  int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
>  {
> -	return tst_syscall(__NR_clock_settime, clk_id, ts);
> +	struct tst_ts tts = { 0, };
> +	static mysyscall func;
> +
> +#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
> +	if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
> +		func = sys_clock_settime64;
> +		tts.type = TST_KERN_TIMESPEC;
> +	}
> +#endif
> +
> +	if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
> +		func = sys_clock_settime;
> +		tts.type = TST_KERN_OLD_TIMESPEC;
> +	}
> +
> +	if (!func) {
> +		tst_res(TCONF, "clock_settime() not available");
> +		return ENOSYS;

And here.

> +	}
> +
> +	tst_ts_set_sec(&tts, ts->tv_sec);
> +	tst_ts_set_nsec(&tts, ts->tv_nsec);
> +	return func(clk_id, tst_ts_get(&tts));
>  }


Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
