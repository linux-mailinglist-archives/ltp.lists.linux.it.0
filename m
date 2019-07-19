Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812A6E337
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 11:15:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01F7E3C1D13
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 11:15:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F20383C14BF
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 11:15:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0B16A600831
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 11:15:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD344AEF3;
 Fri, 19 Jul 2019 09:15:15 +0000 (UTC)
Date: Fri, 19 Jul 2019 11:15:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190719091519.GC30204@dell5510>
References: <20190718083943.7687-1-pvorel@suse.cz>
 <20190718083943.7687-2-pvorel@suse.cz>
 <CAEemH2e6PmPYWWQg+NgSR=6Qc4BZpEswbcc4Y+n3B_pFqnQJDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e6PmPYWWQg+NgSR=6Qc4BZpEswbcc4Y+n3B_pFqnQJDQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] c: Use $LTP_TIMEOUT_MUL also in retry
 functions
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

Hi Li,

thanks for your review!

> On Thu, Jul 18, 2019 at 4:40 PM Petr Vorel <pvorel@suse.cz> wrote:
> >...
> >  #ifndef TST_COMMON_H__
> > @@ -51,15 +40,22 @@

> >  #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)        \
> >  ({     int tst_delay_ = 1;                                             \
> > +       float m = 1;    \
> > +       char *mul = getenv("LTP_TIMEOUT_MUL");  \

> We also need a prefix/suffix in the variable definition to make sure
> that it will
> not alias with anything that has been passed to the FUNC, just like what we do
> for the tst_delay_.

> e.g. if the FUNC is defined as foo_func(m); the m variable will be aliased and
> the function will do something very unexpected.
Good point, I'll fix it in v3.

> > +       if (mul) {      \
> > +               m = atof(mul); \
> > +               if (m < 1) \
> > +                       tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul); \

> If we reverse some code order in tst_set_timeout() function, then here
> we have no need to check if m < 1 again, since the LTP_TIMEOUT_MUL
> valid check will be finished in setup() early phase.
> (This comment is just FYI, and I also think it's OK to check twice.)
Good point. I'd probably check twice in case the logic changes one day.

> --------------------------------------
> void tst_set_timeout(int timeout)
> {
>         float m = 1;
>         char *mul = getenv("LTP_TIMEOUT_MUL");

>         if (mul) {
>                 m = atof(mul);
>                 if (m < 1)
>                         tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);
>         }

>         if (timeout == -1) {
>                 tst_res(TINFO, "Timeout per run is disabled");
>                 return;
>         }

>         results->timeout = timeout * m + 0.5;

>         tst_res(TINFO, "Timeout per run is %uh %02um %02us",
>                 results->timeout/3600, (results->timeout%3600)/60,
>                 results->timeout % 60);

>         if (getpid() == lib_pid)
>                 alarm(results->timeout);
>         else
>                 heartbeat();
> }


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
