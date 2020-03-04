Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 091101795B4
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 17:50:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C0C93C665C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 17:50:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9C4743C6610
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 17:49:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4B1A31A011DC
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 17:49:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 95C2CAD08
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:49:57 +0000 (UTC)
Date: Wed, 4 Mar 2020 17:49:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200304164956.GB5603@dell5510>
References: <20200304151201.19117-1-pvorel@suse.cz>
 <b42e93cb-b06d-538c-a5ff-1d110ed8ce74@suse.cz>
 <20200304160330.GA7516@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304160330.GA7516@rei>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add safe timerfd macros
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > Don't forget to clear errno when you're not using the TEST() macro.

> Hmm, I'm not sure how useful is this. Generally the syscalls in libc
> have single macro definition that is used everywhere to copy the error
> from the errno variable. If that piece of code is buggy half of the test
> in LTP would fail anyway.
That's exactly what I thought when I omit that.
+ we reset errno on fewer places than we don't.

> > > +	if (tst_kvercmp(2, 6, 26) <= 0)
> > > +		flags = 0;

> > I think tst_brk(TCONF) would be better here. Or at least tst_res(TWARN),
> > since resetting flags to 0 may render some tests useless.

> I think that it's completely wrong to put kernel version comparsion to
> the safe_macros. If the test needs specific kernel version it should be
> either put into the tst_test structure of handled in the test setup.
OK, I'll remove it.
For my previous state:
timerfd01.c (all)
timerfd_settime01.c (3th and 4rd test)
timerfd_settime02.c (not sure whether this old version is really affected by
CVE-2017-10661)

It means that 1st and 2nd test from timerfd_settime01.c could be tested on
2.6.25 and .26, but it won't due TCONF. But probably not many people will miss
it nowadays.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
