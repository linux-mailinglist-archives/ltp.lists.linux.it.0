Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B883804B0
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 09:53:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62D213C3309
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 09:53:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 566A33C1AE8
 for <ltp@lists.linux.it>; Fri, 14 May 2021 09:53:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A818F200E14
 for <ltp@lists.linux.it>; Fri, 14 May 2021 09:53:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04366B150;
 Fri, 14 May 2021 07:53:45 +0000 (UTC)
Date: Fri, 14 May 2021 09:53:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YJ4sh7zBOZxQy1S0@pevik>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > FYI I tried to use both SIGINT and SIGTERM, but there was some problem.
> > But I guess it was my error. Please *add* SIGTERM (keep SIGINT).

> Yes, we'd better keep SIGINT for ctrl^c action and use SIGTERM
> additionally for process terminating.

> Does this below (rough solution in my mind) work for you?
LGTM, but Joerg, Metan, could you please have a look?

> diff --git a/lib/newlib_tests/shell/timeout03.sh
> b/lib/newlib_tests/shell/timeout03.sh
> index cd548d9a2..f39f5712a 100755
> --- a/lib/newlib_tests/shell/timeout03.sh
> +++ b/lib/newlib_tests/shell/timeout03.sh
> @@ -30,6 +30,7 @@ TST_TIMEOUT=1

>  do_test()
>  {
> +       trap "echo 'Sorry, timeout03 is still alive'" TERM
Any reason why not use tst_res TINFO? (working on bash).
>         tst_res TINFO "testing killing test after TST_TIMEOUT"

>         sleep 2
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 28c2052d6..d7c9791e9 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -21,7 +21,7 @@ export TST_LIB_LOADED=1
>  . tst_security.sh

>  # default trap function
> -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> +trap "tst_brk TBROK 'test interrupted'" INT

>  _tst_do_exit()
>  {
> @@ -439,18 +439,18 @@ _tst_kill_test()
>  {
>         local i=10

> -       trap '' INT
> -       tst_res TBROK "Test timeouted, sending SIGINT! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
> -       kill -INT -$pid
> +       trap '' TERM
> +       tst_res TBROK "Test timeouted, sending SIGTERM! If you are
> running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
> +       kill -TERM -$pid
>         tst_sleep 100ms

> -       while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
> +       while kill -0 $pid &>/dev/null && [ $i -gt 0 ]; do
FYI: &> is a bashism (we need to keep the original).
>                 tst_res TINFO "Test is still running, waiting ${i}s"
>                 sleep 1
>                 i=$((i-1))
>         done

> -       if kill -0 $pid 2>&1 > /dev/null; then
> +       if kill -0 $pid &>/dev/null; then
And here as well.

>                 tst_res TBROK "Test still running, sending SIGKILL"
>                 kill -KILL -$pid
>         fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
