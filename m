Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C41371B94E6
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 03:24:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BB963C6046
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 03:24:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C27703C1A4E
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 03:24:16 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B0C441000497
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 03:24:13 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,321,1583164800"; d="scan'208";a="90525063"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Apr 2020 09:24:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 67F714BCC88C;
 Mon, 27 Apr 2020 09:13:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 27 Apr 2020 09:24:07 +0800
To: Christoph Hellwig <hch@lst.de>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6a3dfce9-1bc8-dd06-0794-b5ca1578690c@cn.fujitsu.com>
Date: Mon, 27 Apr 2020 09:24:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1585839990-19923-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 67F714BCC88C.ADF1C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 03/10] syscalls/ioctl_loop01: Add
 LO_FLAGS_AUTOCLEAR and LO_FLAGS_PARTSCAN test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Christoph

Recently, this test[1](has merged into ltp master) failed on kernel 
5.7.0-rc2. I found your kernel patch
d3ef55362("block: fix busy device checking in blk_drop_partitions")  and 
commit cb6b771b05("block: fix busy device checking in 
blk_drop_partitions again") introduced this failure.

dmesg as below:
"loop_reread_partitions: partition scan of loop0 () failed (rc=-16)"

It look likes we use bd_dev->bd_openers instead of bd_dev->bd_super in 
blk_drop_partitions after your patch.  When running this test, the 
bd_opener is equal to 3(I don't figure out the reason).
I don't know how to fix this(do special judement for loopdev by using 
MAJOR((bdev->bd_dev) ?) or should I modify test code? Please give me 
some advise.

[1]https://github.com/linux-test-project/ltp/commit/4f3ff1f323cbe4ae4dc6542e940902dca1280e9d

Best Regards
Yang Xu
> For LO_FLAGS_AUTOCLEAR flag, we only check autoclear fieldvalue in sys
> directory and also get lo_flags by using LOOP_GET_STATUS.
> 
> For LO_FLAGS_PARTSCAN flag, it is the same as LO_FLAGS_AUTOCLEAR flag.
> But we also check whether we can scan partition table correctly ie check
> whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   runtest/syscalls                              |   3 +-
>   testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
>   .../kernel/syscalls/ioctl/ioctl_loop01.c      | 127 ++++++++++++++++++
>   3 files changed, 130 insertions(+), 1 deletion(-)
>   create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 777f0ac6a..7fd67450e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -524,10 +524,11 @@ ioctl03      ioctl03
>   ioctl04      ioctl04
>   ioctl05      ioctl05
>   ioctl06      ioctl06
> -
>   ioctl07      ioctl07
>   ioctl08      ioctl08
>   
> +ioctl_loop01 ioctl_loop01
> +
>   ioctl_ns01 ioctl_ns01
>   ioctl_ns02 ioctl_ns02
>   ioctl_ns03 ioctl_ns03
> diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
> index 97fbb9681..4cfef2839 100644
> --- a/testcases/kernel/syscalls/ioctl/.gitignore
> +++ b/testcases/kernel/syscalls/ioctl/.gitignore
> @@ -6,6 +6,7 @@
>   /ioctl06
>   /ioctl07
>   /ioctl08
> +/ioctl_loop01
>   /ioctl_ns01
>   /ioctl_ns02
>   /ioctl_ns03
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> new file mode 100644
> index 000000000..e806e0443
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
> + *
> + * This is a basic ioctl test about loopdevice.
> + * It is designed to test LO_FLAGS_AUTOCLEAR and LO_FLAGS_PARTSCAN flag.
> + *
> + * For LO_FLAGS_AUTOCLEAR flag, we only check autoclear fieldvalue in sys
> + * directory and also get lo_flags by using LOOP_GET_STATUS.
> + *
> + * For LO_FLAGS_PARTSCAN flag, it is the same as LO_FLAGS_AUTOCLEAR flag.
> + * But we also check whether we can scan partition table correctly ie check
> + * whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include "ioctl_loop_support.h"
> +#include "lapi/loop.h"
> +#include "tst_test.h"
> +
> +static char dev_path[1024], backing_path[1024], backing_file_path[1024];
> +static int dev_num, attach_flag, dev_fd;
> +/*
> + *In drivers/block/loop.c code, set status function doesn't handle
> + *LO_FLAGS_READ_ONLY flag and ingore it. Only loop_set_fd with rondonly
> + *mode file_fd, lo_flags will include LO_FLAGS_READ_ONLY.
> + */
> +#define set_flags (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN | LO_FLAGS_READ_ONLY | LO_FLAGS_DIRECT_IO)
> +#define get_flags (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN)
> +
> +static char partscan_path[1024], autoclear_path[1024];
> +static char loop_partpath[1026], sys_loop_partpath[1026];
> +
> +static void verify_ioctl_loop(void)
> +{
> +	int ret;
> +	struct loop_info loopinfo, loopinfoget;
> +
> +	tst_attach_device(dev_path, "test.img");
> +	attach_flag = 1;
> +
> +	check_sys_value(partscan_path, 0);
> +	check_sys_value(autoclear_path, 0);
> +	check_sys_string(backing_path, backing_file_path);
> +
> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	memset(&loopinfo, 0, sizeof(loopinfo));
> +	memset(&loopinfo, 0, sizeof(loopinfoget));
> +
> +	loopinfo.lo_flags = set_flags;
> +	SAFE_IOCTL(dev_fd, LOOP_SET_STATUS, &loopinfo);
> +
> +	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
> +
> +	if (loopinfoget.lo_flags & ~get_flags)
> +		tst_res(TFAIL, "expect %d but got %d", get_flags, loopinfoget.lo_flags);
> +	else
> +		tst_res(TPASS, "get expected lo_flag %d", loopinfoget.lo_flags);
> +
> +	ret = access(loop_partpath, F_OK);
> +	if (ret == 0)
> +		tst_res(TPASS, "access %s succeeds", loop_partpath);
> +	else
> +		tst_res(TFAIL, "access %s fails", loop_partpath);
> +
> +	ret = access(sys_loop_partpath, F_OK);
> +	if (ret == 0)
> +		tst_res(TPASS, "access %s succeeds", sys_loop_partpath);
> +	else
> +		tst_res(TFAIL, "access %s fails", sys_loop_partpath);
> +
> +	check_sys_value(partscan_path, 1);
> +	check_sys_value(autoclear_path, 1);
> +
> +	SAFE_CLOSE(dev_fd);
> +	tst_detach_device(dev_path);
> +	attach_flag = 0;
> +}
> +
> +static void setup(void)
> +{
> +	const char *const cmd_dd[] = {"dd", "if=/dev/zero", "of=test.img", "bs=1M", "count=10", NULL};
> +	const char *const cmd_parted[] = {"parted", "-s", "test.img", "mklabel", "msdos", "mkpart",
> +						"primary", "ext4", "1M", "10M", NULL};
> +
> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> +	if (dev_num < 0)
> +		tst_brk(TBROK, "Failed to find free loop device");
> +
> +	SAFE_CMD(cmd_dd, NULL, NULL);
> +	SAFE_CMD(cmd_parted, NULL, NULL);
> +
> +	sprintf(partscan_path, "/sys/block/loop%d/loop/partscan", dev_num);
> +	sprintf(autoclear_path, "/sys/block/loop%d/loop/autoclear", dev_num);
> +	sprintf(backing_path, "/sys/block/loop%d/loop/backing_file", dev_num);
> +	sprintf(sys_loop_partpath, "/sys/block/loop%d/loop%dp1", dev_num, dev_num);
> +	sprintf(backing_file_path, "%s/test.img", tst_get_tmpdir());
> +	sprintf(loop_partpath, "%sp1", dev_path);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (dev_fd > 0)
> +		SAFE_CLOSE(dev_fd);
> +	if (attach_flag)
> +		tst_detach_device(dev_path);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_ioctl_loop,
> +	.needs_root = 1,
> +	.needs_cmds = (const char *const []) {
> +		"dd",
> +		"parted",
> +		NULL
> +	},
> +	.needs_drivers = (const char *const []) {
> +		"loop",
> +		NULL
> +	},
> +	.needs_tmpdir = 1,
> +};
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
