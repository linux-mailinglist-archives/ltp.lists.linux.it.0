Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6B3F747A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 13:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E205D3C9D9D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 13:40:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F2493C2F77
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 13:40:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DDE5460095D
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 13:40:37 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5DD5421E8E
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629891637;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gS3wvsFZhzd6AIlBXpoqf77lczYiOlN694l3yNqtzuU=;
 b=SQyyo19nTv6DoKESW9DG4NO8S1YyljXmQ5w2oeDriuu8vbrfAZK8dwAc3B++ubJsyZpd1P
 qeGh0OSJ18H4w0PWxc2FiFcdSJFRybQn9w62FpJOM3+QVPU/Pqtmnkkf1FajG64DJOxDxj
 WV9HSza+2qApkhMXi+sg4mooU3c5XoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629891637;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gS3wvsFZhzd6AIlBXpoqf77lczYiOlN694l3yNqtzuU=;
 b=CAgcg4YL0bqk9PgbJ2zLGorB6c3T6fWApq6GyLLeL58wv0OWnYrF5nVhu/uuMqbvAW0jIF
 3q450d2BCKTG0NDg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D6CF6A3B93;
 Wed, 25 Aug 2021 11:40:36 +0000 (UTC)
References: <20210825104300.15255-1-mdoucha@suse.cz>
 <20210825104300.15255-3-mdoucha@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <20210825104300.15255-3-mdoucha@suse.cz>
Date: Wed, 25 Aug 2021 12:40:30 +0100
Message-ID: <87k0k9lpld.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add test for CVE 2021-3609
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> Fixes #863
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  runtest/can                           |   1 +
>  runtest/cve                           |   1 +
>  testcases/network/can/cve/.gitignore  |   1 +
>  testcases/network/can/cve/Makefile    |  10 ++
>  testcases/network/can/cve/can_bcm01.c | 161 ++++++++++++++++++++++++++
>  5 files changed, 174 insertions(+)
>  create mode 100644 testcases/network/can/cve/.gitignore
>  create mode 100644 testcases/network/can/cve/Makefile
>  create mode 100644 testcases/network/can/cve/can_bcm01.c
>
> diff --git a/runtest/can b/runtest/can
> index b637183c6..23cbf9acd 100644
> --- a/runtest/can
> +++ b/runtest/can
> @@ -1,2 +1,3 @@
>  can_filter can_filter
>  can_rcv_own_msgs can_rcv_own_msgs
> +can_bcm01 can_bcm01
> diff --git a/runtest/cve b/runtest/cve
> index c27f58d8d..449f5ad7e 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -66,6 +66,7 @@ cve-2020-14416 pty03
>  cve-2020-25705 icmp_rate_limit01
>  cve-2020-29373 io_uring02
>  cve-2021-3444 bpf_prog05
> +cve-2021-6309 can_bcm01
>  cve-2021-22555 setsockopt08 -i 100
>  cve-2021-26708 vsock01
>  # Tests below may cause kernel memory leak
> diff --git a/testcases/network/can/cve/.gitignore b/testcases/network/can/cve/.gitignore
> new file mode 100644
> index 000000000..3d138b0b4
> --- /dev/null
> +++ b/testcases/network/can/cve/.gitignore
> @@ -0,0 +1 @@
> +/can_bcm01
> diff --git a/testcases/network/can/cve/Makefile b/testcases/network/can/cve/Makefile
> new file mode 100644
> index 000000000..86f84e9f2
> --- /dev/null
> +++ b/testcases/network/can/cve/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +can_bcm01: CFLAGS += -pthread
> +can_bcm01: LDLIBS += -lrt
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/network/can/cve/can_bcm01.c b/testcases/network/can/cve/can_bcm01.c
> new file mode 100644
> index 000000000..b1816e6c2
> --- /dev/null
> +++ b/testcases/network/can/cve/can_bcm01.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 SUSE LLC <mdoucha@suse.cz>
> + *
> + * CVE-2021-3609
> + *
> + * Test for race condition vulnerability in CAN BCM. Fixed in:
> + *
> + *  commit d5f9023fa61ee8b94f37a93f08e94b136cf1e463
> + *  Author: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> + *  Date:   Sat Jun 19 13:18:13 2021 -0300
> + *
> + *  can: bcm: delay release of struct bcm_op after synchronize_rcu()
> + */
> +
> +#include "config.h"
> +#include "tst_test.h"
> +
> +#ifdef HAVE_LINUX_CAN_H
> +
> +#include <linux/can.h>
> +#include <linux/can/bcm.h>
> +
> +#include "tst_netdevice.h"
> +#include "tst_fuzzy_sync.h"
> +
> +#define LTP_DEVICE "ltp_vcan0"
> +
> +struct test_payload {
> +	struct bcm_msg_head head;
> +	struct can_frame frame;
> +};
> +
> +static int sock1 = -1, sock2 = -1;
> +static struct tst_fzsync_pair fzsync_pair;
> +
> +static void setup(void)
> +{
> +	struct sockaddr_can addr = { .can_family = AF_CAN };
> +
> +	/*
> +	 * Older kernels require explicit modprobe of vcan. Newer kernels
> +	 * will load the modules automatically and support CAN in network
> +	 * namespace which would eliminate the need for running the test
> +	 * with root privileges.
> +	 */
> +	tst_cmd((const char*[]){"modprobe", "vcan", NULL}, NULL, NULL, 0);
> +
> +	NETDEV_ADD_DEVICE(LTP_DEVICE, "vcan");
> +	NETDEV_SET_STATE(LTP_DEVICE, 1);
> +	addr.can_ifindex = NETDEV_INDEX_BY_NAME(LTP_DEVICE);
> +	addr.can_addr.tp.rx_id = 1;
> +	sock1 = SAFE_SOCKET(AF_CAN, SOCK_DGRAM, CAN_BCM);
> +	SAFE_CONNECT(sock1, (struct sockaddr *)&addr, sizeof(addr));
> +
> +	fzsync_pair.exec_loops = 100000;
> +	tst_fzsync_pair_init(&fzsync_pair);
> +}
> +
> +static void *thread_run(void *arg)
> +{
> +	struct test_payload data = {
> +		{
> +			.opcode = TX_SEND,
> +			.flags = RX_NO_AUTOTIMER,
> +			.count = -1,
> +			.nframes = 1
> +		},
> +		{0}
> +	};
> +	struct iovec iov = {
> +		.iov_base = &data,
> +		.iov_len = sizeof(data)
> +	};
> +	struct msghdr msg = {
> +		.msg_iov = &iov,
> +		.msg_iovlen = 1
> +	};
> +
> +	while (tst_fzsync_run_b(&fzsync_pair)) {
> +		tst_fzsync_start_race_b(&fzsync_pair);
> +		SAFE_SENDMSG(iov.iov_len, sock1, &msg, 0);
> +		tst_fzsync_end_race_b(&fzsync_pair);
> +	}
> +
> +	return arg;
> +}
> +
> +static void run(void)
> +{
> +	struct sockaddr_can addr = { .can_family = AF_CAN };
> +	struct bcm_msg_head data = {
> +		.opcode = RX_SETUP,
> +		.flags = RX_FILTER_ID | SETTIMER | STARTTIMER,
> +		.ival1.tv_sec = 1,
> +		.ival2.tv_sec = 1
> +	};
> +	struct iovec iov = {
> +		.iov_base = &data,
> +		.iov_len = sizeof(data)
> +	};
> +	struct msghdr msg = {
> +		.msg_iov = &iov,
> +		.msg_iovlen = 1,
> +	};
> +
> +	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
> +
> +	while (tst_fzsync_run_a(&fzsync_pair)) {
> +		sock2 = SAFE_SOCKET(AF_CAN, SOCK_DGRAM, CAN_BCM);
> +		SAFE_CONNECT(sock2, (struct sockaddr *)&addr, sizeof(addr));
> +		SAFE_SENDMSG(iov.iov_len, sock2, &msg, 0);
> +		tst_fzsync_start_race_a(&fzsync_pair);
> +		SAFE_CLOSE(sock2);
> +		tst_fzsync_end_race_a(&fzsync_pair);
> +	}
> +
> +	tst_res(TPASS, "Nothing bad happened, probably");
> +}
> +
> +static void cleanup(void)
> +{
> +	tst_fzsync_pair_cleanup(&fzsync_pair);
> +
> +	if (sock1 >= 0)
> +		SAFE_CLOSE(sock1);
> +
> +	if (sock2 >= 0)
> +		SAFE_CLOSE(sock2);
> +
> +	NETDEV_REMOVE_DEVICE(LTP_DEVICE);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
> +	.needs_root = 1,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_USER_NS=y",
> +		"CONFIG_NET_NS=y",

I think you dropped NS due to lack of CAN support on older kernels?

Otherwise LGTM!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
