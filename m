Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AC242B7C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 16:39:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C4153C3114
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Aug 2020 16:39:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D35253C3105
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 16:39:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39C79200AD3
 for <ltp@lists.linux.it>; Wed, 12 Aug 2020 16:39:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23456B79E;
 Wed, 12 Aug 2020 14:40:09 +0000 (UTC)
Date: Wed, 12 Aug 2020 16:40:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200812144007.GA23472@yuki.lan>
References: <1595245614-24814-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595245614-24814-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/msgget04: Add test for
 /proc/sys/kernel/msg_next_id
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
> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget04.c b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
> new file mode 100644
> index 000000000..3791f331a
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget04.c
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
> + *
> + * It is a basic test about msg_next_id.
> + * msg_next_id specifies desired id for next allocated IPC message. By default
> + * they are equal to -1, which means generic allocation logic. Possible values
> + * to set are in range {0..INT_MAX}.
> + * Toggle with non-default value will be set back to -1 by kernel after
> + * successful IPC object allocation.
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/ipc.h>
> +#include <sys/msg.h>
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewipc.h"
> +
> +#define NEXT_ID_PATH "/proc/sys/kernel/msg_next_id"
> +static int queue_id = 1, pid;
> +static key_t msgkey;
> +
> +static void verify_msgget(void)
> +{
> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
> +
> +	TEST(msgget(msgkey, IPC_CREAT | MSG_RW));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "msgget() failed");
> +		return;
> +	}
> +
> +	queue_id = TST_RET;
> +	if (queue_id == pid)
> +		tst_res(TPASS, "msg_next_id succeeded, queue id %d", pid);
> +	else
> +		tst_res(TFAIL, "msg_next_id failed, expected id %d, but got %d", pid, queue_id);
> +
> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
> +	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
> +	pid++;
> +}
> +
> +static void setup(void)
> +{
> +	msgkey = GETIPCKEY();
> +	pid = getpid();
> +}
> +
> +static void cleanup(void)
> +{
> +	if (queue_id != -1)
> +		SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
> +	SAFE_FILE_SCANF(NEXT_ID_PATH, "-1");

Shouldn't this be SAFE_FILE_PRINTF() ?

Otherwise it looks fine, also I can fix this one before pushing.



Also what happens when we write id of existing id to that file? I guess
that we can write another test that tries that...

> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_msgget,
> +	.needs_root = 1,
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
