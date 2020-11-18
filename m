Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F16132B8673
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 22:19:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E2D63C6451
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 22:19:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C07993C31D3
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 22:19:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 33D9E600671
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 22:19:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FCF0AF7E;
 Wed, 18 Nov 2020 21:19:28 +0000 (UTC)
Date: Wed, 18 Nov 2020 22:19:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201118211926.GA182229@pevik>
References: <1604925271-4811-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <20201109125938.GC9991@yuki.lan> <5FA9ED44.7080909@cn.fujitsu.com>
 <5FAA0151.3030002@cn.fujitsu.com> <20201110102641.GA11262@yuki.lan>
 <5FAB4274.6090505@cn.fujitsu.com> <5FB4BC97.8030300@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FB4BC97.8030300@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pan/ltp-pan.c: fix file descriptors leaks
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

> Hi Petr
> > Hi Cyril
> > > Hi!
> > > > > Yes, musl-libc doesn't support "e" mode for fopen[1].
> > > > Sorry, I ignore __fmodeflags function, musl libc supports "e" mode since
> > > > 0.9.7 after this commit 8582a6e9f ("add 'e' modifier (close-on-exec) to
> > > > fopen and fdopen").

> > > > https://git.musl-libc.org/cgit/musl/commit/src?id=8582a6e9f25dd7b87d72961f58008052a4cac473


> > > > It is about 8 years since musl libc fopen() supports "e". glibc2.7
> > > > fopen() supports "e" is about 13 years. Maybe we can use "e" mode now?

> > > To be honest I haven't had used ltp-pan for last two years, so if that
> > > change works for everyone still using it, then we can go ahead with it.
> > OK. I will wait a week. If nobody has objection, I will merge it.
> I plan to merge this patch today. Before it, I want to listen some advise
> from you( IMO, you know musl-libc a lot and other libc on embedded system).

Acked-by: Petr Vorel <pvorel@suse.cz>

Should be safe.

Kind regards,
Petr

> > Best Regards
> > Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
