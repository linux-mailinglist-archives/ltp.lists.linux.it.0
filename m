Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB98135976
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:49:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B9313C2483
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 13:49:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 81AC73C2369
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:49:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 98AEE1A00EAB
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 13:49:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7777B2326;
 Thu,  9 Jan 2020 12:49:27 +0000 (UTC)
Date: Thu, 9 Jan 2020 13:49:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109124927.GA22952@rei.lan>
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109095239.GB31981@rei.lan>
 <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2eBO5WywEvBJKyEpVCky05CHp-JpwpFUSgAUjTx8GAKtQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > index 2af040840..f5d7ca8ac 100644
> > > --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> > > @@ -20,6 +20,7 @@
> > >   *   None
> > >   */
> > >
> > > +#define _GNU_SOURCE
> > >  #define _XOPEN_SOURCE 600
> > >  #include <fcntl.h>
> >
> > Why do we need the _GNU_SOURCE here? We switched to a syscall() in the
> > header, hence we do not need the syncfs() prototype anymore.
> >
> >
> But shouldn't we define the _GNU_SOURCE for syscall()?  Otherwise,
> the _XOPEN_SOURCE 600 definitions will take effect and makes the compiler
> print new errors[1].
> 
> Here I fee a little confused, or do we need to delete the _XOPEN_SOURCE
> definition directly for the test posix_fadvise01.c?

Sigh, looks like the _XOPEN_SOURCE 600 disables syscall() definition
from being exposed, which is otherwise exposed by default.

Also it looks like things works fine for me when I remove the
_XOPEN_SOURCE 600.

So I guess that we should try to remove the _XOPEN_SOURCE from the
posix_fadvise() tests and try to compile the code on old enough
distribution. If that works we should do it that way.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
