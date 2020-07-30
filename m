Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E601323301F
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:16:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95FA73C4C03
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:16:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CE01F3C0515
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:16:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 410581003A78
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:16:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 989E8AB55
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 10:16:57 +0000 (UTC)
Date: Thu, 30 Jul 2020 12:16:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200730101643.GA6381@dell5510>
References: <20200730092637.487-1-pvorel@suse.cz>
 <20200730094842.GB3457@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730094842.GB3457@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] semctl: Fix 32 bit build
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
> >  testcases/kernel/syscalls/ipc/semctl/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
> > index 99971a7db..2559b4c28 100644
> > --- a/testcases/kernel/syscalls/ipc/semctl/Makefile
> > +++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
> > @@ -8,6 +8,6 @@ LTPLIBS = ltpipc ltpnewipc
> >  include $(top_srcdir)/include/mk/testcases.mk

> >  semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
> > -semctl08: LDLIBS += -lltpnewipc
> > +semctl08: LDLIBS = -lltpnewipc -lltp

> If nothing else this may break things if user passed something in
> LDLIBS, so it should be:

> LDLIBS = -lltpnewipc $(LDLIBS)

Thanks! I tried that before, but without ':' before '=':
semctl08: LDLIBS = -lltpnewipc $(LDLIBS)
Makefile:12: *** Recursive variable 'LDLIBS' references itself (eventually).  Stop.

Assigning as := fixes that:
-semctl08: LDLIBS += -lltpnewipc
+semctl08: LDLIBS := -lltpnewipc $(LDLIBS)

Sorry for overlooking obvious error.

> And I guess the safest rule would be to add the -lltp* libraries first,
> because naturally none of the code in LTP but the test depends on these.
Are you're going to fix by changing order somewhere in include/mk/?
Or shell I push the fix with your ack?
I'd prefer proper fix so commits like this or 22f510de8 ("Fix static linking
with musl-fts") aren't needed any more.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
