Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9369601D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 11:01:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDE223CBF57
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Feb 2023 11:01:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CC1BF3CBF51
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 11:01:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 16D5C1000977
 for <ltp@lists.linux.it>; Tue, 14 Feb 2023 11:01:32 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6DC6321B2B;
 Tue, 14 Feb 2023 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676368892;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFBa7njXVDqmxvyrUzndNKoHyobMlAVsVesWd617rhY=;
 b=vZNUmBRXDoHfxXZYSJRCyy9rbtBbJpzqTPpEC2peBshZH97J8CoQO6hrKy+C1cKiRvfaso
 d1YxTU8GWE/zAQL7qJnTpMxhDi00Qw6eVFxnrovjfeq5bmPTnxA4pvdtu+t3fiyj/gXEtm
 vUhdqem1MOntipDCwZelEBlCoKvqdIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676368892;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFBa7njXVDqmxvyrUzndNKoHyobMlAVsVesWd617rhY=;
 b=yd7SgFazwVcc6iFUmpymbtE3ERtchg5WpsmL5BGYC5Avv+CTdt4DWUsi/+wI+l8LBMBO6E
 ftO5N6FPX/ndsaCA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3EAA82C141;
 Tue, 14 Feb 2023 10:01:32 +0000 (UTC)
References: <20230210171601.19047-1-andrea.cervesato@suse.com>
 <20230210171601.19047-2-andrea.cervesato@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 14 Feb 2023 10:00:29 +0000
Organization: Linux Private Site
In-reply-to: <20230210171601.19047-2-andrea.cervesato@suse.com>
Message-ID: <87ilg4o9ac.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/2] Add SAFE_SETHOSTNAME macro
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

I think you forgot my existing Reviewed-by tag on this patch.

Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  include/safe_net_fn.h  |  3 +++
>  include/tst_safe_net.h |  3 +++
>  lib/safe_net.c         | 17 +++++++++++++++++
>  3 files changed, 23 insertions(+)
>
> diff --git a/include/safe_net_fn.h b/include/safe_net_fn.h
> index ff81b1337..6c63cb2cf 100644
> --- a/include/safe_net_fn.h
> +++ b/include/safe_net_fn.h
> @@ -73,6 +73,9 @@ int safe_getsockname(const char *file, const int lineno,
>  int safe_gethostname(const char *file, const int lineno,
>  		     char *name, size_t size);
>  
> +int safe_sethostname(const char *file, const int lineno,
> +		     const char *name, size_t size);
> +
>  int tst_getsockport(const char *file, const int lineno, int sockfd);
>  
>  unsigned short tst_get_unused_port(const char *file, const int lineno,
> diff --git a/include/tst_safe_net.h b/include/tst_safe_net.h
> index e85b79a3e..98f0256fd 100644
> --- a/include/tst_safe_net.h
> +++ b/include/tst_safe_net.h
> @@ -68,6 +68,9 @@
>  #define SAFE_GETHOSTNAME(name, size) \
>  	safe_gethostname(__FILE__, __LINE__, name, size)
>  
> +#define SAFE_SETHOSTNAME(name, size) \
> +	safe_sethostname(__FILE__, __LINE__, name, size)
> +
>  #define TST_GETSOCKPORT(sockfd) \
>  	tst_getsockport(__FILE__, __LINE__, sockfd)
>  
> diff --git a/lib/safe_net.c b/lib/safe_net.c
> index 1717f0745..5dec0de11 100644
> --- a/lib/safe_net.c
> +++ b/lib/safe_net.c
> @@ -469,6 +469,23 @@ int safe_gethostname(const char *file, const int lineno,
>  	return rval;
>  }
>  
> +int safe_sethostname(const char *file, const int lineno,
> +		     const char *name, size_t size)
> +{
> +	int rval = sethostname(name, size);
> +
> +	if (rval == -1) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
> +			"sethostname(%p, %zu) failed", name, size);
> +	} else if (rval) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
> +			"Invalid sethostname(%p, %zu) return value %d", name,
> +			size, rval);
> +	}
> +
> +	return rval;
> +}
> +
>  /*
>   * @return port in network byte order.
>   */
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
