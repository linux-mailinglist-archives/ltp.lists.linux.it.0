Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8912206B7C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 07:04:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1AB83C2BA6
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 07:04:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9B0173C136B
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 07:04:48 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 65A40140121D
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 07:04:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,273,1589212800"; d="scan'208";a="95207130"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Jun 2020 13:04:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1E5EA4CE3F1A
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 12:54:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 13:04:38 +0800
To: <ltp@lists.linux.it>
References: <20200618094139.24579-1-xuyang_jy_0410@163.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <96be4c61-2163-527a-3981-f442812fcba0@cn.fujitsu.com>
Date: Wed, 24 Jun 2020 13:04:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618094139.24579-1-xuyang_jy_0410@163.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1E5EA4CE3F1A.A0FAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] libs/libltpnewipc: Add libnewmsgctl.c
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

Hi
If we convert msgstress test cases into new api with using 
libnewmsgctl.c, the old libmsgctl.c is useless and we can remove them.

Best Regards
Yang Xu
> From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> 
> Add libnewmsgctl.c into ltp new ipc libs, so the upcoming msgstress cleanup cases
> can use doreader/dowirter functions such as old libmsgctl.c does.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   include/libnewmsgctl.h           |  22 +++++++
>   libs/libltpnewipc/libnewmsgctl.c | 102 +++++++++++++++++++++++++++++++
>   2 files changed, 124 insertions(+)
>   create mode 100644 include/libnewmsgctl.h
>   create mode 100644 libs/libltpnewipc/libnewmsgctl.c
> 
> diff --git a/include/libnewmsgctl.h b/include/libnewmsgctl.h
> new file mode 100644
> index 000000000..e48a04277
> --- /dev/null
> +++ b/include/libnewmsgctl.h
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + */
> +
> +#ifndef __LIBNEWMSGCTL_H__
> +#define __LIBNEWMSGCTL_H__
> +
> +struct mbuffer {
> +	long type;
> +	struct {
> +		char len;
> +		char pbytes[99];
> +	} data;
> +};
> +
> +void doreader(long key, int tid, long type, int child, int nreps);
> +void dowriter(long key, int tid, long type, int child, int nreps);
> +void fill_buffer(char *buf, char val, int size);
> +int verify(char *buf, char val, int size, int child);
> +
> +#endif /*__LIBNEWMSGCTL_H__ */
> diff --git a/libs/libltpnewipc/libnewmsgctl.c b/libs/libltpnewipc/libnewmsgctl.c
> new file mode 100644
> index 000000000..1f6eed74a
> --- /dev/null
> +++ b/libs/libltpnewipc/libnewmsgctl.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + */
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <sys/ipc.h>
> +#include <sys/msg.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_safe_sysv_ipc.h"
> +#include "libnewmsgctl.h"
> +
> +void doreader(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_res(TFAIL,
> +			"Message queue mismatch in the reader of child group %d for message queue id %d\n",
> +			child, id);
> +		return;
> +	}
> +	for (i = 0; i < nreps; i++) {
> +		memset(&buffer, 0, sizeof(buffer));
> +
> +		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
> +		if (buffer.type != type) {
> +			tst_res(TFAIL, "Type mismatch in child %d, read #%d, for message got %ld, exected %ld",
> +				child, (i + 1), buffer.type, type);
> +			return;
> +		}
> +		if (buffer.data.len + 1 != size) {
> +			tst_res(TFAIL, "Size mismatch in child %d, read #%d, for message got %d, expected %d",
> +				child, (i + 1), buffer.data.len + 1, size);
> +			return;
> +		}
> +		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
> +			tst_res(TFAIL, "Verify failed in child %d read # = %d, key = %lx\n",
> +				child, (i + 1), key);
> +			return;
> +		}
> +		key++;
> +	}
> +}
> +
> +void dowriter(long key, int tid, long type, int child, int nreps)
> +{
> +	int i, size;
> +	int id;
> +	struct mbuffer buffer;
> +
> +	id = SAFE_MSGGET(key, 0);
> +	if (id != tid) {
> +		tst_res(TFAIL, "Message queue mismatch in the reader of child group %d for message queue id %d\n",
> +			child, id);
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
> +
> +void fill_buffer(char *buf, char val, int size)
> +{
> +	int i;
> +
> +	for (i = 0; i < size; i++)
> +		buf[i] = val;
> +}
> +
> +/* Check a buffer for correct values */
> +int verify(char *buf, char val, int size, int child)
> +{
> +	while (size-- > 0) {
> +		if (*buf++ != val) {
> +			tst_res(TFAIL, "Verify error in child %d, *buf = %x, val = %x, size = %d\n",
> +				child, *buf, val, size);
> +			return 1;
> +		}
> +	}
> +	return 0;
> +}
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
