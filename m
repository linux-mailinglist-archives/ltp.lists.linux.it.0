Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA02DA7ED
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:00:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52AF23C22A8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:00:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 146223C2297
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 11:00:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EE9281000AFC
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 11:00:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 453E7B5DB;
 Thu, 17 Oct 2019 09:00:46 +0000 (UTC)
Date: Thu, 17 Oct 2019 11:00:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191017090043.GB14386@dell5510>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
 <20191016161519.11256-4-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016161519.11256-4-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/4] Add newlib shell test for
 tst_multiply_timeout()
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

> Simple test for different kinds of calls from tst_multiply_timeout()
> ---
>  lib/newlib_tests/shell/test_timeout_mul.sh | 54 ++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh

> diff --git a/lib/newlib_tests/shell/test_timeout_mul.sh b/lib/newlib_tests/shell/test_timeout_mul.sh
> new file mode 100755
> index 000000000..8397df25c
> --- /dev/null
> +++ b/lib/newlib_tests/shell/test_timeout_mul.sh
> @@ -0,0 +1,54 @@
> +#!/bin/bash
This is library test, which will run on developer box, where bash is for sure.
But I'd still prefer to have /bin/sh with posix shell syntax.
Mainly because if you have /bin/bash in sources people will write tests with
bashisms (even if you document that bash is only allowed for these library
tests).

But we should have a discussion on that and document it ([1]).

> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> +
> +TST_TESTFUNC=do_test
> +. tst_test.sh
This expect PATH to be set correctly. Which is probably better approach, than
mine (I put PATH for tst_test.sh into
lib/newlib_tests/shell/test_timeout_mul.sh; best would be to have 'make check',
which would set it; my patch [2] does not set it).
> +
> +
> +call_it()
> +{
> +	local SAVE_MUL=${LTP_TIMEOUT_MUL}
> +	$1
> +	if [ "${!2}" -ne "$3" ]; then
> +		tst_brk TBROK "LTP_TIMEOUT_MUL=$SAVE_MUL $1 (${!2} != $3)"
> +	else
> +		tst_res TPASS "LTP_TIMEOUT_MUL=$SAVE_MUL $1 (${!2} == $3)"
> +	fi
> +}
> +
> +do_test()
> +{
> +	LTP_TIMEOUT_MUL=2
> +	local sec=1
> +
> +        call_it 'tst_multiply_timeout sec' 'sec' 2
> +        call_it 'tst_multiply_timeout foo 1000' 'foo' 2000
> +
> +	sec=1
You mix tabs and spaces.

> +        call_it 'tst_multiply_timeout sec 500' 'sec' 1000
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL="1.5"
> +        call_it 'tst_multiply_timeout sec' 'sec' 2
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=0.5
> +        call_it 'tst_multiply_timeout sec' 'sec' 1
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=1.5
> +        call_it 'tst_multiply_timeout sec 5' 'sec' 10
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=0.5
> +        call_it 'tst_multiply_timeout sec 5' 'sec' 5
> +
> +	sec=1
> +	LTP_TIMEOUT_MUL=2
> +        call_it 'tst_multiply_timeout sec' 'sec' 2
> +        call_it 'tst_multiply_timeout sec' 'sec' 4
> +        call_it 'tst_multiply_timeout sec' 'sec' 8
> +}
> +
> +tst_run;
Unnecessary ;

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1166786/
[2] https://patchwork.ozlabs.org/patch/1166785/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
