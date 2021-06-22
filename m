Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51423B073D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:17:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E42763C9473
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:17:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9B7A3C2020
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:17:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 01FB5140111D
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:17:44 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6F3C21FD6A;
 Tue, 22 Jun 2021 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371464;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dv7nXg3auDFOqvehxPi9hCd1JstNv9W3i7mTPIOiN9U=;
 b=kfRYVkuNJbz9Jhcu3kkGYd0xIc4CTmC/aZMO//vM32WRVFPNqA6O1dB/WMf6iZi5HaE6P1
 JcvgDJp1EfX/lNczTw6OFUwG2LKrw1yBGMXRIuma34qZBLyPZzfb/ybDU4ZTtgfhduErj/
 5CSD4jAf2UhAoqCBpc19xjprV++2Ncg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371464;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dv7nXg3auDFOqvehxPi9hCd1JstNv9W3i7mTPIOiN9U=;
 b=tyyoASOLk3HgJdYmVDDV5CQ/Ee+D8nFc2fNerttzc4T45cbbMwQiJu7Kb0lZWELHNDypSr
 6XqZNSNn6juj8qBg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 36F63A3B92;
 Tue, 22 Jun 2021 14:17:44 +0000 (UTC)
References: <20210622122538.402907-1-liwang@redhat.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20210622122538.402907-1-liwang@redhat.com>
Date: Tue, 22 Jun 2021 15:17:43 +0100
Message-ID: <877dim56go.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] mem: child alloc memory should larger than
 memory.max + memory.swap.max if lite==1
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

> oom03 often gets fail while setting 'memory.swap.max = TESTMEM' in CGroup V2,
> as in that scenario (lite == 1), child_alloc only start a single process to
> dirty 'TESTMEM + MB' anonymous memory for testing:
>
> testoom(, lite == 1, ,)
>   oom(, lite == 1, ,)
>     child_alloc(, lite == 1,)
>         alloc_mem(TESTMEM + MB, )
>
>   mem.c:224: TINFO: start normal OOM testing.
>   mem.c:146: TINFO: expected victim is 80466.
>   mem.c:38: TINFO: thread (7f411c69d740), allocating 1074790400 bytes.
>   mem.c:64: TINFO: swapped is 25546752 bytes.     <------- swap occuring -----
>   mem.c:164: TFAIL: victim unexpectedly ended with retcode: 0, expected: 12
>
> TBH, this can not really test the 'memory.swap.max' as expected, since in the
> kernel side mem_cgroup_out_of_memory split OOM margin into two-part, one for
> memory.max limit, another for memory.swap.max, if any of them get overflow,
> then invoke out_of_memory to kill victim-process.
>
> Theoretically, alloc_mem(TESTMEM + MB, ) should work while 'memory.max' is equal
> to TESTMEM, but Cgroup v2 tracks memory and swap in separate, which splits memory
> and swap counter. So with swappiness enable (default value is 60 on RHEL), it
> likely has part of memory swapping out during the allocating, upon that the two
> limit loss effect at the same time. Unless disable swap completely then memory.max
> will take effect in precisely.
>
> To get more opportunities to reach the swap limitation, let's scale down the
> value of 'memory.swap.max' to only 1MB for CGroup v2.
>
> But for CGroup v1, the memory.memsw.limit_in_bytes disallow to less than
> memory.limit_in_bytes, so we'd better raise the child_alloc to the
> twifold
  ^twofold
> of TESTMEM.

Ah, this means "memory.swap.x" and "memory.memsw.x" are not really the
same thing. This seems to be common pattern, so maybe we could translate
V2 values to V1 in the library.

If I understand correctly `memory.swap.max = memory.memsw.limit_in_bytes
- memory.limit_in_bytes`? Also "max" can be mapped to ~0UL or maybe
~0ULL when -m32 is used.

This is not important for the current patch.

>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>
> Notes:
>     v1 --> v2
>        * add comments for explaining why set 'memory.swap.max' to 1MB
>        * Scale down the value of 'memory.swap.max' to only 1MB for CGroup v2.
>
>  testcases/kernel/mem/lib/mem.c   |  2 +-
>  testcases/kernel/mem/oom/oom03.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
> index 9f946b5c9..ac890491c 100644
> --- a/testcases/kernel/mem/lib/mem.c
> +++ b/testcases/kernel/mem/lib/mem.c
> @@ -78,7 +78,7 @@ static void child_alloc(int testcase, int lite, int threads)
>  	pthread_t *th;
>  
>  	if (lite) {
> -		int ret = alloc_mem(TESTMEM + MB, testcase);
> +		int ret = alloc_mem(TESTMEM * 2 + MB, testcase);
>  		exit(ret);
>  	}
>  
> diff --git a/testcases/kernel/mem/oom/oom03.c b/testcases/kernel/mem/oom/oom03.c
> index 939413744..89d7711a5 100644
> --- a/testcases/kernel/mem/oom/oom03.c
> +++ b/testcases/kernel/mem/oom/oom03.c
> @@ -46,7 +46,22 @@ static void verify_oom(void)
>  	testoom(0, 0, ENOMEM, 1);
>  
>  	if (SAFE_CGROUP_HAS(cg, "memory.swap.max")) {
> -		SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
> +		/*
> +		 * Cgroup v2 tracks memory and swap in separate, which splits
> +		 * memory and swap counter. So with swappiness enable (default
> +		 * value is 60 on RHEL), it likely has part of memory swapping
> +		 * out during the allocating, upon that the two limit loss
> +		 * effect at the same time.
> +		 *
> +		 * To get more opportunities to reach the swap limitation,
> +		 * let's scale down the value of 'memory.swap.max' to only
> +		 * 1MB for CGroup v2.
> +		 */
> +		if (TST_CGROUP_VER(cg, "memory") != TST_CGROUP_V1)
> +			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", MB);
> +		else
> +			SAFE_CGROUP_PRINTF(cg, "memory.swap.max", "%lu", TESTMEM);
> +

To be consistent with V2; should this be TESTMEM + MB?

>  		testoom(0, 1, ENOMEM, 1);
>  	}
>  
> -- 
> 2.31.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
