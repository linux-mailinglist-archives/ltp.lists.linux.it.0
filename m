Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E522FEDF1
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:03:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8CAD3C63BF
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:03:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 882BB3C2311
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:03:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 88F851A00FAC
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:03:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C49B3AB7A;
 Thu, 21 Jan 2021 15:03:47 +0000 (UTC)
Date: Thu, 21 Jan 2021 16:03:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YAmX0tCKisM14QzS@pevik>
References: <20210119132427.6342-1-pvorel@suse.cz>
 <6007A999.7090903@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6007A999.7090903@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] mallopt01: Rewrite to new API
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

thanks for your review and more search in man page than I did!

...
> > diff --git a/configure.ac b/configure.ac
> > index e44e25cc6..17ef76c1a 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -94,6 +94,7 @@ AC_CHECK_FUNCS_ONCE([ \
> >       io_uring_register \
> >       io_uring_enter \
> >       kcmp \
> > +    mallopt \
> If glibc/ulibc supports mallopt, it also should support mallinfo. So only
> check mallopt, I think it is ok.
Yes. These are glibc specific and uclibc tries to be API compatible with glibc.


> I guess musl libc doesn't support it, is it right?
Correct, musl don't support it, neither binder.

> > diff --git a/testcases/kernel/syscalls/mallopt/mallopt01.c b/testcases/kernel/syscalls/mallopt/mallopt01.c
...
> > -/*
> > - * NAME
> > - *	mallopt
> > - *
> > - * CALLS
> > - *	malloc(3x), mallopt(3x), mallinfo(3x).
> > - *
> > - * ALGORITHM
> > - *	Set options, malloc memory, and check resource ussage.
> > +/*\
> > + * [DESCRIPTION]
> >    *
> > - * RESTRICTIONS
> > - */
> > + * Basic mallinfo() and mallopt() testing (M_MXFAST, M_NLBLKS).
> > +\*/
> I see glibc code, it said "Only one of these (M_MXFAST) is used
>   in this malloc. The others (M_NLBLKS, M_GRAIN, M_KEEP) don't apply,
>   so setting them has no effect. But this malloc also supports four
>   other options in mallopt. "

> Also, I don't see M_NLBLKS handle in __libc_mallopt.

> I think that is why man-pages said "The SVID defined
> options M_MXFAST, M_NLBLKS, M_GRAIN, and M_KEEP, but only the first of these
> is implemented in glibc."

> I guess we can remove useless M_NLBLKS test.
Good catch! Agree. And it's also not supported on uclibc.

...
> >   	info = mallinfo();
> The lastest mallinfo man-pages said " However, the older function,
> mallinfo(), is deprecated since the type used for the fields is too small".
> The mallinfo2 structure used size_t data type instead of int data type in
> mallinfo struct. Maybe we can add a new test for it.

+1.
mallinfo2() was added few months ago to glibc by Martin Liska, released in 2.33.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
