Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2473719D7A7
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 15:34:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90F203C2FA2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 15:34:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 17AAC3C2F80
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 15:34:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 38778600971
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 15:34:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 386C5AD86;
 Fri,  3 Apr 2020 13:34:10 +0000 (UTC)
Date: Fri, 3 Apr 2020 15:34:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200403133424.GA6426@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585839990-19923-5-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 04/10] syscalls/ioctl_loop02: Add
 LO_FLAGS_READ_ONLY and LOOP_CHANGE_FD test
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
> For LOOP_CHANGE_FD, this operation is possible only if the loop device
> is read-only and the new backing store is the same size and type as the
> old backing store.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                              |   1 +
>  testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
>  .../kernel/syscalls/ioctl/ioctl_loop02.c      | 148 ++++++++++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 7fd67450e..719953497 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -528,6 +528,7 @@ ioctl07      ioctl07
>  ioctl08      ioctl08
>  
>  ioctl_loop01 ioctl_loop01
> +ioctl_loop02 ioctl_loop02
>  
>  ioctl_ns01 ioctl_ns01
>  ioctl_ns02 ioctl_ns02
> diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
> index 4cfef2839..534c4ab34 100644
> --- a/testcases/kernel/syscalls/ioctl/.gitignore
> +++ b/testcases/kernel/syscalls/ioctl/.gitignore
> @@ -7,6 +7,7 @@
>  /ioctl07
>  /ioctl08
>  /ioctl_loop01
> +/ioctl_loop02
>  /ioctl_ns01
>  /ioctl_ns02
>  /ioctl_ns03
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> new file mode 100644
> index 000000000..ba3636aa9
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
> + *
> + * This is a basic ioctl test about loopdevice.
> + *
> + * It is designed to test LO_FLAGS_READ_ONLY(similar as losetup -r)
> + * and LOOP_CHANGE_FD.
> + *
> + * For LOOP_CHANGE_FD, this operation is possible only if the loop device
> + * is read-only and the new backing store is the same size and type as the
> + * old backing store.
> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include "ioctl_loop_support.h"
> +#include "lapi/loop.h"
> +#include "tst_test.h"
> +
> +static int file_fd, file_change_fd, file_fd_invalid;
> +static char backing_path[1024], backing_file_path[1024], backing_file_change_path[1024];
> +static int attach_flag, dev_fd, file_fd;
> +static char loop_ro_path[1024], dev_path[1024];
> +static void attach_device(char *);

Just move the function here, there is no point in having the helper
function after the test function.

> +static void verify_ioctl_loop(void)
> +{
> +	struct loop_info loopinfoget;
> +
> +	attach_device("test.img");
> +	attach_flag = 1;
> +
> +	check_sys_value(loop_ro_path, 1);
> +	check_sys_string(backing_path, backing_file_path);
> +
> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	file_change_fd = SAFE_OPEN("test1.img", O_RDWR);
> +	file_fd_invalid = SAFE_OPEN("test2.img", O_RDWR);
> +
> +	memset(&loopinfoget, 0, sizeof(loopinfoget));
> +	/*
> +	 *In drivers/block/loop.c code, set status function doesn't handle
> +	 *LO_FLAGS_READ_ONLY flag and ignore it. Only loop_set_fd with rondonly
                                                                       ^
								       readonly
> +	 *mode, lo_flags will include LO_FLAGS_READ_ONLY.
> +	 */

Also it's customary to add a space between the asterisk and the comment
text.

> +	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
> +
> +	if (loopinfoget.lo_flags & ~LO_FLAGS_READ_ONLY)
> +		tst_res(TFAIL, "lo_flags has unexpected %d flag", loopinfoget.lo_flags);
> +	else
> +		tst_res(TPASS, "lo_flags only has default LO_FLAGS_READ_ONLY flag");
> +
> +	TEST(write(dev_fd, "xx", 2));
> +	if (TST_RET != -1)
> +		tst_res(TFAIL, "write succeed unexpectedly");
> +	else
> +		tst_res(TPASS | TTERRNO, "Can not write data in RO mode");
> +
> +	TEST(ioctl(dev_fd, LOOP_CHANGE_FD, file_change_fd));
> +	if (TST_RET) {
> +		tst_res(TFAIL | TTERRNO, "LOOP_CHANGE_FD failed");
> +	} else {
> +		tst_res(TPASS, "LOOP_CHANGE_FD succeeded");
> +		check_sys_value(loop_ro_path, 1);
> +		check_sys_string(backing_path, backing_file_change_path);
> +	}
> +
> +	TEST(ioctl(dev_fd, LOOP_CHANGE_FD, file_fd_invalid));
> +	if (TST_RET) {
> +		if (TST_ERR == EINVAL)
> +			tst_res(TPASS | TTERRNO, "LOOP_CHANGE_FD failed as expected");
> +		else
> +			tst_res(TFAIL | TTERRNO, "LOOP_CHANGE_FD failed expected EINVAL got");
> +	} else {
> +		tst_res(TFAIL, "LOOP_CHANGE_FD succeeded");
> +	}
> +
> +	SAFE_CLOSE(dev_fd);
> +	SAFE_CLOSE(file_change_fd);
> +	SAFE_CLOSE(file_fd_invalid);
> +	tst_detach_device(dev_path);
> +	attach_flag = 0;
> +}
> +
> +/*
> + * This function is different from tst_attach_dev lib/tst_device.c.
> + * It only opens file_path with O_RDONLY mode before loop_set_fd.
> + * So we can generate LO_FLAGS_READ_ONLY flag.
> + */
> +static void attach_device(char *img)
> +{
> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
> +	file_fd = SAFE_OPEN(img, O_RDONLY);
> +
> +	SAFE_IOCTL(dev_fd, LOOP_SET_FD, file_fd);
> +
> +	SAFE_CLOSE(dev_fd);
> +	SAFE_CLOSE(file_fd);
> +}
> +
> +static void setup(void)
> +{
> +	int dev_num;
> +
> +	char *tmpdir = tst_get_tmpdir();
> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
> +	if (dev_num < 0)
> +		tst_brk(TBROK, "Failed to find free loop device");
> +
> +	tst_fill_file("test.img", 0, 1024, 10);
> +	tst_fill_file("test1.img", 0, 1024, 10);
> +	tst_fill_file("test2.img", 0, 2048, 20);
> +
> +	sprintf(backing_path, "/sys/block/loop%d/loop/backing_file", dev_num);
> +	sprintf(backing_file_path, "%s/test.img", tmpdir);
> +	sprintf(backing_file_change_path, "%s/test1.img", tmpdir);
> +	sprintf(loop_ro_path, "/sys/block/loop%d/ro", dev_num);

We should free the tmpdir here.

> +}
> +
> +static void cleanup(void)
> +{
> +	if (dev_fd > 0)
> +		SAFE_CLOSE(dev_fd);
> +	if (file_fd > 0)
> +		SAFE_CLOSE(file_fd);
> +	if (file_change_fd > 0)
> +		SAFE_CLOSE(file_change_fd);
> +	if (file_fd_invalid > 0)
> +		SAFE_CLOSE(file_fd_invalid);
> +	if (attach_flag)
> +		tst_detach_device(dev_path);
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_ioctl_loop,
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +	.needs_drivers = (const char *const []) {
> +		"loop",
> +		NULL
> +	}
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
