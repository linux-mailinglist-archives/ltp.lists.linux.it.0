Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F93766FE
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:22:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E10213C5669
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 16:22:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55CEB3C5637
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:22:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFF8814016E6
 for <ltp@lists.linux.it>; Fri,  7 May 2021 16:22:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E8EEB1A4;
 Fri,  7 May 2021 14:22:35 +0000 (UTC)
Date: Fri, 7 May 2021 16:22:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YJVNKebKn6jTvyG/@pevik>
References: <20210507103258.232174-1-lkml@jv-coder.de>
 <20210507103258.232174-3-lkml@jv-coder.de>
 <CAEemH2fucJPyeTL-HZJD92ves7GLMaMHcaPzi8kS_qWL+x=Hcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fucJPyeTL-HZJD92ves7GLMaMHcaPzi8kS_qWL+x=Hcg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] shell: Prevent orphan timeout sleep
 processes
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Joerg,

thanks both for your work!

> +++ b/lib/newlib_tests/shell/timeout03.sh
> @@ -32,7 +32,7 @@ do_test()
>  {
>         tst_res TINFO "testing killing test after TST_TIMEOUT"

> -       tst_sleep 2
> +       sleep 2
+1
Although tst_test.sh has many LTP custom binary dependencies I agree to use
simple sleep for seconds.

>         tst_res TFAIL "test: running after TST_TIMEOUT"
>  }

> @@ -40,7 +40,7 @@ cleanup()
>  {
>         tst_res TPASS "test run cleanup after timeout"

> -       tst_sleep 15 # must be higher than wait time in _tst_kill_test
> +       sleep 15 # must be higher than wait time in _tst_kill_test
and here.
>         tst_res TFAIL "cleanup: running after TST_TIMEOUT"
>  }

> diff --git a/lib/newlib_tests/shell/timeout04.sh
> b/lib/newlib_tests/shell/timeout04.sh
> index 0a6ba053c..c702905f3 100755
> --- a/lib/newlib_tests/shell/timeout04.sh
> +++ b/lib/newlib_tests/shell/timeout04.sh
> @@ -9,7 +9,7 @@ TST_TIMEOUT=1

>  do_test()
>  {
> -       tst_res TINFO "Start"
> +    tst_res TINFO "Start"
>      sleep 5
>      tst_res TFAIL "End"
>  }
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 7ceddff04..ed2699175 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -469,7 +469,7 @@ _tst_timeout_process()

>         sleep $sec &
>         sleep_pid=$!
> -       #trap "kill $sleep_pid; exit" TERM
> +       trap "kill $sleep_pid; exit" TERM
I guess trap use is needed, and commented out for testing.

>         wait $sleep_pid
>         _tst_kill_test
>  }


> ================
> (This below is not related to your patches)

> But there is another issue I found that the timeout03 can NOT
> be killed after timed out in calling cleanup(), the reason is
> tst_brk stop the _tst_kill_test running in the background so that
> it does not output as what we expected:
Good catch, I'll try to have a look as well.

Kind regards,
Petr

> # timeout03 1 TINFO: timeout per run is 0h 0m 1s
> # timeout03 1 TINFO: testing killing test after TST_TIMEOUT
> # timeout03 1 TBROK: Test timeouted, sending SIGINT! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> # timeout03 1 TBROK: test interrupted or timed out
> # timeout03 1 TPASS: test run cleanup after timeout
> # timeout03 1 TINFO: Test is still running, waiting 10s
> # timeout03 1 TINFO: Test is still running, waiting 9s
> # timeout03 1 TINFO: Test is still running, waiting 8s
> # timeout03 1 TINFO: Test is still running, waiting 7s
> # timeout03 1 TINFO: Test is still running, waiting 6s
> # timeout03 1 TINFO: Test is still running, waiting 5s
> # timeout03 1 TINFO: Test is still running, waiting 4s
> # timeout03 1 TINFO: Test is still running, waiting 3s
> # timeout03 1 TINFO: Test is still running, waiting 2s
> # timeout03 1 TINFO: Test is still running, waiting 1s
> # timeout03 1 TBROK: Test still running, sending SIGKILL
> # Killed

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
