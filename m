Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DF2FC25D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 22:34:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A1B63C30CC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 22:34:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 02A113C2657
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 22:34:38 +0100 (CET)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 58EE8600A62
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 22:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611092076;
 s=strato-dkim-0002; d=hartkopp.net;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:From:
 Subject:Sender;
 bh=szSf/fv/ZmtKjy6LNU3aUDR+VYBcZ5uxizTWwHfjSVE=;
 b=MDTyiI47BCYgkIE1N/C2SBeXLaE8N7m6VcuB0bQOf+qvaSYF9To707tkNTekcCPYyD
 5X5gZjt/1FilOtohN9TUFd9e1ucu0jm/riTacJe/cjmcdw5RgszHVbLMuPKbNyKYl5Go
 t/CkPU3jHA8cWGc0IPxcmQ8uJdiqthv+ujtKRky4AWn0ghtARkBdRgOoEke2b9W5O5ds
 fUntBBn5faK4KrpV4zm4K+FpamVccAnbifPo4uQ8IMN44qdwN/MS/+EJtW+FcbUAQHSI
 5E4+Fc13RdRot+ZapWaHNuQOgCqmzCv0zUYwTVR1LGwAj0ZufgljWi4u/7pB+5/vIjjM
 1wNQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3TMaFqTGVNiOMtqpw=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.10.177] by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id k075acx0JLYVhaY
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 19 Jan 2021 22:34:31 +0100 (CET)
To: Marc Kleine-Budde <mkl@pengutronix.de>, rpalethorpe@suse.de
References: <20210119093143.17222-1-rpalethorpe@suse.com>
 <20210119093143.17222-5-rpalethorpe@suse.com>
 <322f1056-0a73-65e6-531a-3275029df256@pengutronix.de>
 <YAb1Wncn2/x6LBYj@yuki.lan>
 <3277a88e-0301-7f3d-b024-c728e1041092@pengutronix.de>
 <87bldkq41l.fsf@suse.de>
 <85d808dd-c8c3-1216-ee6e-94d63ddf0f2b@pengutronix.de>
From: Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <29fef223-bb59-bc88-8e3c-6e63de0af210@hartkopp.net>
Date: Tue, 19 Jan 2021 22:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <85d808dd-c8c3-1216-ee6e-94d63ddf0f2b@pengutronix.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/6] can_recv_own_msgs: Convert to new library
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
Cc: ltp@lists.linux.it, linux-can@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 19.01.21 17:39, Marc Kleine-Budde wrote:
> On 1/19/21 5:34 PM, Richard Palethorpe wrote:
>> Hello All,
>>
>> Marc Kleine-Budde <mkl@pengutronix.de> writes:
>>
>>> On 1/19/21 4:06 PM, Cyril Hrubis wrote:
>>>> Hi!
>>>>>>   /*
>>>>>> - * tst-rcv-own-msgs.c
>>>>>> - *
>>>>>> - * Copyright (c) 2010 Volkswagen Group Electronic Research
>>>>>> - * All rights reserved.
>>>>>> - *
>>>>>> - * Redistribution and use in source and binary forms, with or without
>>>>>> - * modification, are permitted provided that the following conditions
>>>>>> - * are met:
>>>>>> - * 1. Redistributions of source code must retain the above copyright
>>>>>> - *    notice, this list of conditions and the following disclaimer.
>>>>>> - * 2. Redistributions in binary form must reproduce the above copyright
>>>>>> - *    notice, this list of conditions and the following disclaimer in the
>>>>>> - *    documentation and/or other materials provided with the distribution.
>>>>>> - * 3. Neither the name of Volkswagen nor the names of its contributors
>>>>>> - *    may be used to endorse or promote products derived from this software
>>>>>> - *    without specific prior written permission.
>>>>>
>>>>> IANAL, I think you're missing this license. Is looks like some sort
>>>>> of BSD to me.
>>
>> Ufff, thanks, I should pay more attention when it is a test imported
>> from elsewhere.
>>
>>>>>
>>>>>> - *
>>>>>> - * Alternatively, provided that this notice is retained in full, this
>>>>>> - * software may be distributed under the terms of the GNU General
>>>>>> - * Public License ("GPL") version 2, in which case the provisions of the
>>>>>> - * GPL apply INSTEAD OF those given above.
>>>>>
>>>>> It doesn't say "or later".
>>>>
>>>> Looks like we cannot just remove this license. So what about moving this
>>>> text into a separate COPYING file and changing the SPDX to GPL-v2.0?
>>>
>>> This file is dual licensed, better keep it dual licensed.
>>>
>>> regards,
>>> Marc
>>
>> HHmm, this appears to be the BSD-3-Clause license with the following
>> text inserted in the middle:
>>
>>   * Alternatively, provided that this notice is retained in full, this
>>   * software may be distributed under the terms of the GNU General
>>   * Public License ("GPL") version 2, in which case the provisions of the
>>   * GPL apply INSTEAD OF those given above.
>>   *
>>   * The provided data structures and external interfaces from this code
>>   * are not restricted to be used by modules with a GPL compatible license.
>>
>> I don't see any corresponding SPDX identifier or exception for this. It
>> is probably easiest and safest just to keep it as-is.
> 
> I think the Linux kernel uses:
> 
> /* SPDX-License-Identifier: ((GPL-2.0-only WITH Linux-syscall-note) OR
> BSD-3-Clause) */
> 
> e.g.:
> 
> https://elixir.bootlin.com/linux/v5.10/source/include/uapi/linux/can/gw.h
> 

Thanks Marc!

Yes, indeed it is a GPLv2 / BSD3 dual license to use it in both 
environments.

Regards,
Oliver

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
