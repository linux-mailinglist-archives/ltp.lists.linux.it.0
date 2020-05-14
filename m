Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D331D3D91
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:34:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CBFAA3C23C2
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 21:34:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A7D7A3C20E3
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:34:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D50B1600B10
 for <ltp@lists.linux.it>; Thu, 14 May 2020 21:34:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAF86AC7D
 for <ltp@lists.linux.it>; Thu, 14 May 2020 19:34:45 +0000 (UTC)
Date: Thu, 14 May 2020 21:34:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200514193441.GA11518@dell5510>
References: <20200514184904.4537-1-pvorel@suse.cz>
 <20200514184904.4537-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514184904.4537-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

>  Cross compiling
>  ---------------
> -
>  To cross compile, you must specify the correct variables when running configure.
> -e.g. CC, LDFLAGS, etc...
> +e.g. CC, LDFLAGS, etc.
> +For correct pkgconf / pkg-config detection you need to set
> +PKG_CONFIG_SYSROOT_DIR=$SYSROOT

>  After configure has run, it will generate include/mk/config.mk. You can tweak
>  settings in there if need be, but you should not specificy settings on the
>  command-line when running make.
It'd be nice to have true cross-compilation test...

> +32 bit build on 64 bit machine
> +------------------------------
> +You need to set CFLAGS=-m32 LDFLAGS=-m32 and PKG_CONFIG_LIBDIR
> +
> +* RPM based distributions (openSUSE, Fedora, etc.)
> +PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
> +
> +* Debian / Ubuntu and derivates
> +PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure

I guess, we should set this variable in 32 bit build in travis CI (we have only 1
job, which uses Debian). It's not failing now, because it's not a minimal build.
Therefore we should have minimal 32 bit build (easiest way is to use openSUSE or
Fedora/CentOS as they don't install libtirpc 32bit).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
