Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF01DF199
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 17:31:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D62C3C241C
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 17:31:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 88ED63C0E60
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 17:31:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DA294200C8B
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 17:31:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E66EDB33F
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 15:31:41 +0000 (UTC)
Message-ID: <1571671901.4633.17.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>, "pvorel@suse.cz" <pvorel@suse.cz>
Date: Mon, 21 Oct 2019 17:31:41 +0200
In-Reply-To: <20191021143703.GA27848@rei>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-3-cfamullaconrad@suse.de>
 <20191021143703.GA27848@rei>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Reply-To: cfamullaconrad@suse.com
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-10-21 at 16:37 +0200, Cyril Hrubis wrote:
> Hi!
> > +	if (timeout_mul == -1) {
> > +		mul = getenv("LTP_TIMEOUT_MUL");
> > +		if (mul) {
> > +			timeout_mul = mul_float = atof(mul);
> > +			if (timeout_mul != mul_float) {
> > +				timeout_mul++;
> > +				tst_res(TINFO, "ceiling
> > LTP_TIMEOUT_MUL to %d",
> > +						timeout_mul);
> > +			}
> 
> Huh, why are we ceiling the timeout multiplier?

Hm, I just understood the discussion about TST_TIMEOUT/LTP_TIMEOUT_MUL
in that way, that we tried to keep both implementations more or less
the same.

So we keep float for LTP_TIMEOUT_MUL in c implementation?
Maybe a v5 is then needed, pvorel?

thanks
Clemens


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
