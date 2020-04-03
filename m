Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8EB19D685
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 14:15:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 611A53C2F94
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 14:15:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 665513C2F82
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 14:15:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 832BE1000D4F
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 14:15:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B88EAC0C;
 Fri,  3 Apr 2020 12:15:49 +0000 (UTC)
Date: Fri, 3 Apr 2020 14:16:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200403121603.GD26355@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585839990-19923-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/ioctl/Makefile      |  3 +
>  .../syscalls/ioctl/ioctl_loop_support.c       | 74 +++++++++++++++++++
>  .../syscalls/ioctl/ioctl_loop_support.h       | 14 ++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
>  create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop_support.h
> 
> diff --git a/testcases/kernel/syscalls/ioctl/Makefile b/testcases/kernel/syscalls/ioctl/Makefile
> index c2ff6c8e7..05a75d1b4 100644
> --- a/testcases/kernel/syscalls/ioctl/Makefile
> +++ b/testcases/kernel/syscalls/ioctl/Makefile
> @@ -7,6 +7,9 @@ include $(top_srcdir)/include/mk/testcases.mk
>  
>  INSTALL_TARGETS		+= test_ioctl
>  
> +MAKE_TARGETS            := $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/ioctl_loop[0-9]*.c))
> +$(MAKE_TARGETS): %: ioctl_loop_support.o

I guess that we should use anything else than MAKE_TARGETS because
changing that variable will disable rest of the ioctl tests from build
right?

As this only expresses dependency on the object file we should use any
variable name that is not used by the test library itself.

>  ifeq ($(ANDROID),1)
>  FILTER_OUT_MAKE_TARGETS	+= ioctl02
>  endif
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
> new file mode 100644
> index 000000000..4099bd364
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#define TST_NO_DEFAULT_MAIN
> +#include "ioctl_loop_support.h"
> +#include "tst_test.h"
> +
> +void check_sys_value(char *path, int setvalue)
> +{
> +	int getvalue;
> +
> +	SAFE_FILE_SCANF(path, "%d", &getvalue);
> +	if (setvalue == getvalue)
> +		tst_res(TPASS, "%s value is %d", path, setvalue);
> +	else
> +		tst_res(TFAIL, "%s value expected %d got %d", path, setvalue, getvalue);
> +}
> +
> +void check_sys_string(char *path, char *setmessage)
> +{
> +	char getmessage[1024];
> +
> +	SAFE_FILE_SCANF(path, "%s", getmessage);
> +	if (strcmp(setmessage, getmessage))
> +		tst_res(TFAIL, "%s expected %s got %s", path, setmessage, getmessage);
> +	else
> +		tst_res(TPASS, "%s string is %s", path, getmessage);
> +}
> +
> +void safe_set_status(int dev_fd, struct loop_info loopinfo)
> +{
> +	int sleep_us = 4096;
> +	int ret = 0;
> +
> +	/*
> +	 * It may have dirty page, so loop dirver may get EAGAIN error
> +	 * when we use different offset or sizelimit.
> +	 */
> +	ret = ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo);
> +	while (ret != 0 && errno == EAGAIN && sleep_us < 100000) {
> +		ret = ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo);
> +		usleep(sleep_us);
> +		sleep_us *= 2;
> +	}

TBROK here if we failed to set the status?

Also we should use the TST_RETRY_FUNC() instead because that one uses
the timeout multiplier environment variable.

> +}
> +
> +void safe_set_status64(int dev_fd, struct loop_info64 loopinfo)
> +{
> +	int sleep_us = 4096;
> +	int ret = 0;
> +
> +	/*
> +	 * It may have dirty page, so loop dirver may get EAGAIN error
> +	 * when we use different offset or sizelimit.
> +	 */
> +	ret = ioctl(dev_fd, LOOP_SET_STATUS64, &loopinfo);
> +	while (ret != 0 && errno == EAGAIN && sleep_us < 100000) {
> +		ret = ioctl(dev_fd, LOOP_SET_STATUS64, &loopinfo);
> +		usleep(sleep_us);
> +		sleep_us *= 2;
> +	}

Here as well.

> +}
> +
> +void check_support_cmd(int dev_fd, int ioctl_flag, int value, char *message)
> +{
> +	int ret = 0;
> +
> +	ret = ioctl(dev_fd, ioctl_flag, value);
> +	if (ret && errno == EINVAL)
> +		tst_brk(TCONF, "Current environment doesn't support this flag(%s)",
> +				message);
> +}
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h
> new file mode 100644
> index 000000000..44445af8a
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop_support.h
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#ifndef IOCTL_LOOP_H
> +#define IOCTL_lOOP_H
> +#include <linux/loop.h>
> +void check_sys_value(char *path, int setvalue);
> +void check_sys_string(char *path, char *setmessage);
> +void safe_set_status(int dev_fd, struct loop_info loopinfo);
> +void safe_set_status64(int dev_fd, struct loop_info64 loopinfo);
> +void check_support_cmd(int dev_fd, int ioctl_flag, int value, char *message);
> +#endif
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
