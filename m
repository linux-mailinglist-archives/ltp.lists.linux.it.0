Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97FF727E
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:50:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66FD53C183D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:50:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C71A13C038C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:50:11 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA9191401A68
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:50:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 08AD6B277;
 Mon, 11 Nov 2019 10:50:08 +0000 (UTC)
Date: Mon, 11 Nov 2019 11:50:07 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yu <999iscool@gmail.com>
Message-ID: <20191111105007.GA14824@rei.lan>
References: <CALgnY2eHDnkoYLoC5TdFzecjpUb2AAJRadU30LofZxT2QG-fgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALgnY2eHDnkoYLoC5TdFzecjpUb2AAJRadU30LofZxT2QG-fgg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Verify LTP was compiled with specific kernel headers
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Not sure if this is the right place to ask, but I am trying to compile LTP
> with a specific kernel release.

What for? LTP compilation does not depend on a kernel version during
build.

All it depends on is glibc and a couple of devel libraries, but in most
of the cases we carry fallback definitions in a case that something is
missing.

> The source tarball was extracted. I make install the linux kernel headers:
> 
> make headers_install INSTALL_HDR_PATH=/tmp/test-kernel-h
> 
> Then I proceeded with:
> 
> make autotool
> ./configure --prefix=/tmp/out --includedir=/tmp/kernel-h/include/linux
> make
> make install
> 
> My question is how can I tell if it's really compiled with those headers?
> Is includedir the right one to use? I see oldincludedir is defaults to
> /usr/include.

LTP mostly avoids including kernel headers, it mostly uses libc and very
few kernel ones when necessary, but as said we carry fallback
definitions to carry on with compliation on older systems.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
