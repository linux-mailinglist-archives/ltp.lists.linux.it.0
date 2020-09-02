Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E825B2A2
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 19:05:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 688A43C6323
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 19:05:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 513D43C2D58
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 19:05:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BCA6B1400F91
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 19:05:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E941DB6AA
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:05:05 +0000 (UTC)
Date: Wed, 2 Sep 2020 19:05:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200902170503.GA26811@dell5510>
References: <20200825160735.24602-1-mdoucha@suse.cz>
 <20200825160735.24602-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825160735.24602-3-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] Add tst_pollute_memory() helper function
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> tst_pollute_memory() fills available RAM up to specified limit with given fill
> byte. Useful for testing data disclosure vulnerablities.

Looks nice.
Minor note below.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +++ b/lib/tst_memutils.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
> + */
> +
> +#include <unistd.h>
> +#include <limits.h>
> +#include <sys/sysinfo.h>
> +#include <stdlib.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +#define BLOCKSIZE (16 * 1024 * 1024)
> +
> +void tst_pollute_memory(size_t maxsize, int fillchar)
> +{
> +	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
> +	void **map_blocks;
> +	struct sysinfo info;
> +
> +	SAFE_SYSINFO(&info);
> +	safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
Out of curiosity, how did you figure out safety?
> +
> +	if (info.freeswap > safety)
> +		safety = 0;
> +
> +	/* Not enough free memory to avoid invoking OOM killer */
> +	if (info.freeram <= safety)
Maybe print TINFO / TWARN here?
> +		return;
> +
> +	if (!maxsize)
> +		maxsize = SIZE_MAX;
> +
> +	if (info.freeram - safety < maxsize / info.mem_unit)
> +		maxsize = (info.freeram - safety) * info.mem_unit;
Don't we also want to use info.bufferram ?
> +
> +	blocksize = MIN(maxsize, blocksize);
> +	map_count = maxsize / blocksize;
> +	map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
> +
> +	/*
> +	 * Keep allocating until the first failure. The address space may be
> +	 * too fragmented or just smaller than maxsize.
> +	 */
> +	for (i = 0; i < map_count; i++) {
> +		map_blocks[i] = mmap(NULL, blocksize, PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +
> +		if (map_blocks[i] == MAP_FAILED) {
> +			map_count = i;
> +			break;
> +		}
> +
> +		memset(map_blocks[i], fillchar, blocksize);
> +	}
> +
> +	for (i = 0; i < map_count; i++)
> +		SAFE_MUNMAP(map_blocks[i], blocksize);
> +
> +	free(map_blocks);
> +}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
