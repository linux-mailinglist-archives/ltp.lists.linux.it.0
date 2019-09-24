Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E7BCC4B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 18:20:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E44C3C2097
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 18:20:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D57543C2035
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 18:20:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 401AF1000A75
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 18:20:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C44DAC32;
 Tue, 24 Sep 2019 16:20:35 +0000 (UTC)
Date: Tue, 24 Sep 2019 18:20:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190924162032.GA28669@dell5510>
References: <20190919135043.14359-1-pvorel@suse.cz>
 <20190919135043.14359-3-pvorel@suse.cz> <20190924140757.GA787@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924140757.GA787@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=BODY_QUOTE_MALF_MSGID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] shell: Introduce TST_TIMEOUT variable,
 add checks
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

Hi Cyril,

...
> > +++ b/doc/test-writing-guidelines.txt
> > -2.2.3 Test temporary directory
> > +2.2.3 Library environment variables for C
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +[options="header"]
> > +|=============================================================================
> > +| Variable name      | Action done
> > +| 'LTP_TIMEOUT_MUL'  | Multiply timeout, must be number >= 1 (> 1 is useful for
> > +                       slow machines to avoid unexpected timeout).
> > +                       Variable is also used in shell tests.
> > +|=============================================================================
> > +
> > +2.2.4 Test temporary directory
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> Can we please avoid this renumbering, also after this patch this
> variable applies to both shell and C. So this should probably go
> somewhere else, and I'm pretty sure that we have a few more at least
> LTPROOT, TMPDIR, KCONFIG_PATH, LTP_COLORIZE_OUTPUT.

OK, do you want a single section "Library environment variables" (for both C and
shell), putting at 5. ? (at the end?)

...
> > +++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> > @@ -17,7 +17,7 @@ TST_NEEDS_CMDS="mount umount cat kill mkdir rmdir grep awk cut"

> >  # Each test case runs for 900 secs when everything fine
> >  # therefore the default 5 mins timeout is not enough.
> > -LTP_TIMEOUT_MUL=7
> > +TST_TIMEOUT=2100

> >  . cgroup_lib.sh

> Shouldn't this go in in a separate patch?
I thought this change is closely related, but you're right as it does not break
the code, I'll put it into separate commit.

...
> > +++ b/testcases/lib/tst_test.sh
> > @@ -379,9 +379,47 @@ _tst_rescmp()

> >  _tst_setup_timer()
> >  {
> > +	TST_TIMEOUT=${TST_TIMEOUT:-300}
> >  	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}

> > -	local sec=$((300 * LTP_TIMEOUT_MUL))
> > +	if [ "$TST_TIMEOUT" = -1 ]; then
> > +		tst_res TINFO "Timeout per run is disabled"
> > +		return
> > +	fi
> > +
> > +	local err="LTP_TIMEOUT_MUL must be number >= 1!"
> > +	local is_float
> > +
> > +	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
> > +
> > +	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
> > +		if tst_cmd_available awk; then
> > +			is_float=1

> My first choice for floating point in shell would be bc.
Yes, but I guess awk is more common on linux than bc - I'd guess bc is not
installed by default, but maybe I'm wrong. If I'm wrong using bc would be
certainly more readable.

+ I didn't realize that bc is also in busybox (the same as awk).
So shell I rewrite it to bc?

> > +		else
> > +			tst_res TINFO "awk not available, cast LTP_TIMEOUT_MUL to int"
> > +			tst_test_cmds cut
> > +			LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)

> Hmm, I guess that it would be safer to cut the part after the decimal
> point and add one, because that would always round up, which is probably
> what we really want instead.
Make sense (but see below).

> > +		fi
> > +	fi
> > +
> > +	if [ "$is_float" ]; then
> > +		echo | awk '{if ('"$LTP_TIMEOUT_MUL"' < 1) {exit 1}}' || \
> > +			tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"

> The bc command can do comparsions like this as well.
Sure, I just was convinced it's not installed by default on distros.

> Also I wonder if it would be easier just to do ceil of the
> LTP_TIMEOUT_MUL unconditionally and get rid of the floating point mess,
> since it's just a timeout and we do not care that much if it's
> multiplied precisely as far as the resulting timeout is never smaller
> than the precise calculation.
OK, I'll do ceil in v4. I don't know why thought it'd be important to have that
support (I think Li or Clemens suggested that).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
