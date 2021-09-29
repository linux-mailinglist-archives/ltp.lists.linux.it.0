Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1241C07E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Sep 2021 10:18:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A947B3C6EA6
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Sep 2021 10:18:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7864D3C1B31
 for <ltp@lists.linux.it>; Wed, 29 Sep 2021 10:18:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AB6301001198
 for <ltp@lists.linux.it>; Wed, 29 Sep 2021 10:18:38 +0200 (CEST)
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id 02F3522529;
 Wed, 29 Sep 2021 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632903518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cC85woQW2pt3RNzTVHsAJ3b6d3DP2WE6MMTK9Fninl4=;
 b=HDvv7jOU02sY1x22jjd7rrvJY73KtoeY7LcS+YvxGt0FZwjUhZQfj9YFw1AScsWHdqANNT
 pjcRzSKUwSjeIpqzEkNBcvzxdMrxgwAMwGXaK1PYa9zVXuFlpvJYJDpdBmEjoTmQUhL3fb
 hEM5O0YP/hg3Fabk+b/Y5o24BRoG0D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632903518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cC85woQW2pt3RNzTVHsAJ3b6d3DP2WE6MMTK9Fninl4=;
 b=rYN9qTuVuyEPFQRHI9UR9nW6RbLjWvoDcOhxz8mUk4xuRNf8Aa4C7nGJb4MlZ/DSUX9s5k
 dELxyD+F/g8CHhCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay1.suse.de (Postfix) with ESMTPS id C807525D66;
 Wed, 29 Sep 2021 08:18:37 +0000 (UTC)
References: <20210928021850.2015065-1-ralph.siemsen@linaro.org>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 29 Sep 2021 09:14:56 +0100
In-reply-to: <20210928021850.2015065-1-ralph.siemsen@linaro.org>
Message-ID: <87ee97g5gi.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: fix MemAvailable parsing
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

Hello Ralph,

Ralph Siemsen <ralph.siemsen@linaro.org> writes:

> The amount of available memory was not being returned correctly, which
> resulted in tests being executed when they should have been skipped.
>
> Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  lib/tst_memutils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> index 69077861f..90911da56 100644
> --- a/lib/tst_memutils.c
> +++ b/lib/tst_memutils.c
> @@ -65,9 +65,9 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
>  
>  long long tst_available_mem(void)
>  {
> -	long long mem_available;
> +	long long mem_available = 0;
>  
> -	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
> +	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %lld",
>  		&mem_available)) {
>  		mem_available = SAFE_READ_MEMINFO("MemFree:")
>  			+ SAFE_READ_MEMINFO("Cached:");
> -- 
> 2.25.1

Just curious, did you find this on 32-bit ARM?

Anyway looks correct.

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
