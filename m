Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA721D476B
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:54:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE72C3C53C7
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:54:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3936A3C1422
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:54:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 37FA210019EE
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:54:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29079ACCE;
 Fri, 15 May 2020 07:54:09 +0000 (UTC)
Date: Fri, 15 May 2020 09:54:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200515075404.GA1751673@x230>
References: <20200514184904.4537-1-pvorel@suse.cz>
 <20200514184904.4537-3-pvorel@suse.cz>
 <20200514193441.GA11518@dell5510>
 <CAEemH2etn2mSJbV=a=xpVMnUOjKdKrp0C5Cch2JYtbZ2pDkRyw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2etn2mSJbV=a=xpVMnUOjKdKrp0C5Cch2JYtbZ2pDkRyw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] INSTALL: Document 32bit and cross-compilation
 setup
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

> On Fri, May 15, 2020 at 3:34 AM Petr Vorel <pvorel@suse.cz> wrote:

> > ...

> > > +32 bit build on 64 bit machine
> > > +------------------------------
> > > +You need to set CFLAGS=-m32 LDFLAGS=-m32 and PKG_CONFIG_LIBDIR
> > > +
> > > +* RPM based distributions (openSUSE, Fedora, etc.)
> > > +PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig CFLAGS=-m32 LDFLAGS=-m32
> > ./configure
> > > +
> > > +* Debian / Ubuntu and derivates
> > > +PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32
> > LDFLAGS=-m32 ./configure


> I occationally build 32bit LTP on my RHEL8(x86_64) platform
> via: CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" ./configure, it works for
> me awalys.

> May I ask why we need the PKG_CONFIG_LIBDIR?
To correctly correctly detect 32 bit version of libtirpc-devel and libmnl-devel

If you have libtirpc-devel (64bit version) and don't have 32bit version,
without it it detect 64bit version and fail in link phase
https://linux.die.net/man/1/pkg-config
https://autotools.io/pkgconfig/cross-compiling.html

BTW there other fix for TI-RPC tests (detection of old glibc support)
https://patchwork.ozlabs.org/project/ltp/patch/20200515070022.16407-1-pvorel@suse.cz/


> > I guess, we should set this variable in 32 bit build in travis CI (we have
> > only 1
> > job, which uses Debian). It's not failing now, because it's not a minimal
> > build.
> > Therefore we should have minimal 32 bit build (easiest way is to use
> > openSUSE or
> > Fedora/CentOS as they don't install libtirpc 32bit).


> Good suggestion! I think at least for CentOS/RHEL has no problem with this.
After release I'd propose to add Arch Linux and move CentOS 6 to CentOS 7.
One of them could be 32 bit build.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
