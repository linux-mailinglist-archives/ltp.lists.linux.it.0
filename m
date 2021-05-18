Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E24387447
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:46:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19A9B3C95CA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:46:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F0BF3C27CA
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:46:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9032C2009C3
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:46:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFF53B0B7;
 Tue, 18 May 2021 08:46:33 +0000 (UTC)
Date: Tue, 18 May 2021 10:46:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YKN+6EXxlU4o7mZE@pevik>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
 <a4154e09-8ae3-beb3-13d5-c92126177ed5@jv-coder.de>
 <CAEemH2c-zTLkh2N2UpA=DSiq1tSJ=072S6j+PVoUz_yUaKjD-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c-zTLkh2N2UpA=DSiq1tSJ=072S6j+PVoUz_yUaKjD-Q@mail.gmail.com>
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

Hi all,

> Hi Joerg,

> > > -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> > > +trap "tst_brk TBROK 'test interrupted'" INT
> > This would require something like
> > trap "tst_brk TBROK 'test terminated'" TERM
> > or
> > trap "_tst_do_exit" TERM

> > Otherwise the test is terminated very roughly, without executing
> > cleanup, which is probably not a good idea.
+1

> Yes, seems I didn't realize this needs cleanup as well.

> But I'd still suggest keeping SIGINT here for catching Ctrl^C for users :).
+1


> > But that introduces the next problem: A short deadlock between
> > _tst_kill_test and _tst_cleanup_timer,
> > because _tst_cleanup_timer waits for the termination of the timeout
> > process and vice versa.
> > Another problem is, that a SIGTERM originating from some other location
> > could look like a timeout.

> Yes, and that's the reason why I didn't trap SIGTERM simply in the main process.


> > I am currently thinking about the following solution, to mitigate most
> > problems:
> > The timeout process sends SIGUSR1 (or maybe SIGALRM?) only to the main
> > test process and blocks TERM.
> > The main process can print, that it ran into a timeout, send a sigterm
> > to its processs group (while ignoring TERM itself).
> > Then it can unset $_tst_setup_timer_pid safely, because it knows it was
> > triggered by the timeout process and execute _tst_do_exit.

> > If the timeout process does not see the termination of the main process,
> > it can still send SIGKILL to the whole process group.


> It probably will be work but looks a bit confusing since that involves
> more signals.

> In conclusion, I think we maybe have such situations to be solved:

> 1. SIGINT (Ctrl^C) for terminating the main process and do cleanup
> correctly before a timeout
> 2. Test finish normally and retrieves the _tst_timeout_process in the
> background via SIGTERM(sending by _tst_cleanup_timer)
> 3. Test timeout occurs and _tst_kill_test sending SIGTERM to
> terminating all process, and the main process do cleanup work
> 4. Test timeout occurs but still have process alive after
> _tst_kill_test sending SIGTERM, then sending SIGKILL to the whole
> group

> So, I'm now thinking can we just introduce a knob(variable) for skipping
> the _tst_cleanup_timer works in timeout mode, then it will not have a
> deadlock anymore.

+1

> How about:

I'm not sure if we're not getting too late for these changes. Because it'll be
just on us to test that (community probably have run these changes). But I'd
still prefer to fix it.

If we don't fix it, I'd be at least for fixing wrong redirection order (2>&1 >
/dev/null) introduced by me in 25ad54dba.

> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -16,12 +16,14 @@ export TST_COUNT=1
>  export TST_ITERATIONS=1
>  export TST_TMPDIR_RHOST=0
>  export TST_LIB_LOADED=1
> +export TST_TIMEOUT_OCCUR=0

>  . tst_ansi_color.sh
>  . tst_security.sh

>  # default trap function
> -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> +trap "tst_brk TBROK 'test interrupted'" INT
> +trap "TST_TIMEOUT_OCCUR=1; tst_brk TBROK 'test timeouted'" TERM

>  _tst_do_exit()
>  {
> @@ -48,7 +50,9 @@ _tst_do_exit()
>                 [ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
>         fi

> -       _tst_cleanup_timer
> +       if ["$TST_TIMEOUT_OCCUR" = 0 ]; then
> +               _tst_cleanup_timer
> +       fi

>         if [ $TST_FAIL -gt 0 ]; then
>                 ret=$((ret|1))
> @@ -439,18 +443,18 @@ _tst_kill_test()
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
> +       while kill -0 $pid >/dev/null 2>&1 && [ $i -gt 0 ]; do
>                 tst_res TINFO "Test is still running, waiting ${i}s"
>                 sleep 1
>                 i=$((i-1))
>         done

> -       if kill -0 $pid 2>&1 > /dev/null; then
> +       if kill -0 $pid >/dev/null 2>&1; then
>                 tst_res TBROK "Test still running, sending SIGKILL"
>                 kill -KILL -$pid
>         fi

LGTM, I'll try to test it today.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
