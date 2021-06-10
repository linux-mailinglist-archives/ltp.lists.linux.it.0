Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F673A2DC0
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:10:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05A3E3C59D0
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:10:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B9973C188E
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:10:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6912F1400525
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:10:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA95B21A33;
 Thu, 10 Jun 2021 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623334214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7gicTIZJ7knecFPYa728ESjfcws5oIGVikdMl9VXwQ=;
 b=p4Wgqt/4M/hvFE4zckNf6WJkRzAwxHHmMlTQNNNr5S8m14aMqp3lJ31v0kv3yepp5PJGVY
 eFZjq/XnCE2nkBLONueMQTQ2ph2Rqy3+MFDqrzxdVw8Lke9iRotvdoJNzbBqgYHbpl4rew
 FXw+KY4X6USC69mS2aFJYEnGw3AFfkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623334214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7gicTIZJ7knecFPYa728ESjfcws5oIGVikdMl9VXwQ=;
 b=HWgBof0PJCX6QV/hE1mlBFN9Ixz+A05sOKgjoEkynEEKMbRSnJJ12TZTYg36Dpr0gAwy5H
 2xvKupvrW+Mjw9DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 9EC49118DD;
 Thu, 10 Jun 2021 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623334214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7gicTIZJ7knecFPYa728ESjfcws5oIGVikdMl9VXwQ=;
 b=p4Wgqt/4M/hvFE4zckNf6WJkRzAwxHHmMlTQNNNr5S8m14aMqp3lJ31v0kv3yepp5PJGVY
 eFZjq/XnCE2nkBLONueMQTQ2ph2Rqy3+MFDqrzxdVw8Lke9iRotvdoJNzbBqgYHbpl4rew
 FXw+KY4X6USC69mS2aFJYEnGw3AFfkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623334214;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7gicTIZJ7knecFPYa728ESjfcws5oIGVikdMl9VXwQ=;
 b=HWgBof0PJCX6QV/hE1mlBFN9Ixz+A05sOKgjoEkynEEKMbRSnJJ12TZTYg36Dpr0gAwy5H
 2xvKupvrW+Mjw9DA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0BxqJUYdwmB2XAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 10 Jun 2021 14:10:14 +0000
Date: Thu, 10 Jun 2021 15:44:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMIXO6IGN/1VHtbe@yuki>
References: <20210610121819.24626-1-rpalethorpe@suse.com>
 <20210610121819.24626-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610121819.24626-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] API: Remove TEST macro usage from library
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
> diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
> index d098173d5..cc2766be8 100644
> --- a/lib/tst_netdevice.c
> +++ b/lib/tst_netdevice.c
> @@ -149,7 +149,7 @@ int tst_create_veth_pair(const char *file, const int lineno,
>  	tst_rtnl_destroy_context(file, lineno, ctx);
>  
>  	if (!ret) {
> -		tst_brk_(file, lineno, TBROK | TTERRNO,
> +		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Failed to create veth interfaces %s+%s", ifname1,
>  			ifname2);
>  	}
> @@ -183,7 +183,7 @@ int tst_remove_netdev(const char *file, const int lineno, const char *ifname)
>  	tst_rtnl_destroy_context(file, lineno, ctx);
>  
>  	if (!ret) {
> -		tst_brk_(file, lineno, TBROK | TTERRNO,
> +		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Failed to remove netdevice %s", ifname);
>  	}
>  
> @@ -232,7 +232,7 @@ static int modify_address(const char *file, const int lineno,
>  	tst_rtnl_destroy_context(file, lineno, ctx);
>  
>  	if (!ret) {
> -		tst_brk_(file, lineno, TBROK | TTERRNO,
> +		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Failed to modify %s network address", ifname);
>  	}
>  
> @@ -301,7 +301,7 @@ static int change_ns(const char *file, const int lineno, const char *ifname,
>  	tst_rtnl_destroy_context(file, lineno, ctx);
>  
>  	if (!ret) {
> -		tst_brk_(file, lineno, TBROK | TTERRNO,
> +		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Failed to move %s to another namespace", ifname);
>  	}
>  
> @@ -392,7 +392,7 @@ static int modify_route(const char *file, const int lineno, unsigned int action,
>  	tst_rtnl_destroy_context(file, lineno, ctx);
>  
>  	if (!ret) {
> -		tst_brk_(file, lineno, TBROK | TTERRNO,
> +		tst_brk_(file, lineno, TBROK | TERRNO,
>  			"Failed to modify network route");
>  	}
>  
> diff --git a/lib/tst_rtnetlink.c b/lib/tst_rtnetlink.c
> index 1ecda3a9f..d93f7e18d 100644
> --- a/lib/tst_rtnetlink.c
> +++ b/lib/tst_rtnetlink.c
> @@ -380,7 +380,7 @@ int tst_rtnl_check_acks(const char *file, const int lineno,
>  		}
>  
>  		if (res->err->error) {
> -			TST_ERR = -res->err->error;
> +			errno = -res->err->error;
>  			return 0;
>  		}
>  	}
> @@ -394,7 +394,7 @@ int tst_rtnl_send_validate(const char *file, const int lineno,
>  	struct tst_rtnl_message *response;
>  	int ret;
>  
> -	TST_ERR = 0;
> +	errno = 0;
>  
>  	if (tst_rtnl_send(file, lineno, ctx) <= 0)
>  		return 0;

I've did a careful review and this part is actually not correct. The
tst_rtnl_send_validate() function uses TST_ERR to propagate error while
the caller calls tst_rtnl_destroy_context() before it reads the value.
It's not correct to use errno this way since it may be modified in the
functions that free messages or destroys the context.

I guess that fixing this part correctly would mean to change the
tst_rtnl_send_validate() to return the return value from
tst_rtnl_check_acks() and the tst_rtnl_check_acks() would have to return
error on a failure.

It may also make sense to split this patch into two and keep changes to
these two files in a separate patch, since the rest is more or less
mechanical replacement of the TEST() macro use which is as far as I can
tell correct.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
