Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A0311FCE
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:54:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC73D3C70A6
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:54:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E4B2D3C230F
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:54:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2A6671000422
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:54:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72BE9AC43;
 Sat,  6 Feb 2021 19:54:28 +0000 (UTC)
Date: Sat, 6 Feb 2021 20:54:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YB7z8hk85v6jZBXd@pevik>
References: <20201110120035.20543-1-pvorel@suse.cz>
 <20201110134625.GA6482@pevik>
 <CAEemH2cP8Tub5UjBcRoo2Nkwtku7KjtUYP9U9v75GHEywe=aXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cP8Tub5UjBcRoo2Nkwtku7KjtUYP9U9v75GHEywe=aXw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] travis: Add libefivar support
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

> On Tue, Nov 10, 2020 at 9:46 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,

> > > Travis CI:
> > > https://travis-ci.org/github/pevik/ltp/builds/742684375

> > Looks like Debian does not ship libefivar-dev for ppc64el
> > https://travis-ci.org/github/pevik/ltp/jobs/742684377


> From Travis CI, the CentOS8 reports miss efivar-devel package too.

> Maybe fix it by the following?

> --- a/travis/fedora.sh
> +++ b/travis/fedora.sh
> @@ -9,11 +9,11 @@ yum -y install \
>         clang \
>         gcc \
>         findutils \
> -       efivar-devel \
>         libtirpc \
>         libtirpc-devel \
>         pkg-config \
>         redhat-lsb-core

> -# CentOS 8 doesn't have libmnl-devel
> +# CentOS 8 doesn't have libmnl-devel and efivar-devel
>  yum -y install libmnl-devel || yum -y install libmnl
> +yum -y --skip-broken install efivar-devel

I'm sorry, I completely overlook your comment.
In the end it's not needed as we use our own implementation.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
