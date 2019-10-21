Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF2DF4D2
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 20:09:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D461C3C2418
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 20:09:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CAD143C23B9
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 20:08:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 05AE914012BF
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 20:08:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E21D0B33A;
 Mon, 21 Oct 2019 18:08:56 +0000 (UTC)
Date: Mon, 21 Oct 2019 20:08:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: cfamullaconrad@suse.com
Message-ID: <20191021180854.GA32537@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-3-cfamullaconrad@suse.de>
 <20191021143703.GA27848@rei> <1571671901.4633.17.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571671901.4633.17.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/5] tst_test.c: Add tst_multiply_timeout()
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

> On Mon, 2019-10-21 at 16:37 +0200, Cyril Hrubis wrote:
> > Hi!
> > > +	if (timeout_mul == -1) {
> > > +		mul = getenv("LTP_TIMEOUT_MUL");
> > > +		if (mul) {
> > > +			timeout_mul = mul_float = atof(mul);
> > > +			if (timeout_mul != mul_float) {
> > > +				timeout_mul++;
> > > +				tst_res(TINFO, "ceiling
> > > LTP_TIMEOUT_MUL to %d",
> > > +						timeout_mul);
> > > +			}

> > Huh, why are we ceiling the timeout multiplier?
I didn't notice Cyril's comment.
I'm sorry to overlook this. I agree with Cyril to keep float for C.
> Hm, I just understood the discussion about TST_TIMEOUT/LTP_TIMEOUT_MUL
> in that way, that we tried to keep both implementations more or less
> the same.

> So we keep float for LTP_TIMEOUT_MUL in c implementation?
> Maybe a v5 is then needed, pvorel?
Yes please. Can you please document float vs int in LTP_TIMEOUT_MUL
in the last commit.

> thanks
> Clemens


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
