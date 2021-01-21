Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88C2FF006
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:20:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C493F3C63CE
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:20:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8D96D3C2311
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:20:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2AC856000FD
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:20:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 661AFB734
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:20:12 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:20:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YAmpuuYfNQLOpi67@pevik>
References: <20210121130033.20764-1-pvorel@suse.cz> <87mtx29wiq.fsf@suse.de>
 <YAmUwVWvm84w8ITB@yuki.lan> <YAmhO8gMJ1KZ4EHA@pevik>
 <87k0s69t6z.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k0s69t6z.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] docparse: Replace \t with space
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

> Hello,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi,

> >> > JQ says "control characters from U+0000 through U+001F must be
> >> > escaped". So I expect it is only a matter of time until some other
> >> > control character is used.
> > +1

> >> > Perhaps we should escape all control characters into the \uXXXX
> >> > hexidecimal form?

> >> Or fail the compilation if we get one of these into the parser?
> > We do fail already, but it's a bit hidden now.
> > I don't know why build continues for so long.

> > Also there would have to be striking error message.
> > But docparser is not mandatory (people might have it disabled), thus mostly it
> > will be us the maintainers who is going to fix these whitespace issues :(.

> >> There is no point in having them in the metadata anyways.
> > That would be solved by replacing some reasonable subset. So far it was the tab
> > character.

> > Kind regards,
> > Petr

> I suppose actually I could just escape the tab in the C string. But as
"escape the tab in C string" that's what it's being done in this patch.

> Petr says, docparse is not mandatory so anything which can pass C
> compilation, but fails docparse is likely to create trouble.
+1.

> It would be possible to force running docparse and doing some validation
> on the JSON. As this would not require any more dependencies. In fact it
> would be nice to run docparse to produce just the JSON without having to
> install asciidoc[tor].

> The Makefile doesn't seem to allow this. Although it is quite easy to
> compile docparse without it.
That'd be easy to change.

But, there is perl package dependency. If possible I'd allow people to compile
LTP without bothering with CPAN (mainly due these embedded build source distros,
e.g. Buildroot, Yocto).

Generally I'd decouple requirements for C source code content and JSON.
\t in C source will be printed as tab, that's ok.
That's why I changed the formatting in docparse/data_storage.h.
I wonder how many escape strings we want to use. Maybe \n (if that's not already
handled).

I wonder if we can do some string validation in git commit or push hooks.
Although not sure if it's a good idea.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
