Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A92F3C77
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 23:47:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCCC13C5462
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 23:47:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C7EB13C26DF
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 23:47:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BD5731400070
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 23:47:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D686AC95;
 Tue, 12 Jan 2021 22:47:51 +0000 (UTC)
Date: Tue, 12 Jan 2021 23:47:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, LTP List <ltp@lists.linux.it>,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/4nFTgDjsO4a9VU@pevik>
References: <20210111123626.28932-1-pvorel@suse.cz>
 <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
 <X/2E2GD/wimgo5Hi@pevik>
 <CAEemH2cmHrUGx3WXWfh6huNh-sv_GY56A+EvGVj-BiXT3WQ32A@mail.gmail.com>
 <X/4kHp818UKMRmXm@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/4kHp818UKMRmXm@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > From what I understanding, this macro runs the pkg-config tool to check
> > for the presence of packages against keyutils-libs and sets two variables:
> > LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.

> > So the list-of-modules should be the precise name(or version) of the
> > library, am I right?
> > See: https://autotools.io/pkgconfig/pkg_check_modules.html

> Thanks for an explanation, but I'm still missing something.
> In openSUSE:

> $ pkg-config --libs --cflags libkeyutils
> -lkeyutils

> $ pkg-config --libs --cflags keyutils-libs
> Package keyutils-libs was not found in the pkg-config search path.
> Perhaps you should add the directory containing `keyutils-libs.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'keyutils-libs', required by 'virtual:world', not found

> That's correct, because keyutils-devel package has file:
> /usr/lib64/pkgconfig/libkeyutils.pc

> The same is for Debian, which has
> /usr/lib/x86_64-linux-gnu/pkgconfig/libkeyutils.pc

> Looking at Fedora:
> keyutils-libs-devel [1] has /usr/lib64/pkgconfig/libkeyutils.pc.

> Download and unpack the package and run:
> $ PKG_CONFIG_LIBDIR="$PWD/usr/lib64/pkgconfig/" pkg-config --libs --cflags libkeyutils
> -lkeyutils

And more importantly upstream has libkeyutils.pc.in [1] (not keyutils-libs.pc).

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/tree/libkeyutils.pc.in

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
