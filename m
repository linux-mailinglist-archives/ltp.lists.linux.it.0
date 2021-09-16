Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42840D74D
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:20:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E60A93C88EB
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:20:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 760973C1D42
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:20:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EBDEF1400966
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:20:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4E7941FED1
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631787640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFxramCGCuhVmz/41i+8NaDcRwRpP7kTZAGrpAxcjvc=;
 b=p3100Z1BPtAAfB++7HQ+hp/r+7aVLekDzyTZIV931TejHal40m+5FpMLj/OiSb72VQ1jrA
 ZPhhtwO9gsCuDBRGWbEUbY9rj9vgh/WlyXQntp9VnSVg7oGDGHqC3ZVP0d8gM6sBxkc6iW
 uAMAsOvIc6+7jQo6hXqTNdsDmWrNXRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631787640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFxramCGCuhVmz/41i+8NaDcRwRpP7kTZAGrpAxcjvc=;
 b=+2GFZnI2DMAGt7LVuSJ5k5c8HE6WpzsgVLqla11ggYDYx7gC88BGo9TJwLsLdMKjutlirE
 8zF7OMEFeh888IBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 77B72A3BA2;
 Thu, 16 Sep 2021 10:20:35 +0000 (UTC)
References: <20210915143725.13170-1-chrubis@suse.cz>
 <20210915143725.13170-2-chrubis@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20210915143725.13170-2-chrubis@suse.cz>
Date: Thu, 16 Sep 2021 11:20:33 +0100
Message-ID: <87tuiklt3i.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: tst_kconfig: Fix typo Constrain ->
 Constraint
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

Cyril Hrubis <chrubis@suse.cz> writes:

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  lib/tst_kconfig.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index c2b85821b..c9de3017b 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -497,7 +497,7 @@ void tst_kconfig_check(const char *const kconfigs[])
>  
>  		if (val != 1) {
>  			abort_test = 1;
> -			tst_res(TINFO, "Constrain '%s' not satisfied!", kconfigs[i]);
> +			tst_res(TINFO, "Constraint '%s' not satisfied!", kconfigs[i]);
>  			dump_vars(exprs[i]);
>  		}
>  
> -- 
> 2.32.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
