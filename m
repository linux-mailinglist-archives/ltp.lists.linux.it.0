Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9FDABE2
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 14:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A9573C2314
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 14:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 141893C2297
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 14:23:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 30E4114011BA
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 14:23:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72BEFB369;
 Thu, 17 Oct 2019 12:23:20 +0000 (UTC)
Message-ID: <1571314999.4128.3.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 17 Oct 2019 14:23:19 +0200
In-Reply-To: <20191017083935.GA21011@dell5510>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
 <20191017083935.GA21011@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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
Reply-To: cfamullaconrad@suse.com
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2019-10-17 at 10:39 +0200, Petr Vorel wrote:
> Hi Clemens,
> 
> ...
> > -_tst_setup_timer()
> > +tst_multiply_timeout()
> 
> Private function, it should have underscore prefix.
> >  {
> > -	TST_TIMEOUT=${TST_TIMEOUT:-300}
> > -	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> > +	# first parameter is used as return value
> > +	local timeout="${!1}"
> 
> Bashism, this will not work on dash, busybox shell ('busybox sh'),
> etc.
> 
> checkbashisms.pl is your friend :).
> https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkba
> shisms.pl
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guideline
> s#132-shell-coding-style
> 
> Variable variable is possible to do portable way with eval.
> eval timeout=\$$1

Ok, I will take bashisms into acount. Thx for pointing me to that
script.

> 
> > +	[ $# -gt 1 ] && timeout="$2"
> > -	if [ "$TST_TIMEOUT" = -1 ]; then
> > -		tst_res TINFO "Timeout per run is disabled"
> > -		return
> > -	fi
> > +	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> >  	local err="LTP_TIMEOUT_MUL must be number >= 1!"
> > @@ -396,13 +395,29 @@ _tst_setup_timer()
> >  		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
> >  		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to
> > $LTP_TIMEOUT_MUL"
> >  	fi
> > +
> >  	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TBROK "$err
> > ($LTP_TIMEOUT_MUL)"
> > +	[ "$timeout" -ge 1 ] || tst_brk TBROK "timeout need to be
> > >= 1 ($timeout)"
> > +
> > +	eval "$1='$(( timeout * LTP_TIMEOUT_MUL))'"
> 
> Eval on input, eval on output :).
> 
> > +	return 0
> 
> You don't use return value anywhere. + There is no return 1.
> > +}
> 
> Passing timeout variable name and optionally timeout value works and
> allows
> TBROK messages not to be mangled/hidden (which would be if function
> echo the
> result, which is then read the usual way:
> timeout=$(tst_multiply_timeout 100) ),
> but I'm not sure if all this is worth of just error handling.
> Having 2x eval, $2 optionally used (but only in tests) makes code a
> bit complex.

In the end, I never called the function with the optional second
parameter. So we could remove it and with it, the first eval.
Would you be ok with just one eval ?

> How about just simply save the result into global variable
> $TST_TIMEOUT?

Will not work, as this function is also used in
TST_RETRY_FN_EXP_BACKOFF() where we do not use TST_TIMEOUT.

thanks
Clemens

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
