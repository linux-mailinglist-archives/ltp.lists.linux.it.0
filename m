Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E729AA333
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 14:29:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3D113C2108
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 14:29:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D992D3C1CCC
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 14:29:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7BB366104A8
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 14:29:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C0F6AFB0;
 Thu,  5 Sep 2019 12:29:54 +0000 (UTC)
References: <2ded10ab8d989ba7ee0cc1e9f1ac28acdf14c947.1567606698.git.jstancek@redhat.com>
 <750a63b18523493412cb53e748b519b7dfbd70b0.1567685224.git.jstancek@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
In-reply-to: <750a63b18523493412cb53e748b519b7dfbd70b0.1567685224.git.jstancek@redhat.com>
Date: Thu, 05 Sep 2019 14:29:54 +0200
Message-ID: <87sgpbkjst.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] fzsync: drop pair->spins_avg.avg check
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
> which on rare occasion can cause: "Can't calculate random delay".
>
> Drop check and use MAX(pair->spins_avg.avg, 1f) to calculate per_spin_time.
> Also print stats one more time when we hit the warning.
>
> Suggested-by: Richard Palethorpe <rpalethorpe@suse.com>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_fuzzy_sync.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index de0402c9bbe9..f9a1947c7542 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -477,8 +477,8 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
>  			tst_res(TINFO, "Minimum sampling period ended");
>  			tst_fzsync_pair_info(pair);
>  		}
> -	} else if (fabsf(pair->diff_ab.avg) >= 1 && pair->spins_avg.avg >= 1) {
> -		per_spin_time = fabsf(pair->diff_ab.avg) / pair->spins_avg.avg;
> +	} else if (fabsf(pair->diff_ab.avg) >= 1) {
> +		per_spin_time = fabsf(pair->diff_ab.avg) / MAX(pair->spins_avg.avg, 1.0f);
>  		time_delay = drand48() * (pair->diff_sa.avg + pair->diff_sb.avg)
>  			- pair->diff_sb.avg;
>  		pair->delay += (int)(time_delay / per_spin_time);
> @@ -495,6 +495,7 @@ static void tst_fzsync_pair_update(struct tst_fzsync_pair *pair)
>  		}
>  	} else if (!pair->sampling) {
>  		tst_res(TWARN, "Can't calculate random delay");
> +		tst_fzsync_pair_info(pair);
>  		pair->sampling = -1;
>  	}

LGTM

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
