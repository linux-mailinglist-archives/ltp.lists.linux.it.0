Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69554BF2E2
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:25:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28BEE3C22CD
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:25:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 33A9A3C1A9D
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:25:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AE0BB600AAE
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:25:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 534E4B251;
 Thu, 26 Sep 2019 12:25:47 +0000 (UTC)
Date: Thu, 26 Sep 2019 14:25:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20190926122546.GA27993@rei>
References: <20190925092958.125325-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925092958.125325-1-lkml@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix/conformance/clock/1.1: Deterministic
 timing
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> On some systems the loop with 8 million iterations takes a very long time.
> This patches changes it to busy loop for five seconds.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../conformance/interfaces/clock/1-1.c                 | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
> index 9c48cd979..cce5beea9 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/clock/1-1.c
> @@ -17,20 +17,22 @@
>  #include <time.h>
>  #include <stdio.h>
>  #include <unistd.h>
> +#include <time.h>
>  #include "posixtest.h"
>  
> -#define LARGENUMBER 8000000
> +#define BUSY_LOOP_SECONDS 5
>  int main(void)
>  {
>  	clock_t c1, c2;
>  	double sec1, sec2;
> -	int i;
> +	time_t end;
>  
>  	c1 = clock();
>  	sec1 = c1 / CLOCKS_PER_SEC;
>  
> -	for (i = 0; i < LARGENUMBER; i++) {
> -		// keep busy so CPU time increases
> +	end = time(NULL) + BUSY_LOOP_SECONDS;
> +
> +	while (end >= time(NULL)) {
>  		clock();
>  	}

clock_gettime() with CLOCK_MONOTONIC would be better fit there, since
the wall clock can be changed by ntp and generally is not guaranteed to
be monotonic...

>  
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
