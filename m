Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592A118171
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 08:38:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB6183C220A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 08:38:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id AD7953C13E0
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 08:38:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB69E6011A9
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 08:38:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA1F2AD2C;
 Tue, 10 Dec 2019 07:38:10 +0000 (UTC)
Date: Tue, 10 Dec 2019 08:38:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191210073808.GA4143@dell5510>
References: <20191209064110.67975-1-lkml@jv-coder.de>
 <20191209222557.GA31054@dell5510>
 <79cfa9ef-b122-b2e1-4051-e16eff04d6be@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79cfa9ef-b122-b2e1-4051-e16eff04d6be@jv-coder.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: Add fifo library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> > > +#ifndef PATH_MAX
> > > +#ifdef MAXPATHLEN
> > > +#define PATH_MAX	MAXPATHLEN
> > > +#else
> > > +#define PATH_MAX	1024
> > > +#endif
> > > +#endif
> > Hm, this is copy paste from old tests (all use test.h, even quite new a=
nd clean tests/tst_tmpdir_test.c).
> > I wonder if this is still relevant, can't we use #include <limits.h>?
> Right, if there is nothing against using limits.h, I'll change it. I just
> used other code for reference for my code.
I don't know the purpose of this code (anybody knows?), but unless there is=
 good
reason for it, I'd be for using <limits.h>.

> > > +++ b/testcases/Makefile
> > > @@ -28,7 +28,7 @@ include $(top_srcdir)/include/mk/env_pre.mk
> > >   # 1. kdump shouldn't be compiled by default, because it's runtime b=
ased and
> > >   #    WILL crash the build host (the tests need to be fixed to just =
build, not
> > >   #    run).
> > > -FILTER_OUT_DIRS		:=3D kdump
> > > +FILTER_OUT_DIRS		:=3D kdump open_posix_testsuite realtime kernel net=
work misc
> > I guess this is unrelated change for your debug.
> Damn... This happens to me all the time, it's time for configure switches=
 ;)
Yep, I have it on my todo list, but haven't forced to do it. Feel free to
implement it.
https://github.com/linux-test-project/ltp/issues/617

> > > +[ "$TST_NEEDS_TMPDIR" !=3D 1 ] && tst_brk TCONF "fifo library requir=
es TST_NEEDS_TMPDIR=3D1"
> > If we apply https://patchwork.ozlabs.org/patch/1206399/, it should be
> > $TST_NEEDS_TMPDIR=3D1
> I don't get it? The path you linked seems unrelated to me and did you mean
> [=A0 "$TST_NEEDS_TMPDIR" =3D 1 ] || ... ?
> > +	[ "$TST_NEEDS_FIFO" =3D 1 ] && . tst_fifo.sh
> > I'd load it at the top, just below
> > . tst_ansi_color.sh
> > . tst_security.sh
> The way I implemented it, I can't load it at the top, because tst_fifo.sh
> requires
> TST_TMPDIR to be already set, when it is included.
Right, sorry. BTW, am I missing something or you don't use this variable in
shell? I see it ony defined in tst_fifo.sh, then you use $TST_TMPDIR.
(+ defined and used in tst_fifo.c)
+ local _tst_path_req=3D"${TST_TMPDIR}/tst_fifo_$1.req"
So what is the purpose of the variable in shell?

And maybe the test for $TST_TMPDIR might not be needed (it's not supposed t=
o be
used without tst_test.sh, but there is no harm to have it (maybe the error
message should be something like "tst_test.sh is part of shell API and shou=
ldn't
be loaded separately").

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
