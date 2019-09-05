Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C53AAA9BB1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 09:23:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A2253C2148
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 09:23:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 27B693C20AC
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 09:23:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9B543140202F
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 09:23:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 092E7AF24;
 Thu,  5 Sep 2019 07:23:00 +0000 (UTC)
References: <2ded10ab8d989ba7ee0cc1e9f1ac28acdf14c947.1567606698.git.jstancek@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
In-reply-to: <2ded10ab8d989ba7ee0cc1e9f1ac28acdf14c947.1567606698.git.jstancek@redhat.com>
Date: Thu, 05 Sep 2019 09:23:00 +0200
Message-ID: <87woenky0b.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: don't compare spins_avg (float) against 1
 (int)
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Jan Stancek <jstancek@redhat.com> writes:

> tst_fzsync_pair.spins is increased at least by one on every iteration.
> If during all calibration loops, both A and B manage to complete at
> nearly same time, then spins is increased only by one.
>
> spins_avg starts as 0, and tst_exp_moving_avg() will move it closer
> and closer to 1, but it will never be 1:
>         float f = 0; int i;
>         for (i = 0; i < 4096; i++)
>                 f = tst_exp_moving_avg(0.25f, 1, f);
>         printf("%.15f %d\n", f, f >= 1);
> 	$ 0.999999880790710 0
>
> which on rare occasion can cause: "Can't calculate random delay".

I'm surprised that you have seen this. Out of interest, does this happen
on a particular setup, or just randomly?

>
> Compare against float slightly smaller than 1.
> Also print stats one more time when we hit the warning.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_fuzzy_sync.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index de0402c9bbe9..2c0389c5d63e 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -73,6 +73,8 @@
>  /* how much of exec time is sampling allowed to take */
>  #define SAMPLING_SLICE 0.5f
>
> +#define EPSILON 0.999f
> +
>  /** Some statistics for a variable */
>  struct tst_fzsync_stat {
>  	float avg;
> @@ -477,7 +479,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
>  			tst_res(TINFO, "Minimum sampling period ended");
>  			tst_fzsync_pair_info(pair);
>  		}
> -	} else if (fabsf(pair->diff_ab.avg) >= 1 && pair->spins_avg.avg >= 1) {
> +	} else if (fabsf(pair->diff_ab.avg) > EPSILON && pair->spins_avg.avg > EPSILON) {
>  		per_spin_time = fabsf(pair->diff_ab.avg) / pair->spins_avg.avg;

I suppose you could also use MAX(pair->spins_avg.avg, 1f) and drop the
check. It might even be OK to only check that it is greater than
zero. I'm not sure if the number of delay spins will be sane either way,
but it probably can't do any harm.

>  		time_delay = drand48() * (pair->diff_sa.avg + pair->diff_sb.avg)
>  			- pair->diff_sb.avg;
> @@ -495,6 +497,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
>  		}
>  	} else if (!pair->sampling) {
>  		tst_res(TWARN, "Can't calculate random delay");
> +		tst_fzsync_pair_info(pair);
>  		pair->sampling = -1;
>  	}


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
