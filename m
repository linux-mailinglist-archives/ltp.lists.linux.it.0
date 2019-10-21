Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1424DEFD5
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 16:37:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2457E3C2430
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 16:37:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5776D3C23E1
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 16:37:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 55627200BB5
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 16:37:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99199B248
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 14:37:04 +0000 (UTC)
Date: Mon, 21 Oct 2019 16:37:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191021143703.GA27848@rei>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
 <20191018124502.25599-3-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018124502.25599-3-cfamullaconrad@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +	if (timeout_mul == -1) {
> +		mul = getenv("LTP_TIMEOUT_MUL");
> +		if (mul) {
> +			timeout_mul = mul_float = atof(mul);
> +			if (timeout_mul != mul_float) {
> +				timeout_mul++;
> +				tst_res(TINFO, "ceiling LTP_TIMEOUT_MUL to %d",
> +						timeout_mul);
> +			}

Huh, why are we ceiling the timeout multiplier?

We do that for shell because it simplifies the code and we do not care
that much about being precise for timeouts, but it does not make much
sense here.

Why can't we just convert the env variable to float and multiply?

Something as:

	if (mul) {
		if (ret = tst_parse_float(mul, &timeout_mul, 1, 10000)) {
			tst_brk(TBROK, "Failed to parse LTP_TIMEOUT_MUL: %s",
			        tst_strerrno(ret));
		}
	} else {
		timeout_mul = 1;
	}


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
