Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53827160EEB
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:38:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E61133C23EC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:38:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E31B03C23B0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:38:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7508B600A9E
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:38:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2BB1B4BF;
 Mon, 17 Feb 2020 09:38:51 +0000 (UTC)
Date: Mon, 17 Feb 2020 10:38:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200217093850.GA13398@dell5510>
References: <20200217084622.11199-1-pvorel@suse.cz>
 <20200217084622.11199-5-pvorel@suse.cz>
 <CAEemH2cGsXkgkfrFN2XW9ByWqNnknR+-9yCv6T+hqAp13PjVyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cGsXkgkfrFN2XW9ByWqNnknR+-9yCv6T+hqAp13PjVyQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 4/4] syscalls/fsmount01: Add test for fsmount
 series API
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

> > NOTE: most of the syscalls numbers were added in previous commits
> > (c2f27f6e9b, 01e4dc2222, 87a2612857).


> 87a2612857 is invalid?
I'm sorry, that was this upcomming commit (besides that it needs to be removed
from it) => thanks for a report, I'll remove it.


> > Signed-off-by: Zorro Lang <zlang@redhat.com>
> > Acked-by: Li Wang <liwang@redhat.com>
> > [ pvorel: rebased, cleanup autotools and other small fixes ]
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  include/lapi/syscalls/powerpc64.in            |  4 +
> >  runtest/syscalls                              |  2 +
> >  testcases/kernel/syscalls/fsmount/.gitignore  |  1 +
> >  testcases/kernel/syscalls/fsmount/Makefile    |  8 ++
> >  testcases/kernel/syscalls/fsmount/fsmount01.c | 95 +++++++++++++++++++
> >  5 files changed, 110 insertions(+)
> >  create mode 100644 testcases/kernel/syscalls/fsmount/.gitignore
> >  create mode 100644 testcases/kernel/syscalls/fsmount/Makefile
> >  create mode 100644 testcases/kernel/syscalls/fsmount/fsmount01.c

> > diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/
> > powerpc64.in
> > index 2c1f105c1..beb0e6812 100644
> > --- a/include/lapi/syscalls/powerpc64.in
> > +++ b/include/lapi/syscalls/powerpc64.in
> > @@ -371,3 +371,7 @@ pidfd_open 434
> >  pkey_mprotect 386
> >  pkey_alloc 384
> >  pkey_free 385
> > +move_mount 429
> > +fsopen 430
> > +fsconfig 431
> > +fsmount 432
Yep.

> As Viresh and I commented in the previous email this four syscalls-number
> should be deleted from the patch.

> Besides that, the patchset looks good to me.
>     Acked-by: Li Wang <liwang@redhat.com>
I suppose you ack also the change include/lapi/fsmount.h using lapi/fcntl.h
(if not, please let me know).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
