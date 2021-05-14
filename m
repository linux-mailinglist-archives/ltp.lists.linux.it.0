Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B24380C8D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 17:10:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C3453C89D6
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 17:10:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 715AC3C1937
 for <ltp@lists.linux.it>; Fri, 14 May 2021 17:10:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CEE7C100142B
 for <ltp@lists.linux.it>; Fri, 14 May 2021 17:10:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E34EB1C8;
 Fri, 14 May 2021 15:10:20 +0000 (UTC)
Date: Fri, 14 May 2021 17:10:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YJ6S2lNjP+G8x0ax@pevik>
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
 <YJ4sh7zBOZxQy1S0@pevik>
 <CAEemH2dOg0JN6XrptGZ6WN3C1SOYpWKgSTdXtpcjSZzBjsnOMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dOg0JN6XrptGZ6WN3C1SOYpWKgSTdXtpcjSZzBjsnOMQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Hi Li, Joerg, Cyril,

> Petr Vorel <pvorel@suse.cz> wrote:

> > > Does this below (rough solution in my mind) work for you?
> > LGTM, but Joerg, Metan, could you please have a look?

> Thanks, I wouldn't send a patch until Joerg/Cyril has a review.
> (Maybe Joerg will have another better solution:)
Understand.

> > > diff --git a/lib/newlib_tests/shell/timeout03.sh
> > > b/lib/newlib_tests/shell/timeout03.sh
> > > index cd548d9a2..f39f5712a 100755
> > > --- a/lib/newlib_tests/shell/timeout03.sh
> > > +++ b/lib/newlib_tests/shell/timeout03.sh
> > > @@ -30,6 +30,7 @@ TST_TIMEOUT=1

> > >  do_test()
> > >  {
> > > +       trap "echo 'Sorry, timeout03 is still alive'" TERM
> > Any reason why not use tst_res TINFO? (working on bash).

> +1
> I just use echo for a quick test, but surely we can replace it with tst_res.
+1


> > > -       while kill -0 $pid 2>&1 > /dev/null && [ $i -gt 0 ]; do
> > > +       while kill -0 $pid &>/dev/null && [ $i -gt 0 ]; do
> > FYI: &> is a bashism (we need to keep the original).

> I just want the error does not to redirect to standard output.
> Because with SIGTERM sending, it seems easier to kill all
> processes, so 'kill -0 $pid' returns "No such process" errors often.

> Mayby I should go with: kill -0 $pid >/dev/null 2>&1
+1. Now I see it, "2>&1 > /dev/null" is wrong, it must be vice versa.

Kind regards,
Petr

> e.g.

> # ./timeout04.sh
> timeout04 1 TINFO: timeout per run is 0h 0m 1s
> timeout04 1 TINFO: Start
> timeout04 1 TBROK: Test timeouted, sending SIGTERM! If you are running
> on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> Terminated
> ./../../../testcases/lib/tst_test.sh: line 448: kill: (74911) - No such process
> ./../../../testcases/lib/tst_test.sh: line 454: kill: (74911) - No such process

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
