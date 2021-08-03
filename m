Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 628103DEBDE
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 13:34:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 327503C8893
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 13:34:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3044F3C886A
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 13:34:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C2A931400159
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 13:34:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2EA23200C3;
 Tue,  3 Aug 2021 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627990457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=haCpEpNJc1Y8f2Mt1khiMAWXqAwcrqqYAk92YCiyWRo=;
 b=vaBSW7FbcZP1nDqS/wGM4fitY8UwuWWpVehmWkzZvZ8XNjxNEg2zx1XLDzshujsO40lu6O
 6ylqPSeRaddHUli6W4F5Tou4KImry2etFD2cx7WTNwyQhBOX5n1gMd40tqDpmv2XeAr92o
 IlCZ7Kz8h7UA4FlZqV6jVJwmEvTdKlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627990457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=haCpEpNJc1Y8f2Mt1khiMAWXqAwcrqqYAk92YCiyWRo=;
 b=bMWB4QuWF17GrfdfZvk8+lJghqz55Viwx60xJ7MOA1XXa4yRvLpC8lGeRyRnvpX/p0Nywj
 4pkf8vRoduaUmQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03E8E13CD6;
 Tue,  3 Aug 2021 11:34:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lFEbO7gpCWGLTwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 Aug 2021 11:34:16 +0000
Date: Tue, 3 Aug 2021 13:34:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YQkpwAieJwTCzK+c@yuki>
References: <1627979166-967-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627979166-967-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/madvise06: Add madvise WILLNEED
 performance problem tag
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
> diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
> index 63d8d5452..f2f65ff96 100644
> --- a/testcases/kernel/syscalls/madvise/madvise06.c
> +++ b/testcases/kernel/syscalls/madvise/madvise06.c
> @@ -35,6 +35,12 @@
>   * faults. Two faults are allowed incase some tasklet or something
>   * else unexpected, but irrelevant procedure, registers a fault to
>   * our process.
> + *
> + * It also can reproduce the MADV_WILLNEED preformance problem.
> + * It was introduced since 5.9 kernel with the following commit
> + *   e6e88712e43b ("mm: optimise madvise WILLNEED")
> + * and fixed since 5.10-rc5 kernel with the following commit
> + *   66383800df9c ("mm: fix madvise WILLNEED performance problem").
>   */
>  
>  #include <errno.h>
> @@ -242,6 +248,8 @@ static struct tst_test test = {
>  	.tags = (const struct tst_tag[]) {
>  		{"linux-git", "55231e5c898c"},
>  		{"linux-git", "8de15e920dc8"},
> +		{"linux-git", "e6e88712e43b"},
> +		{"linux-git", "66383800df9c"},

We only put patches that fixed the problem into the tags since we use
these to print failure hints about missing kernel patches.

Other than that it looks fine.

>  		{}
>  	}
>  };
> -- 
> 2.23.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
