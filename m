Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B823C920
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 11:26:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC3233C3261
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 11:26:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 299603C180B
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 11:26:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 909772009BD
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 11:26:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70A74ACB8;
 Wed,  5 Aug 2020 09:27:01 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:27:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200805092703.GB5522@yuki.lan>
References: <20200731121508.12805-2-chrubis@suse.cz>
 <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build system: Add explicit make rules
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
> > This commit adds explicit build rules, the main motivation are recent
> > build failures caused by library orderings. To fix that this commit
> > introduces LTPLDLIBS special variable that is passed to linker before
> > the LDLIBS which avoids the need for tricks as
> > "LDLIBS := -lltpfoo $(LDLIBS)" in the Makefiles.
> > 
> > This commit also silences the output by default a bit, the verbose
> > output could be enabled by VERBOSE=1 env variable, which is probably
> > what most of the build systems will do if this gets commited. I guess
> > that we can as well silence a bit the "make entering/leaving directory"
> > if this the right way to go.
> 
> alias for V=0 / V=1 would be nice

Done in a follow up patch.

> LTPLDLIBS should probably be mentioned in doc/build-system-guide.txt

I've added a line to the variables listing in there before pushing.

> > 
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  include/mk/env_post.mk |  2 ++
> >  include/mk/rules.mk    | 29 +++++++++++++++++++++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 include/mk/rules.mk
> > 
> > diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> > index f4169ad66..bdf8c696d 100644
> > --- a/include/mk/env_post.mk
> > +++ b/include/mk/env_post.mk
> > @@ -107,4 +107,6 @@ $(error You must define $$(prefix) before executing
> > install)
> >  endif # END $(filter-out install,$(MAKECMDGOALS)),$(MAKECMDGOALS)
> >  endif
> >  
> > +include $(top_srcdir)/include/mk/rules.mk
> > +
> >  endif
> > diff --git a/include/mk/rules.mk b/include/mk/rules.mk
> > new file mode 100644
> > index 000000000..e9b9c35ef
> > --- /dev/null
> > +++ b/include/mk/rules.mk
> > @@ -0,0 +1,29 @@
> > +%.o: %.c
> > +ifdef VERBOSE
> > +	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> > +else
> > +	@$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<
> > +	@echo CC $@
> > +endif
> 
> What if we wouldn't print "DIR" (for non-clean targets) and printed relative paths instead?

Great idea, I've added these changes to the first patch in the series
before I pushed it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
