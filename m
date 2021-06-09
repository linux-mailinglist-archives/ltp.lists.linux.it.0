Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278A3A169B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:05:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF43C3C8FCB
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:05:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9001A3C7AD4
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:05:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C81221A00217
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:05:44 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 436EC219B1;
 Wed,  9 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVZFnzipiUTff9ruEVX3UmoPGhxB/CVoRBtF+GTfJt4=;
 b=A0mPNtnM/0SWTWiHvyKhsmTsfj0l/xScykvC+VCzQ68cZdtBxGRU//UzvEAcsEtaUbm1PD
 rpA7Cckh3NRbEnwUMP9Ky6VJ3D8tj7+5Eh9tBuxSRAuDmoowkHDvUNnKgjsvNPVUG3lLBS
 Yu9IV3cXIc5ZXVioMXtPLcued2YXpdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVZFnzipiUTff9ruEVX3UmoPGhxB/CVoRBtF+GTfJt4=;
 b=UhTDEPBMCq2C/5/umgPMvPSxc+8sWdkI0enU7jomH0B9Fm7RySJCrvxrbfqJTgI4LTYIys
 Zc1rSzhzZ+N+7IDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 11E1A118DD;
 Wed,  9 Jun 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVZFnzipiUTff9ruEVX3UmoPGhxB/CVoRBtF+GTfJt4=;
 b=A0mPNtnM/0SWTWiHvyKhsmTsfj0l/xScykvC+VCzQ68cZdtBxGRU//UzvEAcsEtaUbm1PD
 rpA7Cckh3NRbEnwUMP9Ky6VJ3D8tj7+5Eh9tBuxSRAuDmoowkHDvUNnKgjsvNPVUG3lLBS
 Yu9IV3cXIc5ZXVioMXtPLcued2YXpdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247544;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVZFnzipiUTff9ruEVX3UmoPGhxB/CVoRBtF+GTfJt4=;
 b=UhTDEPBMCq2C/5/umgPMvPSxc+8sWdkI0enU7jomH0B9Fm7RySJCrvxrbfqJTgI4LTYIys
 Zc1rSzhzZ+N+7IDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WYH3ArjKwGCqQwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 09 Jun 2021 14:05:44 +0000
Date: Wed, 9 Jun 2021 16:05:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMDKttIQJfdszYgt@pevik>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
 <YMDC/mjGTXxoq9uH@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMDC/mjGTXxoq9uH@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > >   - the scaled value is then divided, if needed, so that we end up a
> > >     correct maximal runtime for an instance of a test, i.e. we have
> > >     max runtime for an instance fork_testrun() that is inside of
> > >     .test_variants and .all_filesystems loops
> > Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
> > runtime for each filesystems depends on number of filesystems? E.g. writev03.c
> > with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
> > filesystems is about 1 min. We should document that author should expect max
> > number of filesystems. What happen with these values in the (long) future, when
> > LTP support new filesystem (or drop some)? This was a reason for me to define in
> > the test value for "Max runtime per iteration", not whole run.

> That's one of the downsides of this approach.

> The reason why I choose this approach is that you can set upper cap for
> the whole test run and not only for a single filesystem/variant.

> Also this way the test timeout corresponds to the maximal test runtime.

> Another option would be to redefine the timeout to be timeout per a
> fork_testrun() instance, which would make the approach slightly easier
> in some places, however that would mean either changing default test
> timeout to much smaller value and annotating all long running tests.
IMHO slightly better approach to me.

> Hmm, I guess that annotating all long running tests and changing default
> timeout may be a good idea regardless this approach.
+1

> > >   - this also allows us to controll the test max runtime by setting a
> > >     test timeout

> > > * The maximal runtime, per whole test, can be passed down to the test

> > >   - If LTP_MAX_TEST_RUNTIME is set in test environment it's used as a
> > >     base for max_runtime instead of the scaled down timeout, it's still
> > >     divided into pieces so that we have correct runtime cap for an
> > >     fork_testrun() instance
> > LTP_MAX_TEST_RUNTIME should go to doc/user-guide.txt. I suppose you waiting for
> > a feedback before writing docs.

> Yes I do not consider this to be finished patchset and I do expect that
> it would need some changes.
Sure.

> > >   - We also make sure that test timeout is adjusted, if needed, to
> > >     accomodate for the new test runtime cap, i.e. if upscaled runtime is
> > >     greater than timeout, the test timeout is adjusted

> > > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > > ---
> > >  include/tst_fuzzy_sync.h                      |  4 +-
> > >  include/tst_test.h                            |  7 +-
> > >  lib/newlib_tests/.gitignore                   |  3 +-
> > >  .../{test18.c => test_runtime01.c}            |  7 +-
> > >  lib/newlib_tests/test_runtime02.c             | 31 +++++++++
> > >  lib/tst_test.c                                | 64 ++++++++++++++++++-
> > >  testcases/kernel/crypto/af_alg02.c            |  2 +-
> > >  testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
> > >  testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
> > >  testcases/kernel/mem/mtest06/mmap1.c          | 13 ++--
> > >  .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
> > >  11 files changed, 117 insertions(+), 26 deletions(-)
> > >  rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
> > +1 for test description instead of plain number.

> > ...
> > > +++ b/lib/newlib_tests/test_runtime01.c
> > ...
> > >  static void run(void)
> > >  {
> > > -	do {
> > > +	while (tst_remaining_runtime())
> > >  		sleep(1);
> > > -	} while (tst_timeout_remaining() >= 4);

> > > -	tst_res(TPASS, "Timeout remaining: %d", tst_timeout_remaining());
> > > +	tst_res(TPASS, "Timeout remaining: %d", tst_remaining_runtime());

> > There is a warning:
> > tst_test.c:1369: TINFO: Timeout per run is 0h 00m 05s
> > tst_test.c:1265: TWARN: Timeout too short for runtime offset 5!
> > tst_test.c:1309: TINFO: runtime > timeout, adjusting test timeout to 6
> > tst_test.c:1318: TINFO: Max runtime per iteration 1s
> > test_runtime01.c:15: TPASS: Timeout remaining: 0

> This is expected.

> > Maybe test should use value without warning (i.e. 7).
> > Or is the warning intended to be the test output?

> > .timeout = 6 fails:

> > tst_test.c:1369: TINFO: Timeout per run is 0h 00m 06s
> > tst_test.c:1304: TBROK: Test runtime too small!

> This is one of the corner cases that probably needs to be handled
> differently.
+1

...
> > Also test_runtime02.c fails, is that intended?
> > tst_test.c:1374: TINFO: Timeout per run is 0h 00m 05s
> > tst_test.c:1265 timeout_to_runtime(): results->timeout: 5
> > tst_test.c:1266 timeout_to_runtime(): RUNTIME_TIMEOUT_OFFSET: 5
> > tst_test.c:1268: TWARN: Timeout too short for runtime offset 5!
> > tst_test.c:1314: TINFO: runtime > timeout, adjusting test timeout to 6
> > tst_test.c:1321: TBROK: Test runtime too small!

> Yes, this is also supposed to fail, it's written in the test comment as
> well...
I'm sorry to overlook this. Hope I'll finish test-c-run soon, so that we can
continue with expected test output for API tests.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
