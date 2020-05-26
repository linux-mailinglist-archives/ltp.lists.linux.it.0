Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3F919D620
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 13:54:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC4183C2F8E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 13:54:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 932083C2F7A
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 13:54:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E5FD11401134
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 13:54:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 998D2AC11;
 Fri,  3 Apr 2020 11:54:47 +0000 (UTC)
Date: Fri, 3 Apr 2020 13:55:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200403115502.GC26355@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585839990-19923-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> For LO_FLAGS_AUTOCLEAR flag, we only check autoclear fieldvalue in sys
> directory and also get lo_flags by using LOOP_GET_STATUS.
> 
> For LO_FLAGS_PARTSCAN flag, it is the same as LO_FLAGS_AUTOCLEAR flag.
> But we also check whether we can scan partition table correctly ie check
> whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                              |   3 +-
>  testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
>  .../kernel/syscalls/ioctl/ioctl_loop01.c      | 127 ++++++++++++++++++
>  3 files changed, 130 insertions(+), 1 deletion(-)
>  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 777f0ac6a..7fd67450e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -524,10 +524,11 @@ ioctl03      ioctl03
>  ioctl04      ioctl04
>  ioctl05      ioctl05
>  ioctl06      ioctl06
> -
>  ioctl07      ioctl07
>  ioctl08      ioctl08
>  
> +ioctl_loop01 ioctl_loop01
> +
>  ioctl_ns01 ioctl_ns01
>  ioctl_ns02 ioctl_ns02
>  ioctl_ns03 ioctl_ns03
> diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
> index 97fbb9681..4cfef2839 100644
> --- a/testcases/kernel/syscalls/ioctl/.gitignore
> +++ b/testcases/kernel/syscalls/ioctl/.gitignore
> @@ -6,6 +6,7 @@
>  /ioctl06
>  /ioctl07
>  /ioctl08
> +/ioctl_loop01
>  /ioctl_ns01
>  /ioctl_ns02
>  /ioctl_ns03
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

I guess that it would be safer to memset() the loopinfo_get here, also
if we zero the structure we may as well reuse the loopinfo here as well.

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

Why not tst_fill_file("test.img", 0, 1024 * 1024, 10); ?

> +	SAFE_CMD(cmd_parted, NULL, NULL);

I wonder if we can avoid dependency on parted by having a look at the
changes in the image after the call to parted and writing a few bytes
ourselves instead.

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
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
