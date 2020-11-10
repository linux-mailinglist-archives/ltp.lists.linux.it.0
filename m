Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D042AD1D7
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 09:51:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C20A13C5369
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 09:51:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 894533C23EC
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 09:51:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90CDC600A94
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 09:51:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70E78AB95;
 Tue, 10 Nov 2020 08:51:39 +0000 (UTC)
Date: Tue, 10 Nov 2020 09:52:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201110085225.GA3767@yuki.lan>
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201109164605.25965-2-mdoucha@suse.cz>
 <CAEemH2egUaO=ebaRFOZDNCZYi1QKZN168xE=_J_U_yoBH5PyLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2egUaO=ebaRFOZDNCZYi1QKZN168xE=_J_U_yoBH5PyLQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/iopl,
 ioperm: Check for SecureBoot lockdown
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > ...
> >
> >  include $(top_srcdir)/include/mk/testcases.mk
> >
> > +CFLAGS                 += $(EFIVAR_CFLAGS)
> > +LDLIBS                 += $(EFIVAR_LIBS)
> >
> 
> Where can we get the value of these two variables? Shouldn't we
> add AC_SUBST() in the m4 file?

These are exported by the PKG_CHECK_MODULES() pkgconfig autotools macro.

> > --- a/testcases/kernel/syscalls/ioperm/ioperm02.c
> > +++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
> > @@ -22,6 +22,7 @@
> >  #include <pwd.h>
> >  #include "tst_test.h"
> >  #include "tst_safe_macros.h"
> > +#include "tst_secureboot.h"
> >
> >  #if defined __i386__ || defined(__x86_64__)
> >  #include <sys/io.h>
> > @@ -45,6 +46,10 @@ static struct tcase_t {
> >
> >  static void setup(void)
> >  {
> > +       /* ioperm() is restricted under kernel lockdown. */
> > +       if (tst_lockdown_enabled() || tst_secureboot_enabled() > 0)
> > +               tst_brk(TCONF, "Kernel is locked down, skip this test");
> >
> 
> The ioperm02 is an error test for ioperm(), it doesn't matter without the
> lockdown/secure-boot status. Better to remove this from setup().
> 
> iopl02 as well.

Actually I think that this is correct, since there is no imposed order
on the checks in kernel, so we may not get the errors we expect to get.


What we are actually missing are tests that iopl() and ioperm() does
fail with EPERM when either of lockdown or secureboot are enabled.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
