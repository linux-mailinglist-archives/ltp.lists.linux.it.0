Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F7B0AE0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:04:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7E833C2084
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:04:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 391773C0507
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:04:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 78FF71A0BC24
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:04:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF288B705;
 Thu, 12 Sep 2019 09:04:33 +0000 (UTC)
Message-ID: <1568279073.3621.12.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
Date: Thu, 12 Sep 2019 11:04:33 +0200
In-Reply-To: <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Reply-To: cfamullaconrad@suse.com
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-09-02 at 10:34 +0800, Li Wang wrote:
> On Fri, Aug 30, 2019 at 6:46 PM Petr Vorel <pvorel@suse.cz> wrote:
> > 
> > Hi Cristian,
> > 
> > > On 30/08/2019 09:50, Petr Vorel wrote:
> > > > Hi Li,
> > > > Good point. Something like this could do it:
> > > > -LTP_TIMEOUT_MUL=7
> > > > +min_timeout=7
> > > > +[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout
> > > > ] && LTP_TIMEOUT_MUL=$min_timeout
> > > > Unless we test only integers:
> > > > +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt
> > > > $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout
> > 
> > 
> > > I would certainly introduce a check on the minimum allowed test-
> > > timeout and just stick to integers.
> > > (is it really needed to worry for float multipliers ?)
> 
> No, I guess the integer division in the shell/C is enough.
> 
> > Not sure, but it'd be good to have it same for C and for shell.
> > Otherwise
> > working variable for C would fail on shell.
> > 
> > > I also wonder if it is worth somehow put this minimum-enforce
> > > mechanism inside the framework itself
> > > instead that hardcoding it in this specific test (unless you
> > > already mean to do it this way...
> > > and I misunderstood)
> > 
> > Yes, I was thinking about it as well.
> > LTP_TIMEOUT_MUL should be reserved for users, tests should use
> > LTP_TIMEOUT_MUL_MIN,
> > check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN
> > would be in
> > _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9
> > (VIRT_PERF_THRESHOLD_MIN).
> 
> +1 agree.

I have a general question. What do we try to get with
LTP_TIMEOUT_MUL_MIN? From my perspective, we try to set a minimum
timeout value. Isn't it the value (struct tst_test*)->timeout ?

I'm missing such configuration value for shell. Is there one?

Or do we need to increase timeout in smaller steps and that is why we
need this LTP_TIMEOUT_MUL_MIN?

> 
> > 
> > I wonder if it'd be useful to have some functionality in C
> > (ltp_timeout_mul_min
> > as a struct tst_test, default 1).
> 
> Yes. But seems no need to involve a new field in struct tst_test,
> maybe we could complete that in the function tst_set_timeout(int
> timeout).
> 
> > 
> > > So that, roughly, in the test
> > > LTP_TIMEOUT_MUL_MIN=7
> > > LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-7}
> > > and somewhere in framework test initialization you enforce it
> > > (maybe with a warning for the user when overriding its setup)
> > > [ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt
> > > $LTP_TIMEOUT_MUL_MIN ] && LTP_TIMEOUT_MUL=$LTP_TIMEOUT_MUL_MIN
> > 
> > +1. Feel free to send a patch.
> 
> Agree.
> 
> -- 
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
