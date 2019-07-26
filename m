Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E27719D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:50:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 374003C1D3C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 20:50:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1D9A93C1D00
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:50:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F2DBF1401DA2
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 20:50:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 69274AEB8;
 Fri, 26 Jul 2019 18:50:06 +0000 (UTC)
Date: Fri, 26 Jul 2019 20:50:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190726185004.GA12472@x230>
References: <20190726092110.13116-1-pvorel@suse.cz>
 <1968200096.2791881.1564143777013.JavaMail.zimbra@redhat.com>
 <20190726122830.GA4254@dell5510> <20190726124752.GB28028@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726124752.GB28028@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mprotect04: Fix compilation error for
 ia64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > > Thanks, I missed the ia64-specific code. RHEL dropped support for
> > > ia64 in RHEL6, and RHEL5 will likely be EOL in ~6 months, so I'm
> > > fine either way.
> > Thanks for a quick reply. So it's up to Cyril, whether keep the
> > support or not.

> Hmm, the last processors were made in 2017 but looking at TOP500 systems
> there was peek for itanim in 2004 and there were pretty nonexistent
> since 2012. Given that officially supported distros are going EOL soon
> enough I do not think that it makes sense to keep itanium specific code
> just so that 0.1% of our tests works on these processors.
Agree. OK, I'll remove ia64 specific code.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
