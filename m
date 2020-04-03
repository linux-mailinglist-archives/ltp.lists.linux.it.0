Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F419DBF6
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:44:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44CB53C2FB3
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:44:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E2B1A3C2F7B
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:44:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8DD1460049D
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:44:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5C13AA7C;
 Fri,  3 Apr 2020 16:44:01 +0000 (UTC)
Date: Fri, 3 Apr 2020 18:44:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200403164416.GA11850@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-8-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585839990-19923-8-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 07/10] syscalls/ioctl_loop05: Add
 LOOP_SET_DIRECT_IO ioctl test
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
> LOOP_SET_DIRECT_IO can updata a live loop device dio mode. It needs the
> backing file also supports dio mode and the lo_offset is aligned with
> the logical I/O size.
> 
> It was introduced into kernel since 4.10
> commit ab1cb278bc70 ("block: loop: introduce ioctl command of LOOP_SET_DIRECT_IO").
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                              |   1 +
>  testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
>  .../kernel/syscalls/ioctl/ioctl_loop05.c      | 120 ++++++++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 6e8d71d44..9644588f3 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -531,6 +531,7 @@ ioctl_loop01 ioctl_loop01
>  ioctl_loop02 ioctl_loop02
>  ioctl_loop03 ioctl_loop03
>  ioctl_loop04 ioctl_loop04
> +ioctl_loop05 ioctl_loop05
>  
>  ioctl_ns01 ioctl_ns01
>  ioctl_ns02 ioctl_ns02
> diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
> index 039a5251c..f484d98d6 100644
> --- a/testcases/kernel/syscalls/ioctl/.gitignore
> +++ b/testcases/kernel/syscalls/ioctl/.gitignore
> @@ -10,6 +10,7 @@
>  /ioctl_loop02
>  /ioctl_loop03
>  /ioctl_loop04
> +/ioctl_loop05
>  /ioctl_ns01
>  /ioctl_ns02
>  /ioctl_ns03
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> new file mode 100644
> index 000000000..43bad6c18
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
> + *
> + * This is a basic ioctl test about loopdevice.
> + *
> + * It is designed to test LOOP_SET_DIRECT_IO can updata a live
> + * loop device dio mode. It need the backing file also supports
> + * dio mode and the lo_offset is aligned with the logical I/O size.
> + */
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <stdlib.h>
> +#include "ioctl_loop_support.h"
> +#include "lapi/loop.h"
> +#include "tst_test.h"
> +
> +#define DIO_MESSAGE "In dio mode"
> +#define NON_DIO_MESSAGE "In non dio mode"
> +
> +static char dev_path[1024], sys_loop_diopath[1024];
> +static int dev_num, dev_fd, attach_flag;
> +
> +static void check_dio_value(int flag)
> +{
> +	struct loop_info loopinfoget;
> +
> +	memset(&loopinfoget, 0, sizeof(loopinfoget));
> +
> +	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
> +	tst_res(TINFO, "%s", flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
> +
> +	if (loopinfoget.lo_flags & LO_FLAGS_DIRECT_IO)
> +		tst_res(flag ? TPASS : TFAIL, "lo_flags has LO_FLAGS_DIRECT_IO flag");
> +	else
> +		tst_res(flag ? TFAIL : TPASS, "lo_flags doesn't have LO_FLAGS_DIRECT_IO flag");
> +
> +	check_sys_value(sys_loop_diopath, flag);
> +}
> +
> +static void verify_ioctl_loop(void)
> +{
> +	struct loop_info loopinfo;
> +
> +	memset(&loopinfo, 0, sizeof(loopinfo));
> +
> +	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
> +	check_dio_value(0);
> +	tst_res(TINFO, "Without setting lo_offset or sizelimit");
> +	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
> +	check_dio_value(1);
> +
> +	tst_res(TINFO, "With offset equal to sector size");
> +	loopinfo.lo_offset = 512;

We should use BLKSSZGET ioctl() to get the block size for direct I/O
otherwise I would expect that it would break on one of the less common
architectures. See also discussion at the end of man 2 open.

> +	safe_set_status(dev_fd, loopinfo);
> +	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
> +	if (TST_RET == 0) {
> +		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
> +		check_dio_value(1);
> +	} else {
> +		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed");
> +	}
> +
> +	tst_res(TINFO, "With offset less than or unalign sector size");
> +	loopinfo.lo_offset = 256;
> +	safe_set_status(dev_fd, loopinfo);
> +
> +	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
> +	if (TST_RET == 0) {
> +		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
> +		return;
> +	}
> +	if (TST_ERR == EINVAL)
> +		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
> +	else
> +		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
> +
> +	loopinfo.lo_offset = 0;
> +	safe_set_status(dev_fd, loopinfo);
> +}
> +
> +static void setup(void)
> +{
> +	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
> +		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag, skip it");
> +
> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> +	if (dev_num < 0)
> +		tst_brk(TBROK, "Failed to find free loop device");
> +
> +	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
> +	tst_fill_file("test.img", 0, 1024, 1024);
> +	tst_attach_device(dev_path, "test.img");
> +	attach_flag = 1;
> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	check_support_cmd(dev_fd, LOOP_SET_DIRECT_IO, 0, "LOOP_SET_DIRECT_IO");
> +}
> +
> +static void cleanup(void)
> +{
> +	if (dev_fd > 0)
> +		SAFE_CLOSE(dev_fd);
> +	if (attach_flag)
> +		tst_detach_device(dev_path);
> +	unlink("test.img");

We don't have to remove the image here once the needs_tmpdir has been
uncommented below, right?

> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_ioctl_loop,
> +	.needs_root = 1,
> +//	.needs_tmpdir = 1,

Looks like a forgotten debug measure.

> +	.needs_drivers = (const char *const []) {
> +		"loop",
> +		NULL
> +	}
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
