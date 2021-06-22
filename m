Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B20163B00FD
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 12:10:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B3763C870A
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 12:10:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 34E943C22F1
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:10:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7FF851400F9C
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 12:10:41 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E62A21973;
 Tue, 22 Jun 2021 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624356640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ObaqfNMjzPPkQy4UvdgyYmQn5z62HxD2M6MhJ/na0jQ=;
 b=iNCN1nHOD8qKPrQdu+6oJb/Uqo+fghCIfTRUiRQm6eROUi2ZMo0XFb+UOhlZnCqAPELSfo
 YBCJRWVdkqACo/iPZEjD8lJ4LU+5j5723HTn6posmqoP1na1Pgn+1JxpzhlkwXE+O6DPNb
 2ynMjmiJkglVHal5MIfftuB+30Gw4ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624356640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ObaqfNMjzPPkQy4UvdgyYmQn5z62HxD2M6MhJ/na0jQ=;
 b=ztL2lTkXKy474daC8VwVJ79J0PlwlXAPWb07f7RG2SV/mmUm9+YYm8c7FUf6Po5puDP5te
 ZgeHVQOBl0fWVbAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5CEB0118DD;
 Tue, 22 Jun 2021 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624356640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ObaqfNMjzPPkQy4UvdgyYmQn5z62HxD2M6MhJ/na0jQ=;
 b=iNCN1nHOD8qKPrQdu+6oJb/Uqo+fghCIfTRUiRQm6eROUi2ZMo0XFb+UOhlZnCqAPELSfo
 YBCJRWVdkqACo/iPZEjD8lJ4LU+5j5723HTn6posmqoP1na1Pgn+1JxpzhlkwXE+O6DPNb
 2ynMjmiJkglVHal5MIfftuB+30Gw4ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624356640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ObaqfNMjzPPkQy4UvdgyYmQn5z62HxD2M6MhJ/na0jQ=;
 b=ztL2lTkXKy474daC8VwVJ79J0PlwlXAPWb07f7RG2SV/mmUm9+YYm8c7FUf6Po5puDP5te
 ZgeHVQOBl0fWVbAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id IzpZFSC30WDBQgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 22 Jun 2021 10:10:40 +0000
Date: Tue, 22 Jun 2021 12:10:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Yang Xu <xuyang2018.jy@fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YNG3HmqqBGNfWLOI@pevik>
References: <20210618191252.12403-1-pvorel@suse.cz> <YNGmfnR6/FpzHe99@yuki>
 <YNGybhjq161LwfaN@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNGybhjq161LwfaN@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > Why not just add runtest.sh into newlib_tests/ that would do all the
> > work, then we can forget about all the trickery and just run the scritp
> > on 'make test-c'. Well we would have to call make in newlib_tests first
> > to make sure it was compiled, but that should be it.

> > And the same for testcases/lib/.

> > I do not think that adding a target per a testcase is sane.

> Thanks for your input, makes sense. Actually, adding a script which would run it
> was my approach in 2 years old patch [1].

> I'll add runtest.sh which will run all tests which by default TPASS/TCONF now,
> but possible to specify just some tests (speedup the development).

Also make install works also on lib/newlib_tests. Thus I'll install also runtest.sh
and try to setup PATH a way it works on both running from git and running from
make install. It might be worth to have lib tests runnable on SUT.

Kind regards,
Petr

> After we merge it I'll continue in Christian's effort to add metadata of
> expected output [2], which allows us to run all tests (including these which
> fail).

> I suggest to add 3 targets: make test test-c test-shell (test will run both
> test-c test-shell).

> Kind regards,
> Petr

> [1] https://patchwork.ozlabs.org/project/ltp/patch/20190924182841.4528-1-pvorel@suse.cz/
> [2] https://patchwork.ozlabs.org/project/ltp/patch/ce675759672af52bea02c11d51bd7d10f0bcb5cb.1566500817.git.clanig@suse.com/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
