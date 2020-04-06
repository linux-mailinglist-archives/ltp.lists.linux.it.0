Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A677419F037
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 08:02:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 611C43C2DE7
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 08:02:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C23DD3C042A
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 08:02:00 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AE1AD1A00E69
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 08:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=KKav7
 v328E/IXT3a5s4Rirv1whhE3RuOcrl1XaY6LOo=; b=UJSPVz8+8lgelk2XG+Okb
 aaZOEzDIsZfWEnAox8rQjbxXgVwN3BRKONfI5g7F342vpHYREUy9h7kiI/t7CGce
 ulyXu1gixfS1tT2i9EroppV05FrikmkviYLgY9yN7wYBKCogYGs/misq1Mm7u8Sy
 RPEHSzcL/vHvfbEwNO4pxI=
Received: from [192.168.0.105] (unknown [112.22.73.173])
 by smtp8 (Coremail) with SMTP id DMCowABntfXOxYpevcDtCA--.49S2;
 Mon, 06 Apr 2020 14:01:50 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200403114418.GB26355@yuki.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <02f2d002-d2f6-ec03-86ee-5ecdfdde24bb@163.com>
Date: Mon, 6 Apr 2020 14:01:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403114418.GB26355@yuki.lan>
X-CM-TRANSID: DMCowABntfXOxYpevcDtCA--.49S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr1kKF43Ar1DAFW3Ww1ftFb_yoW8AFWfpa
 4UCF45CFWftr4xGFyaq3Z3AF15ZrW8Grs0kryxur1UJa42yw1Iqw1q9F1a9r97XFs7G348
 Zr1UWFyrCr4Fq37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b1a0PUUUUU=
X-Originating-IP: [112.22.73.173]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBRw-9hFO-+gHT3wAAsq
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
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

Hi Cyril

Thanks for your review.
> Hi!
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
> 
> I do wonder if there is actually a distrbution without the linux/loop.h
> header, have you seen one?
> 
No, I don't see this distribution. We can remove this.
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
