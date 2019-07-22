Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D326FBFF
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:18:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D9683C1CFD
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 11:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 24AAB3C185E
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:18:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BA3E71A00704
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 11:18:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12397AE60;
 Mon, 22 Jul 2019 09:18:40 +0000 (UTC)
Date: Mon, 22 Jul 2019 11:18:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190722091839.GB10580@rei.lan>
References: <20190722083356.10142-1-pvorel@suse.cz>
 <20190722085215.GA10580@rei.lan> <20190722091403.GA12237@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722091403.GA12237@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] syscalls: Remove getcontext01
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
> > Being deprecated from POSIX is never a reason to remove tests as far as
> > the API is exposed to userspace it should be tested.
> OK, thanks for a clarification. I thought that, but wasn't sure. That's
> why this RFC. Agree with the point + it's still in current glibc.
> 
> BTW Maybe it'd be good to write down this policy + write which glibc versions
> we support, which would answer whether some functionality can be removed in
> given point (we describe goals and mention glibc in old document doc/ltp-howto.{txt,lyx},
> but IMHO we should update this document remove lyx version and add it to wiki).

I guess that the ltp-howto.lyx should be just removed along with the
man3 directory, generally the doc/ directory could use some cleanup.

Also we do have most of the up-to-date documentation in the
test-writing-guidelines.txt so I we may as well add this kind of
information there.

> > What is the real motivation for this removal?
> Looking over the weekend on tests which does not compile on musl
> (which does not include deprecated functionality). I'll rewrite the test into
> new API and add autotools check.

Ack.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
