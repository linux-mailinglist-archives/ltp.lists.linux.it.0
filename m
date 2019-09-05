Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C585A9C0A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 09:39:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A83003C213F
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 09:39:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0915C3C207F
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 09:39:11 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B537200AC7
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 09:39:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AE7875752;
 Thu,  5 Sep 2019 07:39:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6B15C22C;
 Thu,  5 Sep 2019 07:39:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2437A18089C8;
 Thu,  5 Sep 2019 07:39:09 +0000 (UTC)
Date: Thu, 5 Sep 2019 03:39:08 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de
Message-ID: <1820874262.10134964.1567669148944.JavaMail.zimbra@redhat.com>
In-Reply-To: <87woenky0b.fsf@rpws.prws.suse.cz>
References: <2ded10ab8d989ba7ee0cc1e9f1ac28acdf14c947.1567606698.git.jstancek@redhat.com>
 <87woenky0b.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.14]
Thread-Topic: fzsync: don't compare spins_avg (float) against 1 (int)
Thread-Index: yTZVwD0ukdod6XoDe8rs4q9SqeuKjA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 05 Sep 2019 07:39:09 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hello,
> 
> Jan Stancek <jstancek@redhat.com> writes:
> 
> > tst_fzsync_pair.spins is increased at least by one on every iteration.
> > If during all calibration loops, both A and B manage to complete at
> > nearly same time, then spins is increased only by one.
> >
> > spins_avg starts as 0, and tst_exp_moving_avg() will move it closer
> > and closer to 1, but it will never be 1:
> >         float f = 0; int i;
> >         for (i = 0; i < 4096; i++)
> >                 f = tst_exp_moving_avg(0.25f, 1, f);
> >         printf("%.15f %d\n", f, f >= 1);
> > 	$ 0.999999880790710 0
> >
> > which on rare occasion can cause: "Can't calculate random delay".
> 
> I'm surprised that you have seen this. Out of interest, does this happen
> on a particular setup, or just randomly?

It happens very rarely on power9 lpar running fedora 30 and cve-2017-2671,
where there's only single syscall in fuzzing section.

It takes couple hours to reproduce on demand.

> 
> >
> > Compare against float slightly smaller than 1.
> > Also print stats one more time when we hit the warning.
> >
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  include/tst_fuzzy_sync.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> > index de0402c9bbe9..2c0389c5d63e 100644
> > --- a/include/tst_fuzzy_sync.h
> > +++ b/include/tst_fuzzy_sync.h
> > @@ -73,6 +73,8 @@
> >  /* how much of exec time is sampling allowed to take */
> >  #define SAMPLING_SLICE 0.5f
> >
> > +#define EPSILON 0.999f
> > +
> >  /** Some statistics for a variable */
> >  struct tst_fzsync_stat {
> >  	float avg;
> > @@ -477,7 +479,7 @@ static void tst_fzsync_pair_update(struct
> > tst_fzsync_pair *pair)
> >  			tst_res(TINFO, "Minimum sampling period ended");
> >  			tst_fzsync_pair_info(pair);
> >  		}
> > -	} else if (fabsf(pair->diff_ab.avg) >= 1 && pair->spins_avg.avg >= 1) {
> > +	} else if (fabsf(pair->diff_ab.avg) > EPSILON && pair->spins_avg.avg >
> > EPSILON) {
> >  		per_spin_time = fabsf(pair->diff_ab.avg) / pair->spins_avg.avg;
> 
> I suppose you could also use MAX(pair->spins_avg.avg, 1f) and drop the
> check. It might even be OK to only check that it is greater than
> zero. I'm not sure if the number of delay spins will be sane either way,
> but it probably can't do any harm.

I'll send v2.

Thanks,
Jan

> 
> >  		time_delay = drand48() * (pair->diff_sa.avg + pair->diff_sb.avg)
> >  			- pair->diff_sb.avg;
> > @@ -495,6 +497,7 @@ static void tst_fzsync_pair_update(struct
> > tst_fzsync_pair *pair)
> >  		}
> >  	} else if (!pair->sampling) {
> >  		tst_res(TWARN, "Can't calculate random delay");
> > +		tst_fzsync_pair_info(pair);
> >  		pair->sampling = -1;
> >  	}
> 
> 
> --
> Thank you,
> Richard.
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
