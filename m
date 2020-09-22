Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABC274387
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 15:52:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB2993C5E5C
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 15:52:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C8343C28E5
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 15:52:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1CEFC60073B
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 15:52:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B6FCABA2;
 Tue, 22 Sep 2020 13:52:53 +0000 (UTC)
Date: Tue, 22 Sep 2020 15:52:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <20200922135244.GA4167@yuki.lan>
References: <20200920154633.27255-1-Filip.Bozuta@syrmia.com>
 <20200920154633.27255-2-Filip.Bozuta@syrmia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200920154633.27255-2-Filip.Bozuta@syrmia.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/1] syscalls/{send|recv}mmsg: add a test case
 for timeout and errno test
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
> This patch introduces a test case for the already existing test for
> syscalls 'sendmmsg()' and 'recvmmsg()' (sendmmsg01). This test
> case is meant to check whether the timeout is reached aproppriately
> after the first message is received. The timeout is set to 1 nsec as to
> make sure that it has to be reached. In this case the expected return
> value is 1 as the second message is not supposed be received after the
> timeout is reached.
> 
> * Note: No matter how small the timeout is, one message is always gonna
> have to be received because the timeout is checked only after a received
> message. This is an existing bug for syscall 'recvmmsg()':
> https://man7.org/linux/man-pages/man2/recvmmsg.2.html#BUGS
> 
> This patch introduces new test files for these syscalls (sendmmsg02.c and
> recvmmsg01.c). This test file is meant to check whether the aproppriate
> errno is set in some sitautions when these syscalls fail. These situations
> include: bad socket file descriptor (EBADF), bad message vector address
> (EFAULT), bad timeout value (EINVAL), bad timeout address (EFAULT).
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  runtest/syscalls                              |   3 +
>  testcases/kernel/syscalls/recvmmsg/Makefile   |   7 +
>  .../kernel/syscalls/recvmmsg/recvmmsg01.c     | 127 ++++++++++++++++
>  testcases/kernel/syscalls/sendmmsg/.gitignore |   1 +
>  testcases/kernel/syscalls/sendmmsg/sendmmsg.h |  81 ++++++++++
>  .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 142 +++++++-----------
>  .../kernel/syscalls/sendmmsg/sendmmsg02.c     |  80 ++++++++++
>  7 files changed, 356 insertions(+), 85 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/recvmmsg/Makefile
>  create mode 100644 testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
>  create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg.h
>  create mode 100644 testcases/kernel/syscalls/sendmmsg/sendmmsg02.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index ef1a1ba0b..666e99ea4 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1064,6 +1064,8 @@ recvmsg01 recvmsg01
>  recvmsg02 recvmsg02
>  recvmsg03 recvmsg03
>  
> +recvmmsg01 recvmmsg01
> +
>  remap_file_pages01 remap_file_pages01
>  remap_file_pages02 remap_file_pages02
>  
> @@ -1203,6 +1205,7 @@ sendmsg02 sendmsg02
>  sendmsg03 sendmsg03
>  
>  sendmmsg01 sendmmsg01
> +sendmmsg02 sendmmsg02
>  
>  sendto01 sendto01
>  sendto02 sendto02
> diff --git a/testcases/kernel/syscalls/recvmmsg/Makefile b/testcases/kernel/syscalls/recvmmsg/Makefile
> new file mode 100644
> index 000000000..18896b6f2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/recvmmsg/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
> new file mode 100644
> index 000000000..fe637430b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/recvmmsg/recvmmsg01.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/* test status of errors:
> + *
> + * EBADF            v ('Bad socket file descriptor')
> + * EFAULT           v ('Bad message vector address')
> + * EINVAL           v ('Bad seconds value for the timeout argument')
> + * EINVAL           v ('Bad nanoseconds value for the timeout argument')
> + * EFAULT           v ('Bad timeout address')
> + */
> +
> +#define _GNU_SOURCE
> +#include "../sendmmsg/sendmmsg.h"
> +
> +static struct tst_ts ts;
> +
> +enum test_type {
> +	BAD_FD,
> +	BAD_MSGVEC,
> +	BAD_TS_VALUE_1,
> +	BAD_TS_VALUE_2,
> +	BAD_TS_ADDR,
> +};
> +
> +#define TYPE_NAME(x) .ttype = x, .desc = #x
> +
> +struct test_case {
> +	int ttype;
> +	const char *desc;
> +	int fd;
> +	long tv_sec;
> +	long tv_nsec;
> +	int exp_errno;
> +};
> +
> +static struct test_case tcase[] = {
> +	{
> +		TYPE_NAME(BAD_FD),
> +		.fd = -1,
> +		.exp_errno = EBADF,
> +	},
> +	{
> +		TYPE_NAME(BAD_MSGVEC),
> +		.exp_errno = EFAULT,
> +	},
> +	{
> +		TYPE_NAME(BAD_TS_VALUE_1),
> +		.tv_sec = -1,
> +		.tv_nsec = 0,
> +		.exp_errno = EINVAL,
> +	},
> +	{
> +		TYPE_NAME(BAD_TS_VALUE_2),
> +		.tv_sec = 1,
> +		.tv_nsec = 1000000001,
> +		.exp_errno = EINVAL,
> +	},
> +	{
> +		TYPE_NAME(BAD_TS_ADDR),
> +		.exp_errno = EFAULT,
> +	}
> +};
> +
> +static void do_test(unsigned int i)
> +{
> +	struct time64_variants *tv = &variants[tst_variant];
> +	struct test_case *tc = &tcase[i];
> +	void *rcv_msgvec, *timeout;
> +
> +	tst_res(TINFO, "case %s", tc->desc);
> +
> +	if (tc->ttype != BAD_FD)
> +		tc->fd = receive_sockfd;
> +
> +	TEST(tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0));
> +
> +	if (TST_RET != VLEN || snd_msg[0].msg_len != 6 ||
> +	    snd_msg[1].msg_len != 6) {
> +		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
> +		return;
> +	}
> +
> +	memset(rcv1->iov_base, 0, rcv1->iov_len);
> +	memset(rcv2->iov_base, 0, rcv2->iov_len);
> +
> +	timeout.type = tv->ts_type;

The timeout is a void * and this code does not even compile.

This should probably have been ts->type = tv->ts_type instead.

> +	tst_ts_set_sec(&ts, tc->tv_sec);
> +	tst_ts_set_nsec(&ts, tc->tv_nsec);
> +
> +	if (tc->ttype == BAD_MSGVEC)
> +		rcv_msgvec = bad_addr;
> +	else
> +		rcv_msgvec = rcv_msg;
> +
> +	if (tc->ttype == BAD_TS_ADDR)
> +		timeout = bad_addr;
> +	else
> +		timeout = tst_ts_get(&ts);
> +
> +	TEST(tv->recvmmsg(tc->fd, rcv_msgvec, VLEN, 0, timeout));
> +
> +	if (TST_RET < 0) {
> +		if (tc->exp_errno == errno)
> +			tst_res(TPASS | TERRNO, "receivemmsg() failed successfully");
> +		else
> +			tst_res(TFAIL | TERRNO, "receivemmsg() failed unexpectedly");
> +	} else {
> +		tst_res(TFAIL | TERRNO, "receivemmsg() succeded unexpectedly");
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test = do_test,
> +	.tcnt = ARRAY_SIZE(tcase),
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_variants = ARRAY_SIZE(variants),
> +	.bufs = (struct tst_buffers []) {
> +		{&snd1, .iov_sizes = (int[]){3, 3, -1}},
> +		{&snd2, .iov_sizes = (int[]){6, -1}},
> +		{&rcv1, .iov_sizes = (int[]){6, -1}},
> +		{&rcv2, .iov_sizes = (int[]){5, -1}},
> +		{&snd_msg, .size = VLEN * sizeof(*snd_msg)},
> +		{&rcv_msg, .size = VLEN * sizeof(*rcv_msg)},
> +		{},
> +	}
> +};
> diff --git a/testcases/kernel/syscalls/sendmmsg/.gitignore b/testcases/kernel/syscalls/sendmmsg/.gitignore
> index b703ececd..42693c44d 100644
> --- a/testcases/kernel/syscalls/sendmmsg/.gitignore
> +++ b/testcases/kernel/syscalls/sendmmsg/.gitignore
> @@ -1 +1,2 @@
>  sendmmsg01
> +sendmmsg02
> diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg.h b/testcases/kernel/syscalls/sendmmsg/sendmmsg.h
> new file mode 100644
> index 000000000..f74daf297
> --- /dev/null
> +++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <netinet/ip.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +
> +#include "time64_variants.h"
> +#include "tst_test.h"
> +#include "lapi/socket.h"
> +#include "tst_safe_macros.h"
> +#include "sendmmsg_var.h"
> +
> +#define BUFSIZE 16
> +#define VLEN 2
> +
> +static int send_sockfd;
> +static int receive_sockfd;
> +static struct mmsghdr *snd_msg, *rcv_msg;
> +static struct iovec *snd1, *snd2, *rcv1, *rcv2;
> +
> +static void *bad_addr;
> +
> +#define TYPE_NAME(x) .ttype = x, .desc = #x
> +
> +static struct time64_variants variants[] = {
> +	{ .recvmmsg = libc_recvmmsg, .sendmmsg = libc_sendmmsg, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
> +
> +#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
> +	{ .recvmmsg = sys_recvmmsg, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> +#endif
> +
> +#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
> +	{ .recvmmsg = sys_recvmmsg64, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> +#endif
> +};
> +
> +static void setup(void)
> +{
> +	struct sockaddr_in addr;
> +	unsigned int port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM);
> +
> +	send_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> +	receive_sockfd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
> +
> +	addr.sin_family = AF_INET;
> +	addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
> +	addr.sin_port = port;
> +
> +	SAFE_BIND(receive_sockfd, (struct sockaddr *)&addr, sizeof(addr));
> +	SAFE_CONNECT(send_sockfd, (struct sockaddr *)&addr, sizeof(addr));
> +
> +	memcpy(snd1[0].iov_base, "one", snd1[0].iov_len);
> +	memcpy(snd1[1].iov_base, "two", snd1[1].iov_len);
> +	memcpy(snd2->iov_base, "three3", snd2->iov_len);
> +
> +	memset(snd_msg, 0, VLEN * sizeof(*snd_msg));
> +	snd_msg[0].msg_hdr.msg_iov = snd1;
> +	snd_msg[0].msg_hdr.msg_iovlen = 2;
> +	snd_msg[1].msg_hdr.msg_iov = snd2;
> +	snd_msg[1].msg_hdr.msg_iovlen = 1;
> +
> +	memset(rcv_msg, 0, VLEN * sizeof(*rcv_msg));
> +	rcv_msg[0].msg_hdr.msg_iov = rcv1;
> +	rcv_msg[0].msg_hdr.msg_iovlen = 1;
> +	rcv_msg[1].msg_hdr.msg_iov = rcv2;
> +	rcv_msg[1].msg_hdr.msg_iovlen = 1;
> +
> +	bad_addr = tst_get_bad_addr(NULL);
> +
> +	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
> +}

There is no need for such complex setup for the negative tests, we can
just pass minimal correct mmsghdr instead. So I would rather have each
test have it's own setup and cleanup function tailored for the specific
case.

> +static void cleanup(void)
> +{
> +	if (send_sockfd > 0)
> +		SAFE_CLOSE(send_sockfd);
> +	if (receive_sockfd > 0)
> +		SAFE_CLOSE(receive_sockfd);
> +}
> diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
> index d6a717687..09e37c3fb 100644
> --- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
> +++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
> @@ -5,46 +5,51 @@
>   */
>  
>  #define _GNU_SOURCE
> -#include <netinet/ip.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <sys/types.h>
> -
> -#include "time64_variants.h"
> -#include "tst_test.h"
> -#include "lapi/socket.h"
> -#include "tst_safe_macros.h"
> -#include "sendmmsg_var.h"
> -
> -#define BUFSIZE 16
> -#define VLEN 2
> -
> -static int send_sockfd;
> -static int receive_sockfd;
> -static struct mmsghdr *snd_msg, *rcv_msg;
> -static struct iovec *snd1, *snd2, *rcv1, *rcv2;
> -
> -static struct time64_variants variants[] = {
> -	{ .recvmmsg = libc_recvmmsg, .sendmmsg = libc_sendmmsg, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
> -
> -#if (__NR_recvmmsg != __LTP__NR_INVALID_SYSCALL)
> -	{ .recvmmsg = sys_recvmmsg, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
> -#endif
> -
> -#if (__NR_recvmmsg_time64 != __LTP__NR_INVALID_SYSCALL)
> -	{ .recvmmsg = sys_recvmmsg64, .sendmmsg = sys_sendmmsg, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
> -#endif
> +
> +#include "sendmmsg.h"
> +
> +static struct tst_ts ts;
> +
> +enum test_type {
> +	NORMAL,
> +	TIMEOUT,
> +};
> +
> +struct test_case {
> +	int ttype;
> +	const char *desc;
> +	long tv_sec;
> +	long tv_nsec;
> +	int exp_ret;
> +};
> +
> +static struct test_case tcase[] = {
> +	{
> +		TYPE_NAME(NORMAL),
> +		.tv_sec = 1,
> +		.tv_nsec = 0,
> +		.exp_ret = 2,
> +	},
> +	{
> +		TYPE_NAME(TIMEOUT),
> +		.tv_sec = 0,
> +		.tv_nsec = 0,
> +		.exp_ret = 1,
> +	},
>  };
>  
> -static void run(void)
> +static void do_test(unsigned int i)
>  {
>  	struct time64_variants *tv = &variants[tst_variant];
> +	struct test_case *tc = &tcase[i];
>  	struct tst_ts timeout;
>  	int retval;
>  
> -	retval = tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0);
> -	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
> +	tst_res(TINFO, "case %s", tc->desc);
> +
> +	TEST(tv->sendmmsg(send_sockfd, snd_msg, VLEN, 0));
> +
> +	if (TST_RET < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
>  		tst_res(TFAIL | TERRNO, "sendmmsg() failed");
>  		return;
>  	}
> @@ -53,16 +58,16 @@ static void run(void)
>  	memset(rcv2->iov_base, 0, rcv2->iov_len);
>  
>  	timeout.type = tv->ts_type;
> -	tst_ts_set_sec(&timeout, 1);
> -	tst_ts_set_nsec(&timeout, 0);
> +	tst_ts_set_sec(&timeout, tc->tv_sec);
> +	tst_ts_set_nsec(&timeout, tc->tv_nsec);
>  
> -	retval = tv->recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout));
> +	TEST(tv->recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, tst_ts_get(&timeout)));
>  
> -	if (retval == -1) {
> +	if (TST_RET == -1) {
>  		tst_res(TFAIL | TERRNO, "recvmmsg() failed");
>  		return;
>  	}
> -	if (retval != 2) {
> +	if (tc->exp_ret != TST_RET) {
>  		tst_res(TFAIL, "Received unexpected number of messages (%d)",
>  			retval);

You stil kept the retval here in the tst_res() while it should have been
removed completely.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
