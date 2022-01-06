Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD95486343
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jan 2022 11:55:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24A833C30F4
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jan 2022 11:55:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF2DA3C12D0
 for <ltp@lists.linux.it>; Thu,  6 Jan 2022 11:55:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 33A3D6006DC
 for <ltp@lists.linux.it>; Thu,  6 Jan 2022 11:55:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CDEF21106;
 Thu,  6 Jan 2022 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641466532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A6WGZQWICukOLJwpfI+H19vHaLzJkbPMRU1aCLCQ/VM=;
 b=tTnShNTdms42ljoTX4z/eC0HE0ZSKB4W0Q01rapnkuoKcNT5nPfG2qLBpw77cId0TYHJHZ
 2l5zM4iNKGB5XU9h68U/zCBsTMinZqe9glVa2uJWdr+K0tbcexgjBWAiJxhlx2IRbRgHFM
 yv1R/mImz5roPXE98sIK6ifIX7nZjRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641466532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A6WGZQWICukOLJwpfI+H19vHaLzJkbPMRU1aCLCQ/VM=;
 b=i+gOHPbzVwvUfN2S9s+AkHeCA5C/1255kCbrwg7FMiI8SCsOJpkdzdOG5uXWe6wsmliwRi
 M+2+yYieobJsM9Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AB0B13C24;
 Thu,  6 Jan 2022 10:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j45FEaTK1mGtDgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 06 Jan 2022 10:55:32 +0000
Date: Thu, 6 Jan 2022 11:57:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YdbK/0ngsQGStis6@yuki>
References: <YdWsZpTjnBLszubC@pevik>
 <1641461121-2212-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1641461121-2212-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] lib/tst_kconfig: Modify the return type of
 tst_kconfig_check function
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
> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index d433b8cf6..dc7decff9 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -478,22 +478,26 @@ static void dump_vars(const struct tst_expr *expr)
>  	}
>  }
>  
> -void tst_kconfig_check(const char *const kconfigs[])
> +int tst_kconfig_check(const char *const kconfigs[])
>  {
>  	size_t expr_cnt = array_len(kconfigs);
>  	struct tst_expr *exprs[expr_cnt];
>  	unsigned int i, var_cnt;
> -	int abort_test = 0;
> +	int ret = 0;
>  
>  	for (i = 0; i < expr_cnt; i++) {
>  		exprs[i] = tst_bool_expr_parse(kconfigs[i]);
>  
> -		if (!exprs[i])
> -			tst_brk(TBROK, "Invalid kconfig expression!");
> +		if (!exprs[i]) {
> +			tst_res(TWARN, "Invalid kconfig expression!");
> +			return 1;
> +		}
>  	}
>  
> -	if (validate_vars(exprs, expr_cnt))
> -		tst_brk(TBROK, "Invalid kconfig variables!");
> +	if (validate_vars(exprs, expr_cnt)) {
> +		tst_res(TWARN, "Invalid kconfig variables!");
> +		return 1;
> +	}

I think that it would be actually better to keep the TBROK in these two
checks because neither of these two will trigger unless there is a typo
in the expressions and it makes sense to abort everything and stop in
these cases.

Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
