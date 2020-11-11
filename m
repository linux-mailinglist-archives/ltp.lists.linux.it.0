Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E92862AF54A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:43:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 820DF3C6033
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:43:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 04B663C2F19
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:43:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5B3EC1000A4B
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:43:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8AAAABD6;
 Wed, 11 Nov 2020 15:43:50 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:44:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201111154437.GA23576@yuki.lan>
References: <20200722154558.GB2714@yuki.lan>
 <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] syscalls/msgstress: Add common file for
 msgstress
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
> Copy old libmsgctl.c three functions(doreader,dowriter, fill_buffer, verify)
> into this common file. The reason for not putting it into lib directory because
> only msgstress cases use these functions. So raising them into lib level makes
> no sense.

Well if we add msg to the function names there would be no harm in
putting these functions into the ipc library, right? E.g. we would have
msg_do_reader() etc.

I would actually prefer that, since we would have avoided complexity in
the msgstress/Makefile that way.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../kernel/syscalls/ipc/msgstress/Makefile    |  2 +-
>  .../syscalls/ipc/msgstress/msgstress_common.c | 95 +++++++++++++++++++
>  .../syscalls/ipc/msgstress/msgstress_common.h | 26 +++++
>  3 files changed, 122 insertions(+), 1 deletion(-)
>  create mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
>  create mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
> 
> diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
> index b821bda01..2c8fa8e5b 100644
> --- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
> +++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
> @@ -6,7 +6,7 @@ top_srcdir              ?= ../../../../..
>  LTPLIBS = ltpipc
>  
>  include $(top_srcdir)/include/mk/testcases.mk
> -
> +FILTER_OUT_MAKE_TARGETS         := msgstress_common
>  LTPLDLIBS  += -lltpipc
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
> new file mode 100644
> index 000000000..3431355f6
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) International Business Machines  Corp., 2002
> + * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved???
> + */
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "msgstress_common.h"
> +
> +int verify(char *buf, char val, int size, int child)
> +{
> +	while (size-- > 0) {
> +		if (*buf++ != val) {
> +			tst_res(TFAIL, "Verify error in child %d, *buf = %x, "
> +				"val = %x, size = %d\n", child, *buf, val,
> +				size);
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> +
> +void do_reader(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_res(TFAIL,
> +			"Message queue mismatch in the reader of child group"
> +			" %d for message queue id %d\n", child, id);
> +		return;
> +	}
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
> +		if (buffer.type != type) {
> +			tst_res(TFAIL, "Type mismatch in child %d, read #%d, "
> +				"for message got %ld, exected %ld",
> +				child, (i + 1), buffer.type, type);
> +			return;
> +		}
> +		if (buffer.data.len + 1 != size) {
> +			tst_res(TFAIL, "Size mismatch in child %d, read #%d, "
> +				"for message got %d, expected %d",
> +				child, (i + 1), buffer.data.len + 1, size);
> +			return;
> +		}
> +		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
> +			tst_res(TFAIL, "Verify failed in child %d read # = %d, "
> +				"key = %lx\n", child, (i + 1), key);
> +			return;
> +		}
> +		key++;
> +	}
> +}
> +
> +void fill_buffer(char *buf, char val, int size)
> +{
> +	int i;
> +
> +	for (i = 0; i < size; i++)
> +		buf[i] = val;
> +}

This is open-coded memset() please use memset() instead.

> +void do_writer(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_res(TFAIL, "Message queue mismatch in the reader of child"
> +			" group %d for message queue id %d\n", child, id);
> +		return;
> +	}
> +
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		do {
> +			size = (lrand48() % 99);
> +		} while (size == 0);
> +		fill_buffer(buffer.data.pbytes, (key % 255), size);
> +		buffer.data.len = size;
> +		buffer.type = type;
> +		SAFE_MSGSND(id, &buffer, size + 1, 0);
> +		key++;
> +	}
> +}
> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
> new file mode 100644
> index 000000000..81e2f288b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +
> +#ifndef MSGSTRESS_COMMON_H
> +#define MSGSTRESS_COMMON_H
> +
> +#include <stdlib.h>
> +#include "tst_safe_sysv_ipc.h"
> +#include "tst_test.h"
> +
> +struct mbuffer {
> +	long type;
> +	struct {
> +		char len;
> +		char pbytes[99];
> +	} data;
> +};
> +
> +void do_reader(long key, int tid, long type, int child, int nreps);
> +void do_writer(long key, int tid, long type, int child, int nreps);
> +
> +#endif
> +
> -- 
> 2.23.0
> 
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
