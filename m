Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19F3DE9B0
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:30:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 445503C56BD
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:30:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1B8A73C03FF
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:30:27 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9F7C91000D08
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:30:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9A9A2000C;
 Tue,  3 Aug 2021 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627983025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFg5tggmIvtt7NYvYkASrPCCQJd5ZG7WV3XpAzYwlHI=;
 b=0Qo2nQM93K7nEkAV0th601uthCmST3ONn3/ZwFIRKtV5vfSOCn/v4n1MpZ+b/1+VbxGIvo
 hrUYw+Z42l80IPmMJmYGu4Yf3cihaa3E6F7jLAGig8z2Qv9LZhegVtn6Y+AoOOXChwTMNV
 1csjQOaUjW6lZlI760FL3e6eGGHowls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627983025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFg5tggmIvtt7NYvYkASrPCCQJd5ZG7WV3XpAzYwlHI=;
 b=syvX+yyXz6U08ggFrTUfSnKfSkjVEXcGpagYPLHk/KUyKzl2E278xZUhTgljD0eShNoX9X
 HhzEndzO9nA+yzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A537513CCC;
 Tue,  3 Aug 2021 09:30:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKwQJ7EMCWEHLAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 09:30:25 +0000
Date: Tue, 3 Aug 2021 11:30:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YQkMuOHjZ4HHO+QQ@yuki>
References: <20210802173536.19525-1-pvorel@suse.cz>
 <20210802173536.19525-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802173536.19525-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/7] lib: Print Summary: into stderr
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
I wonder if this change can break anything but I guess that it's
unlikely.

Also while you are at it can you also fix tags? We do print help() to
stderr but tags that follow go into stdout which is rather starnge.

And the failure hints are written to stdout as well, which should be
fixed as well.

> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> The same as in v6.
> 
>  lib/tst_test.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index c7c77596c..d15c8c054 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -734,12 +734,12 @@ static void do_exit(int ret)
>  		if (results->broken)
>  			ret |= TBROK;
>  
> -		printf("\nSummary:\n");
> -		printf("passed   %d\n", results->passed);
> -		printf("failed   %d\n", results->failed);
> -		printf("broken   %d\n", results->broken);
> -		printf("skipped  %d\n", results->skipped);
> -		printf("warnings %d\n", results->warnings);
> +		fprintf(stderr, "\nSummary:\n");
> +		fprintf(stderr, "passed   %d\n", results->passed);
> +		fprintf(stderr, "failed   %d\n", results->failed);
> +		fprintf(stderr, "broken   %d\n", results->broken);
> +		fprintf(stderr, "skipped  %d\n", results->skipped);
> +		fprintf(stderr, "warnings %d\n", results->warnings);
>  	}
>  
>  	do_cleanup();
> -- 
> 2.32.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
