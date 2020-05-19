Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BF1D9627
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:21:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 934243C4E6B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:21:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 596EC3C3032
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:21:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D3AC81A0091A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:21:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD5C4AE53;
 Tue, 19 May 2020 12:21:29 +0000 (UTC)
Date: Tue, 19 May 2020 14:21:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200519122155.GB16008@yuki.lan>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
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
> There are compatibility issues here as we are calling the direct
> syscalls with the "struct timespec" (which is a libc definition). We
> must use struct __kernel_old_timespec instead.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/tst_clocks.h          |  8 +++++---
>  lib/tst_clocks.c              |  6 +++---
>  lib/tst_test.c                | 16 ++++++++--------
>  lib/tst_timer.c               | 23 +++++++++++++++--------
>  lib/tst_timer_test.c          |  2 +-
>  lib/tst_wallclock.c           | 17 +++++++++--------
>  testcases/cve/cve-2016-7117.c |  2 +-
>  7 files changed, 42 insertions(+), 32 deletions(-)
> 
> diff --git a/include/tst_clocks.h b/include/tst_clocks.h
> index 80030c6b0c68..bb149acd2f83 100644
> --- a/include/tst_clocks.h
> +++ b/include/tst_clocks.h
> @@ -9,11 +9,13 @@
>  #ifndef TST_CLOCKS__
>  #define TST_CLOCKS__
>  
> -int tst_clock_getres(clockid_t clk_id, struct timespec *res);
> +struct __kernel_old_timespec;
>  
> -int tst_clock_gettime(clockid_t clk_id, struct timespec *ts);
> +int tst_clock_getres(clockid_t clk_id, struct __kernel_old_timespec *res);
>  
> -int tst_clock_settime(clockid_t clk_id, struct timespec *ts);
> +int tst_clock_gettime(clockid_t clk_id, struct __kernel_old_timespec *ts);
> +
> +int tst_clock_settime(clockid_t clk_id, struct __kernel_old_timespec *ts);
>  
>  /*
>   * Converts clock id to a readable name.
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index 2eaa73b11abe..8d8c2f7666fa 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -11,17 +11,17 @@
>  #include "lapi/syscalls.h"
>  #include "lapi/posix_clocks.h"
>  
> -int tst_clock_getres(clockid_t clk_id, struct timespec *res)
> +int tst_clock_getres(clockid_t clk_id, struct __kernel_old_timespec *res)
>  {
>  	return tst_syscall(__NR_clock_getres, clk_id, res);
>  }
>  
> -int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
> +int tst_clock_gettime(clockid_t clk_id, struct __kernel_old_timespec *ts)
>  {
>  	return tst_syscall(__NR_clock_gettime, clk_id, ts);
>  }
>  
> -int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
> +int tst_clock_settime(clockid_t clk_id, struct __kernel_old_timespec *ts)
>  {
>  	return tst_syscall(__NR_clock_settime, clk_id, ts);
>  }

These functions are supposed to be library-internal and were added so
that we do not have to link everything in LTP with -lrt, which is needed
for the clock_gettime() functions on older glibc.

So we can as well so that they take the tst_ts structure, then we are
also free to change the way the timestamp is acquired without the need
to change all the callers.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
