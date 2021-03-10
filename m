Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C323339A4
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 11:11:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DCC83C6A2A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 11:11:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CFD023C3178
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 11:11:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5BEF5600D6D
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 11:11:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DC32AC24;
 Wed, 10 Mar 2021 10:11:12 +0000 (UTC)
Date: Wed, 10 Mar 2021 11:11:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YEibPvXnSpGceN/e@pevik>
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik>
 <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
 <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
 <20210310084304.d6b626clzj5rafvh@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310084304.d6b626clzj5rafvh@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Viresh, Cyril,

> On 10-03-21, 16:34, Li Wang wrote:
> > But we can put the printing behind the 'gettimeofday+CLOCK_REALTIME'
> > checking.
> > Just similar to what I did in patch V1, is that your mean, Petr?

> > --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> > +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> > @@ -108,6 +108,9 @@ static void run(unsigned int i)
> >                         if (tv->clock_gettime == my_gettimeofday && clks[i]
> > != CLOCK_REALTIME)
> >                                 continue;

> > +                       if (count == 10000)
> > +                                tst_res(TINFO, "\t- %s", tv->desc);
> > +
> >                         ret = tv->clock_gettime(clks[i], tst_ts_get(&ts));
> >                         if (ret) {
> >                                 /*
> > @@ -139,8 +142,8 @@ static void run(unsigned int i)

> >                         diff = end + slack - start;
> >                         if (diff < 0) {
> > -                               tst_res(TFAIL, "%s: Time travelled
> > backwards (%d): %lld ns",
> > -                                       tst_clock_name(clks[i]), j, diff);
> > +                               tst_res(TFAIL, "%s(%s): Time travelled
> > backwards (%d): %lld ns",
> > +                                       tst_clock_name(clks[i]), tv->desc,
> > j, diff);
> >                                 return;
> >                         }

> I think it would be worth keeping it simple then and just print all
> variants only once from setup(). Leave the special case of REALTIME
> clock.
+1.

From a long term, I'd like some easy solution when printing would be handled in
the library. Some time ago I posted a patch which turned .test_variants from int
into array of string description [1]. Cyril didn't see much value at it and
didn't like that it introduced more ifdefs (together with Viresh).
But now we have docparse, could we reconsider this approach? Maybe we could keep
.test_variants and introduce .test_variants_desc for tests which are simple enough.
Or, maybe there is a cleaner solution for clock_adjtime0* tests which I don't
see.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20200519120725.25750-1-pvorel@suse.cz/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
