Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2943A158B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:24:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABC9D3C7AE6
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 15:24:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5A663C4C02
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:24:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F3CCE1A01458
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 15:24:44 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A69B219B7;
 Wed,  9 Jun 2021 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623245084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz4DjVmznlmSDSPV+iYRZzGfvjky9QsT6e+A5HCubv8=;
 b=nVElohYVCkTrriycdHGzF2faFuGVRZMAMrzScVysejJ6TAoVGhkCXPuq1ggeqoy/jWlTmF
 UCRz84zZZvtto+BVb4obkEWcWP9fT7uQ4j0zCwg4fWNzn7KCLz/SyIgCBRKRhv2HIPWZhT
 +kPGwzzYhvcSyE57hesOrKd/jdiIoTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623245084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz4DjVmznlmSDSPV+iYRZzGfvjky9QsT6e+A5HCubv8=;
 b=K1/RmoS5O4M8HoXdvehBX3YHr9092aGXW3iQnraVo9M9Zjd9YvN5oAEKdQs99Rw5OPxc15
 MbxgciJTDVxubmCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 03978118DD;
 Wed,  9 Jun 2021 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623245084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz4DjVmznlmSDSPV+iYRZzGfvjky9QsT6e+A5HCubv8=;
 b=nVElohYVCkTrriycdHGzF2faFuGVRZMAMrzScVysejJ6TAoVGhkCXPuq1ggeqoy/jWlTmF
 UCRz84zZZvtto+BVb4obkEWcWP9fT7uQ4j0zCwg4fWNzn7KCLz/SyIgCBRKRhv2HIPWZhT
 +kPGwzzYhvcSyE57hesOrKd/jdiIoTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623245084;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz4DjVmznlmSDSPV+iYRZzGfvjky9QsT6e+A5HCubv8=;
 b=K1/RmoS5O4M8HoXdvehBX3YHr9092aGXW3iQnraVo9M9Zjd9YvN5oAEKdQs99Rw5OPxc15
 MbxgciJTDVxubmCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DBjpORvBwGC+JwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 09 Jun 2021 13:24:43 +0000
Date: Wed, 9 Jun 2021 15:24:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMDBFfCZwYDYwWDg@pevik>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609114659.2445-4-chrubis@suse.cz>
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

> This is an attempt on how to handle a cap on a test runtime correctly it
> consists of several pieces namely:

> * The idea of test maximal runtime is uncoupled from  test timeout

>   - the maximal runtime is simply a cap for how long should an instance
>     of a test run, it's mainly used by CVE reproducers that attempt to
>     trigger a race until they run out of time, such test may exit sooner
>     but must not run longer than the cap

>   - the tst_timeout_remaining() is replaced with tst_remaining_runtime()
>     which accounts correctly for .test_variants and .all_filesystems

> * The default value for a test max_runtime is computed from test timeout

>   - we scale the timeout down so that the there is some room for test to
>     properly exit once test runtime was exhausted, this is our base for
>     a test max_runtime

>   - the scaled value is then divided, if needed, so that we end up a
>     correct maximal runtime for an instance of a test, i.e. we have
>     max runtime for an instance fork_testrun() that is inside of
>     .test_variants and .all_filesystems loops
Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
runtime for each filesystems depends on number of filesystems? E.g. writev03.c
with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
filesystems is about 1 min. We should document that author should expect max
number of filesystems. What happen with these values in the (long) future, when
LTP support new filesystem (or drop some)? This was a reason for me to define in
the test value for "Max runtime per iteration", not whole run.

>   - this also allows us to controll the test max runtime by setting a
>     test timeout

> * The maximal runtime, per whole test, can be passed down to the test

>   - If LTP_MAX_TEST_RUNTIME is set in test environment it's used as a
>     base for max_runtime instead of the scaled down timeout, it's still
>     divided into pieces so that we have correct runtime cap for an
>     fork_testrun() instance
LTP_MAX_TEST_RUNTIME should go to doc/user-guide.txt. I suppose you waiting for
a feedback before writing docs.

>   - We also make sure that test timeout is adjusted, if needed, to
>     accomodate for the new test runtime cap, i.e. if upscaled runtime is
>     greater than timeout, the test timeout is adjusted

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_fuzzy_sync.h                      |  4 +-
>  include/tst_test.h                            |  7 +-
>  lib/newlib_tests/.gitignore                   |  3 +-
>  .../{test18.c => test_runtime01.c}            |  7 +-
>  lib/newlib_tests/test_runtime02.c             | 31 +++++++++
>  lib/tst_test.c                                | 64 ++++++++++++++++++-
>  testcases/kernel/crypto/af_alg02.c            |  2 +-
>  testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
>  testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
>  testcases/kernel/mem/mtest06/mmap1.c          | 13 ++--
>  .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
>  11 files changed, 117 insertions(+), 26 deletions(-)
>  rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
+1 for test description instead of plain number.

...
> +++ b/lib/newlib_tests/test_runtime01.c
...
>  static void run(void)
>  {
> -	do {
> +	while (tst_remaining_runtime())
>  		sleep(1);
> -	} while (tst_timeout_remaining() >= 4);

> -	tst_res(TPASS, "Timeout remaining: %d", tst_timeout_remaining());
> +	tst_res(TPASS, "Timeout remaining: %d", tst_remaining_runtime());

There is a warning:
tst_test.c:1369: TINFO: Timeout per run is 0h 00m 05s
tst_test.c:1265: TWARN: Timeout too short for runtime offset 5!
tst_test.c:1309: TINFO: runtime > timeout, adjusting test timeout to 6
tst_test.c:1318: TINFO: Max runtime per iteration 1s
test_runtime01.c:15: TPASS: Timeout remaining: 0

Maybe test should use value without warning (i.e. 7).
Or is the warning intended to be the test output?

.timeout = 6 fails:

tst_test.c:1369: TINFO: Timeout per run is 0h 00m 06s
tst_test.c:1304: TBROK: Test runtime too small!

.timeout >= 7 is ok:
tst_test.c:1369: TINFO: Timeout per run is 0h 00m 07s
tst_test.c:1318: TINFO: Max runtime per iteration 1s
test_runtime01.c:15: TPASS: Timeout remaining: 0

...
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 7c9061d6d..23b52583a 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c

> -unsigned int tst_timeout_remaining(void)
> +#define RUNTIME_TIMEOUT_OFFSET 5
=> maybe define it to 6 to allow running with .timeout = 6?

> +#define RUNTIME_TIMEOUT_SCALE  0.9
> +
> +static unsigned int timeout_to_runtime(void)
> +{
> +	if (results->timeout <= RUNTIME_TIMEOUT_OFFSET) {
> +		tst_res(TWARN, "Timeout too short for runtime offset %i!",
> +		        RUNTIME_TIMEOUT_OFFSET);
> +		return 1;
> +	}
> +
> +	return (results->timeout - RUNTIME_TIMEOUT_OFFSET) * RUNTIME_TIMEOUT_SCALE;
> +}
> +
> +static unsigned int runtime_to_timeout(unsigned int runtime)
> +{
> +	return runtime / RUNTIME_TIMEOUT_SCALE + RUNTIME_TIMEOUT_OFFSET;
> +}
...

Also test_runtime02.c fails, is that intended?
tst_test.c:1374: TINFO: Timeout per run is 0h 00m 05s
tst_test.c:1265 timeout_to_runtime(): results->timeout: 5
tst_test.c:1266 timeout_to_runtime(): RUNTIME_TIMEOUT_OFFSET: 5
tst_test.c:1268: TWARN: Timeout too short for runtime offset 5!
tst_test.c:1314: TINFO: runtime > timeout, adjusting test timeout to 6
tst_test.c:1321: TBROK: Test runtime too small!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
