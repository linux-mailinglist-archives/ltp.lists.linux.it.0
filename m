Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C98B7EF0D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Sep 2025 15:07:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA9F03CDC01
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Sep 2025 12:37:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C02C73CDBC5
 for <ltp@lists.linux.it>; Wed, 17 Sep 2025 12:37:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33F68200ADE
 for <ltp@lists.linux.it>; Wed, 17 Sep 2025 12:37:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAC0A22213;
 Wed, 17 Sep 2025 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758105439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHfj9QtuGM/YVm6SM5sRd/dmqh4SWqXV8g4WkVrDlVg=;
 b=PWjOgVLT4/uHgMx7F/hlGDL7HnO1blZQp+xtO+O3fkqTYx8nWnUxKfsC2ZwYVbPlIU4j5u
 k0duQRnlg0b3Mi2ssf+PFFCb3KX4r7x8GV35AyLfVAs18HXrInOiQZK/G7CS0fuTuD4LIE
 nojqERp6b3Fzl9yBf/cvr0wqhmD8q6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758105439;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHfj9QtuGM/YVm6SM5sRd/dmqh4SWqXV8g4WkVrDlVg=;
 b=oLLXR30/G1MltrofTWh0Tt3PH8cAKp6m4wFVlWnkcad5zawv0daMmam/mWkB3jX/uBOPyC
 2FoSR2UT8c5atQAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758105438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHfj9QtuGM/YVm6SM5sRd/dmqh4SWqXV8g4WkVrDlVg=;
 b=n4Ua4kyDu/DPvcRy6VWmSEZWLCkKpv8t0tSq93vMrwPHzSc/3dmiEhHLLnHMPy6k3zgZ6t
 Fp1IdUovDc25qOjX/P7EwBIC3cHkTWD/W16ZjvRCO2Br2gC0OSRz3fKsA34GA6rNVa9nWM
 jOGRLMlYepUwrpcKMdMu8vsexMGhx44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758105438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHfj9QtuGM/YVm6SM5sRd/dmqh4SWqXV8g4WkVrDlVg=;
 b=ksdqcHVx2JiCobwv3asOX3TTucM3l08BRJkPpssoJz4HvDKvUl/8vvi1ME9qYL41kIrbVT
 2NIv42rGb9LqSFAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8C5313A92;
 Wed, 17 Sep 2025 10:37:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /vcsKF6Pymj+OAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 17 Sep 2025 10:37:18 +0000
Date: Wed, 17 Sep 2025 12:37:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Cermak <mcermak@redhat.com>
Message-ID: <20250917103717.GB336745@pevik>
References: <20250917090712.5tbidlr7yvqvikj7@lida.tpb.lab.eng.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917090712.5tbidlr7yvqvikj7@lida.tpb.lab.eng.brq.redhat.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -7.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] Proposal for new LTP config knob: LTP_QUIET
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
Cc: valgrind-developers@lists.sourceforge.net, Mark Wielaard <mark@klomp.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Hi folks,

> some time back, LTP_REPRODUCIBLE_OUTPUT was introduced in LTP.
> I'd like to propose a new, related LTP knob for our Valgrind
> test automation purposes: LTP_QUIET.  See attached patch.

> LTP_QUIET is supposed to suppress certain types of test output
> messages, such as: TCONF, TWARN, TINFO, and TDEBUG.  This would
> help us keep our test logs briefer, while still keeping the
> information we need in the logs.

> Please, consider merging upstream.

Thanks for contributing this. So the point is to have only the final summary
printed, right? (summary of TCONF/TWARN/TBROK/...).

I'm ok for merging this + to introduce the same for shell API (tst_test.sh),
although you in valgrind don't use it.  And we could even introduce '-q' getopt
(easier for manual debugging).

Do we then want to keep the "reproducible output" part? Or should it quiet
replace it?

@Cyril, if you agree, do we dare to have it before the release?

> Thank you,
> Martin



> From fb13e461ac76f6843f0fd9cc37ff42b971e8057c Mon Sep 17 00:00:00 2001
> From: Martin Cermak <mcermak@redhat.com>
> Date: Tue, 16 Sep 2025 16:15:22 +0200
> Subject: [PATCH] Introduce and use LTP_QUIET

> Introduce LTP_QUIET env variable.  When set to  1 or y, it will
> suppress printing TCONF, TWARN, TINFO, and TDEBUG messages, making
> valgrind ltp test logs cleaner.  In some cases such as  eventfd2_03,
> shmctl05, mlock03, poll02, prctl09, setsockopt10, and select02 this
> update avoids false positives.
> ---
>  .../0002-Introduce-LTP_QUIET-env-var.patch    | 73 +++++++++++++++++++
>  auxprogs/ltp-tester.sh                        |  7 ++
>  2 files changed, 80 insertions(+)
>  create mode 100644 auxprogs/ltp-patches/0002-Introduce-LTP_QUIET-env-var.patch

> diff --git a/auxprogs/ltp-patches/0002-Introduce-LTP_QUIET-env-var.patch b/auxprogs/ltp-patches/0002-Introduce-LTP_QUIET-env-var.patch
> new file mode 100644
> index 000000000..a77162bfc
> --- /dev/null
> +++ b/auxprogs/ltp-patches/0002-Introduce-LTP_QUIET-env-var.patch
> @@ -0,0 +1,73 @@
> +From 183df3240f8e7ca38fbe2fd472c31c9417ae7eb2 Mon Sep 17 00:00:00 2001
> +From: Martin Cermak <mcermak@redhat.com>
> +Date: Tue, 16 Sep 2025 15:46:40 +0200
> +Subject: [PATCH] Introduce LTP_QUIET env var
> +
> +Introduce LTP_QUIET env variable.  When set to  1 or y, it will
> +suppress printing TCONF, TWARN, TINFO, and TDEBUG messages.
> +---
> + lib/tst_test.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/lib/tst_test.c b/lib/tst_test.c
> +index 92872cc89..609a7b075 100644
> +--- a/lib/tst_test.c
> ++++ b/lib/tst_test.c
> +@@ -68,6 +68,7 @@ static int iterations = 1;
> + static float duration = -1;
> + static float timeout_mul = -1;
> + static int reproducible_output;
> ++static int quiet_output;
> + 
> + struct context {
> + 	int32_t lib_pid;
> +@@ -307,15 +308,19 @@ static void print_result(const char *file, const int lineno, int ttype,
> + 		res = "TBROK";
> + 	break;
> + 	case TCONF:
> ++		if (quiet_output) return;
> + 		res = "TCONF";
> + 	break;
> + 	case TWARN:
> ++		if (quiet_output) return;
> + 		res = "TWARN";
> + 	break;
> + 	case TINFO:
> ++		if (quiet_output) return;
> + 		res = "TINFO";
> + 	break;
> + 	case TDEBUG:
> ++		if (quiet_output) return;
> + 		res = "TDEBUG";
> + 	break;
> + 	default:
> +@@ -670,6 +675,7 @@ static void print_help(void)
> + 	fprintf(stderr, "LTP_DEV_FS_TYPE          Filesystem used for testing (default: %s)\n", DEFAULT_FS_TYPE);
> + 	fprintf(stderr, "LTP_ENABLE_DEBUG         Print debug messages (set 1 or y)\n");
> + 	fprintf(stderr, "LTP_REPRODUCIBLE_OUTPUT  Values 1 or y discard the actual content of the messages printed by the test\n");
> ++	fprintf(stderr, "LTP_QUIET                Values 1 or y will suppress printing TCONF, TWARN, TINFO, and TDEBUG messages\n");
> + 	fprintf(stderr, "LTP_SINGLE_FS_TYPE       Specifies filesystem instead all supported (for .all_filesystems)\n");
> + 	fprintf(stderr, "LTP_FORCE_SINGLE_FS_TYPE Testing only. The same as LTP_SINGLE_FS_TYPE but ignores test skiplist.\n");
> + 	fprintf(stderr, "LTP_TIMEOUT_MUL          Timeout multiplier (must be a number >=1)\n");
> +@@ -1361,6 +1367,7 @@ static void do_setup(int argc, char *argv[])
> + {
> + 	char *tdebug_env = getenv("LTP_ENABLE_DEBUG");
> + 	char *reproducible_env = getenv("LTP_REPRODUCIBLE_OUTPUT");
> ++	char *quiet_env = getenv("LTP_QUIET");
> + 
> + 	if (!tst_test)
> + 		tst_brk(TBROK, "No tests to run");
> +@@ -1391,6 +1398,10 @@ static void do_setup(int argc, char *argv[])
> + 	    (!strcmp(reproducible_env, "1") || !strcmp(reproducible_env, "y")))
> + 		reproducible_output = 1;
> + 
> ++	if (quiet_env &&
> ++	    (!strcmp(quiet_env, "1") || !strcmp(quiet_env, "y")))
> ++		quiet_output = 1;
> ++
> + 	assert_test_fn();
> + 
> + 	TCID = tcid = get_tcid(argv);
> +-- 
> +2.48.1
> +
> diff --git a/auxprogs/ltp-tester.sh b/auxprogs/ltp-tester.sh
> index ba8fd8be4..a95c603c5 100755
> --- a/auxprogs/ltp-tester.sh
> +++ b/auxprogs/ltp-tester.sh

This part is your valgrind runner right? (i.e. not for LTP).

Kind regards,
Petr

> @@ -21,6 +21,7 @@ PARALLEL_JOBS=${PARALLEL_JOBS:-$(nproc)}
>  # https://lore.kernel.org/ltp/20250505195003.GB137650@pevik/T/#t
>  export LTP_COLORIZE_OUTPUT=0
>  export LTP_REPRODUCIBLE_OUTPUT=1
> +export LTP_QUIET=1

>  # Initialize LOGDIR for bunsen upload (https://sourceware.org/bunsen/)
>  mkdir -p $LOGDIR; rm -rf ${LOGDIR:?}/*
> @@ -110,4 +111,10 @@ done

>  wait

> +echo -e "\nBrief LTP test results summary"
> +echo "-----------------------------------------"
> +find $LOGDIR -type f -name '*.trs' -exec grep -F ':test-result:' '{}' ';' |\
> +    sort -r | uniq -c | awk '{print $NF": "$1}'
> +echo -e "-----------------------------------------\n"
> +
>  echo "TESTING FINISHED, logs in $LOGDIR"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
