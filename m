Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A530DD635F
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 15:07:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35D8D3C22A3
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 15:07:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8360B3C223B
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 15:06:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1C48600769
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 15:06:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D93BDB3C2
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 13:06:54 +0000 (UTC)
References: <20190924112159.18845-1-mmoese@suse.de>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190924112159.18845-1-mmoese@suse.de>
Date: Mon, 14 Oct 2019 15:06:54 +0200
Message-ID: <87v9srwk5t.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add a regression test for cve-2017-15649
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Michael Moese <mmoese@suse.de> writes:

> net/packet/af_packet.c in the Linux kernel before 4.13.6 allows local
> users to gain privileges via crafted system calls that trigger
> mishandling of packet_fanout data structures, because of a race
> condition (involving fanout_add and packet_do_bind) that leads to a
> use-after-free.
>
> See https://ssd-disclosure.com/archives/3484 for more detail.
>
> Signed-off-by: Michael Moese <mmoese@suse.de>
> ---
>  runtest/cve                    |   1 +
>  testcases/cve/.gitignore       |   1 +
>  testcases/cve/Makefile         |   1 +
>  testcases/cve/cve-2017-15649.c | 192 +++++++++++++++++++++++++++++++++
>  4 files changed, 195 insertions(+)
>  create mode 100644 testcases/cve/cve-2017-15649.c
>
> diff --git a/runtest/cve b/runtest/cve
> index 33c9196e0..6c0597e71 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -40,3 +40,4 @@ cve-2017-1000380 snd_timer01
>  cve-2018-5803 sctp_big_chunk
>  cve-2018-1000001 realpath01
>  cve-2018-19854 crypto_user01
> +cve-2017-15649 cve-2017-15649

I like having these in date order

> diff --git a/testcases/cve/.gitignore b/testcases/cve/.gitignore
> index 01a3e4c8f..94415b4e4 100644
> --- a/testcases/cve/.gitignore
> +++ b/testcases/cve/.gitignore
> @@ -10,3 +10,4 @@ stack_clash
>  cve-2017-17052
>  cve-2017-16939
>  cve-2017-17053
> +cve-2017-15649
> diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
> index da44fff60..6cf3b5af9 100644
> --- a/testcases/cve/Makefile
> +++ b/testcases/cve/Makefile
> @@ -46,5 +46,6 @@ cve-2017-17052:	CFLAGS += -pthread
>  cve-2017-17053:	CFLAGS += -pthread
>  
>  cve-2015-3290:	CFLAGS += -pthread
> +cve-2017-15649: CFLAGS += -pthread
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/cve/cve-2017-15649.c b/testcases/cve/cve-2017-15649.c
> new file mode 100644
> index 000000000..c19b5bdd4
> --- /dev/null
> +++ b/testcases/cve/cve-2017-15649.c
> @@ -0,0 +1,192 @@
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
> +#define TEST_RUNTIME 15 /* seconds */
> +
> +static struct tst_fzsync_pair fzsync_pair;
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
> +void *task1(void *unused)
> +{
> +	int fanout = 0x3;
> +
> +	if (tst_fzsync_run_a(&fzsync_pair)) {
> +		setsockopt(fd, 0x107, 18, &fanout, sizeof(fanout));
> +		tst_fzsync_end_race_a(&fzsync_pair);
> +	}
> +	return unused;
> +}

This is not the intended usage. I suppose it may work to some extent,
but the randomisation will either never be used or will be broken when
it is activated. Also see comments below.

You need to restructure the test to look more like:
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2233-reproducing-race-conditions

> +
> +void *task2(void *unused)
> +{
> +	if (tst_fzsync_run_b(&fzsync_pair)) {
> +		bind(fd, (struct sockaddr *)&addr, sizeof(addr));
> +		tst_fzsync_end_race_b(&fzsync_pair);
> +	}
> +	return unused;
> +}
> +
> +static int write_file(const char *file, const char *what, ...)

I think this is more or less what FILE_PRINTF does in the LTP lib.

> +{
> +	char buf[1024];
> +	va_list args;
> +	int len;
> +	int my_fd;
> +
> +	va_start(args, what);
> +	vsnprintf(buf, sizeof(buf), what, args);
> +	va_end(args);
> +
> +	buf[sizeof(buf) - 1] = 0;
> +	len = strlen(buf);
> +
> +	my_fd = SAFE_OPEN(file, O_WRONLY | O_CLOEXEC);
> +
> +	SAFE_WRITE(1, my_fd, buf, len);
> +
> +	SAFE_CLOSE(my_fd);
> +
> +	return 0;
> +}
> +
> +static void setup(void)
> +{
> +	int real_uid = getuid();
> +	int real_gid = getgid();
> +
> +	tst_fzsync_pair_init(&fzsync_pair);
> +	tst_taint_init(TST_TAINT_W | TST_TAINT_D | TST_TAINT_L);
> +
> +	if (unshare(CLONE_NEWUSER) != 0) {
> +		printf("[!] unprivileged user namespaces are not available\n");
> +		perror("[-] unshare(CLONE_NEWUSER)");
> +		exit(EXIT_FAILURE);

You should use tst_res(TINFO, ...) and tst_brk(TBROK, ...).

> +	}
> +
> +	if (unshare(CLONE_NEWNET) != 0) {
> +		perror("[-] unshare(CLONE_NEWUSER)");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (write_file("/proc/self/setgroups", "deny")) {
> +		perror("[-] write_file(/proc/self/set_groups)");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (write_file("/proc/self/uid_map", "0 %d 1\n", real_uid)) {
> +		perror("[-] write_file(/proc/self/uid_map)");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (write_file("/proc/self/gid_map", "0 %d 1\n", real_gid)) {
> +		perror("[-] write_file(/proc/self/gid_map)");
> +		exit(EXIT_FAILURE);
> +	}
> +}
> +
> +
> +static void run(void)
> +{
> +	int index;
> +	struct timespec start, now;
> +	struct tst_cap_user_data before[2] = { {0} };
> +	struct tst_cap_user_data after[2] = { {0} };
> +
> +	struct tst_cap_user_header hdr = {
> +		.version = 0x20080522,
> +		.pid = tst_syscall(__NR_gettid),
> +	};
> +
> +	if (tst_capget(&hdr, before))
> +		tst_brk(TBROK | TTERRNO, "tst_capget()");
> +
> +	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);

You should probably have tst_fzysync_reset here then...

> +
> +	while (1) {

tst_fzsync_run_a here in the while condition which will also handle the timeout

> +		pthread_t thread1, thread2;
> +
> +
> +		fd = SAFE_SOCKET(AF_PACKET, SOCK_RAW, PF_PACKET);
> +
> +		strcpy((char *) &ifr.ifr_name, "lo");
> +		SAFE_IOCTL(fd, SIOCGIFINDEX, &ifr);
> +		index = ifr.ifr_ifindex;
> +
> +		SAFE_IOCTL(fd, SIOCGIFFLAGS, &ifr);
> +		ifr.ifr_flags &= ~(short) IFF_UP;
> +
> +		SAFE_IOCTL(fd, SIOCSIFFLAGS, &ifr);
> +
> +		addr.sll_family = AF_PACKET;
> +		addr.sll_protocol = 0x0;
> +		addr.sll_ifindex = index;

then start and end race down here. I suppose if you really need three
threads then there could be a problem. However it will be a lot faster
if you just have two long running threads.

You can use pairs of tst_fzysnc_wait_a/b to add extra synchronisation
before the race to setup the socket if necessary.

> +
> +		SAFE_PTHREAD_CREATE(&thread1, NULL, task1, NULL);
> +		SAFE_PTHREAD_CREATE(&thread2, NULL, task2, NULL);
> +		SAFE_PTHREAD_JOIN(thread1, NULL);
> +		SAFE_PTHREAD_JOIN(thread2, NULL);
> +
> +		SAFE_CLOSE(fd);
> +
> +		if (tst_capget(&hdr, after))
> +			tst_brk(TBROK | TTERRNO, "tst_capget()");
> +
> +		if (memcmp(before, after, sizeof(after)) || tst_taint_check())
> +			tst_res(TFAIL, "kernel is vulnerable");
> +
> +		clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &now);
> +		if ((now.tv_sec - start.tv_sec) > TEST_RUNTIME)
> +			tst_res(TPASS, "kernel seems to be not
> vulnerable");

this should be handled by the fzsync library in the run_a function.

> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.caps = (struct tst_cap []) {
> +		TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
> +		TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
> +		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
> +		{},
> +	},
> +};
> -- 
> 2.23.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
