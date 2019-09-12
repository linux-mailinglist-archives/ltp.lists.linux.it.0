Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0CB1305
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 18:49:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DF733C20A2
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 18:49:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6D9123C0358
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 18:49:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E34F71BCB03B
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 18:49:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BDC6ABB1;
 Thu, 12 Sep 2019 16:49:24 +0000 (UTC)
Message-ID: <1568306963.3621.34.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 12 Sep 2019 18:49:23 +0200
In-Reply-To: <20190912145539.GC22246@dell5510>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
 <CAEemH2fy0hQc0yXJY0BXf8-9nnzkDW9LEsydyhtHC3Jboc_tFA@mail.gmail.com>
 <1568278363.3621.6.camel@suse.de> <20190912145539.GC22246@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_test.sh: Use LTP_TIMEOUT_MUL in
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 2019-09-12 at 16:55 +0200, Petr Vorel wrote:
> Hi Clemens,
> 
> > On Thu, 2019-09-12 at 13:42 +0800, Li Wang wrote:
> > > On Thu, Sep 12, 2019 at 12:52 AM Clemens Famulla-Conrad <
> > > cfamullaconrad@suse.de> wrote:
> > > > Because of timeout problems when using TST_RETRY_FN() we do now
> > > > use
> > > > LTP_TIMEOUT_MUL to adopt the timeout value.
> > > > Introduced tst_adjut_timeout function to have a generic place
> > > > to
> > > > adopt timeout values.
> 
> 
> > > What about using tst_multipy_timeout as the function name? Since
> > > it
> > > only
> > > raises the timeout value with a multiplier.
> 
> +1.
> 
> > I had a this patchset [1] in my mind. 
> > Maybe we will also apply a minimum. But we would still just
> > multiply :)
> > so Sure we can name it tst_multiply_timeout().
> > [1]https://patchwork.ozlabs.org/patch/1155460
> 
> 
> 
> > > > Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> > > > ---
> > > >  testcases/lib/tst_test.sh | 12 ++++++++----
> > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > diff --git a/testcases/lib/tst_test.sh
> > > > b/testcases/lib/tst_test.sh
> > > > index e0b24c6b9..03692e503 100644
> > > > --- a/testcases/lib/tst_test.sh
> > > > +++ b/testcases/lib/tst_test.sh
> > > > @@ -164,7 +164,7 @@ TST_RETRY_FN_EXP_BACKOFF()
> > > >  {
> > > >         local tst_fun="$1"
> > > >         local tst_exp=$2
> > > > -       local tst_sec=$(expr $3 \* 1000000)
> > > > +       local tst_sec=$(tst_adjust_timeout $(expr $3 \*
> > > > 1000000))
> > > >         local tst_delay=1
> > > >         if [ $# -ne 3 ]; then
> > > > @@ -371,12 +371,16 @@ _tst_rescmp()
> > > >         fi
> > > >  }
> > > > -
> > > > -_tst_setup_timer()
> > > > +tst_adjust_timeout()
> > > >  {
> > > >         LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> > > > +       local timeout=$1
> > > > +       echo $(( timeout * LTP_TIMEOUT_MUL))
> > > Shouldn't we check the LTP_TIMEOUT_MUL > 1 before using it?
> 
> Also timeout should be checked.
> I'd tst_brk TBROK if either of them is < 0.
> 
> > Yes, thx for the hint.
> 
> BTW: I haven't finish patchset doing the same [1]. Feel free to
> include docs
> from [2].

Thx for that hint, was aware of that patchset [1].

> I'll also sent tonight LTP_TIMEOUT_MUL_MIN (as part of v2 for [3]).
> But it should be trivial to rebase changes of the later commit
> (whoever gets merged first).
> 
> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/project/ltp/list/?series=120151&stat
> e=*
> [2] https://patchwork.ozlabs.org/patch/1133627/
> [3] https://patchwork.ozlabs.org/patch/1155460/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
