Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B77A6C6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 13:21:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F39063C1D65
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 13:21:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 099E83C194D
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 13:21:22 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CEA48140007F
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 13:21:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 212A2AD3A;
 Tue, 30 Jul 2019 11:21:21 +0000 (UTC)
Date: Tue, 30 Jul 2019 13:21:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190730112120.GA10214@rei.lan>
References: <1564363652-3975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564363652-3975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/nanosleep03: remove duplicated
 nanosleep03
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
> diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep01.c b/testcases/kernel/syscalls/nanosleep/nanosleep01.c
> index 96e1cf1b4..418f86565 100644
> --- a/testcases/kernel/syscalls/nanosleep/nanosleep01.c
> +++ b/testcases/kernel/syscalls/nanosleep/nanosleep01.c
> @@ -1,21 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-or-lat
                                             ^
					   later
>  /*
>   * Copyright (c) International Business Machines  Corp., 2001
>   *  07/2001 Ported by Wayne Boyer
>   * Copyright (C) 2015-2017 Cyril Hrubis <chrubis@suse.cz>
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program;  if not, write to the Free Software Foundation,
> - * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
>  
>  /*
> @@ -25,7 +12,6 @@
>   */
>  
>  #include <errno.h>
> -
>  #include "tst_timer_test.h"
>  
>  int sample_fn(int clk_id, long long usec)
> diff --git a/testcases/kernel/syscalls/nanosleep/nanosleep02.c b/testcases/kernel/syscalls/nanosleep/nanosleep02.c
> index 8bd2c44c4..20a93d3b6 100644
> --- a/testcases/kernel/syscalls/nanosleep/nanosleep02.c
> +++ b/testcases/kernel/syscalls/nanosleep/nanosleep02.c
> @@ -10,6 +10,9 @@
>   *  Verify that nanosleep() will be successful to suspend the execution
>   *  of a process, returns after the receipt of a signal and writes the
>   *  remaining sleep time into the structure.
> + *
> + *  This test also verifies that if the call is interrupted by a signal
> + *  handler, nanosleep() returns -1, sets errno to EINTR.
>   */
>  
>  #include <errno.h>
> @@ -39,11 +42,13 @@ static void do_child(void)
>  	TEST(nanosleep(&timereq, &timerem));
>  	tst_timer_stop();
>  
> -	if (!TST_RET)
> +	if (TST_RET != -1)
>  		tst_brk(TBROK, "nanosleep was not interrupted");

We should probably print the TST_RET after this change.

>  	if (TST_ERR != EINTR)
>  		tst_brk(TBROK | TTERRNO, "nanosleep() failed");

And I guess that we should change these two messages to tst_res(TFAIL,
followed by return;

> +	tst_res(TPASS, "nanosleep() returned -1, set errno to EINTER");
> +
>  	if (tst_timespec_lt(timereq, tst_timer_elapsed()))
>  		tst_brk(TFAIL, "nanosleep() slept more than timereq");
>  

Other than these minor issues the patch is OK.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
