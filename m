Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BF30A8FC
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 14:45:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DA1E3C759E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Feb 2021 14:45:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9EF8D3C2EF0
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 14:45:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 301B5600A51
 for <ltp@lists.linux.it>; Mon,  1 Feb 2021 14:45:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0626FAB92;
 Mon,  1 Feb 2021 13:45:51 +0000 (UTC)
Date: Mon, 1 Feb 2021 14:46:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YBgGSRNMXU58+cTw@yuki.lan>
References: <20210201133106.26970-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201133106.26970-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lib: enhancement of tst_pollute_memory
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
Cc: liuxp11@chinatelecom.cn, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  lib/tst_memutils.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> index dd09db490..af2178a9c 100644
> --- a/lib/tst_memutils.c
> +++ b/lib/tst_memutils.c
> @@ -15,6 +15,7 @@
>  
>  void tst_pollute_memory(size_t maxsize, int fillchar)
>  {
> +	unsigned int ori_overcommit_mem, ori_overcommit_rat, new_overcommit_rat;
>  	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
>  	void **map_blocks;
>  	struct sysinfo info;
> @@ -40,6 +41,25 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
>  	map_count = maxsize / blocksize;
>  	map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
>  
> +	/* Only allow to run on systems with less than or equal to 128GB of memory */
> +	if (info.totalram  >= (137438953472 / info.mem_unit)) {
> +		tst_brk(TCONF, "Skip test - totalram (%lukB) is larger than 128GB",
> +				info.totalram * info.mem_unit / 1024);
> +	}

This is completely wrong, attempt to dirty memory only increases chances
of reproducing the kernel bug but it's not strictly required.

It's okay to limit the memory or completely skip the rest of this
function but we must not exit the test. The test is valid even if we do
not dirty any memory, it's just less likely to fail on buggy kernel.

> +	SAFE_FILE_SCANF("/proc/sys/vm/overcommit_memory", "%u", &ori_overcommit_mem);
> +	SAFE_FILE_SCANF("/proc/sys/vm/overcommit_ratio",  "%u", &ori_overcommit_rat);
> +
> +	/* Disable the memory overcommit to prevent test invoking OOM killer */
> +	if (SAFE_READ_MEMINFO("CommitLimit:") >= SAFE_READ_MEMINFO("MemAvailable:")) {
> +		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
> +	} else {
> +		new_overcommit_rat = (maxsize / info.mem_unit * 100) / info.totalram;
> +		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_ratio", "%u", new_overcommit_rat);
> +
> +		SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "2");
> +	}

And I do not like this that much either, I would be happier with
attempt to dirty only half of the available memory instead of depending
on specific kernel behavior like this.

>  	/*
>  	 * Keep allocating until the first failure. The address space may be
>  	 * too fragmented or just smaller than maxsize.
> @@ -60,4 +80,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
>  		SAFE_MUNMAP(map_blocks[i], blocksize);
>  
>  	free(map_blocks);
> +
> +	SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_memory", "%u", ori_overcommit_mem);
> +	SAFE_FILE_PRINTF("/proc/sys/vm/overcommit_ratio", "%u",  ori_overcommit_rat);
>  }
> -- 
> 2.21.3
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
