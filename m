Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7C7A352C
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 12:46:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF2603C201D
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 12:46:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 552223C1D01
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 12:46:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 84A43202981
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 12:46:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 979AEB601;
 Fri, 30 Aug 2019 10:46:11 +0000 (UTC)
Date: Fri, 30 Aug 2019 12:46:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cristian Marussi <cristian.marussi@arm.com>
Message-ID: <20190830104609.GA9330@dell5510>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cristian,

> On 30/08/2019 09:50, Petr Vorel wrote:
> > Hi Li,

> > Good point. Something like this could do it:
> > -LTP_TIMEOUT_MUL=7
> > +min_timeout=7
> > +[ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout

> > Unless we test only integers:
> > +[ is_int "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $min_timeout ] && LTP_TIMEOUT_MUL=$min_timeout


> I would certainly introduce a check on the minimum allowed test-timeout and just stick to integers.
> (is it really needed to worry for float multipliers ?)
Not sure, but it'd be good to have it same for C and for shell. Otherwise
working variable for C would fail on shell.

> I also wonder if it is worth somehow put this minimum-enforce mechanism inside the framework itself
> instead that hardcoding it in this specific test (unless you already mean to do it this way...
> and I misunderstood)
Yes, I was thinking about it as well.
LTP_TIMEOUT_MUL should be reserved for users, tests should use LTP_TIMEOUT_MUL_MIN,
check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN would be in
_tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9 (VIRT_PERF_THRESHOLD_MIN).

I wonder if it'd be useful to have some functionality in C (ltp_timeout_mul_min
as a struct tst_test, default 1).

> So that, roughly, in the test

> LTP_TIMEOUT_MUL_MIN=7
> LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-7}

> and somewhere in framework test initialization you enforce it (maybe with a warning for the user when overriding its setup)

> [ -z "$LTP_TIMEOUT_MUL" -o "$LTP_TIMEOUT_MUL" -lt $LTP_TIMEOUT_MUL_MIN ] && LTP_TIMEOUT_MUL=$LTP_TIMEOUT_MUL_MIN
+1. Feel free to send a patch.

> (but my LTP framework memories are a bit blurred now...so feel free to ignore if it is not feasible or practical)

> Thanks

> Cristian

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
