Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D0305575
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:18:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B86E03C79D6
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 09:18:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D205E3C0194
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:18:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 41D8F1A00CCD
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 09:18:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 675C6AF17;
 Wed, 27 Jan 2021 08:18:34 +0000 (UTC)
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
 <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
 <87bldd9t9i.fsf@suse.de> <20210126212855.GC15365@pevik>
 <64f599af-f2a7-901d-06a6-a5ff56a107a2@hartkopp.net>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>, Oliver Hartkopp <socketcan@hartkopp.net>
In-reply-to: <64f599af-f2a7-901d-06a6-a5ff56a107a2@hartkopp.net>
Date: Wed, 27 Jan 2021 08:18:33 +0000
Message-ID: <87im7i94iu.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr & Oliver,

Oliver Hartkopp <socketcan@hartkopp.net> writes:

> Hi Petr,
>
> On 26.01.21 22:28, Petr Vorel wrote:
>> Hi Oliver, Richie,
>> 
>>>>> --- /dev/null
>>>>> +++ b/testcases/network/can/filter-tests/can_common.h
>>>>> @@ -0,0 +1,75 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * Copyright (c) 2021 SUSE LLC
>>>>> + */
>>>>> +
>>>>> +#include <stdio.h>
>>>>> +#include <stdlib.h>
>>>>> +#include <unistd.h>
>>>>> +#include <string.h>
>>>>> +
>>>>> +#include <sys/types.h>
>>>>> +#include <sys/socket.h>
>>>>> +#include <sys/ioctl.h>
>>>>> +#include <sys/time.h>
>>>>> +
>>>>> +#include "tst_cmd.h"
>>>>> +#include "tst_safe_stdio.h"
>>>>> +#include "tst_safe_file_ops.h"
>>>>> +
>>>>> +#include <linux/if.h>
>>>>> +#include <linux/can.h>
>>>>> +#include <linux/can/raw.h>
>>>>> +
>>>>> +#ifndef IFF_ECHO
>>>>> +# define IFF_ECHO (1<<18)
>>>>> +#endif
>> Thanks a lot, Richie!
>> 
>>>> IFF_ECHO was included into Linux 2.6.25 together with the CAN
>>>> subsystem itself.
>> 
>>>> So when you run the tests on Kernels < 2.6.25 you don't have CAN
>>>> support and don't need IFF_ECHO too.
>> 
>>> Petr, what kernel version and/or distro version did compilation fail on?
>> 
>>> There is a small chance someone might be compiling with old kernel
>>> headers relative to their kernel. However it is a challenge to compile
>>> LTP with such an old user land.
>> No, we don't support 2.6.25 :). I was playing with Buildroot distro
>> in my spare time.
>> These embedded toolchains suffer compatibility problems (usually uclibc-ng and
>> sometimes musl lack the support). This problem was when using sourcery-arm-*.
>
> :-/
>
>> But this is definitely not a blocker for this patchset. That lapi is not a must,
>> I can fix it some time later. I usually fix few of these problems before each
>> LTP release.
>
> Ok. No problem. I wasn't aware that e.g. musl or other toolchains
> select such strange starting points for their include files.

I wonder Petr, is it still necessary to define IFF_ECHO now only
<linux/if.h> is included? Or do they somehow symlink linux/if.h ->
net/if.h?

Indeed it seems the current version of uclibc-ng doesn't include
IFF_ECHO in <net/if.h>. OTOH musl does define it.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
