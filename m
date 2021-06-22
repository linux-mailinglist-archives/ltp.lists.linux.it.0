Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1523B0758
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:23:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D8F03C9473
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:23:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3CF73C229E
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:23:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6A6D5600C63
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:23:51 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C89B01FD62;
 Tue, 22 Jun 2021 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371830;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2RJa1yGoa0CXIDpxJXQSnZ7vnVGvCmIPETRZotNttbA=;
 b=ODnI6yOX+cVF9jnrqW08yoq8T5BLXtA6oBsSX1ZpClo1Z6eTneOcZSunbUss+LeOnUrBw5
 OLrhdg/P3cjntvwIg6BJQXTM/ODeaOJBsJJKu1dkuL7E7g5W/1+/LAQgvXSR1psfwWVY+q
 48s+Qi01uxf5QLGnBAOULqECIRL0HpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371830;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2RJa1yGoa0CXIDpxJXQSnZ7vnVGvCmIPETRZotNttbA=;
 b=Fjk80LMd91QdgyB2UUAT5AcMDds/dRaeAqYvwG7skT4mFHBYw7ydTet2sQ8key/9ZAWrrk
 tfMWRebe4i+OOMCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 99811A3B8D;
 Tue, 22 Jun 2021 14:23:50 +0000 (UTC)
References: <20210622122538.402907-1-liwang@redhat.com>
 <20210622122538.402907-2-liwang@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20210622122538.402907-2-liwang@redhat.com>
Date: Tue, 22 Jun 2021 15:23:50 +0100
Message-ID: <874kdq566h.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] oom: enable lite == 1 for memory.swap.max
 testing
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

Hello Li,

Li Wang <liwang@redhat.com> writes:

> oom03: adding print info and restore memory.swap.max after testing
> oom05: enable lite == 1 for memory.swap.max testing
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/mem/oom/oom03.c | 6 ++++++
>  testcases/kernel/mem/oom/oom05.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/oom/oom03.c
> index 89d7711a5..6728e1ddb 100644
> --- a/testcases/kernel/mem/oom/oom03.c
> +++ b/testcases/kernel/mem/oom/oom03.c
> @@ -46,6 +46,7 @@ static void verify_oom(void)
>  	testoom(0, 0, ENOMEM, 1);
>  
>  	if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
> +		tst_res(TINFO, "OOM on MEMCG with special memswap limitation:");
>  		/*
>  		 * Cgroup v2 tracks memory and swap in separate, which splits
>  		 * memory and swap counter. So with swappiness enable (default
> @@ -63,6 +64,11 @@ static void verify_oom(void)
>  			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
>  
>  		testoom(0, 1, ENOMEM, 1);
> +
> +		if (TST_CGROUP_VER(cg, "memory") == TST_CGROUP_V1)
> +			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", ~0UL);
> +		else
> +			SAFE_CGROUP_PRINT(cg, "memory.swap.max", "max");
>  	}
>  
>  	/* OOM for MEMCG with mempolicy */
> diff --git a/testcases/kernel/mem/oom/oom05.c b/testcases/kernel/mem/oom/oom05.c
> index 9c9bba7f6..9e1cff312 100644
> --- a/testcases/kernel/mem/oom/oom05.c
> +++ b/testcases/kernel/mem/oom/oom05.c
> @@ -63,8 +63,12 @@ static void verify_oom(void)
>  	if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
>  		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
>  				"special memswap limitation:");
> -		SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
> -		testoom(0, 0, ENOMEM, 1);
> +		if (TST_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
> +			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", MB);
> +		else
> +			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);

Again; TESTMEM + MB?
> +
> +		testoom(0, 1, ENOMEM, 1);
>  
>  		tst_res(TINFO, "OOM on CPUSET & MEMCG with "
>  				"disabled memswap limitation:");
> -- 
> 2.31.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
