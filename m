Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D42EAB7D
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 14:07:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BF6A3C31F7
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 14:07:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 59D4B3C2BE3
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 14:07:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D14B11400E10
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 14:07:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D42AAD0B
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 13:07:51 +0000 (UTC)
Date: Tue, 5 Jan 2021 14:08:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <X/Rk3ZOu8gVb9+Ur@yuki.lan>
References: <20201216101012.14644-1-chrubis@suse.cz>
 <20201216101012.14644-6-chrubis@suse.cz> <X9t8ZjwhY+Db7nRq@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9t8ZjwhY+Db7nRq@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Patchset pushed, thanks for the review.

> ...
> > -/*
> > - * Description:
> > +/*\
> > + * [DESCRIPTION]
> > + *
> > + * *Test 1*
> >   *
> > - * Test #1:
> > - *  This is a regression test for the race condition between move_pages()
> > - *  and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> > - *  for hugepages internally and tries to get its refcount without
> > - *  preventing concurrent freeing.
> > + * This is a regression test for the race condition between move_pages()
> > + * and freeing hugepages, where move_pages() calls follow_page(FOLL_GET)
> > + * for hugepages internally and tries to get its refcount without
> > + * preventing concurrent freeing.
> >   *
> > - *  This test can crash the buggy kernel, and the bug was fixed in:
> > + * This test can crash the buggy kernel, and the bug was fixed in:
> >   *
> >   *   commit e66f17ff71772b209eed39de35aaa99ba819c93d
> >   *   Author: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
> 
> I wonder if we should format "commit XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" as
> link to Linus' tree (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX).

Well we do have links in the tags anyways so I think that it's a bit
more readable as it is.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
