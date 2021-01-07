Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769A2ECE5F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 12:02:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 482503C6CD4
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 12:02:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 934263C6066
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 12:02:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2450A60094C
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 12:02:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B21AD78;
 Thu,  7 Jan 2021 11:02:28 +0000 (UTC)
Date: Thu, 7 Jan 2021 12:02:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/bqQinLuCM4xlId@pevik>
References: <20201217144424.19414-1-pvorel@suse.cz>
 <20201217144424.19414-2-pvorel@suse.cz> <X/bc+ZGQ6JPsg4YY@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/bc+ZGQ6JPsg4YY@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] tst_test.sh: Call cleanup function after
 test start
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

Hi Cyril,

> Hi!
> > It does not make sense to run the test cleanup function when the setup
> > function has been run.

> Did you mean "setup function hasn't been run." here?

> As it is this sentence does not make any sense to me.
Yes, thanks!

> > And at least some network tests expect setup has been run before running
> > cleanup (e.g. tcp_fastopen_run.sh).

> > When shell API was introduced, cleanup function was run only if 1) setup
> > function was defined 2) and also run. That was inconsistent from C API,
> > thus e7dc14caa run it always.

> > But shell API is different from C API: tst_brk can be called from
> > tst_test.sh (or other library which is run before tst_run, e.g.
> > tst_net.sh). That was probably the reason, why detection via
> > $TST_SETUP_STARTED was introduced in initial shell API.

> > NOTE: using type is better than grep $TST_TEST_PATH, because cleanup
> > function can be in other library sourced by the test.

> > Fixes: e7dc14caa ("tst_test.sh: Run cleanup even setup is not defined")

> This still possibly break tests that would call tst_brk() in the middle
> of setup and expect the cleanup() to be executed, right?

> I guess that we would need TST_DO_CLEANUP that would be set in both
> cases i.e. before we run setup and also before we execute the tests.

> What about this:
Good catch, agree.
I'm going to merge with one runtime fix:
> -       if [ -n $TST_DO_CLEANUP -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
> +       if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then

Quotes are required otherwise we can get error:
/opt/ltp/testcases/bin/tst_test.sh: line 31: [: too many arguments

Kind regards,
Petr


> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 2417da140..94d95df6f 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -28,7 +28,7 @@ _tst_do_exit()
>         local ret=0
>         TST_DO_EXIT=1

> -       if [ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
> +       if [ -n $TST_DO_CLEANUP -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
>                 $TST_CLEANUP
>         fi

> @@ -582,6 +582,7 @@ tst_run()
>         [ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"

>         if [ -n "$TST_SETUP" ]; then
> +               TST_DO_CLEANUP=1
>                 $TST_SETUP
>         fi

> @@ -608,6 +609,7 @@ _tst_run_tests()
>         local _tst_data="$1"
>         local _tst_i

> +       TST_DO_CLEANUP=1
>         for _tst_i in $(seq ${TST_CNT:-1}); do
>                 if type ${TST_TESTFUNC}1 > /dev/null 2>&1; then
>                         _tst_run_test "$TST_TESTFUNC$_tst_i" $_tst_i "$_tst_data"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
