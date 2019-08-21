Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB698037
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 18:35:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2797B3C1D04
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 18:35:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DAA6D3C1C7F
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 18:35:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8C62A1A01231
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 18:35:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9870AD85
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 16:35:04 +0000 (UTC)
Message-ID: <1566405304.3587.20.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Date: Wed, 21 Aug 2019 18:35:04 +0200
In-Reply-To: <20190820151831.7418-4-chrubis@suse.cz>
References: <20190820151831.7418-1-chrubis@suse.cz>
 <20190820151831.7418-4-chrubis@suse.cz>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/5] kernel/uevent: Add uevent02
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On Tue, 2019-08-20 at 17:18 +0200, Cyril Hrubis wrote:
> Similar to uevent01 but we create and remove a tun network card
> instead.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/uevent                      |   1 +
>  testcases/kernel/uevents/.gitignore |   1 +
>  testcases/kernel/uevents/uevent02.c | 141
> ++++++++++++++++++++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 testcases/kernel/uevents/uevent02.c
> 
> diff --git a/runtest/uevent b/runtest/uevent
> index e9cdf26b8..30b1114a4 100644
> --- a/runtest/uevent
> +++ b/runtest/uevent
> @@ -1 +1,2 @@
>  uevent01 uevent01
> +uevent02 uevent02
> diff --git a/testcases/kernel/uevents/.gitignore
> b/testcases/kernel/uevents/.gitignore
> index 53d0b546a..0afc95534 100644
> --- a/testcases/kernel/uevents/.gitignore
> +++ b/testcases/kernel/uevents/.gitignore
> @@ -1 +1,2 @@
>  uevent01
> +uevent02
> diff --git a/testcases/kernel/uevents/uevent02.c
> b/testcases/kernel/uevents/uevent02.c
> new file mode 100644
> index 000000000..2c28d1810
> --- /dev/null
> +++ b/testcases/kernel/uevents/uevent02.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +/*
> + * Very simple uevent netlink socket test.
> + *
> + * We fork a child that listens for a kernel events while parents
> creates and removes
             ^maybe line wrap?

> + * a tun network device which should produce two several add and
> remove events.
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/wait.h>
> +#include <linux/if.h>
> +#include <linux/if_tun.h>
> +
> +#include "tst_test.h"
> +
> +#include "uevent.h"
> +
> +#define TUN_PATH "/dev/net/tun"
> +
> +static void generate_tun_uevents(void)
> +{
> +	int fd = SAFE_OPEN(TUN_PATH, O_RDWR);
> +
> +	struct ifreq ifr = {
> +		.ifr_flags = IFF_TUN,
> +		.ifr_name = "ltp-tun0",
> +	};
> +
> +	SAFE_IOCTL(fd, TUNSETIFF, (void*)&ifr);
> +
> +	SAFE_IOCTL(fd, TUNSETPERSIST, 0);
> +
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void verify_uevent(void)
> +{
> +	int pid, fd;
> +
> +	struct uevent_desc add = {
> +		.msg = "add@/devices/virtual/net/ltp-tun0",
> +		.value_cnt = 0,
                             ^should it be 4?

> +		.values = (const char*[]) {
> +			"ACTION=add",
> +			"DEVPATH=/devices/virtual/net/ltp-tun0",
> +			"SUBSYSTEM=net",
> +			"ITERFACE=ltp-tun0",
                          ^INTERFACE

> +		}
> +	};
> +
> +	struct uevent_desc add_rx = {
> +		.msg = "add@/devices/virtual/net/ltp-tun0/queues/rx-
> 0",
> +		.value_cnt = 0,
                             ^3

> +		.values = (const char*[]) {
> +			"ACTION=add",
> +			"DEVPATH=/devices/virtual/net/ltp-
> tun0/queues/rx-0",
> +			"SUBSYSTEM=queueus",
                                        ^queues

> +		}
> +	};
> +
> +	struct uevent_desc add_tx = {
> +		.msg = "add@/devices/virtual/net/ltp-tun0/queues/tx-
> 0",
> +		.value_cnt = 0,
                             ^3

> +		.values = (const char*[]) {
> +			"ACTION=add",
> +			"DEVPATH=/devices/virtual/net/ltp-
> tun0/queues/tx-0",
> +			"SUBSYSTEM=queueus",
                                        ^queues

> +		}
> +	};
> +
> +	struct uevent_desc rem_rx = {
> +		.msg = "remove@/devices/virtual/net/ltp-
> tun0/queues/rx-0",
> +		.value_cnt = 0,
                             ^3

> +		.values = (const char*[]) {
> +			"ACTION=remove",
> +			"DEVPATH=/devices/virtual/net/ltp-
> tun0/queues/rx-0",
> +			"SUBSYSTEM=queueus",
                                        ^queues

> +		}
> +	};
> +
> +	struct uevent_desc rem_tx = {
> +		.msg = "remove@/devices/virtual/net/ltp-
> tun0/queues/tx-0",
> +		.value_cnt = 0,
                             ^3

> +		.values = (const char*[]) {
> +			"ACTION=remove",
> +			"DEVPATH=/devices/virtual/net/ltp-
> tun0/queues/tx-0",
> +			"SUBSYSTEM=queueus",
> +		}
> +	};
> +
> +	struct uevent_desc rem = {
> +		.msg = "remove@/devices/virtual/net/ltp-tun0",
> +		.value_cnt = 0,
                             ^4
> +		.values = (const char*[]) {
> +			"ACTION=remove",
> +			"DEVPATH=/devices/virtual/net/ltp-tun0",
> +			"SUBSYSTEM=net",
> +			"ITERFACE=ltp-tun0",
                          ^should be INTERFACE

> +		}
> +	};
> +
> +	const struct uevent_desc *const uevents[] = {
> +		&add,
> +		&add_rx,
> +		&add_tx,
> +		&rem_rx,
> +		&rem_tx,
> +		&rem,
> +		NULL
> +	};
> +
> +	pid = SAFE_FORK();
> +	if (!pid) {
> +		fd = open_uevent_netlink();
> +		TST_CHECKPOINT_WAKE(0);
> +		wait_for_uevents(fd, uevents);
> +	}
> +
> +	TST_CHECKPOINT_WAIT(0);
> +
> +	generate_tun_uevents();
> +
> +	wait_for_pid(pid);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = verify_uevent,
> +	.forks_child = 1,
> +	.needs_tmpdir = 1,
> +	.needs_checkpoints = 1,
> +	.needs_root = 1,
> +	.needs_drivers = (const char *const []) {
> +		"tun",
> +		NULL
> +	},
> +};
> -- 
> 2.21.0
> 
> 

thanks
clemens

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
