Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1571A3252
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:14:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BD043C2CDF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:14:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 440443C2CC3
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:14:21 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5256A1A01529
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:14:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88748001"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:14:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id ADF5850A9999;
 Thu,  9 Apr 2020 18:03:42 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:14:06 +0800
To: Martin Doucha <mdoucha@suse.cz>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <6bb6bc11-c3c0-48e5-0a67-80b246dfbe4b@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <66b22f28-b53f-98f9-1021-26dbcfa41091@cn.fujitsu.com>
Date: Thu, 9 Apr 2020 18:14:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <6bb6bc11-c3c0-48e5-0a67-80b246dfbe4b@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ADF5850A9999.AD737
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 01/10] lapi: Add a configure check and fallback
 for loop ioctl and flag
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

Hi Martin

> Hi,
> 
> On 02. 04. 20 17:06, Yang Xu wrote:
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   configure.ac        |  1 +
>>   include/lapi/loop.h | 35 +++++++++++++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 include/lapi/loop.h
>>
>> diff --git a/configure.ac b/configure.ac
>> index e1069b57e..e088cb564 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -50,6 +50,7 @@ AC_CHECK_HEADERS([ \
>>       linux/if_ether.h \
>>       linux/if_packet.h \
>>       linux/keyctl.h \
>> +    linux/loop.h \
>>       linux/mempolicy.h \
>>       linux/module.h \
>>       linux/netlink.h \
>> diff --git a/include/lapi/loop.h b/include/lapi/loop.h
>> new file mode 100644
>> index 000000000..bc6d9950d
>> --- /dev/null
>> +++ b/include/lapi/loop.h
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> 
> Here's a little legal issue for LTP: "GPL" and "All rights reserved" are
> mutually exclusive. Those two lines are effectively saying that your
> code is both open-source and proprietary at the same time. Please pick
> one, or the other. It can't be both.
I never think this is a problem before. ltp has some cases also using 
this style. Also, xfstests have many cases like this.  Even kernel, it 
also has the two line. Is it a problem?

Best Regards
Yang Xu
> 
>> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> + */
>> +#ifndef LAPI_LOOP_H
>> +#define LAPI_LOOP_H
>> +
>> +#include <linux/types.h>
>> +#ifdef HAVE_LINUX_LOOP_H
>> +# include <linux/loop.h>
>> +#endif
>> +
>> +#ifndef LO_FLAGS_PARTSCAN
>> +# define LO_FLAGS_PARTSCAN 8
>> +#endif
>> +
>> +#ifndef LO_FLAGS_DIRECT_IO
>> +# define LO_FLAGS_DIRECT_IO 16
>> +#endif
>> +
>> +#ifndef LOOP_SET_CAPACITY
>> +# define LOOP_SET_CAPACITY 0x4C07
>> +#endif
>> +
>> +#ifndef LOOP_SET_DIRECT_IO
>> +# define LOOP_SET_DIRECT_IO 0x4C08
>> +#endif
>> +
>> +#ifndef LOOP_SET_BLOCK_SIZE
>> +# define LOOP_SET_BLOCK_SIZE 0x4C09
>> +#endif
>> +
>> +#endif
>> +
>>
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
