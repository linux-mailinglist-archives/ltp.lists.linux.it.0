Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8561F518A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 11:51:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FFAF3C618A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 11:51:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 525BA3C0198
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 11:51:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E7DA71A014AC
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 11:51:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3384AEF1;
 Wed, 10 Jun 2020 09:51:30 +0000 (UTC)
Date: Wed, 10 Jun 2020 11:51:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200610095125.GA21406@dell5510>
References: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
 <78176e41-03c4-e75b-594b-20731b2d4dfd@cn.fujitsu.com>
 <20200610080529.GA19781@dell5510>
 <2845dc64-cce0-47df-1005-4cc508bd9388@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2845dc64-cce0-47df-1005-4cc508bd9388@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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

Hi Xu,

> > I guess you missed librealtime.a in (testcases/realtime/lib/Makefile).
> Yes.

> > Maybe removing libdir could be in separate commit, it looks to me as unrelated
> > change.
Actually, when looking into this more (this part is new in v2, Jan didn't review
it).

I'd keep keep libdir in include/mk/config.mk.in, because we use it in our
lib/ltp.pc file. Maybe we don't need if we don't install any library, but then
we should remove also LIB variable and associated code in include/mk/lib.mk.
Which should be a second step (second commit).

Also libdir is somehow expected by automake (it's referenced in generated
./m4/Makefile.in ./testcases/realtime/m4/Makefile.in).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
