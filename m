Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9884B1D962D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:23:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6850D3C4E69
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 14:23:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0455A3C1811
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:23:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A1F820090F
 for <ltp@lists.linux.it>; Tue, 19 May 2020 14:23:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 164E2ACF3;
 Tue, 19 May 2020 12:23:22 +0000 (UTC)
Date: Tue, 19 May 2020 14:23:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200519122347.GC16008@yuki.lan>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f3b7d669d47ae701385b43deb8280a353dd231e.1589877853.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: Don't use tst_syscall()
 unnecessarily
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
> These syscall are old enough and must have support in libc for everyone.
> Don't use tst_syscall() for them unnecessarily.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  lib/parse_opts.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/parse_opts.c b/lib/parse_opts.c
> index a9d50589a3f9..b3ab69c0a539 100644
> --- a/lib/parse_opts.c
> +++ b/lib/parse_opts.c
> @@ -45,7 +45,6 @@
>  #include "test.h"
>  #include "ltp_priv.h"
>  #include "usctest.h"
> -#include "tst_clocks.h"
>  
>  #ifndef UNIT_TEST
>  #define UNIT_TEST	0
> @@ -472,7 +471,7 @@ static uint64_t get_current_time(void)
>  {
>  	struct timespec ts;
>  
> -	tst_clock_gettime(CLOCK_MONOTONIC, &ts);
> +	clock_gettime(CLOCK_MONOTONIC, &ts);

I guess that this will reintroduce LTP compilation failures on older
glibc, which was the primary reason we used the tst_clock_gettime()
instead of clock_gettime().

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
