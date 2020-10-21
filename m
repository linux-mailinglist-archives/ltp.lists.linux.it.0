Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3F0294EB1
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 16:31:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA49B3C56AA
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 16:31:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 71BAD3C2632
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 16:31:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9B3DB1000AE4
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 16:31:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6512AC8B;
 Wed, 21 Oct 2020 14:31:31 +0000 (UTC)
Date: Wed, 21 Oct 2020 16:31:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201021143130.GA21944@x230>
References: <20201020100910.10828-1-chrubis@suse.cz>
 <20201020100910.10828-2-chrubis@suse.cz> <878sbzx66b.fsf@suse.de>
 <20201021100605.GA10861@yuki.lan> <874kmnwy6g.fsf@suse.de>
 <20201021141157.GC10861@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021141157.GC10861@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/3] lib/tst_kconfig: Rewrite
 the parser internals
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > >> lines first to remove whitespace issues and expose the parser to all
> > >> possible variable name symbols and values instead of just the ones which
> > >> appear in our current tests.

> > > I guess that it's techincally possible to have a whitespaces there, but
> > > will not happen unless you hand-edit the config file before compilation,
> > > which I doubt will ever happen.


> > It can also happen if someone has their own script to modify the
> > config. At any rate, if you are confident that it will never happen then
> > there should be no problem failing hard if it does.

> It would be probably easier to eat the whitespace around the = if
> present. But still I would ignore anything that isn't correct variable
> assignment, since such config would fail kernel compilation anyways.
+1

+ I use ./scripts/config --enable | --disable ... to avoid problems with
incorrect config.

> > >> > +
> > >> > +		if (kconfig_parse_line(line, vars, vars_len))
> > >> > +			vars_found++;

> > >> > +		if (vars_found == vars_len)
> > >> > +			goto exit;
> > >> >  	}

> > >> Generally, this approach seems like to result in spurious TCONFs. We
> > >> need to properly parse the file and fail if some line can't be
> > >> interpreted.

> > > Well we do expect well formatted .config file from a start, if you hand
> > > edit it and put whitespaces into unexpected places more things may
> > > fail.

> > Kernel build system seems to have no problem with it. More generally
> > though we should fail hard if there is something unexpected, not produce
> > TCONF which people don't check.

> Even if we do I do not think that we should care about anything but
> syntactically correct input, since if you modify the file after kernel
> compilation you have lost anyways.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
