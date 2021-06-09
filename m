Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7843A164A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:58:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52FA93C8FD8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:58:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C0783C7AB9
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:58:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1547514011AE
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:58:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CE021FD2A;
 Wed,  9 Jun 2021 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gl6AcTRFOHx6ON0bL4BfF+ZN6SDuYTFIdfFSZ4G7G0M=;
 b=GqMpOliFwW6vRfLZu8Udysbvnq3bdF5wXhT0ov4a9EyNUZf5A1tsHinOztiWuAO1RGgseB
 BdocJxmdpS9nEY/JvYhM2EE+KOZktx9tapfwy3O26s3X8+NuXqZk+aBdaZOAcM4xZWwjU2
 gD0pwqpULOpY1NVy6R1Dm5oAlX+j5GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gl6AcTRFOHx6ON0bL4BfF+ZN6SDuYTFIdfFSZ4G7G0M=;
 b=Q+BfP5slNVa+bKwgrdI05lwY1jRP3IyArHiPfI9wyTu8qN7ue2sE7+d+SSY0R8SNFWdxUO
 xv4n5ZtAQtSL0xDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4DA48118DD;
 Wed,  9 Jun 2021 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gl6AcTRFOHx6ON0bL4BfF+ZN6SDuYTFIdfFSZ4G7G0M=;
 b=GqMpOliFwW6vRfLZu8Udysbvnq3bdF5wXhT0ov4a9EyNUZf5A1tsHinOztiWuAO1RGgseB
 BdocJxmdpS9nEY/JvYhM2EE+KOZktx9tapfwy3O26s3X8+NuXqZk+aBdaZOAcM4xZWwjU2
 gD0pwqpULOpY1NVy6R1Dm5oAlX+j5GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gl6AcTRFOHx6ON0bL4BfF+ZN6SDuYTFIdfFSZ4G7G0M=;
 b=Q+BfP5slNVa+bKwgrdI05lwY1jRP3IyArHiPfI9wyTu8qN7ue2sE7+d+SSY0R8SNFWdxUO
 xv4n5ZtAQtSL0xDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /crHEQvJwGBCPwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 13:58:35 +0000
Date: Wed, 9 Jun 2021 15:32:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YMDC/mjGTXxoq9uH@yuki>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMDBFfCZwYDYwWDg@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >   - the scaled value is then divided, if needed, so that we end up a
> >     correct maximal runtime for an instance of a test, i.e. we have
> >     max runtime for an instance fork_testrun() that is inside of
> >     .test_variants and .all_filesystems loops
> Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
> runtime for each filesystems depends on number of filesystems? E.g. writev03.c
> with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
> filesystems is about 1 min. We should document that author should expect max
> number of filesystems. What happen with these values in the (long) future, when
> LTP support new filesystem (or drop some)? This was a reason for me to define in
> the test value for "Max runtime per iteration", not whole run.

That's one of the downsides of this approach.

The reason why I choose this approach is that you can set upper cap for
the whole test run and not only for a single filesystem/variant.

Also this way the test timeout corresponds to the maximal test runtime.

Another option would be to redefine the timeout to be timeout per a
fork_testrun() instance, which would make the approach slightly easier
in some places, however that would mean either changing default test
timeout to much smaller value and annotating all long running tests.

Hmm, I guess that annotating all long running tests and changing default
timeout may be a good idea regardless this approach.

> >   - this also allows us to controll the test max runtime by setting a
> >     test timeout
> 
> > * The maximal runtime, per whole test, can be passed down to the test
> 
> >   - If LTP_MAX_TEST_RUNTIME is set in test environment it's used as a
> >     base for max_runtime instead of the scaled down timeout, it's still
> >     divided into pieces so that we have correct runtime cap for an
> >     fork_testrun() instance
> LTP_MAX_TEST_RUNTIME should go to doc/user-guide.txt. I suppose you waiting for
> a feedback before writing docs.

Yes I do not consider this to be finished patchset and I do expect that
it would need some changes.

> >   - We also make sure that test timeout is adjusted, if needed, to
> >     accomodate for the new test runtime cap, i.e. if upscaled runtime is
> >     greater than timeout, the test timeout is adjusted
> 
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  include/tst_fuzzy_sync.h                      |  4 +-
> >  include/tst_test.h                            |  7 +-
> >  lib/newlib_tests/.gitignore                   |  3 +-
> >  .../{test18.c => test_runtime01.c}            |  7 +-
> >  lib/newlib_tests/test_runtime02.c             | 31 +++++++++
> >  lib/tst_test.c                                | 64 ++++++++++++++++++-
> >  testcases/kernel/crypto/af_alg02.c            |  2 +-
> >  testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
> >  testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
> >  testcases/kernel/mem/mtest06/mmap1.c          | 13 ++--
> >  .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
> >  11 files changed, 117 insertions(+), 26 deletions(-)
> >  rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
> +1 for test description instead of plain number.
> 
> ...
> > +++ b/lib/newlib_tests/test_runtime01.c
> ...
> >  static void run(void)
> >  {
> > -	do {
> > +	while (tst_remaining_runtime())
> >  		sleep(1);
> > -	} while (tst_timeout_remaining() >= 4);
> 
> > -	tst_res(TPASS, "Timeout remaining: %d", tst_timeout_remaining());
> > +	tst_res(TPASS, "Timeout remaining: %d", tst_remaining_runtime());
> 
> There is a warning:
> tst_test.c:1369: TINFO: Timeout per run is 0h 00m 05s
> tst_test.c:1265: TWARN: Timeout too short for runtime offset 5!
> tst_test.c:1309: TINFO: runtime > timeout, adjusting test timeout to 6
> tst_test.c:1318: TINFO: Max runtime per iteration 1s
> test_runtime01.c:15: TPASS: Timeout remaining: 0

This is expected.

> Maybe test should use value without warning (i.e. 7).
> Or is the warning intended to be the test output?
> 
> .timeout = 6 fails:
> 
> tst_test.c:1369: TINFO: Timeout per run is 0h 00m 06s
> tst_test.c:1304: TBROK: Test runtime too small!

This is one of the corner cases that probably needs to be handled
differently.

> .timeout >= 7 is ok:
> tst_test.c:1369: TINFO: Timeout per run is 0h 00m 07s
> tst_test.c:1318: TINFO: Max runtime per iteration 1s
> test_runtime01.c:15: TPASS: Timeout remaining: 0
> 
> ...
> > diff --git a/lib/tst_test.c b/lib/tst_test.c
> > index 7c9061d6d..23b52583a 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> 
> > -unsigned int tst_timeout_remaining(void)
> > +#define RUNTIME_TIMEOUT_OFFSET 5
> => maybe define it to 6 to allow running with .timeout = 6?
> 
> > +#define RUNTIME_TIMEOUT_SCALE  0.9
> > +
> > +static unsigned int timeout_to_runtime(void)
> > +{
> > +	if (results->timeout <= RUNTIME_TIMEOUT_OFFSET) {
> > +		tst_res(TWARN, "Timeout too short for runtime offset %i!",
> > +		        RUNTIME_TIMEOUT_OFFSET);
> > +		return 1;
> > +	}
> > +
> > +	return (results->timeout - RUNTIME_TIMEOUT_OFFSET) * RUNTIME_TIMEOUT_SCALE;
> > +}
> > +
> > +static unsigned int runtime_to_timeout(unsigned int runtime)
> > +{
> > +	return runtime / RUNTIME_TIMEOUT_SCALE + RUNTIME_TIMEOUT_OFFSET;
> > +}
> ...
> 
> Also test_runtime02.c fails, is that intended?
> tst_test.c:1374: TINFO: Timeout per run is 0h 00m 05s
> tst_test.c:1265 timeout_to_runtime(): results->timeout: 5
> tst_test.c:1266 timeout_to_runtime(): RUNTIME_TIMEOUT_OFFSET: 5
> tst_test.c:1268: TWARN: Timeout too short for runtime offset 5!
> tst_test.c:1314: TINFO: runtime > timeout, adjusting test timeout to 6
> tst_test.c:1321: TBROK: Test runtime too small!

Yes, this is also supposed to fail, it's written in the test comment as
well...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
