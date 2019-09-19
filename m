Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76DB76F1
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 12:02:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B27FE3C2109
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 12:02:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CA54E3C20F7
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 12:02:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8917F200E08
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 12:02:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFD5EB603;
 Thu, 19 Sep 2019 10:02:05 +0000 (UTC)
Date: Thu, 19 Sep 2019 12:02:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190919100205.GA26642@rei>
References: <20190918053519.26244-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918053519.26244-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> As the tst_taint_init comments described, If the tainted-flags are already set
> by the kernel, there is no reason to continue and TCONF is generated. But in
> the function achieve, it uses TBROK.
> 
>   cmdline="cve-2017-17053"
>   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
>   tst_taint.c:88: BROK: Kernel is already tainted: 536871424

There is a reason for generating TBROK, we do not want the test to be
skipped silently in this case. If kernel is tainted something went wrong
anyways and we are looking only for a specific flags.

> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Chang Yin <cyin@redhat.com>
> Cc: Michael Moese <mmoese@suse.de>
> ---
> 
> Notes:
>     Hi Cyril & Michael,
>     
>     I'm not sure if that's a good choice to skip whole test if the kernel already
>     tainted, so maybe we could also perform it but not do a strict tainted-flags
>     check after testing? The reason I think is it probably have chance to find
>     new issue even with a tainted kernel.
>     
>     Any suggestion?
> 
>  lib/tst_taint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/tst_taint.c b/lib/tst_taint.c
> index a5dbf77d2..f7cafb96f 100644
> --- a/lib/tst_taint.c
> +++ b/lib/tst_taint.c
> @@ -85,7 +85,7 @@ void tst_taint_init(unsigned int mask)
>  
>  	taint = tst_taint_read();
>  	if ((taint & mask) != 0)
> -		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
> +		tst_brk(TCONF, "Kernel is already tainted: %u", taint);
>  }
>  
>  
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
