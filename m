Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD91D0865
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:36:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C57F43C207E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 09:36:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CCF9D3C1045
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:36:13 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2489060005A
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 09:34:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14B9CAB91;
 Wed,  9 Oct 2019 07:36:12 +0000 (UTC)
Date: Wed, 9 Oct 2019 09:36:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191009073609.GB27854@dell5510>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009061619.48677-2-lkml@jv-coder.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] tst_test.sh: Add TST_USES_MODULE
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

Hi Joerg,

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

> Adds a new library variable TST_USES_MODULE, that can be used, when a
> test may need a module, but should not fail, if the module is not available.
I wonder if TST_USES_MODULE is descriptive enough. But it looks to me better
than TST_GET_MODPATH (which Cyril suggested in v3).

We should think twice as _USES_ keyword should be used consistently for the same
approach in different functionality (i.e. TST_USES_FOO is the same as
TST_NEEDS_FOO, but not TCONF/TBROK if it fails).

But whole concept of TST_USES_FOO looks to me a bit complicated, if needed only
for modules. Cannot we just call _tst_find_module directly in this case and not
introduce variable?

...
> +++ b/doc/test-writing-guidelines.txt
> @@ -2125,6 +2125,8 @@ simply by setting right '$TST_NEEDS_FOO'.
>  | 'TST_NEEDS_CMDS'   | String with command names that has to be present for
>                         the test (see below).
>  | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
> +| 'TST_USES_MODULE'  | Same as TST_NEEDS_MODULE, except that a missing module
> +|                    | is not an error.
>  | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
>  |=============================================================================

> @@ -2174,7 +2176,7 @@ Locating kernel modules
>  +++++++++++++++++++++++

>  The LTP build system can build kernel modules as well, setting
> -'$TST_NEEDS_MODULE' to module name will cause to library to look for the
> +'$TST_NEEDS_MODULE' to module name will cause the library to look for the
This is unrelated change, I merged it as a separate commit (c518ee8b9).

...
> +_tst_find_module()
> +{
> +	local _tst_module=$1
> +	local _tst_is_required=${2:-0}
> +
> +	for tst_module in "$_tst_module" \
> +						"$LTPROOT/testcases/bin/$_tst_module" \
> +						"$TST_STARTWD/$_tst_module"; do
nit: (can be fixed by person who merges it): It's not visible, but uses more
tags than it should be, so it looks like:
+       for tst_module in "$_tst_module" \
+                                               "$LTPROOT/testcases/bin/$_tst_module" \
+                                               "$TST_STARTWD/$_tst_module"; do
+
+                       if [ -f "$tst_module" ]; then
+                               TST_MODPATH="$tst_module"
+                               break
+                       fi
I actually like the original alignment created by Alexey:
        for tst_module in "$TST_NEEDS_MODULE" \
                          "$LTPROOT/testcases/bin/$TST_NEEDS_MODULE" \
                          "$TST_STARTWD/$TST_NEEDS_MODULE"; do

> +
> +			if [ -f "$tst_module" ]; then
> +				TST_MODPATH="$tst_module"
> +				break
> +			fi
> +	done
> +
> +	if [ -z "$TST_MODPATH" ]; then
> +		if [ $_tst_is_required -eq 1 ]; then
> +			tst_brk TCONF "Failed to find module '$_tst_module'"
> +		else
> +			tst_res TINFO "Module '$_tst_module' not found."
nit: please drop dot at the end (can be fixed by person who merges it).
> +		fi
> +	else
> +		tst_res TINFO "Found module at '$TST_MODPATH'"
> +	fi


nit: this is IMHO more readable
	if [ -n "$TST_MODPATH" ]; then
		tst_res TINFO "Found module at '$TST_MODPATH'"
		return
	fi

	if [ $_tst_is_required -eq 1 ]; then
		tst_brk TCONF "Failed to find module '$_tst_module'"
	else
		tst_res TINFO "Module '$_tst_module' not found"
	fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
