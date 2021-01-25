Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9133023FC
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:59:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E82D43C52B2
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:59:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1887E3C042D
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:59:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 135D36009FD
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:59:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C6CEAD8C;
 Mon, 25 Jan 2021 10:59:38 +0000 (UTC)
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
 <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Oliver Hartkopp <socketcan@hartkopp.net>, Petr Vorel <pvorel@suse.cz>
In-reply-to: <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
Date: Mon, 25 Jan 2021 10:59:37 +0000
Message-ID: <87bldd9t9i.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

Hello Oliver and Petr,

Oliver Hartkopp <socketcan@hartkopp.net> writes:

> Hello Richard,
>
> On 20.01.21 15:37, Richard Palethorpe wrote:
>> Note that we call modprobe to set echo=1. However this does seem to be
>> necessary for the current tests on 5.10. It has been kept to avoid
>> changing the test behavior unnecessarily, but can most likely be
>> safely removed if it causes problems.
>
> Without echo=1 a shortcut in af_can.c is used.
>
> I just checked that it works too - but with echo=1 we increase the
> test coverage to a test of the message flow down to the virtual CAN
> driver vcan.

Ah, thanks, I will amend the comments.

>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>   .../network/can/filter-tests/can_common.h     | 75 +++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>   create mode 100644 testcases/network/can/filter-tests/can_common.h
>> diff --git a/testcases/network/can/filter-tests/can_common.h
>> b/testcases/network/can/filter-tests/can_common.h
>> new file mode 100644
>> index 000000000..f15145f30
>> --- /dev/null
>> +++ b/testcases/network/can/filter-tests/can_common.h
>> @@ -0,0 +1,75 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 SUSE LLC
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <unistd.h>
>> +#include <string.h>
>> +
>> +#include <sys/types.h>
>> +#include <sys/socket.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/time.h>
>> +
>> +#include "tst_cmd.h"
>> +#include "tst_safe_stdio.h"
>> +#include "tst_safe_file_ops.h"
>> +
>> +#include <linux/if.h>
>> +#include <linux/can.h>
>> +#include <linux/can/raw.h>
>> +
>> +#ifndef IFF_ECHO
>> +# define IFF_ECHO (1<<18)
>> +#endif
>
> IFF_ECHO was included into Linux 2.6.25 together with the CAN
> subsystem itself.
>
> So when you run the tests on Kernels < 2.6.25 you don't have CAN
> support and don't need IFF_ECHO too.

Petr, what kernel version and/or distro version did compilation fail on?

There is a small chance someone might be compiling with old kernel
headers relative to their kernel. However it is a challenge to compile
LTP with such an old user land.

>
> Regards,
> Oliver
>
>> +
>> +static char *can_dev_name;
>> +static int can_created_dev;
>> +
>> +static void can_cmd(const char *const argv[])
>> +{
>> +	tst_cmd(argv, NULL, NULL, TST_CMD_TCONF_ON_MISSING);
>> +}
>> +
>> +#define CAN_CMD(...) can_cmd((const char *const[]){ __VA_ARGS__, NULL })
>> +
>> +static void can_setup_vcan(void)
>> +{
>> +	unsigned int flags;
>> +	char *path;
>> +
>> +	if (can_dev_name)
>> +		goto check_echo;
>> +
>> +	can_dev_name = "vcan0";
>> +
>> +	tst_res(TINFO, "Creating vcan0 device; use -D option to avoid this");
>> +
>> +	CAN_CMD("modprobe", "-r", "vcan");
>> +	CAN_CMD("modprobe", "vcan", "echo=1");
>> +
>> +	can_created_dev = 1;
>> +
>> +	CAN_CMD("ip", "link", "add", "dev", "vcan0", "type", "vcan");
>> +	CAN_CMD("ip", "link", "set", "dev", "vcan0", "up");
>> +
>> +check_echo:
>> +	/* Precondition for the frame flow test? */
>> +	SAFE_ASPRINTF(&path, "/sys/class/net/%s/flags", can_dev_name);
>> +	if (FILE_SCANF(path, "%x", &flags) || !(flags & IFF_ECHO)) {
>> +		tst_res(TWARN, "Could not determine if ECHO is set on %s",
>> +			can_dev_name);
>> +	}
>> +}
>> +
>> +static void can_cleanup_vcan(void)
>> +{
>> +	if (!can_created_dev)
>> +		return;
>> +
>> +	CAN_CMD("ip", "link", "set", "dev", "vcan0", "down");
>> +	CAN_CMD("ip", "link", "del", "dev", "vcan0");
>> +	CAN_CMD("modprobe", "-r", "vcan");
>> +}
>> 


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
