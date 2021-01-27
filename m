Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 822763063A6
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 20:01:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 448393C7A42
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 20:01:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 58AE83C4FA4
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 20:01:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 099451000340
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 20:01:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E9C4AD2B;
 Wed, 27 Jan 2021 19:01:26 +0000 (UTC)
Date: Wed, 27 Jan 2021 20:01:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>, Cyril Hrubis <chrubis@suse.cz>,
 Li Wang <liwang@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YBG4hFVo5wdaFnPa@pevik>
References: <20210125131746.74630-1-lkml@jv-coder.de>
 <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e573f919-8205-40e2-5187-49bff0983872@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg/functional: Convert to newlib
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> --- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> > +++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
> > @@ -1,58 +1,39 @@
> >   #!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> > +# Copyright (c) 2009 FUJITSU LIMITED
> > +# Copyright (c) 2018-2019 ARM Ltd. All Rights Reserved.
> This is bad copy-and-paste for all files, where I mentioned arm, sorry...
That's not a big deal.

On a first look good cleanup, thank you!

I hope these tests aren't planned to be rewritten to C (like NUMA tests).
I suppose not, but better to ask earlier.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
