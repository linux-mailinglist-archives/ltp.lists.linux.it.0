Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA04CFF79
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 14:04:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFE473C1BC3
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Mar 2022 14:03:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 65BBD3C1B99
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 14:03:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 81C362009CB
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 14:03:57 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C2AA61F37D
 for <ltp@lists.linux.it>; Mon,  7 Mar 2022 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646658236;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQlzvg7oQYVtO6o8B9TKfrh45oCkKIkSVd4H3NVbXFc=;
 b=F2d9rpNf3VTQY2A/w7P8b9TwCpBjzh6ZAd+oRhHTVrwUwZKx2ahVI/fN6+f/2lDsUtIlN/
 V8m6tH10q/U1aGwjq9u3cPaybpLOsBJtFOHWlYswu+aRpKAZxxhsPcRajx81wjwO0y2D0+
 KJYp5UUuHaQqjeigsvQOjlOsjPeg0nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646658236;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQlzvg7oQYVtO6o8B9TKfrh45oCkKIkSVd4H3NVbXFc=;
 b=gF+BN8ssnEEcYavbom0oBQ95M6uOphvSfKHHi21I3P2gIAPKTumFnaxYBWerTBX7hSPypo
 yMo9MCnpDwZ+yVCQ==
Received: from g78 (unknown [10.163.24.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 799F5A3B96;
 Mon,  7 Mar 2022 13:03:56 +0000 (UTC)
References: <20220303145032.21493-1-chrubis@suse.cz>
 <20220303145032.21493-4-chrubis@suse.cz>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 07 Mar 2022 13:03:48 +0000
In-reply-to: <20220303145032.21493-4-chrubis@suse.cz>
Message-ID: <875yopnccj.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] mem/ksm06: Move test code from library to the
 test
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

Hi,

Cyril Hrubis <chrubis@suse.cz> writes:

> There is no point in keeping the test code in the library since ksm06 is
> the only test that actually uses it.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

> ---
>  testcases/kernel/mem/ksm/ksm06.c | 82 +++++++++++++++++++++++++++++-
>  testcases/kernel/mem/lib/mem.c   | 85 --------------------------------
>  2 files changed, 81 insertions(+), 86 deletions(-)
>
> diff --git a/testcases/kernel/mem/ksm/ksm06.c b/testcases/kernel/mem/ksm/ksm06.c
> index 379236f1f..0f5e4b05d 100644
> --- a/testcases/kernel/mem/ksm/ksm06.c
> +++ b/testcases/kernel/mem/ksm/ksm06.c
> @@ -48,7 +48,87 @@ static char *n_opt;
>  
>  static void test_ksm(void)
>  {
> -	test_ksm_merge_across_nodes(nr_pages);
> +	char **memory;
> +	int i, ret;
> +	int num_nodes, *nodes;
> +	unsigned long length;
> +	unsigned long pagesize;
> +
> +#ifdef HAVE_NUMA_V2
> +	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
> +#endif
> +
> +	ret = get_allowed_nodes_arr(NH_MEMS, &num_nodes, &nodes);
> +	if (ret != 0)
> +		tst_brk(TBROK|TERRNO, "get_allowed_nodes_arr");
> +	if (num_nodes < 2) {
> +		tst_res(TINFO, "need NUMA system support");
> +		free(nodes);
> +		return;
> +	}
> +
> +	pagesize = sysconf(_SC_PAGE_SIZE);
> +	length = nr_pages * pagesize;
> +
> +	memory = SAFE_MALLOC(num_nodes * sizeof(char *));
> +	for (i = 0; i < num_nodes; i++) {
> +		memory[i] = SAFE_MMAP(NULL, length, PROT_READ|PROT_WRITE,
> +			    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +#ifdef HAVE_DECL_MADV_MERGEABLE
> +		if (madvise(memory[i], length, MADV_MERGEABLE) == -1)
> +			tst_brk(TBROK|TERRNO, "madvise");
> +#endif
> +
> +#ifdef HAVE_NUMA_V2
> +		clean_node(nmask);
> +		set_node(nmask, nodes[i]);
> +		/*
> +		 * Use mbind() to make sure each node contains
> +		 * length size memory.
> +		 */
> +		ret = mbind(memory[i], length, MPOL_BIND, nmask, MAXNODES, 0);
> +		if (ret == -1)
> +			tst_brk(TBROK|TERRNO, "mbind");
> +#endif
> +
> +		memset(memory[i], 10, length);
> +
> +		if (mlock(memory[i], length))
> +			tst_res(TWARN | TERRNO, "mlock() failed");
> +	}
> +
> +	SAFE_FILE_PRINTF(PATH_KSM "sleep_millisecs", "0");
> +	SAFE_FILE_PRINTF(PATH_KSM "pages_to_scan", "%ld",
> +			 nr_pages * num_nodes);
> +	/*
> +	 * merge_across_nodes and max_page_sharing setting can be changed
> +	 * only when there are no ksm shared pages in system, so set run 2
> +	 * to unmerge pages first, then to 1 after changing merge_across_nodes,
> +	 * to remerge according to the new setting.
> +	 */
> +	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> +	if (access(PATH_KSM "max_page_sharing", F_OK) == 0)
> +		SAFE_FILE_PRINTF(PATH_KSM "max_page_sharing",
> +			"%ld", nr_pages * num_nodes);
> +	tst_res(TINFO, "Start to test KSM with merge_across_nodes=1");
> +	SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
> +	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
> +	ksm_group_check(1, 1, nr_pages * num_nodes - 1, 0, 0, 0,
> +			nr_pages * num_nodes);
> +
> +	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> +	tst_res(TINFO, "Start to test KSM with merge_across_nodes=0");
> +	SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "0");
> +	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
> +	ksm_group_check(1, num_nodes, nr_pages * num_nodes - num_nodes,
> +			0, 0, 0, nr_pages * num_nodes);
> +
> +	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> +
> +	for (i = 0; i < num_nodes; i++)
> +		SAFE_MUNMAP(memory[i], length);
> +
> +	free(memory);
>  }
>  
>  static void setup(void)
> diff --git a/testcases/kernel/mem/lib/mem.c b/testcases/kernel/mem/lib/mem.c
> index 102fc5665..090569ebb 100644
> --- a/testcases/kernel/mem/lib/mem.c
> +++ b/testcases/kernel/mem/lib/mem.c
> @@ -519,91 +519,6 @@ void create_same_memory(int size, int num, int unit)
>  				 WEXITSTATUS(status));
>  }
>  
> -void test_ksm_merge_across_nodes(unsigned long nr_pages)
> -{
> -	char **memory;
> -	int i, ret;
> -	int num_nodes, *nodes;
> -	unsigned long length;
> -	unsigned long pagesize;
> -
> -#ifdef HAVE_NUMA_V2
> -	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
> -#endif
> -
> -	ret = get_allowed_nodes_arr(NH_MEMS, &num_nodes, &nodes);
> -	if (ret != 0)
> -		tst_brk(TBROK|TERRNO, "get_allowed_nodes_arr");
> -	if (num_nodes < 2) {
> -		tst_res(TINFO, "need NUMA system support");
> -		free(nodes);
> -		return;
> -	}
> -
> -	pagesize = sysconf(_SC_PAGE_SIZE);
> -	length = nr_pages * pagesize;
> -
> -	memory = SAFE_MALLOC(num_nodes * sizeof(char *));
> -	for (i = 0; i < num_nodes; i++) {
> -		memory[i] = SAFE_MMAP(NULL, length, PROT_READ|PROT_WRITE,
> -			    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -#ifdef HAVE_DECL_MADV_MERGEABLE
> -		if (madvise(memory[i], length, MADV_MERGEABLE) == -1)
> -			tst_brk(TBROK|TERRNO, "madvise");
> -#endif
> -
> -#ifdef HAVE_NUMA_V2
> -		clean_node(nmask);
> -		set_node(nmask, nodes[i]);
> -		/*
> -		 * Use mbind() to make sure each node contains
> -		 * length size memory.
> -		 */
> -		ret = mbind(memory[i], length, MPOL_BIND, nmask, MAXNODES, 0);
> -		if (ret == -1)
> -			tst_brk(TBROK|TERRNO, "mbind");
> -#endif
> -
> -		memset(memory[i], 10, length);
> -
> -		if (mlock(memory[i], length))
> -			tst_res(TWARN | TERRNO, "mlock() failed");
> -	}
> -
> -	SAFE_FILE_PRINTF(PATH_KSM "sleep_millisecs", "0");
> -	SAFE_FILE_PRINTF(PATH_KSM "pages_to_scan", "%ld",
> -			 nr_pages * num_nodes);
> -	/*
> -	 * merge_across_nodes and max_page_sharing setting can be changed
> -	 * only when there are no ksm shared pages in system, so set run 2
> -	 * to unmerge pages first, then to 1 after changing merge_across_nodes,
> -	 * to remerge according to the new setting.
> -	 */
> -	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> -	if (access(PATH_KSM "max_page_sharing", F_OK) == 0)
> -		SAFE_FILE_PRINTF(PATH_KSM "max_page_sharing",
> -			"%ld", nr_pages * num_nodes);
> -	tst_res(TINFO, "Start to test KSM with merge_across_nodes=1");
> -	SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
> -	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
> -	ksm_group_check(1, 1, nr_pages * num_nodes - 1, 0, 0, 0,
> -		        nr_pages * num_nodes);
> -
> -	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> -	tst_res(TINFO, "Start to test KSM with merge_across_nodes=0");
> -	SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "0");
> -	SAFE_FILE_PRINTF(PATH_KSM "run", "1");
> -	ksm_group_check(1, num_nodes, nr_pages * num_nodes - num_nodes,
> -		        0, 0, 0, nr_pages * num_nodes);
> -
> -	SAFE_FILE_PRINTF(PATH_KSM "run", "2");
> -
> -	for (i = 0; i < num_nodes; i++)
> -		SAFE_MUNMAP(memory[i], length);
> -
> -	free(memory);
> -}
> -
>  /* THP */
>  
>  /* cpuset/memcg */
> -- 
> 2.34.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
