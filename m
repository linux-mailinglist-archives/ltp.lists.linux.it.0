Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D68762EB24B
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 19:16:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DFB83C6FB3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 19:16:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D766A3C231A
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 19:16:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 68ABE14001E3
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 19:16:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76336AD8C
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 18:16:48 +0000 (UTC)
Date: Tue, 5 Jan 2021 19:16:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/StDvQcbuLsmuRC@pevik>
References: <20201216101012.14644-1-chrubis@suse.cz>
 <20201216101012.14644-6-chrubis@suse.cz> <X9t8ZjwhY+Db7nRq@pevik>
 <X/Rk3ZOu8gVb9+Ur@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/Rk3ZOu8gVb9+Ur@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/move_pages12: Add one more kernel
 git hash
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
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Patchset pushed, thanks for the review.
Great, thanks!

> > ...
> > > -/*
> > > - * Description:
> > > +/*\
> > > + * [DESCRIPTION]
> > > + *
> > > + * *Test 1*
> > >   *
> > > - * Test #1:
> > > - *  This is a regression test for the race condition between move_pages()
> > > - *  and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> > > - *  for hugepages internally and tries to get its refcount without
> > > - *  preventing concurrent freeing.
> > > + * This is a regression test for the race condition between move_pages()
> > > + * and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> > > + * for hugepages internally and tries to get its refcount without
> > > + * preventing concurrent freeing.
> > >   *
> > > - *  This test can crash the buggy kernel, and the bug was fixed in:
> > > + * This test can crash the buggy kernel, and the bug was fixed in:
> > >   *
> > >   *   commit e66f17ff71772b209eed39de35aaa99ba819c93d
> > >   *   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>

> > I wonder if we should format "commit XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" as
> > link to Linus' tree (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX).

> Well we do have links in the tags anyways so I think that it's a bit
> more readable as it is.

I meant in the output (pdf, html) the text would be the same but become link to
Linus' tree (instead of being a plain text).

But that's really minor.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
