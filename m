Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 026083B00C5
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 11:50:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A9B1E3C7003
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 11:50:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE8DF3C2307
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 11:50:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2099E600902
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 11:50:40 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B5E71FD45;
 Tue, 22 Jun 2021 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624355440;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LlTOynl7ajRg53Gw66Cy7GxshOFv2r3OUPebMT7frkQ=;
 b=fVNk8RUBjzXJAVTzKASeHZhIVazYR97UXr8R6VQQkRsQUjT9NkNHEQ4LJ15PEonP3hMJcF
 uTzLFaU8k4vqDBOw3yjFKenjIoybg2h7K1vK0PRH0Sxio6N7rQGj3bBVEgfuKCnhiOUnA8
 jNGzWtWfawArcKLXkEPJD/iHc1nNgKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624355440;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LlTOynl7ajRg53Gw66Cy7GxshOFv2r3OUPebMT7frkQ=;
 b=FJx2Shmlgm7mmanh2Li5vQUG/PK/T7ZyaNDp6ybW08ELxC6mbkwYturCRVLfMVbWOpfftS
 G8jPDJoNJ2g8TSDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 079C9118DD;
 Tue, 22 Jun 2021 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624355440;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LlTOynl7ajRg53Gw66Cy7GxshOFv2r3OUPebMT7frkQ=;
 b=fVNk8RUBjzXJAVTzKASeHZhIVazYR97UXr8R6VQQkRsQUjT9NkNHEQ4LJ15PEonP3hMJcF
 uTzLFaU8k4vqDBOw3yjFKenjIoybg2h7K1vK0PRH0Sxio6N7rQGj3bBVEgfuKCnhiOUnA8
 jNGzWtWfawArcKLXkEPJD/iHc1nNgKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624355440;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LlTOynl7ajRg53Gw66Cy7GxshOFv2r3OUPebMT7frkQ=;
 b=FJx2Shmlgm7mmanh2Li5vQUG/PK/T7ZyaNDp6ybW08ELxC6mbkwYturCRVLfMVbWOpfftS
 G8jPDJoNJ2g8TSDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /8N2AHCy0WA/OAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 22 Jun 2021 09:50:40 +0000
Date: Tue, 22 Jun 2021 11:50:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YNGybhjq161LwfaN@pevik>
References: <20210618191252.12403-1-pvorel@suse.cz>
 <YNGmfnR6/FpzHe99@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNGmfnR6/FpzHe99@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/1] make: Add make test{, -c, -c-run,
 -shell-run} targets
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, ltp@lists.linux.it,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > For testing C and shell API.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi all,

> > another attempt for make test target.

> > In a long term, I'd like to wrap the execution with some script, as I
> > suppose there will be some metadata in test, allowing to run tests which
> > don't TPASS or TBROK (we have quite a lot of them). Then the summary
> > would be even more useful.

> > FIXME: broken in lib/, it runs all test twice.

> > changes v1->v2:
> > Not sure if it's a good approach to process each test separately,
> > there is no loop as Cyril suggested in [1], thus there is no summary
> > what happen.

> > I previously had in similar loop in include/mk/generic_leaf_target.inc:

> > test-c-run: $(TEST_TARGETS)
> > 	@set -e; echo; echo "===== Test C API ====="; \
> > 	for i in $(TEST_TARGETS); do \
> > 	    echo; echo "* $$i"; \
> > 	    echo "PATH $(top_srcdir)/testcases/lib:$$PATH"; \
> > 	    PATH="$(top_srcdir)/testcases/lib:$$PATH" ./$$i || [ $$? -eq 32 ]; \
> > 	done; echo; \
> > 	echo "All C API tests passed or TCONF"

> > test-shell-run:
> > 	@set -e; echo; echo "===== Test shell API ====="; \
> > 	for i in $(TEST_SHELL_TARGETS); do \
> > 	    echo; echo "* $$i"; \
> > 	    PATH="$(abs_top_srcdir)/testcases/lib:$(abs_top_builddir)/testcases/lib:$$PATH" $(abs_srcdir)/$$i || [ $$? -eq 32 ]; \
> > 	done; echo; \
> > 	echo "All shell API tests passed or TCONF"

> > but that was problematic in lib (which uses generic_leaf_target.inc).

> Why not just add runtest.sh into newlib_tests/ that would do all the
> work, then we can forget about all the trickery and just run the scritp
> on 'make test-c'. Well we would have to call make in newlib_tests first
> to make sure it was compiled, but that should be it.

> And the same for testcases/lib/.

> I do not think that adding a target per a testcase is sane.

Thanks for your input, makes sense. Actually, adding a script which would run it
was my approach in 2 years old patch [1].

I'll add runtest.sh which will run all tests which by default TPASS/TCONF now,
but possible to specify just some tests (speedup the development).

After we merge it I'll continue in Christian's effort to add metadata of
expected output [2], which allows us to run all tests (including these which
fail).

I suggest to add 3 targets: make test test-c test-shell (test will run both
test-c test-shell).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20190924182841.4528-1-pvorel@suse.cz/
[2] https://patchwork.ozlabs.org/project/ltp/patch/ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
