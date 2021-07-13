Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B43C71F0
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:16:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 152D83C77ED
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:16:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D780A3C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:16:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3FD4C600296
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:16:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76A70201DA;
 Tue, 13 Jul 2021 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626185810;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OWWq5uhLjei/pZ9R+Ayd1Gk4tla6mdqrPY0iiL2uG64=;
 b=OXPBIYPyQgbzH9zj6/TNwYguC97nBdbVHM0IwSd0GVsBuoeUBFTCqXI+VzbLJoKdlJCSQE
 KfeqfOTZCY7rLq5jCMiI/mEQJjU7nu8bXbYg8F9hCx+eDWl+cPPLvv5aXgZVpxPS5ckNwO
 MhvK1XUPGBWMjJsRM8TXfNzGw0W4bL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626185810;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OWWq5uhLjei/pZ9R+Ayd1Gk4tla6mdqrPY0iiL2uG64=;
 b=dVrYsOMsXpVdpjqVdlasGR+QRWK+qBE055+RxerS+TXCKwh7dTg0EXszm8f27Ek/YmADsJ
 Dsn6d+HPZzlTeVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44B9D13AF0;
 Tue, 13 Jul 2021 14:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i8z6DlKg7WDaIQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 14:16:50 +0000
Date: Tue, 13 Jul 2021 16:16:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YO2gUL2/s29SGdNo@pevik>
References: <20210713101338.6985-1-pvorel@suse.cz>
 <20210713101338.6985-5-pvorel@suse.cz> <YO2T4J14roLUT32t@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO2T4J14roLUT32t@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/7] lib: Add script for running tests
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > For now run only tests which TPASS or TCONF.

> > Disabled also problematic tests:

> > * tst_bool_expr: for some reason killed after testing:

> > /__w/ltp/ltp/lib/newlib_tests/tst_bool_expr.c:41: TINFO: Parsing 'A ( B )'
> > A ( B )

> > Summary:
> > passed   24
> > failed   0
> > broken   0
> > skipped  0
> > warnings 0
> > PATH: '/__w/ltp/ltp/../ltp-build/testcases/lib:/__w/ltp/ltp/lib/newlib_tests/../../testcases/lib/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
> > DEBUG: 0
> > /__w/ltp/ltp/lib/tst_test.c:1363: TBROK: Test killed by SIGSEGV!

> I've executed the test under valgrind and found some "conditional jump
> depends on uninitialized value", which is because we do not clear the
> priv pointer for newly added tokens. Does this patch fix it for you?

> diff --git a/lib/tst_bool_expr.c b/lib/tst_bool_expr.c
> index 387c38b91..15825e364 100644
> --- a/lib/tst_bool_expr.c
> +++ b/lib/tst_bool_expr.c
> @@ -55,6 +55,7 @@ static int new_tok(struct tst_expr_tok **last, const char *tok, size_t tok_len)
>         (*last)->tok = tok;
>         (*last)->tok_len = tok_len;
>         (*last)->op = char_to_op(tok[0]);
> +       (*last)->priv = NULL;
>         (*last)++;

Thanks! It looks like it helped (but few jobs haven't finished yet).
https://github.com/pevik/ltp/actions/runs/1026771350
Will you merge this fix yourself please?

>         return 1;

> > * tst_fuzzy_sync01: sporadically fails:
> > ../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
> > tst_fuzzy_sync01.c:227: TFAIL: acs:3  act:1  art:1  | =:23   -:46   +:2999931
> > ...
> > Summary:
> > passed   21
> > failed   3

> Not sure what we can do here, I guess that timings would be hard to fix
> on VMs that run the tests.

If I remember correctly Richie suggested that FAIL is also OK. He said only
TBROK and TCONF is a problem. I'd prefer to fuzzy sync tests which always pass,
but after this effort I can work on API tests metadata, which would allow also
this.

...
> > +# custom version
> > +tst_res()
> > +{
> > +	if [ $# -eq 0 ]; then
> > +		echo >&2
> > +		return
> > +	fi
> > +
> > +	local res="$1"
> > +	shift
> > +
> > +	tst_color_enabled
> > +	local color=$?
> > +
> > +	printf "runtest " >&2
> > +	tst_print_colored $res "$res: " >&2
> > +	echo "$@" >&2
> > +
> > +}
> > +
> > +# custom version
> > +tst_brk()
> > +{
> > +	local res="$1"
> > +	shift
> > +
> > +	tst_flag2mask "$res"
> > +	local mask=$?
> > +
> > +	tst_res
> > +	tst_res $res $@
> > +
> > +	exit $mask
> > +}

> I'm not sure that we should call these function tst_res and tst_brk it
> only confuses everything since these are different from the ones in the
> test library.
OK, I'll rename it (runtest_res() and runtest_brk()).

> > +run_tests()
> > +{
> > +	local target="$1"
> > +	local i ret tconf tpass vars
> > +
> > +	eval vars="\$LTP_${target}_API_TESTS"
> > +
> > +	tst_res TINFO "=== Run $target tests ==="
> > +
> > +	for i in $vars; do
> > +		tst_res TINFO "* $i"
> > +		./$i
> > +		ret=$?
> > +
> > +		case $ret in
> > +			0) tpass="$tpass $i";;
> > +			1) tst_brk TFAIL "$i failed with TFAIL";;
> > +			2) tst_brk TFAIL "$i failed with TBROK";;
> > +			4) tst_brk TFAIL "$i failed with TWARN";;
> > +			32) tconf="$tconf $i";;
> > +			127) tst_brk TBROK "Error: file not found (wrong PATH? out-of-tree build without -b?), exit code: $ret";;
> > +			*) tst_brk TBROK "Error: unknown failure, exit code: $ret";;

> Why do we exit on failure here?

> We should just increase the fail counters and go ahead with next test.

I quit here because you know how hard is to find error in very long log
file. Also why to waste developer time when some test failed? Similar approach
make has. But sure, I can continue here and print summary at the end.

Thanks for your review!
I merged the first 3 commits.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
