Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3112F2DAF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 12:15:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17AB33C644B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 12:15:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9CCED3C2365
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 12:15:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 405E11000952
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 12:15:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7477BAFA0;
 Tue, 12 Jan 2021 11:15:38 +0000 (UTC)
Date: Tue, 12 Jan 2021 12:15:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <X/2E2GD/wimgo5Hi@pevik>
References: <20210111123626.28932-1-pvorel@suse.cz>
 <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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

Hi Li,

> > diff --git a/m4/ltp-keyutils.m4 b/m4/ltp-keyutils.m4
> > deleted file mode 100644
> > index 451c549f3..000000000
> > --- a/m4/ltp-keyutils.m4
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -dnl SPDX-License-Identifier: GPL-2.0-or-later
> > -dnl Copyright (c) 2016 Fujitsu Ltd.
> > -dnl Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> > -dnl Author: Xiao Yang <yangx.jy@cn.fujitsu.com>
> > -
> > -AC_DEFUN([LTP_CHECK_KEYUTILS_SUPPORT], [
> > -       AC_CHECK_LIB([keyutils], [add_key],
> > -       [AC_DEFINE(HAVE_LIBKEYUTILS, 1, [Define to 1 if you have
> > libkeyutils installed.])
> > -             AC_SUBST(KEYUTILS_LIBS, "-lkeyutils")])
> > -])
> > diff --git a/m4/ltp-libkeyutils.m4 b/m4/ltp-libkeyutils.m4
> > new file mode 100644
> > index 000000000..f5d128969
> > --- /dev/null
> > +++ b/m4/ltp-libkeyutils.m4
> > @@ -0,0 +1,8 @@
> > +dnl SPDX-License-Identifier: GPL-2.0-or-later
> > +dnl Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> > +
> > +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
> > +    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [


> I guess the list-of-modules should be [keyutils-libs] but not [libkeyutils]?
No problem to change that, but can you explain why?

Thanks for your review.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
