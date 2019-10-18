Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193FDBEAB
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 09:46:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A9023C2296
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 09:46:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 11AF23C147F
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 09:46:50 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C7272140183E
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 09:46:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30580B756;
 Fri, 18 Oct 2019 07:46:46 +0000 (UTC)
Date: Fri, 18 Oct 2019 09:46:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20191018074643.GA4755@dell5510>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
 <20191017083935.GA21011@dell5510> <1571314999.4128.3.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571314999.4128.3.camel@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Clemens,

> > Variable variable is possible to do portable way with eval.
> > eval timeout=\$$1

> Ok, I will take bashisms into acount. Thx for pointing me to that
> script.
Thanks!

> > Passing timeout variable name and optionally timeout value works and
> > allows
> > TBROK messages not to be mangled/hidden (which would be if function
> > echo the
> > result, which is then read the usual way:
> > timeout=$(tst_multiply_timeout 100) ),
> > but I'm not sure if all this is worth of just error handling.
> > Having 2x eval, $2 optionally used (but only in tests) makes code a
> > bit complex.

> In the end, I never called the function with the optional second
> parameter. So we could remove it and with it, the first eval.
> Would you be ok with just one eval ?

> > How about just simply save the result into global variable
> > $TST_TIMEOUT?

> Will not work, as this function is also used in
> TST_RETRY_FN_EXP_BACKOFF() where we do not use TST_TIMEOUT.
OK.

Previously I was thinking to echo result or error message and handle error
outside, depending on return value:

	timeout_or_error=$(tst_multiply_timeout 100) || tst_brk TBROK "$timeout_or_error"

but that's not nice solution either.

Your solution (with removed second parameter) is ok, it just looks unusual for
me (passing variable name to be changed, something like "shell way of passing a
pointer" is not really common), but as I don't see any other solution, I'm ok
with that. But I'd like to get somebody else opinion, maybe we just don't see
other obvious solution.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
