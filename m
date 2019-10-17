Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E986DDA7B8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:47:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4110B3C2290
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:47:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 946E13C147F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:47:55 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9D3560108D
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:47:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26D4DAE40;
 Thu, 17 Oct 2019 08:47:54 +0000 (UTC)
Date: Thu, 17 Oct 2019 10:47:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191017084751.GA12047@dell5510>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
 <20191016161519.11256-2-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016161519.11256-2-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/4] tst_test.c: Add tst_multiply_timeout()
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

Hi Clemens,

> This function is used to adjust timeout values with environment
> variables like LTP_TIMEOUT_MUL.

> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
LGTM, minor formatting/wording bellow.

...
> -void tst_set_timeout(int timeout)
> +unsigned int tst_multiply_timeout(unsigned int timeout)
>  {
> -	char *mul = getenv("LTP_TIMEOUT_MUL");
> +	char *mul;
> +	float mul_float;
> +
> +	if (timeout_mul == -1){
Please add space before { (on more places + unnecessary { }).
linux/scripts/checkpatch.pl --terse --no-tree -f lib/tst_test.c
would tell you :)
([1] but we don't follow it fully - common sense is applied, but we try).

> +		mul = getenv("LTP_TIMEOUT_MUL");
> +		if (mul) {
> +			timeout_mul = mul_float = atof(mul);
> +			if (timeout_mul != mul_float){
> +				timeout_mul++;
> +				tst_res(TINFO, "ceiling LTP_TIMEOUT_MUL to %d", timeout_mul);
> +			}
> +		} else {
> +			timeout_mul = 1;
> +		}
> +	}
> +	if (timeout_mul < 1)
> +		tst_brk(TBROK, "LTP_TIMEOUT_MUL need to be int >= 1! (%d)", timeout_mul);
> +
> +	if (timeout < 1)
> +		tst_brk(TBROK, "timeout need to be >= 1! (%d)", timeout);
nit: need => maybe must/needs ?

Kind regards,
Petr
[1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
