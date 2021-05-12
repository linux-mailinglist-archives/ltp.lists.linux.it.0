Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4568B37BFC2
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:20:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD3F43C8A8B
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:20:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AFB3C3C1C23
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:20:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D38401A011F4
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:20:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C639B061;
 Wed, 12 May 2021 14:20:07 +0000 (UTC)
Date: Wed, 12 May 2021 16:20:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YJvkFTUWS2iuZ00H@pevik>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

...
> > To conclude:
> > - bash does not seem to care about SIGINT delivery to background
> > processes, but can be blocked using trap
> > - zsh ignores SIGINT for background processes by default, but can be
> > allowed using trap
> > - dash and busybox sh ignore the signal to background processes, and
> > this cannot be changed with trap

> > I tried with the following snippets:
> > <SHELL> -c 'trap "echo trap;" INT; (sleep 2; echo end sub) & sleep 1;
> > kill -INT -$$; echo end main'
> > <SHELL> -c 'trap "echo trap;" INT; (trap - SIGINT sleep 2; echo end sub)
> > & sleep 1; kill -INT -$$; echo end main'
> > <SHELL> -c 'trap "echo trap;" INT; (trap "exit" SIGINT sleep 2; echo end
> > sub) & sleep 1; kill -INT -$$; echo end main'
FYI (you probably know it) SIGINT is a bashism, INT needs to be used.
$ kill -s SIGINT $$
dash: 2: kill: invalid signal number or name: SIGINT

> Thanks for the demos above, it shows the difference clearly.

> > SIGINT handling for child processes is strange. This might have some
> > implication for the shell tests,
> > because it is possible, that SIGINT is not delivered to all processes
> > and some may reside as orphans.
> > Since this can happen only in case of timeouts, I guess there is no real
> > Problem.

> Yes.

> Looks like the behaviors on signal 'SIGINT' are not unify in background
> processes handling for different SHELL. So as you said that using SIGINT
> seems NOT a good idea to stop the process in timeout.

Yes, trap looks to be having some portability issues [1] [2]

> > A possible fix could be using SIGTERM instead of SIGINT. This signal
> > does not seem to have some "intelligent" handling for background processes.

> I agree. Can you make a patch to replace that INT?

> (and this is only a timeout issue, so patch merging may be delayed due
> to LTP new release)

> > I do not know why LTP used SIGINT in the first place. My first thought
> > would have been to use SIGTERM.  It is the way to "politely ask
> > processes to terminate"

> Yes, but that not strange to me, the possible reason is just to
> stop(ctrl ^c) the LTP test manually for debugging, so we went
> too far for using SIGINT but forget the original purpose :).
I'm not the author, but yes, SIGINT was used for stopping with ctrl^c during
debugging.

FYI I tried to use both SIGINT and SIGTERM, but there was some problem.
But I guess it was my error. Please *add* SIGTERM (keep SIGINT).

Kind regards,
Petr

[1] https://unix.stackexchange.com/questions/240723/exit-trap-in-dash-vs-ksh-and-bash/240736#240736
[2] https://stackoverflow.com/questions/27012762/is-trap-exit-required-to-execute-in-case-of-sigint-or-sigterm-received

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
