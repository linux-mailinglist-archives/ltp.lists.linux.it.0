Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB33A1703
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:22:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA46E3C9005
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:22:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D92613C7A97
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:22:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4529F200FED
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:22:15 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1lqz5x-0003m5-L2; Wed, 09 Jun 2021 14:22:14 +0000
Date: Wed, 9 Jun 2021 11:22:09 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMDOkVaCIWEA6Etl@mussarela>
References: <20210608132723.255996-1-cascardo@canonical.com>
 <YMB6aoVvTKJQ6wif@yuki> <YMCkB/iS54OJaby4@mussarela>
 <YMDEPYSWZG5FzUTi@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMDEPYSWZG5FzUTi@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on
 32-bit platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 09, 2021 at 03:38:05PM +0200, Cyril Hrubis wrote:
> Hi!
> > > Good catch, I guess that it would be slightly cleaner to fix the
> > > NSEC_PER_SEC size instead with:
> > > 
> > > diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
> > > index b783beff4..e50f698d6 100644
> > > --- a/include/lapi/common_timers.h
> > > +++ b/include/lapi/common_timers.h
> > > @@ -12,7 +12,7 @@
> > >  #include "lapi/posix_clocks.h"
> > > 
> > >  #ifndef NSEC_PER_SEC
> > > -#define NSEC_PER_SEC (1000000000L)
> > > +#define NSEC_PER_SEC (1000000000LL)
> > >  #endif
> > > 
> > >  static const clock_t clock_list[] = {
> > > 
> > > 
> > > What do you think?
> > > 
> > > -- 
> > > Cyril Hrubis
> > > chrubis@suse.cz
> > 
> > Yeah, I even wrote and tested that it would build, but I wasn't able to go
> > through any build logs or run complete tests.
> > 
> > But maybe I am just overthinking this, and any promotions due to this would
> > only fix issues and not introduce any new ones.
> 
> That would be my expectation.
> 
> > Well, on second thought, on 32-bit, in cases like variadic functions, it could
> > cause a problem. So, I am just afraid that applying this fix without looking
> > for every use of NSEC_PER_SEC might lead to new bugs.
> 
> Having a look at 'git grep NSEC_PER_SEC' there are five uses of
> NSEC_PER_SEC and all of these should be, as far as I can tell, safe.
> 

Yes, there are even uses where NSEC_PER_SEC is redefined.

I am fine with this other change. I had already tested that it fixes the
problem just the same.

How about the commit below?

Cascardo.

> -- 
> Cyril Hrubis
> chrubis@suse.cz

From 3c248cd5e6fc1dd967787249857fd310e688d89f Mon Sep 17 00:00:00 2001
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Date: Tue, 8 Jun 2021 10:21:48 -0300
Subject: [PATCH] common_timers: define NSEC_PER_SEC as long long to avoid
 overflow on 32-bit

When multiplying 30 with NSEC_PER_SEC, the result would overflow on 32-bit
platforms, unless there was promotion to long long, which is what
tst_ts_from_ns expects.

futex_wake04, which uses that, would end up getting EINVAL when calling futex,
because timespec_valid would fail, as tv_nsec would have an invalid value.

After this change, futex_wake04 passes on i386.

Reported-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 include/lapi/common_timers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
index 8da3abec24b2..953741d73810 100644
--- a/include/lapi/common_timers.h
+++ b/include/lapi/common_timers.h
@@ -12,7 +12,7 @@
 #include "lapi/posix_clocks.h"
 
 #ifndef NSEC_PER_SEC
-#define NSEC_PER_SEC (1000000000L)
+#define NSEC_PER_SEC (1000000000LL)
 #endif
 
 static const clock_t clock_list[] = {
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
