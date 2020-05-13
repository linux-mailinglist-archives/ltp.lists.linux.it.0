Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C1A1D116D
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 13:33:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51EFC3C5503
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 13:33:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 01F643C54D6
 for <ltp@lists.linux.it>; Wed, 13 May 2020 13:33:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ACE09601085
 for <ltp@lists.linux.it>; Wed, 13 May 2020 13:33:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53EE9AD2A;
 Wed, 13 May 2020 11:33:23 +0000 (UTC)
Date: Wed, 13 May 2020 13:33:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200513113318.GA25472@dell5510>
References: <437d6fd3926de4c801ae0edb2379c6afafcb34d4.1589190284.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <437d6fd3926de4c801ae0edb2379c6afafcb34d4.1589190284.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Fix issues around calling syscalls with
 old timespec
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

checking for __kernel_timespec, which defined in include/tst_timer.h should fix
it, but we might need some more elegant solution (have that depende

diff --git testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
index 42e4c699c..c246f84bb 100644
--- testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
+++ testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
@@ -17,7 +17,7 @@
 #include <asm/posix_types.h>
 #include "lapi/timex.h"
 
-#ifndef __kernel_timex
+#ifndef __kernel_timespec
 #if defined(__x86_64__) && defined(__ILP32__)
 typedef long long __kernel_long_t;
 #else

> +++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
> @@ -14,9 +14,54 @@
>  #include <pwd.h>
>  #include <sys/timex.h>
>  #include <sys/types.h>
> +#include <asm/posix_types.h>
>  #include "lapi/timex.h"

Thanks! On a first look LGTM.
Unfortunately, there is failure on Centos 6 (gcc 4):

https://travis-ci.org/github/pevik/ltp/jobs/686519604

/usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:24: error: redefinition of typedef '__kernel_long_t'
/usr/src/ltp/include/tst_timer.h:99: note: previous declaration of '__kernel_long_t' was here
/usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:27: error: redefinition of typedef '__kernel_old_time_t'
/usr/src/ltp/include/tst_timer.h:102: note: previous declaration of '__kernel_old_time_t' was here
make[4]: *** [clock_adjtime01] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from /usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime02.c:58:
/usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h: At top level:
/usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:24: error: redefinition of typedef '__kernel_long_t'
/usr/src/ltp/include/tst_timer.h:99: note: previous declaration of '__kernel_long_t' was here
/usr/src/ltp/testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h:27: error: redefinition of typedef '__kernel_old_time_t'
/usr/src/ltp/include/tst_timer.h:102: note: previous declaration of '__kernel_old_time_t' was here
make[4]: *** [clock_adjtime02] Error 1
make[4]: Leaving directory `/usr/src/ltp-build/testcases/kernel/syscalls/clock_adjtime'

>  #ifndef __kernel_timex
> +#if defined(__x86_64__) && defined(__ILP32__)
> +typedef long long __kernel_long_t;
> +#else
> +typedef long __kernel_long_t;
> +#endif
> +
> +typedef __kernel_long_t	__kernel_old_time_t;

It's caused by this fallback definition ^, which is already in
include/tst_timer.h. Simple deleting it should fix the problem

Kind regards,
Petr

diff --git testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
index 42e4c699c..9849d83e3 100644
--- testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
+++ testcases/kernel/syscalls/clock_adjtime/clock_adjtime.h
@@ -18,13 +18,6 @@
 #include "lapi/timex.h"
 
 #ifndef __kernel_timex
-#if defined(__x86_64__) && defined(__ILP32__)
-typedef long long __kernel_long_t;
-#else
-typedef long __kernel_long_t;
-#endif
-
-typedef __kernel_long_t	__kernel_old_time_t;
 
 struct __kernel_old_timeval {
 	__kernel_old_time_t	tv_sec;		/* seconds */

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
