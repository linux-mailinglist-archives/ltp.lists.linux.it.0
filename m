Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3733108E
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 15:14:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 884DE3C557C
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 15:14:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1EA823C3236
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 15:14:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 822E62001C6
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 15:14:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC8F8AE05;
 Mon,  8 Mar 2021 14:14:51 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:16:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YEYxwOr3tOJdnz+j@yuki.lan>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
 <20210305155123.18199-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305155123.18199-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/6] fzsync: Reset delay bias
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
> If the delay bias a preserved then it breaks tests which have multiple
                    ^
		    is?

> scenarios and/or use -i. The test author could reset it manually in
> this case, but it's likely to be error prone.
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Other than that this looks OK.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> ---
>  include/tst_fuzzy_sync.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 4141f5c64..b8841d96d 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -289,6 +289,7 @@ static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  	tst_init_stat(&pair->diff_ab);
>  	tst_init_stat(&pair->spins_avg);
>  	pair->delay = 0;
> +	pair->delay_bias = 0;
>  	pair->sampling = pair->min_samples;
>  
>  	pair->exec_loop = 0;
> -- 
> 2.30.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
