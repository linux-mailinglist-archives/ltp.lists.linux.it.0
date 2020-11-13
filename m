Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A552B15CA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 07:14:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 288E03C4FA6
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 07:14:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 05F923C2EC1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 07:14:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 069126010DE
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 07:14:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,474,1596470400"; d="scan'208";a="101329935"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 14:14:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 621B84CE4BB7;
 Fri, 13 Nov 2020 14:14:34 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 14:14:34 +0800
Message-ID: <5FAE244C.3030806@cn.fujitsu.com>
Date: Fri, 13 Nov 2020 14:14:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200722154558.GB2714@yuki.lan>
 <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201111154437.GA23576@yuki.lan>
In-Reply-To: <20201111154437.GA23576@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 621B84CE4BB7.AC0A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril
> Hi!
>> Copy old libmsgctl.c three functions(doreader,dowriter, fill_buffer, verify)
>> into this common file. The reason for not putting it into lib directory because
>> only msgstress cases use these functions. So raising them into lib level makes
>> no sense.
>
> Well if we add msg to the function names there would be no harm in
> putting these functions into the ipc library, right? E.g. we would have
> msg_do_reader() etc.

Yes. it is no harm. But I don't see any other case using these api.

Also this patch looks has wrongly merged into ltp master.

>
> I would actually prefer that, since we would have avoided complexity in
> the msgstress/Makefile that way.
>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   .../kernel/syscalls/ipc/msgstress/Makefile    |  2 +-
>>   .../syscalls/ipc/msgstress/msgstress_common.c | 95 +++++++++++++++++++
>>   .../syscalls/ipc/msgstress/msgstress_common.h | 26 +++++
>>   3 files changed, 122 insertions(+), 1 deletion(-)
>>   create mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
>>   create mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
>>
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> index b821bda01..2c8fa8e5b 100644
>> --- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
>> @@ -6,7 +6,7 @@ top_srcdir              ?= ../../../../..
>>   LTPLIBS = ltpipc
>>
>>   include $(top_srcdir)/include/mk/testcases.mk
>> -
>> +FILTER_OUT_MAKE_TARGETS         := msgstress_common
>>   LTPLDLIBS  += -lltpipc
>>
>>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
>> new file mode 100644
>> index 000000000..3431355f6
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.c
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) International Business Machines  Corp., 2002
>> + * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved???
>> + */
>> +
>> +#define TST_NO_DEFAULT_MAIN
>> +#include "msgstress_common.h"
>> +
>> +int verify(char *buf, char val, int size, int child)
>> +{
>> +	while (size-->  0) {
>> +		if (*buf++ != val) {
>> +			tst_res(TFAIL, "Verify error in child %d, *buf = %x, "
>> +				"val = %x, size = %d\n", child, *buf, val,
>> +				size);
>> +			return 1;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>> +void do_reader(long key, int tid, long type, int child, int nreps)
>> +{
>> +	int i, size;
>> +	int id;
>> +	struct mbuffer buffer;
>> +
>> +	id = SAFE_MSGGET(key, 0);
>> +	if (id != tid) {
>> +		tst_res(TFAIL,
>> +			"Message queue mismatch in the reader of child group"
>> +			" %d for message queue id %d\n", child, id);
>> +		return;
>> +	}
>> +	for (i = 0; i<  nreps; i++) {
>> +		memset(&buffer, 0, sizeof(buffer));
>> +
>> +		size = SAFE_MSGRCV(id,&buffer, 100, type, 0);
>> +		if (buffer.type != type) {
>> +			tst_res(TFAIL, "Type mismatch in child %d, read #%d, "
>> +				"for message got %ld, exected %ld",
>> +				child, (i + 1), buffer.type, type);
>> +			return;
>> +		}
>> +		if (buffer.data.len + 1 != size) {
>> +			tst_res(TFAIL, "Size mismatch in child %d, read #%d, "
>> +				"for message got %d, expected %d",
>> +				child, (i + 1), buffer.data.len + 1, size);
>> +			return;
>> +		}
>> +		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
>> +			tst_res(TFAIL, "Verify failed in child %d read # = %d, "
>> +				"key = %lx\n", child, (i + 1), key);
>> +			return;
>> +		}
>> +		key++;
>> +	}
>> +}
>> +
>> +void fill_buffer(char *buf, char val, int size)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i<  size; i++)
>> +		buf[i] = val;
>> +}
>
> This is open-coded memset() please use memset() instead.
OK
>
>> +void do_writer(long key, int tid, long type, int child, int nreps)
>> +{
>> +	int i, size;
>> +	int id;
>> +	struct mbuffer buffer;
>> +
>> +	id = SAFE_MSGGET(key, 0);
>> +	if (id != tid) {
>> +		tst_res(TFAIL, "Message queue mismatch in the reader of child"
>> +			" group %d for message queue id %d\n", child, id);
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i<  nreps; i++) {
>> +		memset(&buffer, 0, sizeof(buffer));
>> +
>> +		do {
>> +			size = (lrand48() % 99);
>> +		} while (size == 0);
>> +		fill_buffer(buffer.data.pbytes, (key % 255), size);
>> +		buffer.data.len = size;
>> +		buffer.type = type;
>> +		SAFE_MSGSND(id,&buffer, size + 1, 0);
>> +		key++;
>> +	}
>> +}
>> diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
>> new file mode 100644
>> index 000000000..81e2f288b
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress_common.h
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> + */
>> +
>> +#ifndef MSGSTRESS_COMMON_H
>> +#define MSGSTRESS_COMMON_H
>> +
>> +#include<stdlib.h>
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "tst_test.h"
>> +
>> +struct mbuffer {
>> +	long type;
>> +	struct {
>> +		char len;
>> +		char pbytes[99];
>> +	} data;
>> +};
>> +
>> +void do_reader(long key, int tid, long type, int child, int nreps);
>> +void do_writer(long key, int tid, long type, int child, int nreps);
>> +
>> +#endif
>> +
>> --
>> 2.23.0
>>
>>
>>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
