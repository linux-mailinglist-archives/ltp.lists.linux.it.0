Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2639EDAD80
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 14:54:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB9483C2354
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 14:54:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3CC443C2348
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 14:54:45 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1C01E1400250
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 14:54:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69506B15B;
 Thu, 17 Oct 2019 12:54:43 +0000 (UTC)
Date: Thu, 17 Oct 2019 14:54:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191017125442.GB31415@rei.lan>
References: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
 <81c89bbde27ede0ef4291df60186bdcd293a3db5.1571219422.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81c89bbde27ede0ef4291df60186bdcd293a3db5.1571219422.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_getoverrun/2-3: increase tolerance for
 overshoot
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
Cc: joerg.vehlow@aox-tech.de, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Joerg reports that test fails on systems with low timer precision (qemu-arm64,
> 4ms timer precision) due to way we calculate maximum number of overruns.
> If the expected overruns is less than 200, there is no tollerance.
> 
> Allow up to ~50ms of extra overruns.
> 
> Reported-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> Acked-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../conformance/interfaces/timer_getoverrun/2-3.c             | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> index 96b7d01e6ffe..66f8b583a5a6 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/2-3.c
> @@ -94,11 +94,17 @@ int main(void)
>  
>  	valuensec = tsres.tv_nsec;
>  	intervalnsec = 2 * valuensec;
> -	//expectedoverruns = (1000000000 - valuensec) / intervalnsec;
>  	expectedoverruns = 1000000000 / intervalnsec - 1;
>  
> +	/*
> +	 * waking up from sleep isn't instant, we can overshoot.
> +	 * Allow up to ~50ms worth of extra overruns.
> +	 */
> +	fudge = 50000000 / intervalnsec + 1;

I wonder if we can measure the sleep with monotonic clock, then we can
be more precise, since we would know how much we overshoot. But it's
probably not worth of complicating the code.

Either way I'm fine with this version as well, acked.

>  	printf("value = %d sec, interval = %d nsec, "
> -	       "expected overruns = %d\n", 1, intervalnsec, expectedoverruns);
> +	       "expected overruns = %d, fudge = %d\n", 1,
> +	       intervalnsec, expectedoverruns, fudge);
>  
>  	its.it_interval.tv_sec = 0;
>  	its.it_interval.tv_nsec = intervalnsec;
> @@ -146,7 +152,6 @@ int main(void)
>  	 * extra expiries after the nanosleep completes so do
>  	 * a range check.
>  	 */
> -	fudge = expectedoverruns / 100;
>  	if (overruns >= expectedoverruns && overruns < expectedoverruns + fudge) {
>  		printf("Test PASSED\n");
>  		return PTS_PASS;
> -- 
> 1.8.3.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
