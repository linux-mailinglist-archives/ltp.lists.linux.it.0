Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74C2C7F7A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:01:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E26FE3C2C76
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 09:01:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 175163C2555
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:01:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3AF9B10005B6
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 09:01:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38D03AD6D;
 Mon, 30 Nov 2020 08:01:04 +0000 (UTC)
References: <20201127071419.20370-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20201127071419.20370-1-lkml@jv-coder.de>
Date: Mon, 30 Nov 2020 08:01:03 +0000
Message-ID: <87360rnuio.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Joerg Vehlow <lkml@jv-coder.de> writes:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> Changes to v2:
>  - Removed useless call to get_total_batch_size_bytes
>  - Calculate batch size before reading /proc/meminfo
>    This should reduce memory allocations after meminfo was read

Still mostly LGTM, but I have one question about CPU conf below.

>
> The test sets overcommit policy to never overcommit and then tries
> to allocate the commit limit reported by /proc/meminfo. This value is an exact
> value (at least at that point in time) of memory, that can be allocated
> according to the policy and ratio settings. This should fail, since there
> is already some memory allocated for running the test programm, but due to
> inaccurate memory accounting in mm/util.c __vm_enough_memory(), the allocation
> can still succeed.
>
> The commited memory is stored in a percpu counter, that counts in 1 + ncpu
> variables. For small allocations and deallocations, the memory is counted
> in a counter per cpu, without locking. If this counter reaches a threshold,
> the value is committed to a global counter. Due to this the global counter
> can become negative. This global counter is the only thing taken into
> account in __vm_enough_memory, propably for performance reasons, because
> otherwise a lock is required.
>
> Because of the inaccuracy the system can overcommit a bit by number of cpus
> times threshold value. By adding this value to the exact commit limit
> reported by /proc/meminfo, we can be sure, that we really always hit the
> memory limit.
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  .../kernel/mem/tunable/overcommit_memory.c    | 56 +++++++++++++------
>  1 file changed, 39 insertions(+), 17 deletions(-)
>
> diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
> index f77939908..918b4e68e 100644
> --- a/testcases/kernel/mem/tunable/overcommit_memory.c
> +++ b/testcases/kernel/mem/tunable/overcommit_memory.c
> @@ -1,18 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) Linux Test Project, 2012-2020
> - * Copyright (C) 2012-2017  Red Hat, Inc.
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * Descriptions:
> + * Copyright (c) 2012-2020 Linux Test Project
> + * Copyright (c) 2012-2017 Red Hat, Inc.
>   *
>   * There are two tunables overcommit_memory and overcommit_ratio under
>   * /proc/sys/vm/, which can control memory overcommitment.
> @@ -53,12 +42,16 @@
>   * the system is limited to CommitLimit(Swap+RAM*overcommit_ratio)
>   * commit_left(allocatable memory) = CommitLimit - Committed_AS
>   * a. less than commit_left:    commit_left / 2, alloc should pass
> - * b. greater than commit_left: commit_left * 2, alloc should fail
> - * c. overcommit limit:         CommitLimit,     alloc should fail
> + * b. overcommit limit:         CommitLimit + TotalBatchSize, should fail
> + * c. greater than commit_left: commit_left * 2, alloc should fail
>   * *note: CommitLimit is the current overcommit limit.
>   *        Committed_AS is the amount of memory that system has used.
>   * it couldn't choose 'equal to commit_left' as a case, because
>   * commit_left rely on Committed_AS, but the Committed_AS is not stable.
> + * *note2: TotalBatchSize is the total number of bytes, that can be
> + *         accounted for in the per cpu counters for the vm_committed_as
> + *         counter. Since the check used by malloc only looks at the
> + *         global counter of vm_committed_as, it can overallocate a bit.
>   *
>   * References:
>   * - Documentation/sysctl/vm.txt
> @@ -89,11 +82,13 @@ static long sum_total;
>  static long free_total;
>  static long commit_limit;
>  static long commit_left;
> +static long total_batch_size;
>  
>  static int heavy_malloc(long size);
>  static void alloc_and_check(long size, int expect_result);
>  static void update_mem(void);
>  static void update_mem_commit(void);
> +static long get_total_batch_size_bytes(void);
>  
>  static void setup(void)
>  {
> @@ -154,7 +149,7 @@ static void overcommit_memory_test(void)
>  
>  	update_mem_commit();
>  	alloc_and_check(commit_left * 2, EXPECT_FAIL);
> -	alloc_and_check(commit_limit, EXPECT_FAIL);
> +	alloc_and_check(commit_limit + total_batch_size, EXPECT_FAIL);
>  	update_mem_commit();
>  	alloc_and_check(commit_left / 2, EXPECT_PASS);
>  
> @@ -228,6 +223,8 @@ static void update_mem_commit(void)
>  {
>  	long committed;
>  
> +	total_batch_size = get_total_batch_size_bytes();
> +
>  	commit_limit = SAFE_READ_MEMINFO("CommitLimit:");
>  	committed = SAFE_READ_MEMINFO("Committed_AS:");
>  	commit_left = commit_limit - committed;
> @@ -247,6 +244,31 @@ static void update_mem_commit(void)
>  	}
>  }
>  
> +static long get_total_batch_size_bytes(void)
> +{
> +	struct sysinfo info;
> +	long ncpus = tst_ncpus_conf();

I'm not completely sure if this is the same value as num_cpus_present()
in the kernel? I'm just wondering if CPU hotplugging could result in the
wrong value being calculated (other than if it is hotplugged while the test
is running).

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
