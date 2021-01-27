Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2030630550B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 08:52:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A75243C4FB1
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 08:52:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1C1A93C01C3
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 08:52:53 +0100 (CET)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.219])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F2B6E1400E55
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 08:52:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611733972;
 s=strato-dkim-0002; d=hartkopp.net;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=6hw3wFjxLaMNsfWzr8wfI0Pit3rYtFzmPxn+oIQNvdA=;
 b=ZJQT3moXGpCkxSXFQyA5SUD6pe/9GuI0AnuQ6tIskbXKxIiYCTlC+DoVK7+TujMDuP
 5IC7z8BnRYFSKwbE3LOW3pPnwKXJvy7MCD0Ga/SrFxi4+eqhzD1uXXfLtznRAmIdrlwc
 uyCFPfcYq7TB8B2/mpUuu9L8KLDHAdI+utQamC0PoSamFgc9Mn1uq8QBnzp9bnH+uMjj
 ZLno5poGTSdEnrSZJQ0uJ86pOhYdc+AZ68GgBFayXS+/AZINeXEE6XjeLvaL0Gxg6Ly7
 c9YIuxJzHCg2KV1BpkGdzI0JthTTfRm13t0FUBy8W8YzxH9YO0L0TzKehuaJiQf0xSjI
 YM0w==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3TMaFqTEVR9J8xty10="
X-RZG-CLASS-ID: mo00
Received: from [192.168.10.137] by smtp.strato.de (RZmta 47.15.2 SBL|AUTH)
 with ESMTPSA id 60826fx0R7qo2lv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 27 Jan 2021 08:52:50 +0100 (CET)
To: Petr Vorel <pvorel@suse.cz>, Richard Palethorpe <rpalethorpe@suse.de>
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
 <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net> <87bldd9t9i.fsf@suse.de>
 <20210126212855.GC15365@pevik>
From: Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <64f599af-f2a7-901d-06a6-a5ff56a107a2@hartkopp.net>
Date: Wed, 27 Jan 2021 08:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126212855.GC15365@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/7] can: Add can_common.h for vcan device setup
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 26.01.21 22:28, Petr Vorel wrote:
> Hi Oliver, Richie,
> 
>>>> --- /dev/null
>>>> +++ b/testcases/network/can/filter-tests/can_common.h
>>>> @@ -0,0 +1,75 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Copyright (c) 2021 SUSE LLC
>>>> + */
>>>> +
>>>> +#include <stdio.h>
>>>> +#include <stdlib.h>
>>>> +#include <unistd.h>
>>>> +#include <string.h>
>>>> +
>>>> +#include <sys/types.h>
>>>> +#include <sys/socket.h>
>>>> +#include <sys/ioctl.h>
>>>> +#include <sys/time.h>
>>>> +
>>>> +#include "tst_cmd.h"
>>>> +#include "tst_safe_stdio.h"
>>>> +#include "tst_safe_file_ops.h"
>>>> +
>>>> +#include <linux/if.h>
>>>> +#include <linux/can.h>
>>>> +#include <linux/can/raw.h>
>>>> +
>>>> +#ifndef IFF_ECHO
>>>> +# define IFF_ECHO (1<<18)
>>>> +#endif
> Thanks a lot, Richie!
> 
>>> IFF_ECHO was included into Linux 2.6.25 together with the CAN
>>> subsystem itself.
> 
>>> So when you run the tests on Kernels < 2.6.25 you don't have CAN
>>> support and don't need IFF_ECHO too.
> 
>> Petr, what kernel version and/or distro version did compilation fail on?
> 
>> There is a small chance someone might be compiling with old kernel
>> headers relative to their kernel. However it is a challenge to compile
>> LTP with such an old user land.
> 
> No, we don't support 2.6.25 :). I was playing with Buildroot distro in my spare time.
> These embedded toolchains suffer compatibility problems (usually uclibc-ng and
> sometimes musl lack the support). This problem was when using sourcery-arm-*.

:-/

> But this is definitely not a blocker for this patchset. That lapi is not a must,
> I can fix it some time later. I usually fix few of these problems before each
> LTP release.

Ok. No problem. I wasn't aware that e.g. musl or other toolchains select 
such strange starting points for their include files.

Thanks,
Oliver

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
