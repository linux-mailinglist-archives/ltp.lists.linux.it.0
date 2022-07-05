Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2C5662C0
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:24:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28AB33CA086
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:24:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 962E53C7C07
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:24:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 799931A0089F
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:24:22 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D23851FE31
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 05:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656998661;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/mxz83Hewk9e6epSLtUr/eEA1puEsiSw2xGzv8YRZk=;
 b=qtzocpE/rYb8duWKBQR9gKtK58uOen+GwfkcfM4laDrQ1rCezDu1qjHkB4Pg/g1b3QMk0i
 K7QwCO3AtztTjnaS3Qf5iD1RojJ3tYT5byaLjuJqutIDRkYg5rIeyy3zEyh+kAP+dddZnX
 GLOgfOu7i45GKJjP5RZMas+2WT6UcTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656998661;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/mxz83Hewk9e6epSLtUr/eEA1puEsiSw2xGzv8YRZk=;
 b=KYelVP575jzDUlAitdkKhg24UyDBCswEle2hb6lGbQeL2YIQY3yTmxnl5JTth+k3mleFu7
 hU3H6HRI9lPI3uDA==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A25112C141;
 Tue,  5 Jul 2022 05:24:21 +0000 (UTC)
References: <20220620092146.7604-1-chrubis@suse.cz>
 <20220620092146.7604-4-chrubis@suse.cz>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 05 Jul 2022 06:23:21 +0100
In-reply-to: <20220620092146.7604-4-chrubis@suse.cz>
Message-ID: <87y1x8rv22.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] openposix: sem_destroy/3-1: Fix
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

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> +	if (sem_destroy(&psem) == 0 && sem_destroy(&csem) == 0) {
>  		puts("TEST PASS");
> -		pthread_exit(NULL);

lol

> -		if ((sem_destroy(&psem) == 0) && sem_destroy(&csem) == 0) {
> -			return PTS_PASS;
> -		} else {
> -			puts("TEST FAILED");
> -			return PTS_FAIL;
> -		}
> +		return PTS_PASS;
> +	} else {
> +		puts("TEST FAILED");
> +		return PTS_FAIL;
>  	}
>  }
>  
> -- 
> 2.35.1

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
