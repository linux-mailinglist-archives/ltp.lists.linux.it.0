Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A41DECC6
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 14:50:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 175CC3C23E8
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 14:50:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DFE4E3C22CB
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 14:50:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E2D1B60CD0C
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 14:50:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 53EFFB45F;
 Mon, 21 Oct 2019 12:50:55 +0000 (UTC)
Date: Mon, 21 Oct 2019 14:50:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191021125053.GA18513@x230>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-3-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018124502.25599-3-cfamullaconrad@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Clements,

> +	if (timeout_mul < 1)
> +		tst_brk(TBROK, "LTP_TIMEOUT_MUL must to be int >= 1! (%d)",
> +				timeout_mul);
> +
> +	if (timeout < 1)
> +		tst_brk(TBROK, "timeout must to be >= 1! (%d)", timeout);
> +
> +	return timeout * timeout_mul;
> +}

> +void tst_set_timeout(int timeout)
> +{
>  	if (timeout == -1) {
>  		tst_res(TINFO, "Timeout per run is disabled");
>  		return;
>  	}

> -	results->timeout = timeout;
> +	if (timeout < 1)
> +		tst_brk(TBROK, "timeout need to be >= 1! (%d)", timeout);
need => needs, but better to use must (to be consistent with the previous one:
		tst_brk(TBROK, "timeout must to be >= 1! (%d)", timeout);

I also wonder, if this check is needed, next step is
results->timeout = tst_multiply_timeout(timeout);
which does the same check.

Can be changed with the committer (unless you plan to do v5 for some reason).

> -	if (mul) {
> -		float m = atof(mul);
> -
> -		if (m < 1)
> -			tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul);
> -
> -		results->timeout = results->timeout * m + 0.5;
> -	}
> +	results->timeout = tst_multiply_timeout(timeout);

>  	tst_res(TINFO, "Timeout per run is %uh %02um %02us",
>  		results->timeout/3600, (results->timeout%3600)/60,

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
