Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9581E765B1
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:28:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8D73C1D0C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:28:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 287F43C1CFE
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:28:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2836E14019C4
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:28:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D0E9B650;
 Fri, 26 Jul 2019 12:28:27 +0000 (UTC)
Date: Fri, 26 Jul 2019 14:28:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190726122830.GA4254@dell5510>
References: <20190726092110.13116-1-pvorel@suse.cz>
 <1968200096.2791881.1564143777013.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1968200096.2791881.1564143777013.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mprotect04: Fix compilation error for
 ia64
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

Hi Jan,

> ----- Original Message -----
> > Fixes: 94f5be719 ("syscalls/mprotect04: align exec_func to 64 bytes")

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi,

> > or should we drop ia64 support as the architecture is obsolete?
> > Since we don't test this arch, there are some other build failures
> > (at least on old SLES I tested the patch).

> Thanks, I missed the ia64-specific code. RHEL dropped support for ia64 in RHEL6,
> and RHEL5 will likely be EOL in ~6 months, so I'm fine either way.
Thanks for a quick reply. So it's up to Cyril, whether keep the support or not.

> One note below.


> > Kind regards,
> > Petr

> >  testcases/kernel/syscalls/mprotect/mprotect04.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)

> > diff --git a/testcases/kernel/syscalls/mprotect/mprotect04.c
> > b/testcases/kernel/syscalls/mprotect/mprotect04.c
> > index a014ab6b4..d1991a2db 100644
> > --- a/testcases/kernel/syscalls/mprotect/mprotect04.c
> > +++ b/testcases/kernel/syscalls/mprotect/mprotect04.c
> > @@ -141,7 +141,7 @@ struct func_desc {
> >  	uint64_t glob_pointer;
> >  };

> > -static __attribute__((noinline)) void *get_func(void *mem)
> > +static __attribute__((noinline)) void *get_func(void *mem, uintptr_t
> > *func_page_offset LTP_ATTRIBUTE_UNUSED)
> >  {
> >  	static struct func_desc fdesc;

> > @@ -275,11 +275,13 @@ static void testfunc_protexec(void)
> >  	if (!func)
> >  		goto out;

> > +#ifndef __ia64__

> If you initialize func_page_offset to 0 in ia64 get_func(), then this ifdef
> is not needed. Either way:
This is obviously better, thanks!

> Acked-by: Jan Stancek <jstancek@redhat.com>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
