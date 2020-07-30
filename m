Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D26232C2E
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 09:00:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DA983C2615
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 09:00:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DDF813C0194
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 09:00:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5D3F61466090
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 09:00:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,413,1589212800"; d="scan'208";a="97096755"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 15:00:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6F2A54CE5444;
 Thu, 30 Jul 2020 15:00:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 15:00:26 +0800
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729143451.GG7152@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <320f25e9-f0e7-73a9-fe43-284befcce1e2@cn.fujitsu.com>
Date: Thu, 30 Jul 2020 15:00:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729143451.GG7152@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6F2A54CE5444.ACE0A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.6 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into
 new ipc library
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
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   include/libnewipc.h           |  28 ++++------
>>   libs/libltpnewipc/libnewipc.c | 101 ++++++++++++++++++++++++++++++++--
>>   2 files changed, 109 insertions(+), 20 deletions(-)
> 
> Just FYI we do not have to put all the code into a single *.c file, we
> can have as many as we want in the library directory...
I remember you have some comments on my previous patach as below:
------------------------------
So unless we plan to use it from different tests it does not make much
sense to export it to the top level include and libs.

Or alternatively we do have libltpnewipc we can pust put the
libnewmsgctl.c to that directory and with that we will have a single
System V IPC helper library.
------------------------------

So I merge libnewmsgctl.c into libnewipc.c.

ps: IMO, libnewipc has only three functions(getipckey,get_used_queues, 
probe_free_addr) ,It's hard to call it a LIBS library. Can we put it 
into lib directory and named it as tst_ipc.c?
@LI, What do you think about this?

> 
>>
>> diff --git a/include/libnewipc.h b/include/libnewipc.h
>> index 30288cd68..1256c4668 100644
>> --- a/include/libnewipc.h
>> +++ b/include/libnewipc.h
>> @@ -1,21 +1,7 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>>    * Copyright (c) 2016 Xiao Yang <yangx.jy@cn.fujitsu.com>
>>    *
>> - * This program is free software;  you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; either version 2 of the License, or
>> - * (at your option) any later version.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - * the GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program.
>> - */
>> -
>> -/*
>>    * common definitions for the IPC system calls.
>>    */
> 
> Ideally the changes in comments should be in a separate patch from
> functional changes.
Yes.
> 
>> @@ -56,4 +42,14 @@ void *probe_free_addr(const char *file, const int lineno);
>>   #define PROBE_FREE_ADDR() \
>>   	probe_free_addr(__FILE__, __LINE__)
>>   
>> -#endif /* newlibipc.h */
>> +void do_read(const char *file, const int lineno, long key, int tid, \
>> +	     long type, int child, int nreps);
>> +#define DO_READ(key, tid, type, child, nreps) \
>> +	do_read(__FILE__, __LINE__, (key), (tid), (type), (child), (nreps))
>> +
>> +void do_writer(const char *file, const int lineno, long key, int tid, \
>> +	       long type, int child, int nreps);
>> +#define DO_WRITER(key, tid, type, child, nreps) \
>> +	do_writer(__FILE__, __LINE__, (key), (tid), (type), (child), (nreps))
> 
> The naming here is a bit inconsistent, either we should have do_reader()
> and do_writer() or do_read() and do_write(), but mixing them like this
> is strange choice.
Sorry. Yes, I did't notice this. I will do_writer/do_reader pair.
> 
>> +#endif /* libnewipc.h */
>> diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
>> index 3734040b7..4980ce078 100644
>> --- a/libs/libltpnewipc/libnewipc.c
>> +++ b/libs/libltpnewipc/libnewipc.c
>> @@ -1,10 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   /*
>>    * Copyright (c) 2016 Xiao Yang <yangx.jy@cn.fujitsu.com>
>> - */
>> -
>> -/*
>> - * DESCRIPTION
>> + *
>>    * common routines for the IPC system call tests.
>>    */
>>   
>> @@ -26,6 +23,14 @@
>>   
>>   #define BUFSIZE 1024
>>   
>> +struct mbuffer {
>> +	long type;
>> +	struct {
>> +		char len;
>> +		char pbytes[99];
>> +	} data;
>> +};
>> +
>>   key_t getipckey(const char *file, const int lineno)
>>   {
>>   	char buf[BUFSIZE];
>> @@ -86,3 +91,91 @@ void *probe_free_addr(const char *file, const int lineno)
>>   
>>   	return addr;
>>   }
>> +
>> +int verify(char *buf, char val, int size, int child)
>> +{
>> +	while (size-- > 0) {
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
>> +void do_reader(const char *file, const int lineno, long key, int tid,
>> +	       long type, int child, int nreps)
>> +{
>> +	int i, size;
>> +	int id;
>> +	struct mbuffer buffer;
>> +
>> +	id = safe_msgget(file, lineno, key, 0);
>> +	if (id != tid) {
>> +		tst_res(TFAIL,
>> +			"Message queue mismatch in the reader of child group"
>> +			" %d for message queue id %d\n", child, id);
>> +		return;
>> +	}
>> +	for (i = 0; i < nreps; i++) {
>> +		memset(&buffer, 0, sizeof(buffer));
>> +
>> +		size = safe_msgrcv(file, lineno, id, &buffer, 100, type, 0);
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
>> +	for (i = 0; i < size; i++)
>> +		buf[i] = val;
>> +}
>> +
>> +void do_writer(const char *file, const int lineno, long key, int tid,
>> +	       long type, int child, int nreps)
>> +{
>> +	int i, size;
>> +	int id;
>> +	struct mbuffer buffer;
>> +
>> +	id = safe_msgget(file, lineno, key, 0);
>> +	if (id != tid) {
>> +		tst_res(TFAIL, "Message queue mismatch in the reader of child"
>> +			" group %d for message queue id %d\n", child, id);
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < nreps; i++) {
>> +		memset(&buffer, 0, sizeof(buffer));
>> +
>> +		do {
>> +			size = (lrand48() % 99);
>> +		} while (size == 0);
>> +		fill_buffer(buffer.data.pbytes, (key % 255), size);
>> +		buffer.data.len = size;
>> +		buffer.type = type;
>> +		safe_msgsnd(file, lineno, id, &buffer, size + 1, 0);
>> +		key++;
>> +	}
>> +}
>> -- 
>> 2.23.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
