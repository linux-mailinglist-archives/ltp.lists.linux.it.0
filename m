Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57798209D3E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 13:07:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92C4C3C58BD
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 13:07:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9B3DA3C2B82
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 13:07:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7E35200DEE
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 13:07:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 034DBAD60;
 Thu, 25 Jun 2020 11:07:30 +0000 (UTC)
Date: Thu, 25 Jun 2020 13:07:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200625110751.GB23637@yuki.lan>
References: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
 <9621b4f97b539f2e080b00491eb9ba4973878028.1591760262.git.viresh.kumar@linaro.org>
 <20200624142327.GA5181@yuki.lan>
 <20200625095006.d6ndameqblecadp4@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625095006.d6ndameqblecadp4@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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
> > > +static void verify(void)
> > > +{
> > > +	struct test_variants *tv = &variants[tst_variant];
> > > +	struct tst_its spec = {.type = tv->type, };
> > > +
> > > +	TEST(tv->func(timer, tst_its_get(&spec)));
> > > +	if (TST_RET == 0) {
> > > +		tst_res(TPASS, "timer_gettime() Passed");
> > > +	} else {
> > > +		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
> > >  	}
> > 
> > Looking at manuals it seems that:
> > 
> > * Newly created timer is disarmed
> > 
> > * For disarmed timers the clock_gettime() should get itimer with zeroes
> > 
> > So we check here that the returned itimer has zeroes for both oneshoot
> > and interval timers here.
> 
> I am not sure what oneshoot/interval timers you are talking about :)

These are the two timerspec structures inside of the itimerspec, one of
them is for oneshoot timer/alarm and the second one is for reocurring
timer/alarm and called interval.

> This is what I came to, is this sufficient ?
> 
> diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> index ea7cc6b59f7e..4a949486a920 100644
> --- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> +++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> @@ -55,7 +55,19 @@ static void verify(void)
>  
>         TEST(tv->func(timer, tst_its_get(&spec)));
>         if (TST_RET == 0) {
> -               tst_res(TPASS, "timer_gettime() Passed");
> +               if ((spec.type == TST_KERN_OLD_TIMESPEC &&
> +                       (spec.ts.kern_old_its.it_interval.tv_sec ||
> +                        spec.ts.kern_old_its.it_interval.tv_nsec ||
> +                        spec.ts.kern_old_its.it_value.tv_sec ||
> +                        spec.ts.kern_old_its.it_value.tv_nsec)) ||
> +                   (spec.type == TST_KERN_TIMESPEC &&
> +                       (spec.ts.kern_its.it_interval.tv_sec ||
> +                        spec.ts.kern_its.it_interval.tv_nsec ||
> +                        spec.ts.kern_its.it_value.tv_sec ||
> +                        spec.ts.kern_its.it_value.tv_nsec)))
> +                       tst_res(TFAIL, "timespec should have been zeroed");

Indeed that's what I had in mind, can we please abstract this properly
as well? I guess that we can add helpers such as tst_its_interval_sec()
tst_its_inverval_nsec, etc.

> +               else
> +                       tst_res(TPASS, "timer_gettime() Passed");
>         } else {
>                 tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
>         }
> 
> -- 
> viresh

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
