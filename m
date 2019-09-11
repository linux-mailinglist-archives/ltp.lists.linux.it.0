Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D8AF8B5
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:18:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E91B13C2096
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 11:18:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 705AD3C061B
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:17:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 952091001BDB
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 11:17:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39558AD0F;
 Wed, 11 Sep 2019 09:17:58 +0000 (UTC)
Message-ID: <1568193477.3738.3.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed, 11 Sep 2019 11:17:57 +0200
In-Reply-To: <20190911091242.GA24623@dell5510>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911091242.GA24623@dell5510>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Use LTP_TIMEOUT_MUL in TST_RETRY_FN()
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
Reply-To: cfamullaconrad@suse.com
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2019-09-11 at 11:12 +0200, Petr Vorel wrote:
> Hi Clemens,
> 
> > We discovered timeout problems for well known candidates.
> > Most of the time we already use LTP_TIMEOUT_MUL in other cases to
> > globally increase timeout value. So doing it for this function as
> > well.
> > Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> > ---
> >  testcases/lib/tst_test.sh | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index e0b24c6b9..80b8871cb 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -162,9 +162,11 @@ EXPECT_FAIL()
> >  TST_RETRY_FN_EXP_BACKOFF()
> >  {
> > +	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> > +
> >  	local tst_fun="$1"
> >  	local tst_exp=$2
> > -	local tst_sec=$(expr $3 \* 1000000)
> > +	local tst_sec=$(expr $3 \* 1000000 \* $LTP_TIMEOUT_MUL)
> >  	local tst_delay=1
> 
> I'm for it, but that will diverge from C API. Shouldn't we add it
> also
> to tst_common.h?

Agree, let me add it. Thx for the hint.

> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
