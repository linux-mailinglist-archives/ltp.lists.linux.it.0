Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A260E333D66
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 14:11:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCF993C6A36
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 14:11:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2C6D13C4AEE
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 14:11:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BCD421400BF8
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 14:11:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1499AEB6;
 Wed, 10 Mar 2021 13:11:21 +0000 (UTC)
Date: Wed, 10 Mar 2021 14:11:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YEjFeGrGsYrr/n3U@pevik>
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik>
 <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
 <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
 <20210310084304.d6b626clzj5rafvh@vireshk-i7>
 <YEibPvXnSpGceN/e@pevik>
 <CAEemH2c0LQPc1dY=ErruKHOGU3OXeKXQgh3VMaYveZN+qVnCKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c0LQPc1dY=ErruKHOGU3OXeKXQgh3VMaYveZN+qVnCKA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > From a long term, I'd like some easy solution when printing would be
> > handled in
> > the library. Some time ago I posted a patch which turned .test_variants
> > from int
> > into array of string description [1]. Cyril didn't see much value at it and

> I look back at patch[1], IMHO, splitting the test variant struct is not a
> good idea.
> I'd rather go print variants[i].desc in the library directly but not split
> it to make
> struct here and there :).
Thanks a lot for having a look. Make sense, I'll try to send v2 soon.

> > didn't like that it introduced more ifdefs (together with Viresh).
> > But now we have docparse, could we reconsider this approach? Maybe we
> > could keep
> > .test_variants and introduce .test_variants_desc for tests which are
> > simple enough.
> > Or, maybe there is a cleaner solution for clock_adjtime0* tests which I
> > don't
> > see.


> Maybe there is.  We can have more time to thinking/discussing this.

> So, would you mind if I merge this V2 patch first?

> (Since we're encountering a sporadical(we can't reproduce it manually)
> failure. Hope this can print more useful info to locate the issue.)

Although I'd slightly prefer if it printed everything once in the setup, it's
not important and we've already spent quite a lot of time with it, so sure,
go ahead :)

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
