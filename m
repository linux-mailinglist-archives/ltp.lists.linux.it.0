Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75E2FBC83
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 17:34:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 230783C30C8
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 17:34:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 51E383C0BCB
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 17:34:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 815A6600579
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 17:34:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0D53AE55;
 Tue, 19 Jan 2021 16:34:15 +0000 (UTC)
References: <20210119093143.17222-1-rpalethorpe@suse.com>
 <20210119093143.17222-5-rpalethorpe@suse.com>
 <322f1056-0a73-65e6-531a-3275029df256@pengutronix.de>
 <YAb1Wncn2/x6LBYj@yuki.lan>
 <3277a88e-0301-7f3d-b024-c728e1041092@pengutronix.de>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-reply-to: <3277a88e-0301-7f3d-b024-c728e1041092@pengutronix.de>
Date: Tue, 19 Jan 2021 16:34:14 +0000
Message-ID: <87bldkq41l.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: Oliver Hartkopp <socketcan@hartkopp.net>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello All,

Marc Kleine-Budde <mkl@pengutronix.de> writes:

> On 1/19/21 4:06 PM, Cyril Hrubis wrote:
>> Hi!
>>>>  /*
>>>> - * tst-rcv-own-msgs.c
>>>> - *
>>>> - * Copyright (c) 2010 Volkswagen Group Electronic Research
>>>> - * All rights reserved.
>>>> - *
>>>> - * Redistribution and use in source and binary forms, with or without
>>>> - * modification, are permitted provided that the following conditions
>>>> - * are met:
>>>> - * 1. Redistributions of source code must retain the above copyright
>>>> - *    notice, this list of conditions and the following disclaimer.
>>>> - * 2. Redistributions in binary form must reproduce the above copyright
>>>> - *    notice, this list of conditions and the following disclaimer in the
>>>> - *    documentation and/or other materials provided with the distribution.
>>>> - * 3. Neither the name of Volkswagen nor the names of its contributors
>>>> - *    may be used to endorse or promote products derived from this software
>>>> - *    without specific prior written permission.
>>>
>>> IANAL, I think you're missing this license. Is looks like some sort
>>> of BSD to me.

Ufff, thanks, I should pay more attention when it is a test imported
from elsewhere.

>>>
>>>> - *
>>>> - * Alternatively, provided that this notice is retained in full, this
>>>> - * software may be distributed under the terms of the GNU General
>>>> - * Public License ("GPL") version 2, in which case the provisions of the
>>>> - * GPL apply INSTEAD OF those given above.
>>>
>>> It doesn't say "or later".
>> 
>> Looks like we cannot just remove this license. So what about moving this
>> text into a separate COPYING file and changing the SPDX to GPL-v2.0?
>
> This file is dual licensed, better keep it dual licensed.
>
> regards,
> Marc

HHmm, this appears to be the BSD-3-Clause license with the following
text inserted in the middle:

 * Alternatively, provided that this notice is retained in full, this
 * software may be distributed under the terms of the GNU General
 * Public License ("GPL") version 2, in which case the provisions of the
 * GPL apply INSTEAD OF those given above.
 *
 * The provided data structures and external interfaces from this code
 * are not restricted to be used by modules with a GPL compatible license.

I don't see any corresponding SPDX identifier or exception for this. It
is probably easiest and safest just to keep it as-is.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
