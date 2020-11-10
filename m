Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 180242AD3A0
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 11:24:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AAE53C5378
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 11:24:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5BFDF3C20D7
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 11:23:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D14271A00148
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 11:23:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BC9AABCC;
 Tue, 10 Nov 2020 10:23:57 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:23:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201110102355.GA10788@pevik>
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201109164605.25965-2-mdoucha@suse.cz>
 <CAEemH2egUaO=ebaRFOZDNCZYi1QKZN168xE=_J_U_yoBH5PyLQ@mail.gmail.com>
 <20201110085225.GA3767@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110085225.GA3767@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Martin Doucha <martin.doucha@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> > >  include $(top_srcdir)/include/mk/testcases.mk

> > > +CFLAGS                 += $(EFIVAR_CFLAGS)
> > > +LDLIBS                 += $(EFIVAR_LIBS)


> > Where can we get the value of these two variables? Shouldn't we
> > add AC_SUBST() in the m4 file?

> These are exported by the PKG_CHECK_MODULES() pkgconfig autotools macro.
FYI: I added a fix for old pkg-config (< 0.24) into m4/ltp-tirpc.m4
(the first m4 file which started to use pkg-config)
https://autotools.io/pkgconfig/pkg_check_modules.html

But 0.24 is probably old enough (2010; 0.23 was released 2008), thus we should
probably remove it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
