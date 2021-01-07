Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6A2ED223
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 15:32:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDA3C3C6542
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 15:32:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C2EF03C5493
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 15:31:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 249941A00F26
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 15:31:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 656B9B732;
 Thu,  7 Jan 2021 14:31:55 +0000 (UTC)
Date: Thu, 7 Jan 2021 15:32:50 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: gengcixi@gmail.com
Message-ID: <X/cbkj65+VRafj6y@yuki.lan>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-4-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223033517.1464263-4-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] rtc02: add rtc set time verify case
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
Cc: Cixi Geng <cixi.geng1@unisoc.com>, ltp@lists.linux.it, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Test for the Real Time Clock driver.
>  * Veirify that,
>  * 1) set a RTC time
>  * 2) read the RTC time after set RTC time at once
>  * 3) compare the set time and the read is identical
> 
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> ---
>  runtest/kernel_misc                           |   1 +
>  .../kernel/device-drivers/rtc/.gitignore      |   1 +
>  testcases/kernel/device-drivers/rtc/rtc02.c   | 108 ++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 testcases/kernel/device-drivers/rtc/rtc02.c
> 
> diff --git a/runtest/kernel_misc b/runtest/kernel_misc
> index 7937c7bbf..abb75ebaf 100644
> --- a/runtest/kernel_misc
> +++ b/runtest/kernel_misc
> @@ -1,6 +1,7 @@
>  kmsg01 kmsg01
>  fw_load fw_load
>  rtc01 rtc01
> +rtc02 rtc02
>  block_dev block_dev
>  tpci tpci
>  tbio tbio
> diff --git a/testcases/kernel/device-drivers/rtc/.gitignore b/testcases/kernel/device-drivers/rtc/.gitignore
> index 8412fe679..0c0161eba 100644
> --- a/testcases/kernel/device-drivers/rtc/.gitignore
> +++ b/testcases/kernel/device-drivers/rtc/.gitignore
> @@ -1 +1,2 @@
>  /rtc01
> +/rtc02
> diff --git a/testcases/kernel/device-drivers/rtc/rtc02.c b/testcases/kernel/device-drivers/rtc/rtc02.c
> new file mode 100644
> index 000000000..cb8f7fea0
> --- /dev/null
> +++ b/testcases/kernel/device-drivers/rtc/rtc02.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Communications Inc.
> + *
> + * Filename : rtc02.c

This is pretty much useless information.

> + * Abstract : This file is a implementation test rtc set function.

And this as well as we do have a test description in the separate
comment.

> + */
> +
> +/*
> + * Test description
> + *
> + * Test for the Real Time Clock driver.
> + * Veirify that,
> + * 1) set a RTC time
> + * 2) read the RTC time after set RTC time at once
> + * 3) compare the set time and the read is identical
> + *
> + */

Can you please reformat this into special asciidoc formatted comment so
that it's picked up correctly by the documentation parser?

Have a look for example at top level comment in syscalls/ipc/shmctl/shmctl01.c

> +#include "tst_rtctime.h"
> +#include "tst_wallclock.h"
> +#include "tst_test.h"
> +
> +static struct rtc_time show_tm;
> +
> +static char *tst_show_rtctime(struct rtc_time *tm)

This function should be rather named rtctime_to_str() or something along
these lines, also test functions must not start with tst_ that prefix is
reserved to test library.

> +{
> +	static char rtctime_buf[20];
> +
> +	sprintf(rtctime_buf, "%04d-%02d-%02d %02d:%02d:%02d",
> +		tm->tm_year + 1900,
> +		tm->tm_mon + 1,
> +		tm->tm_mday,
> +		tm->tm_hour,
> +		tm->tm_min,
> +		tm->tm_sec);
> +	return rtctime_buf;
> +}
> +
> +static void rtc_setup(void)
> +{
> +	tst_rtctime_save();
> +}
> +
> +static int rtc_tm_cmp(struct rtc_time *set_tm, struct rtc_time *read_tm)
> +{
> +	if ((set_tm->tm_sec == read_tm->tm_sec)
> +		&& (set_tm->tm_min == read_tm->tm_min)
> +		&& (set_tm->tm_hour == read_tm->tm_hour)
> +		&& (set_tm->tm_mday == read_tm->tm_mday)
> +		&& (set_tm->tm_mon == read_tm->tm_mon)
> +		&& (set_tm->tm_year == read_tm->tm_year)) {
> +		return 0;
> +	}
> +	return -1;

This can be just:

	return !((set_tm->tm_sec == read_tm->tm_sec) &&
	         ...);

> +}
> +
> +static void set_rtc_test(void)
> +{
> +	struct rtc_time read_tm;
> +	int ret;
> +
> +	struct rtc_time set_tm = {
> +		.tm_sec = 30,
> +		.tm_min = 23,
> +		.tm_hour = 13,
> +		.tm_mday = 9,
> +		.tm_mon = 9,
> +		.tm_year = 120,
> +	};
> +
> +	/* set rtc to 2020.10.9 13:23:30 */
> +	tst_res(TINFO, "To set RTC date/time is: %s", tst_show_rtctime(&set_tm));
> +
> +	ret = tst_rtc_settime(&set_tm);
> +	if (ret != 0) {
> +		tst_res(TFAIL | TERRNO, "RTC_SET_TIME failed");
> +		return;
> +	}
> +
> +	/* Read current RTC Time */
> +	ret = tst_rtc_gettime(&read_tm);
> +	if (ret != 0) {
> +		tst_res(TFAIL | TERRNO, "RTC_RD_TIME failed");
> +		return;
> +	}
> +	tst_res(TINFO, "read RTC date/time is: %s", tst_show_rtctime(&read_tm));
> +
> +	if (rtc_tm_cmp(&set_tm, &read_tm)) {
> +		tst_res(TFAIL | TERRNO, "RTC SET TEST Failed");
> +		return;
> +	}
> +	tst_res(TPASS, "The read RTC time is consistent with set");
> +
> +}
> +
> +static void rtc_cleanup(void)
> +{
> +	tst_rtctime_restore();
> +}
> +
> +static struct tst_test test = {
> +	.setup = rtc_setup,
> +	.test_all = set_rtc_test,
> +	.cleanup = rtc_cleanup,
> +	/* tests needs to run with UID=0 */
> +	.needs_root = 1,
> +};
> -- 
> 2.25.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
