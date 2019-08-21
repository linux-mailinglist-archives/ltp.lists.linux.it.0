Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 451B797518
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:36:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D97FB3C1CFE
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 10:36:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 37E483C1C7F
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:36:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C5A081000BE2
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 10:36:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71A36ABD2;
 Wed, 21 Aug 2019 08:36:51 +0000 (UTC)
Date: Wed, 21 Aug 2019 10:36:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20190821083650.GA26334@rei.lan>
References: <20190819133618.7538-1-rpalethorpe@suse.com>
 <20190820095521.GA22253@rei.lan>
 <CAEemH2cX1CO=zLzf1ZHQM+MUNS=FLKpGD1ypx=2uGst5qXn4YQ@mail.gmail.com>
 <20190820102711.GA22483@rei.lan> <87y2znuf0a.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2znuf0a.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_res: Print errno number in addition to error
 name
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> > > It appears we are atleast missing ENOTSUPP (524) which is probably returned by
> >> > > create_timer for some alarm clocks on none x86 arches. This isn't entirely
> >> > > clear, but what is clear is that it would help to know what the error number
> >> > > is without using strace.
> >> >
> >> > Can we please also patch the lib/errnos.h so that the ENOTSUPP is
> >> > included there as well?
> >>
> >> Not sure if we should do that since it(from google) says ENOTSUPP is
> >> not intended to used in userland.
> 
> I suppose we could print a warning/fail if any error value over 512
> (ERESTARTSYS) is seen by tst_res(). We can define these error numbers in
> user land for debugging purposes.

Sounds good to me, I wouldn't do it a fail, even simple TINFO message
that would say that we got unexpected errno.

And we should btw do that for the tst_strerrno() as well.

> > Looks like there are two of these ENOTSUP and ENOTSUPP so the syscall
> > returning ENOTSUPP is a bug itself since it should return ENOTSUP. Also
> > btw ENOTSUP == EOPNOTSUPP and we do have EOPNOTSUPP in errnos.h.
> 
> I think there is quite a lot of stuff missing. Maybe it is time to
> create a script for generating this list?

We can but I would just commit the resulting header to LTP since the
list will not change frequently or at all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
