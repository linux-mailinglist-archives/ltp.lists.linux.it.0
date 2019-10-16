Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E998D9370
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:13:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C64583C2398
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:13:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 73A383C2267
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:13:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 54BBD601BEA
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:13:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 701D3ACC0;
 Wed, 16 Oct 2019 14:13:40 +0000 (UTC)
Date: Wed, 16 Oct 2019 16:13:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191016141339.GA19297@rei.lan>
References: <20191016131506.17193-1-chrubis@suse.cz>
 <1282930646.6466524.1571232948788.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1282930646.6466524.1571232948788.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: Chang Yin <cyin@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +
> > +	if (mask & TST_TAINT_W && taint & TST_TAINT_W) {
> > +		tst_res(TCONF, "Ignoring already set kernel warning taint");
> > +		mask &= ~TST_TAINT_W;
> 
> Shouldn't this rather mask it from taint_mask?
> Otherwise, won't you still get an error in tst_taint_check()?

Of course.

> > +	}
> > +
> >  	if ((taint & mask) != 0)

And this has to be changed so that we check the taint againts the
taint_mask .

> >  		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
> >  }
> > --
> > 2.21.0
> > 
> > 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
