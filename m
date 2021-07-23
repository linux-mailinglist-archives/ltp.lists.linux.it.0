Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9973D3C66
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 17:25:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C96D3C6947
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 17:25:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A83933C58B2
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 17:25:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 17A42200936
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 17:25:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53D6021FCD;
 Fri, 23 Jul 2021 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627053948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ekTjZYU0SxRLpo346yjNWJYXzPM7NdfvZphaelZQOA=;
 b=AFLl3pwr1ZHXCfRIWfKvg7L5qyEfQMw75MAbljklGVhhT1hXhRjIVYTQWhULgre8OSc3JN
 aTKvVPzlfPd/WraPV8szpOXGM6VoRM6OFRwNwB8+k7IeoMTodT48ZEvBbKMiY/YauqP31S
 oC6ftm1vBmqZAsFYTXyK9djBI6NPrqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627053948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ekTjZYU0SxRLpo346yjNWJYXzPM7NdfvZphaelZQOA=;
 b=BpP+z/t3XMRvv96eSInjG798O+ZZdGNMmkQMMhlv5OOzdTpAaN9NMZbdzqA6vBugOs63mX
 kO1vq2Y4zeXqARCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAD2913E02;
 Fri, 23 Jul 2021 15:25:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MYXpMHvf+mBDWgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 23 Jul 2021 15:25:47 +0000
Date: Fri, 23 Jul 2021 17:00:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YPrZhzFng/7nHywg@yuki>
References: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0
 bug
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
> +'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
                                      ^
				      If the hugepage size needs to be
				      set to 0 on ...
> +system, please use '.request_hugepages = TST_NO_HUGEPAGES'.
>  
>  Also, we do cleanup and restore work for the hpages resetting automatically.
>  
> diff --git a/include/tst_test.h b/include/tst_test.h
> index c7d77eb09..40c725995 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -125,6 +125,8 @@ struct tst_tag {
>  
>  extern unsigned int tst_variant;
>  
> +#define TST_NO_HUGEPAGES ((unsigned long)-1)
> +
>  struct tst_test {
>  	/* number of tests available in test() function */
>  	unsigned int tcnt;
> @@ -175,7 +177,8 @@ struct tst_test {
>  	 * have enough hpage for using, it will try the best to reserve 80% available
>  	 * number of hpages. With success test stores the reserved hugepage number in
>  	 * 'tst_hugepages. For the system without hugetlb supporting, variable
> -	 * 'tst_hugepages' will be set to 0.
> +	 * 'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
> +	 * system, please use '.request_hugepages = TST_NO_HUGEPAGES'.

Here as well.


Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
