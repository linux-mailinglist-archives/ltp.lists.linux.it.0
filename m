Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806195C39
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:27:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E97133C1CF3
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:27:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5FE293C1347
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:27:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F7351A00FF3
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:27:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C11C5AB91;
 Tue, 20 Aug 2019 10:27:12 +0000 (UTC)
Date: Tue, 20 Aug 2019 12:27:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190820102711.GA22483@rei.lan>
References: <20190819133618.7538-1-rpalethorpe@suse.com>
 <20190820095521.GA22253@rei.lan>
 <CAEemH2cX1CO=zLzf1ZHQM+MUNS=FLKpGD1ypx=2uGst5qXn4YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cX1CO=zLzf1ZHQM+MUNS=FLKpGD1ypx=2uGst5qXn4YQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > It appears we are atleast missing ENOTSUPP (524) which is probably returned by
> > > create_timer for some alarm clocks on none x86 arches. This isn't entirely
> > > clear, but what is clear is that it would help to know what the error number
> > > is without using strace.
> >
> > Can we please also patch the lib/errnos.h so that the ENOTSUPP is
> > included there as well?
> 
> Not sure if we should do that since it(from google) says ENOTSUPP is
> not intended to used in userland.

Looks like there are two of these ENOTSUP and ENOTSUPP so the syscall
returning ENOTSUPP is a bug itself since it should return ENOTSUP. Also
btw ENOTSUP == EOPNOTSUPP and we do have EOPNOTSUPP in errnos.h.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
