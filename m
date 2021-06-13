Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB63A5A34
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 21:45:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C23863C4D3D
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 21:45:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EEF633C2E31
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 21:45:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 059616002F4
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 21:45:00 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 277F021967;
 Sun, 13 Jun 2021 19:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623613500;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfNfogusoI+cgFXsDxHs1BIKq/RJSdSURL08Uh1un3o=;
 b=N0e7XEg4Q2GHnaj96EJGXLC4hnZGg5McpHxQC4eCXNkOGq0naoMwq/q1M1XXrUmq3aO8is
 tg66mrPp+hmk4P+NUpafm7JmxgOkQ44ZWlE0JCBQTkHfjw20k2rlXcmIy+ja0TULL7o8wf
 iTED1rST8zzvxHNsF8IQD8qAl0DpDXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623613500;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfNfogusoI+cgFXsDxHs1BIKq/RJSdSURL08Uh1un3o=;
 b=vKs81hTLci3lKYwhTUAvjgIrDXAC4tMm+Y5pehGt9pI9PkmmsTy7QvBgnnwPwpRYpMJ/hB
 VWgS4KX8dIdOcwCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C5E36118DD;
 Sun, 13 Jun 2021 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623613500;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfNfogusoI+cgFXsDxHs1BIKq/RJSdSURL08Uh1un3o=;
 b=N0e7XEg4Q2GHnaj96EJGXLC4hnZGg5McpHxQC4eCXNkOGq0naoMwq/q1M1XXrUmq3aO8is
 tg66mrPp+hmk4P+NUpafm7JmxgOkQ44ZWlE0JCBQTkHfjw20k2rlXcmIy+ja0TULL7o8wf
 iTED1rST8zzvxHNsF8IQD8qAl0DpDXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623613500;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfNfogusoI+cgFXsDxHs1BIKq/RJSdSURL08Uh1un3o=;
 b=vKs81hTLci3lKYwhTUAvjgIrDXAC4tMm+Y5pehGt9pI9PkmmsTy7QvBgnnwPwpRYpMJ/hB
 VWgS4KX8dIdOcwCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bGI+LDtgxmCEGwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Sun, 13 Jun 2021 19:44:59 +0000
Date: Sun, 13 Jun 2021 21:44:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YMZgONrus6i45R9U@pevik>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
 <YMDC/mjGTXxoq9uH@yuki>
 <fd006cd4-2f65-138a-8907-94153ee3b45e@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd006cd4-2f65-138a-8907-94153ee3b45e@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 3/4] lib: Introduce concept of
 max_test_runtime
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On 09. 06. 21 15:32, Cyril Hrubis wrote:
> > Hi!
> >>>   - the scaled value is then divided, if needed, so that we end up a
> >>>     correct maximal runtime for an instance of a test, i.e. we have
> >>>     max runtime for an instance fork_testrun() that is inside of
> >>>     .test_variants and .all_filesystems loops
> >> Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
> >> runtime for each filesystems depends on number of filesystems? E.g. writev03.c
> >> with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
> >> filesystems is about 1 min. We should document that author should expect max
> >> number of filesystems. What happen with these values in the (long) future, when
> >> LTP support new filesystem (or drop some)? This was a reason for me to define in
> >> the test value for "Max runtime per iteration", not whole run.

> > That's one of the downsides of this approach.

> > The reason why I choose this approach is that you can set upper cap for
> > the whole test run and not only for a single filesystem/variant.

> > Also this way the test timeout corresponds to the maximal test runtime.

> > Another option would be to redefine the timeout to be timeout per a
> > fork_testrun() instance, which would make the approach slightly easier
> > in some places, however that would mean either changing default test
> > timeout to much smaller value and annotating all long running tests.

> > Hmm, I guess that annotating all long running tests and changing default
> > timeout may be a good idea regardless this approach.

> Some fuzzysync tests have long run time by design because running too
> few loops on broken systems will not trigger the bug. Limiting maximum
> program execution time may be useful for quick smoke tests but it's not
> usable for real test runs where we want reliable reproducibility.
Interesting.

> I'd prefer adding a command line option to tst_test (e.g. -m) that would
> just print test metadata, including total timeout of all fork_testrun()
> subtests, and exit. Static metadata is not a sufficient solution for
FYI I suggested this some time ago with private chat with Cyril, he mentioned
that there were some problems with it. IMHO it'd be great to implement it.

> this because the same test binary may have different runtimes on
> different system configurations, for example because the list of
> available filesystems may change arbitrarily between test runs. It'd be
> great if test runners other than runltp-ng could get a straighforward
> timeout number without reimplementing a calculation that may change in
> future versions of LTP.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
