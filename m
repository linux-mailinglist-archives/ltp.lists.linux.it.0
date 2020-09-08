Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B21260A20
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 07:34:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 516F23C53D8
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 07:34:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9D0863C2214
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 07:34:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2CFA31400DF3
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 07:34:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; d="scan'208";a="98993552"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 13:34:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7854948990E7;
 Tue,  8 Sep 2020 13:34:29 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 13:34:28 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200907150157.23886-1-chrubis@suse.cz>
 <20200907150157.23886-10-chrubis@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4a6a5c02-1d93-de12-cdd5-811e6a3610ce@cn.fujitsu.com>
Date: Tue, 8 Sep 2020 13:34:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907150157.23886-10-chrubis@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7854948990E7.AD3B9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 09/10] syscalls/ipc: Add shmctl IPC_SET test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril


> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>   runtest/syscalls                              |   1 +
>   runtest/syscalls-ipc                          |   1 +
>   .../kernel/syscalls/ipc/shmctl/.gitignore     |   1 +
>   .../kernel/syscalls/ipc/shmctl/shmctl07.c     |   6 +-
>   .../kernel/syscalls/ipc/shmctl/shmctl08.c     | 103 ++++++++++++++++++
>   5 files changed, 110 insertions(+), 2 deletions(-)
>   create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 448b893ea..9f1c9ee0c 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1360,6 +1360,7 @@ shmctl04 shmctl04
>   shmctl05 shmctl05
>   shmctl06 shmctl06
>   shmctl07 shmctl07
> +shmctl08 shmctl08
>   
>   shmdt01 shmdt01
>   shmdt02 shmdt02
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index 5b50820d2..4eb71e3cb 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -56,6 +56,7 @@ shmctl04 shmctl04
>   shmctl05 shmctl05
>   shmctl06 shmctl06
>   shmctl07 shmctl07
> +shmctl08 shmctl08
>   
>   shmdt01 shmdt01
>   shmdt02 shmdt02
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/.gitignore b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> index 4322d03b7..f3f88ee17 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/shmctl/.gitignore
> @@ -5,3 +5,4 @@
>   /shmctl05
>   /shmctl06
>   /shmctl07
> +/shmctl08
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> index 409203db7..39b9ad78a 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> @@ -42,10 +42,12 @@ static void verify_shmlock(void)
>   	else
>   		tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
>   
> +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> +
>   	if (ds.shm_perm.mode & SHM_LOCKED)
> -		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
> -	else
>   		tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
> +	else
> +		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
>   }
>   
This change should belong to "syscalls/ipc: Add shmctl07 test" patch.
>   static void setup(void)
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> new file mode 100644
> index 000000000..157ced608
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> @@ -0,0 +1,103 @@
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
> +	tst_res(TPASS, "shmctl(%i, IPC_SET, {shm_perm.mode=%04o})",
> +		shm_id, ds->shm_perm.mode);
> +	return 0;
> +}
> +
> +static void check_mode(struct shmid_ds *ds, short exp_mode)
> +{
> +	if (ds->shm_perm.mode == exp_mode) {
> +		tst_res(TPASS, "shm_perm.mode=%04o", exp_mode);
> +		return;
> +	}
> +
> +	tst_res(TFAIL, "shm_perm.mode=%04o, expected %i",
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
> +
> +	check_mode(&ds, 0666);
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
> +	if (ds.shm_ctime <= old_ctime || ds.shm_ctime > old_ctime + 10) {
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
Mailing list info: https://lists.linux.it/listinfo/ltp
