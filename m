Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB10D93A7
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:21:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0AFF3C22B8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:21:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 321AB3C061B
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:21:03 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFE501000C15
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:21:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 450B6BA58
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 14:21:02 +0000 (UTC)
Date: Wed, 16 Oct 2019 16:21:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Michael Moese <mmoese@suse.de>
Message-ID: <20191016142101.GC19297@rei.lan>
References: <20191016131506.17193-1-chrubis@suse.cz>
 <bc2f54f1-3be1-cf77-7475-3c08cbd24850@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc2f54f1-3be1-cf77-7475-3c08cbd24850@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_taint: Ignore WARN taint flag if already
 set
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
> > diff --git a/lib/tst_taint.c b/lib/tst_taint.c
> > index a5dbf77d2..3de6d72f4 100644
> > --- a/lib/tst_taint.c
> > +++ b/lib/tst_taint.c
> > @@ -82,8 +82,13 @@ void tst_taint_init(unsigned int mask)
> >  		tst_res(TCONF, "Kernel is too old for requested mask");
> >  
> >  	taint_mask = mask;
> > -
> >  	taint = tst_taint_read();
> > +
> > +	if (mask & TST_TAINT_W && taint & TST_TAINT_W) {
> > +		tst_res(TCONF, "Ignoring already set kernel warning taint");
> > +		mask &= ~TST_TAINT_W;
> > +	}
> > +
> >  	if ((taint & mask) != 0)
> >  		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
> >  }
> > 
> 
> Tests may rely on TAINT_W to decide the result. If we need TAINT_W, we
> can only run the test when it was not set before. For example,
> testcases/cve/cve-2017-17053.c relies on this.
> This may render this testcase unusable, or do I get this wrong?

Only on systems where something set the flag already. Ideally that will
not happen on many systems.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
