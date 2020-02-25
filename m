Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDF16C302
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 14:58:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 592223C25A2
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 14:58:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 19F1F3C0716
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 14:58:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 676AB1401D90
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 14:57:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3745CAC69;
 Tue, 25 Feb 2020 13:57:59 +0000 (UTC)
Date: Tue, 25 Feb 2020 14:46:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200225134648.GB62318@gacrux.arch.suse.de>
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <ccb816c7032270dd2ef51ab14290aacb2c89db38.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccb816c7032270dd2ef51ab14290aacb2c89db38.1582612624.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 05/10] syscalls/fsconfig: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Add tests to check working of fsconfig() syscall.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, minor comments below.
...
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Basic fsconfig() test which tries to configure and mount the filesystem as
> + * well.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +#define MNTPOINT	"mntpoint"
> +
> +static void run(void)
> +{
> +	int fd, fsmfd;
> +
> +	TEST(fsopen(tst_device->fs_type, 0));
> +	fd = TST_RET;
Just
TEST(fd = fsopen(tst_device->fs_type, 0));

> +
> +	if (fd == -1)
> +		tst_brk(TBROK | TERRNO, "fsopen() failed");
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +		goto out;
> +	}
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +		goto out;
> +	}
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_PATH, "sync", tst_device->dev, 0));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EOPNOTSUPP) {
> +			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH not supported");
This should be TCONF. It'd be nice to have this check in functions in lapi/fsmount.h
(just DRY). But don't want to block these tests just because DRY.

> +		} else {
> +			tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +			goto out;
> +		}
> +	}
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_PATH_EMPTY, "sync", tst_device->dev, 0));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EOPNOTSUPP) {
> +			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported");
> +		} else {
> +			tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +			goto out;
> +		}
> +	}
> +
> +	TEST(fsconfig(fd, FSCONFIG_SET_FD, "sync", NULL, 0));
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EOPNOTSUPP) {
> +			tst_res(TINFO, "fsconfig(): FSCONFIG_SET_FD not supported");
> +		} else {
> +			tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +			goto out;
> +		}
> +	}
> +
> +	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +		goto out;
> +	}
> +
> +	TEST(fsmount(fd, 0, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TBROK | TERRNO, "fsmount() failed");
> +		goto out;
> +	}
> +
> +	fsmfd = TST_RET;
> +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> +			MOVE_MOUNT_F_EMPTY_PATH));
> +	SAFE_CLOSE(fsmfd);
> +
> +	if (TST_RET == -1) {
> +		tst_res(TBROK | TERRNO, "move_mount() failed");
> +		goto out;
> +	}
> +
> +	if (tst_is_mounted(MNTPOINT))
> +		tst_res(TPASS, "fsconfig() passed");
> +
> +	SAFE_UMOUNT(MNTPOINT);
> +
> +out:
> +	SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = fsopen_supported_by_kernel,
> +	.needs_root = 1,
> +	.format_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.all_filesystems = 1,
> +	.dev_fs_flags = TST_FS_SKIP_FUSE,
> +};
> diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> new file mode 100644
> index 000000000000..d51a869ac3ff
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Basic fsconfig() failure tests.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +int fd = -1, temp_fd = -1, invalid_fd = -1;
> +int aux_0 = 0, aux_1 = 1, aux_fdcwd = AT_FDCWD, aux_minus1 = -1;
These 2 should be static (also fd could be default 0, but who cares :)).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
