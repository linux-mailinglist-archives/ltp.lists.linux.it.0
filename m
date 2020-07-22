Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F023722964C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 12:36:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7AF433C4D72
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 12:36:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DC3053C266B
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 12:35:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 61EFA1000C1D
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 12:35:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECC8DAB7D
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 10:36:02 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-9-chrubis@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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
Message-ID: <24909ad6-6752-ee5d-e9ca-6e91b51a3e8e@suse.cz>
Date: Wed, 22 Jul 2020 12:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200717163453.9587-9-chrubis@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/9] syscalls/ipc: Add shmctl IPC_SET test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
I'm skipping patch 7 because Li Wang already reported the missing
shmctl(IPC_STAT) before the (flipped) final check for SHM_LOCKED flag.

Here, Li Wang already reported the issue with ctime check so I'll just
add two minor suggestions for improvement.

On 17. 07. 20 18:34, Cyril Hrubis wrote:
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/syscalls                              |   1 +
>  runtest/syscalls-ipc                          |   1 +
>  .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
>  .../kernel/syscalls/ipc/shmctl/shmctl08.c     | 101 ++++++++++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 1dc4973e7..00c8d6d66 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1360,6 +1360,7 @@ shmctl04 shmctl04
>  shmctl05 shmctl05
>  shmctl06 shmctl06
>  shmctl07 shmctl07
> +shmctl08 shmctl08
>  
>  shmdt01 shmdt01
>  shmdt02 shmdt02
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index 613987589..d3d477741 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -58,6 +58,7 @@ shmctl04 shmctl04
>  shmctl05 shmctl05
>  shmctl06 shmctl06
>  shmctl07 shmctl07
> +shmctl08 shmctl08
>  
>  shmdt01 shmdt01
>  shmdt02 shmdt02
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> index 4322d03b7..f3f88ee17 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> @@ -5,3 +5,4 @@
>  /shmctl05
>  /shmctl06
>  /shmctl07
> +/shmctl08
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> new file mode 100644
> index 000000000..2c83e9901
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +/*
> + * Test for a SHM_SET.
> + *
> + * The test clears the group and others bits from the shm_perm.mode and checks
> + * the result as well as if the ctime was updated correctly.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +
> +#define SHM_SIZE 2048
> +
> +static int shm_id = -1;
> +
> +static int test_ipc_set(struct shmid_ds *ds)
> +{
> +	TEST(shmctl(shm_id, IPC_SET, ds));
> +
> +	if (TST_RET != 0) {
> +		tst_res(TFAIL, "shmctl(%i, IPC_SET, ...)", shm_id);
> +		return 1;
> +	}
> +
> +	tst_res(TPASS, "shmctl(%i, IPC_SET, {shm_perm.mode=%i})",

Formatting mode values with %04o would be better here, also in
check_mode() below.

> +		shm_id, ds->shm_perm.mode);
> +	return 0;
> +}
> +
> +static void check_mode(struct shmid_ds *ds, short exp_mode)
> +{
> +	if (ds->shm_perm.mode == exp_mode) {
> +		tst_res(TPASS, "shm_perm.mode=%i was updated", exp_mode);
> +		return;
> +	}
> +
> +	tst_res(TFAIL, "shm_perm.mode=%i wasn't updated, expected %i",
> +	        ds->shm_perm.mode, exp_mode);
> +}
> +
> +static void verify_shmset(void)
> +{
> +	struct shmid_ds ds;
> +	unsigned short old_mode;
> +	time_t old_ctime;
> +
> +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +
> +	old_mode = ds.shm_perm.mode;
> +	old_ctime = ds.shm_ctime;

I'd recommend validating old_mode as well.

> +
> +	sleep(1);
> +
> +	ds.shm_perm.mode &= ~0066;
> +
> +	if (test_ipc_set(&ds))
> +		return;
> +
> +	memset(&ds, 0, sizeof(ds));
> +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +	check_mode(&ds, old_mode & ~0066);
> +
> +	if (ds.shm_ctime - old_ctime > 10) {
> +		tst_res(TFAIL, "shm_ctime not updated old %li new %li",
> +		        (long)old_ctime, (long)ds.shm_ctime);
> +	} else {
> +		tst_res(TPASS, "shm_ctime updated correctly diff=%li",
> +		        (long)(ds.shm_ctime - old_ctime));
> +	}
> +
> +	ds.shm_perm.mode = old_mode;
> +	if (test_ipc_set(&ds))
> +		return;
> +
> +	memset(&ds, 0, sizeof(ds));
> +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +	check_mode(&ds, old_mode & MODE_MASK);
> +}
> +
> +static void setup(void)
> +{
> +	shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | 0666);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (shm_id >= 0)
> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_shmset,
> +};
> 


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
