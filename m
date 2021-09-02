Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C5C3FEA81
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:18:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B6D43C2DCC
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 10:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 897B63C29D7
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:18:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D8AAD1A0121F
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 10:18:39 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B1AD6224EC;
 Thu,  2 Sep 2021 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630570718;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICBThQ7YFPbp2m9Afi24m+7QQ3IUZj2hkaJXDrHA2J8=;
 b=Svea+gzM1enDsTWPGPF3f2H+1WTqtVr1he1uSY0cu9k2DPtqxHi/l7l0u3wGA5KXbB4doM
 vk41u8o7cmGC2Xo/DZmXKzXv+DRWDbRC4EtGcIJBuN2y+QP2F7vD2KYxHD/nOznIetDjpE
 pPG219VoTmeLXzbJEXx1lr6nhZ6Esls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630570718;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICBThQ7YFPbp2m9Afi24m+7QQ3IUZj2hkaJXDrHA2J8=;
 b=55d8kDc6c5RUH30atiQegtCAxw2WZZUvHaWnKVYqF9z6JBYLMpmlvQua+5CeRFaauLklFf
 CXogA3NZoFOftzDQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7EC6913A75;
 Thu,  2 Sep 2021 08:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 34CVHN6IMGGcRwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 08:18:38 +0000
Date: Thu, 2 Sep 2021 10:18:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTCI3O7Et+VvYJfc@pevik>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
 <20210901151655.95760-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901151655.95760-3-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] controllers/cpuacct: fix rmdir failures on
 early test abort
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

Hi Krzysztof,

...
> -	if [ -d "$testpath/subgroup_1" ]; then
> -		rmdir $testpath/subgroup_*
> +	if [ "$testpath" ]; then
> +		if [ -d "$testpath/subgroup_1" ]; then
> +			rmdir $testpath/subgroup_*
> +		fi
> +		rmdir $testpath
>  	fi

> -	rmdir $testpath
> -

LGTM, but how about use `rm -rf' instead?

e.g.

if [ "$testpath" ]; then
	rm -rf $testpath
fi

That could simplify checks. Or is it needed to use `rmdir' to make sure there is
no content in the directory? I suppose check like this is needed in cleanup,
thus no problem to use `rm -rf'.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
