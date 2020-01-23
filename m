Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80614622C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 07:57:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FE7F3C2496
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 07:57:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 001873C05ED
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 07:57:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 834EE6012D6
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 07:57:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,352,1574092800"; d="scan'208";a="82510182"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jan 2020 14:57:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 90CF950A997E;
 Thu, 23 Jan 2020 14:47:49 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 23 Jan 2020 14:57:02 +0800
To: Jorik Cronenberg <jcronenberg@suse.de>
References: <20200122134239.28844-1-jcronenberg@suse.de>
 <20200122134239.28844-2-jcronenberg@suse.de>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <98f76b66-20ef-214b-4ac2-6221201bcfec@cn.fujitsu.com>
Date: Thu, 23 Jan 2020 14:57:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200122134239.28844-2-jcronenberg@suse.de>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 90CF950A997E.AF761
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/vmsplice: Add NONBLOCK testcase
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

Hi
> Add a testcase for vmsplice() with the flag SPLICE_F_NONBLOCK.
> And also test that vmsplice() blocks when writing to a full pipe
> without the flag specified.
> 
> Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
> ---
>   testcases/kernel/syscalls/vmsplice/.gitignore |  1 +
>   .../kernel/syscalls/vmsplice/vmsplice04.c     | 87 +++++++++++++++++++
>   2 files changed, 88 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/vmsplice/vmsplice04.c
add vmsplice04 into runtest/syscalls
> 
> diff --git a/testcases/kernel/syscalls/vmsplice/.gitignore b/testcases/kernel/syscalls/vmsplice/.gitignore
> index 03922073c..042c32585 100644
> --- a/testcases/kernel/syscalls/vmsplice/.gitignore
> +++ b/testcases/kernel/syscalls/vmsplice/.gitignore
> @@ -1,3 +1,4 @@
>   /vmsplice01
>   /vmsplice02
>   /vmsplice03
> +/vmsplice04
> diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice04.c b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
> new file mode 100644
> index 000000000..c49657d84
> --- /dev/null
> +++ b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC
> + * Author: Jorik Cronenberg <jcronenberg@suse.de>
> + *
> + * Test vmsplice() to a full pipe with SPLICE_F_NONBLOCK and without
> + * With SPLICE_F_NONBLOCK vmsplice() should return with errno EAGAIN
> + * Without SPLICE_F_NONBLOCK it should block
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include "tst_test.h"
> +#include "lapi/vmsplice.h"
> +#include <stdlib.h>
miss "lapi/fcntl.h". it will compile failed because of undefined 
F_GETPIPE_SZ error on centos6 like my pipe12.c(v1)

https://travis-ci.org/xuyang0410/ltp/jobs/629597516?utm_medium=notification&utm_source=github_status

> +
> +
> +static int pipes[2];
> +static ssize_t pipe_max_size;
> +static char *write_buffer;
> +
> +static void vmsplice_test(void)
> +{
> +	int status;
> +	struct iovec iov;
> +	int pid;
> +
> +	iov.iov_base = write_buffer;
> +	iov.iov_len = pipe_max_size;
> +
> +
> +	TEST(vmsplice(pipes[1], &iov, 1, 0));
> +	if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO,
> +		    "Initial vmsplice() to fill pipe failed");
> +
> +	TEST(vmsplice(pipes[1], &iov, 1, SPLICE_F_NONBLOCK));
> +	if (TST_RET < 0 && TST_ERR == EAGAIN)
> +		tst_res(TPASS | TTERRNO, "vmsplice failed as expected");
I think we should add more info. such as "vmsplice failed EAGAIN to full 
pipe with SPLICE_F_NONBLOCK mode"
> +	else if (TST_RET < 0)
> +		tst_res(TFAIL | TTERRNO,
> +		    "vmsplice failed with unexpected errno");
here as well
> +	else
> +		tst_res(TFAIL, "vmsplice wrote to a full pipe");
here as well
> +
> +	pid = SAFE_FORK();
> +	if (!pid) {
> +		TEST(vmsplice(pipes[1], &iov, 1, 0));
> +		if (TST_RET < 0)
> +			tst_res(TFAIL | TTERRNO, "vmsplice() failed");
> +		else
> +			tst_res(TFAIL, "vmsplice() wrote to a full pipe");
> +		exit(0);
> +	} else {
> +		if (TST_PROCESS_STATE_WAIT2(pid, 'S', 1000) < 0)
> +			return;
> +		else
> +			tst_res(TPASS, "vmsplice() blocked");
here as well (without SPLICE_F_NONBLOCK mode)
> +		SAFE_KILL(pid, SIGKILL);
> +		SAFE_WAIT(&status);
> +	}
> +
> +}
> +static void cleanup(void)
> +{
> +	if (pipes[1] > 0)
> +		SAFE_CLOSE(pipes[1]);
> +	if (pipes[0] > 0)
> +		SAFE_CLOSE(pipes[0]);
> +	if (write_buffer)
> +		free(write_buffer);
> +}
> +static void setup(void)
> +{
> +	SAFE_PIPE(pipes);
> +
> +	pipe_max_size = SAFE_FCNTL(pipes[1], F_GETPIPE_SZ);
> +	write_buffer = SAFE_MALLOC(pipe_max_size);
Can we use guarded buffer for iov in setup?
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2231-guarded-buffers

other than, this patch looks good to me.
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = vmsplice_test,
> +	.min_kver = "2.6.17",
> +	.forks_child = 1,
> +};
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
