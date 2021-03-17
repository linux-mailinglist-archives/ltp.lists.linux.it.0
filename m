Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548E33EED5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:52:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 365DD3C6096
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 11:52:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 409EF3C6058
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:51:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E9879140112F
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 11:51:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52591AC1F;
 Wed, 17 Mar 2021 10:51:47 +0000 (UTC)
Date: Wed, 17 Mar 2021 11:51:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Li Wang <liwang@redhat.com>
Message-ID: <YFHfQeFg0Uzwl3kH@pevik>
References: <20210317083347.9791-1-pvorel@suse.cz> <YFHPbD132yWLMqK8@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFHPbD132yWLMqK8@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add Maintainer Patch Review Checklist
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

Hi all,

Cyril, Li, Jan, thanks for your tips, I'll use them for v2.
Few notes to some of Cyril's tips.

> > +### C tests
> > +* use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
> > +* record in `.gitignore`
> > +* check coding style with `checkpatch.pl`

> Checkpatch is distributed with linux kernel source code, please also use
> reasonably recent one.
I'd prefer not duplicate the info, that's why I linked it docs, which already
mention this. Thus I'd prefer add "reasonably recent one" to
doc/test-writing-guidelines.txt.

> > +(more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
> > +* docparse documentation

> + proper documentation comment
>   -- this should be explained somewhere and linked here
Agree, but I'll probably skip this one.

> + If a test is a regression test it should include tags
>   -- this should be explained somewhere as well and linked here
+1

> > +### Shell tests
> > +* use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell API]
> > +* check coding style with `checkbashism.pl`

> I guess that we should add the link to debian devscripts here
Again, I wanted to remove duplicity, but just repeating link here does no harm.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
