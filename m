Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67498751A9
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 16:45:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2800B3C1CDE
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 16:45:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3C7D13C104D
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 16:45:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 54DFA600665
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 16:45:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26389ADD1;
 Thu, 25 Jul 2019 14:45:52 +0000 (UTC)
Date: Thu, 25 Jul 2019 16:45:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
Message-ID: <20190725144450.GB24513@rei.lan>
References: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
 <1563992624-4968-3-git-send-email-piotr.krzysztof.gawel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563992624-4968-3-git-send-email-piotr.krzysztof.gawel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_timer: fix verification of execution time
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
> Each sample needs to be in range:
>     t < s[i] < t + threshold
> Thus for i from the interval [d...n]:
>     (n-d)*t < sum(s[d...n]) < (n-d)*(t + threshold)
> This patch fixes that check.

As far as I can tell the function compute_treshold() multiplies the
threshold per call by keep_samples already, so it's a threashold per run
not a treshold per call, or do I miss something?

> Signed-off-by: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
> ---
>  lib/tst_timer_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
> index f6459e5..4508e29 100644
> --- a/lib/tst_timer_test.c
> +++ b/lib/tst_timer_test.c
> @@ -306,7 +306,7 @@ void do_timer_test(long long usec, unsigned int nsamples)
>  		samples[nsamples-1], samples[0], median,
>  		1.00 * trunc_mean / keep_samples, discard);
>  
> -	if (trunc_mean > (nsamples - discard) * usec + threshold) {
> +	if (trunc_mean > keep_samples * (usec + threshold)) {
>  		tst_res(TFAIL, "%s slept for too long", scall);
>  		if (!print_frequency_plot)
> -- 
> 2.7.4
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
