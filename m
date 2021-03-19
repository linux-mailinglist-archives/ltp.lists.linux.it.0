Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124C341976
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 11:05:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3A903C6022
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 11:05:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D97153C2C1A
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 11:05:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 747FA200254
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 11:05:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE7AEACC6;
 Fri, 19 Mar 2021 10:05:24 +0000 (UTC)
Date: Fri, 19 Mar 2021 11:05:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YFR3Y2yln5y8EDKc@pevik>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz> <YFRtoRtRFVFYeXkn@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFRtoRtRFVFYeXkn@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > +* Author's `Signed-off-by` tag
> > +* Committer's `Reviewed-by` or `Signed-off-by` tag
> > +* Check also mailing lists for other reviewers / testers
> > +* `Fixes: hash` if it fixes particular commit
>                                          ^
> 					 LTP

> Let's add this here so that is clear what we mean.

> > +* `Fixes: #N` if it fixes N github issue, so it's automatically closed
>                               ^
> 			 This wording is not clear it should be:

> 	... if it fixes github issue number N ...

> Or just:

> 	.. if it fixed github issue N ...

+1

> > +After patch is accepted or rejected, set correct state and archive in
> > +https://patchwork.ozlabs.org/project/ltp/list/[LTP patchwork instance].
> > +
> > +Also update LTP WIKI (git URL https://github.com/linux-test-project/ltp.wiki.git)
> > +if touch 'doc/*.txt'.
> > +
> > +## New tests
> > +New test should
> > +
> > +* Have a record in runtest file
> > +* Test should work fine with more than one iteration
> > +  (e.g. run with `-i 100`)
> > +* Have a brief description
> > +
> > +### C tests
> > +* Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
> > +* Test files are added into corresponding '.gitignore' files
>           ^
> 	  binaries?

+1 (copy pasted from Test Writing Guidelines, thus fixed it also there as you
suggest in next mail).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
