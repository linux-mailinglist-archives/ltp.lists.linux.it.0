Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A8F22BE2C
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 08:43:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 984913C26D8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 08:43:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 507D73C2642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 08:43:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 31210601C6F
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 08:42:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95338AC20;
 Fri, 24 Jul 2020 06:43:48 +0000 (UTC)
Date: Fri, 24 Jul 2020 08:43:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200724064338.GF32086@dell5510>
References: <20200722184739.19460-1-t-josne@linux.microsoft.com>
 <20200723114600.GB31591@dell5510>
 <0a970e3c-a10f-f032-eb26-d738bc220458@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a970e3c-a10f-f032-eb26-d738bc220458@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Petr,
> Thank you for reviewing
Thanks for your time as well :).

> On 7/23/20 7:46 AM, Petr Vorel wrote:
> > Hi,

> > ...
> > > +++ b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
> > > @@ -0,0 +1,121 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +# Copyright (c) 2020 Microsoft Corporation
> > > +# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
> > > +#
> > > +# Verify that kexec cmdline is measured correctly.
> > > +
> > > +TST_NEEDS_CMDS="kexec sed xargs printf grep tr"
> > > +TST_CNT=1
> > > +TST_NEEDS_DEVICE=1
> > > +
> > > +. ima_setup.sh
> > > +
> > > +# Since the test is executed inside some sort of
> > > +# separate shell, *most* environment variables are
> > > +# not accessible, so there's no way to set it from
> > > +# the outside.
> > Do you mean that using this will not work?
> > IMA_KEXEC_IMAGE="${IMA_KEXEC_IMAGE:-/boot/vmlinuz-$(uname -r)}"
> > I don't understand that as I'm able to set variables even I run some tests in
> > dracut.
> I tried doing this in the past, and couldn't get it to work, but I just
> tried it again
> and was able to get it working. Essentially, what I tried before was
> `SOME_VAR="..." sudo runltp ...`, which doesn't work, but `sudo
> SOME_VAR="..." runltp` does pass the variable
> to the test. So, that should be added to this patch.
OK, so no any dracut / initramfs involved :).
Passing variables really works as expected, you need to export it first:
$ sudo su
# export IMA_KEXEC_IMAGE=/tmp/foo
# PATH="/opt/ltp/testcases/bin:$PATH" runltp ...

or just run the script directly:
$ sudo su
# IMA_KEXEC_IMAGE=/tmp/foo PATH="/opt/ltp/testcases/bin:$PATH" ima_kexec.sh

> > Also writing same docs doc on 2 places is not good. High level info should go to
> > README.md, implementation details to shell script.
> This is a good point. I'll reorganize the documentation of this patch.
> > Please hold on with posting new version. I have several fixes, thus I'd like to
> > send it after we sort this (trying to save you time).
> Okay :)
> > Kind regards,
> > Petr
> Thanks,
> Lachlan

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
