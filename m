Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 229FE14C87D
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:06:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C6FB3C256A
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:06:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 85D5D3C223B
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:06:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 528B1601271
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:06:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 531CBAD82;
 Wed, 29 Jan 2020 10:06:20 +0000 (UTC)
Date: Wed, 29 Jan 2020 11:06:19 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20200129100619.GC21699@rei.lan>
References: <20200128212725.22781-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128212725.22781-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ioctl02.c: check for struct termio
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
>  configure.ac                              |  1 +
>  m4/ltp-termio.m4                          |  6 ++++++
>  testcases/kernel/syscalls/ioctl/ioctl01.c | 20 ++++++++++++--------
>  3 files changed, 19 insertions(+), 8 deletions(-)
>  create mode 100644 m4/ltp-termio.m4
> 
> diff --git a/configure.ac b/configure.ac
> index c7cdff1c4..b860bdacc 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -257,6 +257,7 @@ LTP_CHECK_SYSCALL_QUOTACTL
>  LTP_CHECK_SYSCALL_SIGNALFD
>  LTP_CHECK_SYSCALL_UTIMENSAT
>  LTP_CHECK_TASKSTATS
> +LTP_CHECK_TERMIO
>  LTP_CHECK_TIMERFD
>  test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
>  LTP_CHECK_TPACKET_V3
> diff --git a/m4/ltp-termio.m4 b/m4/ltp-termio.m4
> new file mode 100644
> index 000000000..e745df1d9
> --- /dev/null
> +++ b/m4/ltp-termio.m4
> @@ -0,0 +1,6 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
> +
> +AC_DEFUN([LTP_CHECK_TERMIO],[
> +AC_CHECK_TYPES([struct termio],,,[#include <sys/ioctl.h>])
> +])

What about we add a fallback defition of the structure into
lapi/termio.h instead of disabling the test?

That way we would be able to test the kernel even if the userspace
headers were missing...

#include "config.h"

#ifndef HAVE_STRUCT_TERMIO
struct termio {
...
}
#ifdef

Should be enough to be able to compile that test, right?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
