Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5EDED44
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:15:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F358E3C23F6
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 15:15:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 990CD3C1C90
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:15:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8804C1000BE1
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:15:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 710A4B7FB
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 13:15:35 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:15:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20191021131530.GB18513@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-6-cfamullaconrad@suse.de>
 <87h842o2pp.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h842o2pp.fsf@rpws.prws.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 5/5] Adopt doc for TST_RETRY_FUNC for
 LTP_TIMEOUT_MUL
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

Hi,

> Clemens Famulla-Conrad <cfamullaconrad@suse.de> writes:

> > Mention that time limit is mulitplied with LTP_TIMEOUT_MUL.
> > ---
> >  doc/test-writing-guidelines.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)

> > diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> > index efff4d40c..905a4baa5 100644
> > --- a/doc/test-writing-guidelines.txt
> > +++ b/doc/test-writing-guidelines.txt
> > @@ -2313,7 +2313,8 @@ Retry a function in limited time
> >  Sometimes LTP test needs retrying a function for many times to get success.
> >  This achievement makes that possible via keeping it retrying if the return
> >  value of the function is NOT as we expected. After exceeding a limited time,
> > -test will break from the retries immediately.
> > +test will break from the retries immediately. The time limit is multiplied
> > +with LTP_TIMEOUT_MUL.

> I think the function tst_multiply_timeout also needs documenting.
Isn't it meant to be used just in library (in lib/tst_test.c)?
Thus I wouldn't document it here. And in fact remove it from include/tst_test.h
(second commit).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
