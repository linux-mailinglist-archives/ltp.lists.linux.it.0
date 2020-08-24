Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F079924F2AF
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 08:41:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82B383C2EF0
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 08:41:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DB3603C267D
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 08:41:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id EDE5F2009E6
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 08:41:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,347,1592841600"; d="scan'208";a="98448813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Aug 2020 14:41:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 208ED48990D6;
 Mon, 24 Aug 2020 14:41:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 24 Aug 2020 14:41:03 +0800
To: <chrubis@suse.cz>
References: <20200813152536.GH13292@yuki.lan>
 <1597722208-3672-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <091f98e3-2767-3fe8-e4b8-067f591d8002@cn.fujitsu.com>
Date: Mon, 24 Aug 2020 14:40:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597722208-3672-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 208ED48990D6.ABDA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.9 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/msgrcv03: Add error test for MSG_COPY
 flag
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril

Do you have some comments for this v2 patch?

Best Regards
Yang Xu
> The MSG_COPY flag was added in 3.8 for the implementation of the kernel
> checkpoint-restore facility and is available only if the kernel was
> built with the CONFIG_CHECKPOINT_RESTORE option.
> 
> On old kernel without this support, it only ignores this flag and doesn't
> report ENOSYS/EINVAL error, so I add kconfig and min_kver check.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
> v1->v2:
> 1.Rename msgrcv09->msgrcv03
> 2.add comment on top level for why we both need min_kernel and kconfig check
>   include/lapi/msg.h                            |  15 +++
>   runtest/syscalls                              |   1 +
>   runtest/syscalls-ipc                          |   1 +
>   .../kernel/syscalls/ipc/msgrcv/.gitignore     |   1 +
>   .../kernel/syscalls/ipc/msgrcv/msgrcv03.c     | 102 ++++++++++++++++++
>   5 files changed, 120 insertions(+)
>   create mode 100644 include/lapi/msg.h
>   create mode 100644 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
> 
> diff --git a/include/lapi/msg.h b/include/lapi/msg.h
> new file mode 100644
> index 000000000..d649f3318
> --- /dev/null
> +++ b/include/lapi/msg.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#ifndef LAPI_MSG_H
> +#define LAPI_MSG_H
> +
> +#include <sys/msg.h>
> +
> +#ifndef MSG_COPY
> +# define MSG_COPY  040000  /* copy (not remove) all queue messages */
> +#endif
> +
> +#endif
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 860c5c36d..20bbc022b 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -815,6 +815,7 @@ msgget05 msgget05
>   
>   msgrcv01 msgrcv01
>   msgrcv02 msgrcv02
> +msgrcv03 msgrcv03
>   msgrcv05 msgrcv05
>   msgrcv06 msgrcv06
>   msgrcv07 msgrcv07
> diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
> index e6837414c..94d1e4001 100644
> --- a/runtest/syscalls-ipc
> +++ b/runtest/syscalls-ipc
> @@ -17,6 +17,7 @@ msgget05 msgget05
>   
>   msgrcv01 msgrcv01
>   msgrcv02 msgrcv02
> +msgrcv03 msgrcv03
>   msgrcv05 msgrcv05
>   msgrcv06 msgrcv06
>   msgrcv07 msgrcv07
> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/.gitignore b/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
> index 0596ee00f..8ab91e763 100644
> --- a/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/.gitignore
> @@ -1,5 +1,6 @@
>   /msgrcv01
>   /msgrcv02
> +/msgrcv03
>   /msgrcv05
>   /msgrcv06
>   /msgrcv07
> diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
> new file mode 100644
> index 000000000..84456c1cf
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
> + *
> + * This is a basic test about MSG_COPY flag.
> + * This flag was added in 3.8 for the implementation of the kernel checkpoint
> + * restore facility and is available only if the kernel was built with the
> + * CONFIG_CHECKPOINT_RESTORE option.
> + * On old kernel without this support, it only ignores this flag and doesn't
> + * report ENOSYS/EINVAL error. The CONFIG_CHECKPOINT_RESTORE has existed
> + * before kernel 3.8.
> + * So for using this flag, kernel should greater than 3.8 and enable
> + * CONFIG_CHECKPOINT_RESTORE together.
> + *
> + * 1)msgrcv(2) fails and sets errno to EINVAL if IPC_NOWAIT was not specified
> + *   in msgflag.
> + * 2)msgrcv(2) fails and sets errno to EINVAL if IPC_EXCEPT was specified
> + *   in msgflag.
> + * 3)msgrcv(2) fails and set errno to ENOMSG if IPC_NOWAIT and MSG_COPY were
> + *  specified in msgflg and the queue contains less than msgtyp messages.
> + */
> +
> +#define  _GNU_SOURCE
> +#include <string.h>
> +#include <sys/wait.h>
> +#include <sys/msg.h>
> +#include <pwd.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +#include "lapi/msg.h"
> +
> +static key_t msgkey;
> +static int queue_id = -1;
> +static struct buf {
> +	long type;
> +	char mtext[MSGSIZE];
> +} rcv_buf, snd_buf = {MSGTYPE, "hello"};
> +
> +static struct tcase {
> +	int exp_err;
> +	int msg_flag;
> +	int msg_type;
> +	char *message;
> +} tcases[] = {
> +	{EINVAL, 0, MSGTYPE,
> +	"Test EINVAL error when msgflg specified MSG_COPY, but not IPC_NOWAIT"},
> +
> +	{EINVAL, MSG_EXCEPT, MSGTYPE,
> +	"Test EINVAL error when msgflg specified both MSG_COPY and MSG_EXCEPT"},
> +
> +	{ENOMSG, IPC_NOWAIT, 2,
> +	"Test ENOMSG error when using IPC_NOWAIT and MSG_COPY but not have"
> +	" corresponding msgtype msg"},
> +};
> +
> +static void verify_msgrcv(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	tst_res(TINFO, "%s", tc->message);
> +	TEST(msgrcv(queue_id, &rcv_buf, MSGSIZE, tc->msg_type, MSG_COPY | tc->msg_flag));
> +	if (TST_RET != -1) {
> +		tst_res(TFAIL, "msgrcv() succeeded unexpectedly");
> +		SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
> +		return;
> +	}
> +
> +	if (TST_ERR == tc->exp_err)
> +		tst_res(TPASS | TTERRNO, "msgrcv() failed as expected");
> +	else
> +		tst_res(TFAIL | TTERRNO, "msgrcv() failed unexpectedly,"
> +			" expected %s but got", tst_strerrno(tc->exp_err));
> +}
> +
> +static void setup(void)
> +{
> +	msgkey = GETIPCKEY();
> +	queue_id = SAFE_MSGGET(msgkey, IPC_CREAT | IPC_EXCL | MSG_RW);
> +	SAFE_MSGSND(queue_id, &snd_buf, MSGSIZE, 0);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (queue_id != -1)
> +		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.needs_root = 1,
> +	.needs_kconfigs = (const char *[]) {
> +		"CONFIG_CHECKPOINT_RESTORE",
> +		NULL
> +	},
> +	.min_kver = "3.8.0",
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = verify_msgrcv,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
