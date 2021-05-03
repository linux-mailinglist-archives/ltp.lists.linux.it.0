Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9B371475
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 13:45:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C44F3C79D4
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 13:45:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64CCC3C5773
 for <ltp@lists.linux.it>; Mon,  3 May 2021 13:45:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DD1ED60004F
 for <ltp@lists.linux.it>; Mon,  3 May 2021 13:45:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E179B080;
 Mon,  3 May 2021 11:45:07 +0000 (UTC)
Date: Mon, 3 May 2021 13:20:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YI/clrb4houmTsY7@yuki>
References: <20210430112649.16302-1-rpalethorpe@suse.com>
 <20210430112649.16302-7-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430112649.16302-7-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 6/7] mem: Convert tests to new CGroups API
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
> diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
> index 51f5d4cca..e6de61ece 100644
> --- a/testcases/kernel/mem/ksm/ksm02.c
> +++ b/testcases/kernel/mem/ksm/ksm02.c
> @@ -59,6 +59,9 @@
>  #ifdef HAVE_NUMA_V2
>  #include <numaif.h>
>  
> +static const struct tst_cgroup_group *cg;
> +static const struct tst_cgroup_group *cg_drain;
> +
>  static void verify_ksm(void)
>  {
>  	unsigned long nmask[MAXNODES / BITS_PER_LONG] = { 0 };
> @@ -76,9 +79,10 @@ static void verify_ksm(void)
>  	}
>  	create_same_memory(size, num, unit);
>  
> -	write_cpusets(PATH_TMP_CG_CST, node);
> -	tst_cgroup_move_current(PATH_TMP_CG_CST);
> +	write_cpusets(cg, node);
> +	SAFE_CGROUP_PRINTF(cg, "cgroup.procs", "%d", getpid());
>  	create_same_memory(size, num, unit);
> +	SAFE_CGROUP_PRINTF(cg_drain, "cgroup.procs", "%d", getpid());
>  }
>  
>  static void cleanup(void)
> @@ -87,7 +91,7 @@ static void cleanup(void)
>  		FILE_PRINTF(PATH_KSM "merge_across_nodes",
>  				 "%d", merge_across_nodes);
>  
> -	tst_cgroup_umount(PATH_TMP_CG_CST);
> +	tst_cgroup_cleanup();
>  }
>  
>  static void setup(void)
> @@ -103,7 +107,8 @@ static void setup(void)
>  		SAFE_FILE_PRINTF(PATH_KSM "merge_across_nodes", "1");
>  	}
>  
> -	tst_cgroup_mount(TST_CGROUP_CPUSET, PATH_TMP_CG_CST);
> +	tst_cgroup_require("cpuset", NULL);
> +	cg = tst_cgroup_get_test_group();

Forgotten cg_drain = tst_cgroup_get_drain_group() ?

Other than that the rest is pretty much straightforward, so with the
above fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
