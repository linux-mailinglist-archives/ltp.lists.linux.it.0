Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D11F2F24
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:24:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2ADC3C2033
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:24:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 04AFB3C1CAE
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:24:02 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4DAAF1400279
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 14:24:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87F5BAD31;
 Thu,  7 Nov 2019 13:24:00 +0000 (UTC)
Date: Thu, 7 Nov 2019 14:23:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191107132359.GE22352@rei.lan>
References: <20191009121906.GA7677@rei.lan>
 <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1570767798-26685-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570767798-26685-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] syscalls/prctl09: New timer sample test
 for PR_SET_TIMERSLACK
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
> +#include <errno.h>
> +#include <sys/prctl.h>
> +#include "lapi/prctl.h"
> +#include "tst_timer_test.h"
> +
> +int sample_fn(int clk_id, long long usec)
> +{
> +	struct timespec t = tst_us_to_timespec(usec);
> +
> +	TEST(prctl(PR_SET_TIMERSLACK, 200000));

This is a bit more complicated.

First of all it does not make sense to set the timerslack in the sample
function. It should be done once in the test setup.

Also in the tst_timer_test.c we store the timerslack value in the
timer_setup(), which executes the test setup() at the end of the
function, so we would have to move the part that gets the timerslack()
after the test setup() function so that the library includes the newly
set timerslack in the calculation.

> +	if (TST_RET != 0) {
> +		tst_res(TFAIL | TTERRNO,
> +			"prctl(), returned %li", TST_RET);
> +		return 1;
> +	}
> +
> +	tst_timer_start(clk_id);
> +	TEST(nanosleep(&t, NULL));
> +	tst_timer_stop();
> +	tst_timer_sample();
> +
> +	if (TST_RET != 0) {
> +		tst_res(TFAIL | TTERRNO,
> +			"nanosleep() returned %li", TST_RET);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct tst_test test = {
> +	.scall = "prctl()",
> +	.sample = sample_fn,
> +};
> -- 
> 2.18.1
> 
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
