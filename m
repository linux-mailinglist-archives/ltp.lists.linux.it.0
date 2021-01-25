Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F630238F
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:20:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA4853C52AA
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:20:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BD5663C2948
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:20:31 +0100 (CET)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6BE706002F4
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611570029;
 s=strato-dkim-0002; d=hartkopp.net;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:From:
 Subject:Sender;
 bh=lFAuS/sgHOUb2ncpj7VsITK/pd5OuzCG2iodqvLn4cU=;
 b=f4hKx8+ca6ArHfk+fKmG37hYfo5BFLMZkqoKkoySv6od7SqgQTX52m6fEFMo7dIgDb
 UlWMUhhn8b94YXudFdshOwGSIKK9iqd4g397G47PvWt8OrOf5i+tSBfdxCsGpz+vVlII
 O/MTx/EplEs2Zbp7j9a3sJ2rsyyYftXOLhkT6+d9W12J2e3g/RuNBfdxBP2GEQsCZUSK
 kB+GWs2EmkrqCv8d3pORpQFCL3ZSjQeY0yA93Fgfekp07m4pjOafXFDxzE/qUiZFSRi+
 a9nemJ86BqyCoP/Rz0RXquHTypRORJ8w690ZBkj7wTyboF70C8m08uLM8ziez6ate1qj
 VVdQ==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1o3TMaFqTEVR/J8xty10="
X-RZG-CLASS-ID: mo00
Received: from [192.168.10.137] by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id k075acx0PAKRxO6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 25 Jan 2021 11:20:27 +0100 (CET)
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210120143723.26483-1-rpalethorpe@suse.com>
 <20210120143723.26483-3-rpalethorpe@suse.com>
From: Oliver Hartkopp <socketcan@hartkopp.net>
Message-ID: <058a6f05-d5ca-0746-dc4e-007253d3a84d@hartkopp.net>
Date: Mon, 25 Jan 2021 11:20:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120143723.26483-3-rpalethorpe@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Richard,

On 20.01.21 15:37, Richard Palethorpe wrote:
> Note that we call modprobe to set echo=1. However this does seem to be
> necessary for the current tests on 5.10. It has been kept to avoid
> changing the test behavior unnecessarily, but can most likely be
> safely removed if it causes problems.

Without echo=1 a shortcut in af_can.c is used.

I just checked that it works too - but with echo=1 we increase the test 
coverage to a test of the message flow down to the virtual CAN driver vcan.

> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   .../network/can/filter-tests/can_common.h     | 75 +++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 testcases/network/can/filter-tests/can_common.h
> 
> diff --git a/testcases/network/can/filter-tests/can_common.h b/testcases/network/can/filter-tests/can_common.h
> new file mode 100644
> index 000000000..f15145f30
> --- /dev/null
> +++ b/testcases/network/can/filter-tests/can_common.h
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 SUSE LLC
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <string.h>
> +
> +#include <sys/types.h>
> +#include <sys/socket.h>
> +#include <sys/ioctl.h>
> +#include <sys/time.h>
> +
> +#include "tst_cmd.h"
> +#include "tst_safe_stdio.h"
> +#include "tst_safe_file_ops.h"
> +
> +#include <linux/if.h>
> +#include <linux/can.h>
> +#include <linux/can/raw.h>
> +
> +#ifndef IFF_ECHO
> +# define IFF_ECHO (1<<18)
> +#endif

IFF_ECHO was included into Linux 2.6.25 together with the CAN subsystem 
itself.

So when you run the tests on Kernels < 2.6.25 you don't have CAN support 
and don't need IFF_ECHO too.

Regards,
Oliver

> +
> +static char *can_dev_name;
> +static int can_created_dev;
> +
> +static void can_cmd(const char *const argv[])
> +{
> +	tst_cmd(argv, NULL, NULL, TST_CMD_TCONF_ON_MISSING);
> +}
> +
> +#define CAN_CMD(...) can_cmd((const char *const[]){ __VA_ARGS__, NULL })
> +
> +static void can_setup_vcan(void)
> +{
> +	unsigned int flags;
> +	char *path;
> +
> +	if (can_dev_name)
> +		goto check_echo;
> +
> +	can_dev_name = "vcan0";
> +
> +	tst_res(TINFO, "Creating vcan0 device; use -D option to avoid this");
> +
> +	CAN_CMD("modprobe", "-r", "vcan");
> +	CAN_CMD("modprobe", "vcan", "echo=1");
> +
> +	can_created_dev = 1;
> +
> +	CAN_CMD("ip", "link", "add", "dev", "vcan0", "type", "vcan");
> +	CAN_CMD("ip", "link", "set", "dev", "vcan0", "up");
> +
> +check_echo:
> +	/* Precondition for the frame flow test? */
> +	SAFE_ASPRINTF(&path, "/sys/class/net/%s/flags", can_dev_name);
> +	if (FILE_SCANF(path, "%x", &flags) || !(flags & IFF_ECHO)) {
> +		tst_res(TWARN, "Could not determine if ECHO is set on %s",
> +			can_dev_name);
> +	}
> +}
> +
> +static void can_cleanup_vcan(void)
> +{
> +	if (!can_created_dev)
> +		return;
> +
> +	CAN_CMD("ip", "link", "set", "dev", "vcan0", "down");
> +	CAN_CMD("ip", "link", "del", "dev", "vcan0");
> +	CAN_CMD("modprobe", "-r", "vcan");
> +}
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
