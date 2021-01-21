Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7C2FDF3D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 03:19:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E59F53C881D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 03:19:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6E1743C2658
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 03:19:50 +0100 (CET)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DF5DC600F28
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 03:19:47 +0100 (CET)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10L2G9qa012905;
 Thu, 21 Jan 2021 10:16:09 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Thu, 21 Jan 2021
 10:19:26 +0800
Date: Thu, 21 Jan 2021 10:19:23 +0800
From: Leo Liang <ycliang@andestech.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20210121021923.GA2366@andestech.com>
References: <20210120070053.11490-1-ycliang@andestech.com>
 <87sg6w9bdd.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sg6w9bdd.fsf@suse.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10L2G9qa012905
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fzsync: Add sched_yield for single core
 machine
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

On Wed, Jan 20, 2021 at 06:00:14PM +0800, Richard Palethorpe wrote:
> Hello Leo,
> 
> Leo Yu-Chi Liang <ycliang@andestech.com> writes:
> 
> > Fuzzy sync library uses spin waiting mechanism
> > to implement thread barrier behavior, which would
> > cause this test to be time-consuming on single core machine.
> >
> > Fix this by adding sched_yield in the spin waiting loop,
> > so that the thread yields cpu as soon as it enters the waiting loop.
> 
> Thanks for sending this in. Comments below.
> 
> >
> > Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> > ---
> >  include/tst_fuzzy_sync.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> > index 4141f5c64..64d172681 100644
> > --- a/include/tst_fuzzy_sync.h
> > +++ b/include/tst_fuzzy_sync.h
> > @@ -59,9 +59,11 @@
> >   * @sa tst_fzsync_pair
> >   */
> >  
> > +#include <sys/sysinfo.h>
> >  #include <sys/time.h>
> >  #include <time.h>
> >  #include <math.h>
> > +#include <sched.h>
> >  #include <stdlib.h>
> >  #include <pthread.h>
> >  #include "tst_atomic.h"
> > @@ -564,6 +566,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
> >  		       && tst_atomic_load(our_cntr) < INT_MAX) {
> >  			if (spins)
> >  				(*spins)++;
> > +			if(get_nprocs() == 1)
> 
> We should use tst_ncpus() and then cache the value so we are not making
> a function call within the loop. It is probably best to avoid calling
> this function inside tst_fzsync_pair_wait, it may even result in a
> system call.
> 
> We should probably cache the value in tst_fzsync_pair, maybe as a
> boolean e.g. "yield_in_wait". This can be set/checked in the
> tst_fzsync_pair_init function. Also this will allow the user to handle
> CPUs being offlined if the test itself can cause that.
> 

Got it! Thanks for reviewing the patch and all the heads-ups!
I will refine it and send a v2.

> > +				sched_yield();
> >  		}
> >  
> >  		tst_atomic_store(0, other_cntr);
> > @@ -581,6 +585,8 @@ static inline void tst_fzsync_pair_wait(int *our_cntr,
> >  		while (tst_atomic_load(our_cntr) < tst_atomic_load(other_cntr)) {
> >  			if (spins)
> >  				(*spins)++;
> > +			if(get_nprocs() == 1)
> > +				sched_yield();
> >  		}
> >  	}
> >  }
> 
> Everyone please note that we will have to test this extensively to
> ensure it does break existing reproducers.
>

Got it as well, will try to reproduce the cve with this patch applied.

Thanks again,
Leo

> Alternatively to this approach we could create seperate implementations
> of pair_wait and use a function pointer. I am thinking it may be best to
> do it both ways and perform some measurements.
>
> -- 
> Thank you,
> Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
