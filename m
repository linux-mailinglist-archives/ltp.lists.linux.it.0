Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0F839B5B4
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:15:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 901F83C4F2A
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:15:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B5293C248C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:15:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 29FDC1400549
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:15:40 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86E8521A14;
 Fri,  4 Jun 2021 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622798140;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZpiHK8805D4I4eziqhIr20vySLMHSn83fKaZjkkDOs=;
 b=tSr0MpwDVqPLmTb26C4hFjXvRWi1bxLOXcDRMgcpoHNxJMJDoQpscTIAnEzwyP7PMHSagB
 u2sDZUWno5I9rlTzVCfABgLJk2ygKd/RUxGqU4+8ahAIDEx3sVjUmi37J8P//kY7pKv59W
 ynVWsiSHZfzF998F97nFMdYxdc57KKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622798140;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZpiHK8805D4I4eziqhIr20vySLMHSn83fKaZjkkDOs=;
 b=gs+T+kJeXTtuDDsQOpT07V3tdwEXGTntk3y66irR222DXv9rshKTx945JCSGjspQSeTzSD
 sWD7pi3hbxQcH8Ag==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5EA48118DD;
 Fri,  4 Jun 2021 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622798140;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZpiHK8805D4I4eziqhIr20vySLMHSn83fKaZjkkDOs=;
 b=tSr0MpwDVqPLmTb26C4hFjXvRWi1bxLOXcDRMgcpoHNxJMJDoQpscTIAnEzwyP7PMHSagB
 u2sDZUWno5I9rlTzVCfABgLJk2ygKd/RUxGqU4+8ahAIDEx3sVjUmi37J8P//kY7pKv59W
 ynVWsiSHZfzF998F97nFMdYxdc57KKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622798140;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BZpiHK8805D4I4eziqhIr20vySLMHSn83fKaZjkkDOs=;
 b=gs+T+kJeXTtuDDsQOpT07V3tdwEXGTntk3y66irR222DXv9rshKTx945JCSGjspQSeTzSD
 sWD7pi3hbxQcH8Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ruS+FTzvuWDWZwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 09:15:40 +0000
Date: Fri, 4 Jun 2021 11:15:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YLnvOpNr3HlTLWWP@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <YLnGIJWPf2XsAdTt@pevik> <875yyuj91v.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875yyuj91v.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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

Hi Richie,

> > FYI yesterday I sent patch to add make check{,-c,shell}, but for running C/shell API tests:
> > https://patchwork.ozlabs.org/project/ltp/list/?series=247103

> So I guess we have a name collision here. Something to consider is that
> GNU Make defines 'checks' as running self tests. So perhaps you are
> correct to use that word.

> I could rename the static analyses to 'analyze' or 'lint'. OTOH it might
> be better if running the self tests is called 'make
> run-{c,shell}-api-tests', because only a few people need to do
> that. Whereas it is intended that all contributors run the static
> analyses checks.

run-{c,shell}-api-tests is IMHO too long, but I was thinking about
check-{,c,shell}-api. But maybe you're right, let's wait for others opinions.

> Although, if someone runs 'make check' in the lib directory, then it
> makes sense to run the C API tests as well as do the analyses. Or not?

Yes, I'd be for having make check, which would run all check targets,
which can be also run separately:
make check-clang
make check-c
make check-shell

(or whatever we name these clang and C/shell API tests targets)

> > Taking 2 latests commits + adding clang-devel / libclang-dev packages makes CI
> > running.

> > https://github.com/pevik/ltp/commit/b2427f39ddb15c97761208a605637e0da6fe66ca

> Thanks, I guess this shows that libclang is well supported.
Yes, it looks to be even in old clang 3.5.


> > The only missing piece is include/mk/clang-checks.mk (this patchset not even
> > compile now).

> >> Richard Palethorpe (2):
> >>   Add 'make checks' and clang-checks to build system
> > make check ... clang-check (to avoid confusion).

> >>   Start libclang based analyzer and TEST() check

> >>  configure.ac                       |   2 +
> >>  include/mk/config.mk.in            |   5 +
> >>  include/mk/env_post.mk             |   8 ++
> >>  include/mk/generic_leaf_target.inc |   5 +-
> >>  include/mk/lib.mk                  |   3 +
> >>  include/mk/rules.mk                |   9 ++
> >>  include/mk/testcases.mk            |   1 +
> >>  tools/clang-checks/.gitignore      |   1 +
> >>  tools/clang-checks/Makefile        |  13 ++
> >>  tools/clang-checks/main.c          | 218 +++++++++++++++++++++++++++++
> > I'd name it tools/clang-check/ (and include/mk/clang-check.mk), but that's just
> > personal opinion.

> Yeah, we do not want a mixture of check and checks. I should probably
> just make it 'check' as it saves typing one letter.

+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
