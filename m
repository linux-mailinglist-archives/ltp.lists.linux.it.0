Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFC1C5B15
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:27:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4F8E3C57EE
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 17:27:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BAB553C268A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:27:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7A61F200DA4
 for <ltp@lists.linux.it>; Tue,  5 May 2020 17:27:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FEA4AC7B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 15:27:43 +0000 (UTC)
Date: Tue, 5 May 2020 17:27:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200505152739.GD9949@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505101625.25020-2-rpalethorpe@suse.com>
 <20200505133523.GA27810@yuki.lan> <20200505135531.GA30346@dell5510>
 <87a72ms93x.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a72ms93x.fsf@our.domain.is.not.set>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] pty04: Add SLCAN ldisc and check for
 CVE-2020-11494
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

Hi Richard,

> >> Hi!
> >> Both pushed, thanks.

> > This test does not compile on kernel older than v4.2-rc1 (2015),
> > because __pad, __res0 and __res1 are missing. They were added in
> > a2f11835994e ("can.h: make padding given by gcc explicit").

> I suppose I can just drop the header and define it inline as we need the
> fallback anyway.
+1. Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
