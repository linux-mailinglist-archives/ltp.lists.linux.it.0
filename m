Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD01D2BAD
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:43:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB4223C25E8
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 11:43:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8AEA93C13DA
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:43:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D60691401996
 for <ltp@lists.linux.it>; Thu, 14 May 2020 11:43:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A272CAF0D;
 Thu, 14 May 2020 09:43:54 +0000 (UTC)
Date: Thu, 14 May 2020 11:44:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200514094421.GA18592@yuki.lan>
References: <addb718d24b6a32853bfc9fc6f47833b253fc719.1589434662.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <addb718d24b6a32853bfc9fc6f47833b253fc719.1589434662.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: Fix issues around calling syscalls
 with old timespec
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
> The non _time64 syscalls can only be called with the old timespec and
> calling them with the libc timespec or the new kernel timespec is
> incorrect.
> 
> Similarly, calling the libc interfaces with the old timespec is
> incorrect as well and they should be called only with the libc timespec.
> 
> This patch updates various testcases that have got this issue.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2:
> - Don't declare __kernel_old_time_t and again.
> 
>  .../syscalls/clock_adjtime/clock_adjtime.h    | 57 +++++++++++++++----
>  .../syscalls/clock_adjtime/clock_adjtime01.c  | 11 +---
>  .../syscalls/clock_adjtime/clock_adjtime02.c  | 11 +---
>  .../syscalls/clock_getres/clock_getres01.c    | 17 ++----
>  .../syscalls/clock_gettime/clock_gettime01.c  | 11 +---
>  .../syscalls/clock_gettime/clock_gettime02.c  | 12 +---
>  .../syscalls/clock_gettime/clock_gettime03.c  | 11 +---
>  .../clock_nanosleep/clock_nanosleep01.c       | 11 +---
>  .../clock_nanosleep/clock_nanosleep03.c       | 11 +---
>  .../clock_nanosleep/clock_nanosleep04.c       | 11 +---
>  .../syscalls/clock_settime/clock_settime01.c  | 11 +---
>  .../syscalls/clock_settime/clock_settime02.c  | 12 +---
>  12 files changed, 82 insertions(+), 104 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> index e4cf80fa8bcc..9dd6c1f349c1 100644
> --- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> +++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> @@ -14,9 +14,46 @@
>  #include <pwd.h>
>  #include <sys/timex.h>
>  #include <sys/types.h>
> +#include <asm/posix_types.h>
>  #include "lapi/timex.h"
>  
>  #ifndef __kernel_timex
> +struct __kernel_old_timeval {
> +	__kernel_old_time_t	tv_sec;		/* seconds */
> +	__kernel_suseconds_t	tv_usec;	/* microseconds */
> +};
> +
> +struct __kernel_old_timex {
> +	unsigned int modes;	/* mode selector */
> +	__kernel_long_t offset;	/* time offset (usec) */
> +	__kernel_long_t freq;	/* frequency offset (scaled ppm) */
> +	__kernel_long_t maxerror;/* maximum error (usec) */
> +	__kernel_long_t esterror;/* estimated error (usec) */
> +	int status;		/* clock command/status */
> +	__kernel_long_t constant;/* pll time constant */
> +	__kernel_long_t precision;/* clock precision (usec) (read only) */
> +	__kernel_long_t tolerance;/* clock frequency tolerance (ppm)
> +				   * (read only)
> +				   */
> +	struct timeval time;	/* (read only, except for ADJ_SETOFFSET) */

This is still libc struct timeval, should be this the
__kernel_old_timeval instead?

Other than this the patch looks obviously fine and also should be
applied before the release.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
