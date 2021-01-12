Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C125D2F3C61
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 23:35:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C3F73C5461
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 23:35:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 008173C26DF
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 23:35:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F3C51000641
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 23:35:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63311AC8F;
 Tue, 12 Jan 2021 22:35:12 +0000 (UTC)
Date: Tue, 12 Jan 2021 23:35:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <X/4kHp818UKMRmXm@pevik>
References: <20210111123626.28932-1-pvorel@suse.cz>
 <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
 <X/2E2GD/wimgo5Hi@pevik>
 <CAEemH2cmHrUGx3WXWfh6huNh-sv_GY56A+EvGVj-BiXT3WQ32A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cmHrUGx3WXWfh6huNh-sv_GY56A+EvGVj-BiXT3WQ32A@mail.gmail.com>
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

> Hi Petr,

> Petr Vorel <pvorel@suse.cz> wrote:

> > > +
> > > > +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
> > > > +    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [


> > > I guess the list-of-modules should be [keyutils-libs] but not
> > [libkeyutils]?
> > No problem to change that, but can you explain why?


> From what I understanding, this macro runs the pkg-config tool to check
> for the presence of packages against keyutils-libs and sets two variables:
> LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.

> So the list-of-modules should be the precise name(or version) of the
> library, am I right?
> See: https://autotools.io/pkgconfig/pkg_check_modules.html

Thanks for an explanation, but I'm still missing something.
In openSUSE:

$ pkg-config --libs --cflags libkeyutils
-lkeyutils

$ pkg-config --libs --cflags keyutils-libs
Package keyutils-libs was not found in the pkg-config search path.
Perhaps you should add the directory containing `keyutils-libs.pc'
to the PKG_CONFIG_PATH environment variable
Package 'keyutils-libs', required by 'virtual:world', not found

That's correct, because keyutils-devel package has file:
/usr/lib64/pkgconfig/libkeyutils.pc

The same is for Debian, which has
/usr/lib/x86_64-linux-gnu/pkgconfig/libkeyutils.pc

Looking at Fedora:
keyutils-libs-devel [1] has /usr/lib64/pkgconfig/libkeyutils.pc.

Download and unpack the package and run:
$ PKG_CONFIG_LIBDIR="$PWD/usr/lib64/pkgconfig/" pkg-config --libs --cflags libkeyutils
-lkeyutils

> > Tested: https://travis-ci.org/github/pevik/ltp/builds/753925166


> The reason for test all get passed is the "include/lapi/keyctl.h" has the
> second choice to include <linux/keyctl.h> I guess.

> #if defined(HAVE_KEYUTILS_H) && defined(HAVE_LIBKEYUTILS)
> # include <keyutils.h>
In my case (openSUSE) I have HAVE_LIBKEYUTILS defined.
> #else
> # ifdef HAVE_LINUX_KEYCTL_H
> #  include <linux/keyctl.h>
> # endif /* HAVE_LINUX_KEYCTL_H */

Kind regards,
Petr

[1] https://download-ib01.fedoraproject.org/pub/fedora/linux/updates/33/Everything/x86_64/Packages/k/keyutils-libs-devel-1.6.1-1.fc33.x86_64.rpm

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
