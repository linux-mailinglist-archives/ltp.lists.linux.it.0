Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A11072CBDA4
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 14:02:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F9C23C4CDF
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 14:02:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A83E3C4CC3
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 14:02:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5CC4E1A00F65
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 14:02:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FF1CAB63;
 Wed,  2 Dec 2020 13:02:11 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:03:04 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: gengcixi@gmail.com
Message-ID: <20201202130304.GB849@yuki.lan>
References: <20201126110710.436277-1-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126110710.436277-1-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] device-drivers/rtc: add rtc02 test
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
Cc: Xiaopeng Bai <xiaopeng.bai@unisoc.com>, Cixi Geng <cixi.geng1@unisoc.com>,
 ltp@lists.linux.it, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  runtest/kernel_misc                         |   1 +
>  testcases/kernel/device-drivers/rtc/rtc02.c | 119 ++++++++++++++++++++

Missing .gitignore entry, please add it.

> diff --git a/testcases/kernel/device-drivers/rtc/rtc02.c b/testcases/kernel/device-drivers/rtc/rtc02.c
> new file mode 100644
> index 000000000..cce799670
> --- /dev/null
> +++ b/testcases/kernel/device-drivers/rtc/rtc02.c
> @@ -0,0 +1,119 @@
> +/*
> + * Test for the Real Time Clock driver.

This test description should be more verbose, e.g. what exactly we do in
the test and in a separate documentation comment.

See:

https://github.com/linux-test-project/ltp/blob/master/docparse/README.md

> + * 
     ^
Trailing whitespace.

Also there are many different minor coding style violations as well.
Please use checkpatch.pl (which is distributed along linux kernel
sources) to check for common mistakes before sending patches to mailing
list.

> + * SPDX-License-Identifier: GPL-2.0-or-later

This should be on a first line of the souce and the line should start
with //

> + * Copyright (C) 2019, Unisoc Communications Inc.
> + *
> + * Author: Xiaopeng Bai <xiaopeng.bai@unisoc.com>
> + * Author: Cixi Geng  <cixi.gegn1@unisoc.com>
> + *
> + */
> +#include <sys/ioctl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <linux/rtc.h>
> +#include <errno.h>
> +#include <time.h>
> +
> +#include "tst_test.h"
> +
> +int rtc_fd = -1;

Missing static.

> +static char *rtc_dev = "/dev/rtc";
> +
> +static struct tst_option rtc_options[] = {
> +	{"d:", &rtc_dev, "test driver device name"},
> +	{NULL, NULL, NULL}
> +};
> +
> +static void help(void)
> +{
> +	printf("  -d xxx --> rtc device node, default is %s\n",
> +	rtc_dev);
> +}

This is not used at all.

> +static void rtc_setup(void)
> +{
> +	if (access(rtc_dev, F_OK) == -1)
> +		tst_brk(TBROK | TERRNO, "setenv() failed");
                            ^
			    Huh, really "setenv() failed" ?

			    Also this should really be TCONF


Also we do set the during the test so that we should restore it after
the test as well.

We do this usually by:

* Reading the RTC in the setup as well as timestamping with monotonic
  timer

* Getting a second monotonic timestamp in the cleanup

* Setting the RTC to the value taken in setup plus the difference in
  the monotonic timer timestamps

Have a look how it's done for the system wallclock timer in
lib/tst_wallclock.c. It would be very similar for RTC the only
difference is that we will read/write RTC instead of realtime timer.

I guess that we can as well add tst_rtc_save() and tst_rct_restore()
functions to the tst_wallclock.c if we are expecting to use the code
from more than one testcase.

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
> +
> +	return -1;
> +}
> +
> +static void set_rtc_test(void)
> +{
> +	struct rtc_time set_tm, read_tm;
> +	int ret;
> +
> +	rtc_fd = SAFE_OPEN(rtc_dev, O_RDONLY);
> +
> +	tst_res(TINFO, "RTC SET TEST :");

We do not print what we are about to test in LTP, we just print the
results.

> +	/* set rtc to 2020.10.9 13:23:30 */
> +	set_tm.tm_sec = 30;
> +	set_tm.tm_min = 23;
> +	set_tm.tm_hour = 13;
> +	set_tm.tm_mday = 9;
> +	set_tm.tm_mon = 9;
> +	set_tm.tm_year = 120;

This can be initialized on declaration as with:

	struct rtc_time set_tm = {
		.tm_sec = 30,
		...
	};

> +	tst_res(TINFO, "set RTC date/time is %d-%d-%d, %02d:%02d:%02d.",
> +		 set_tm.tm_mday, set_tm.tm_mon + 1, set_tm.tm_year + 1900,
> +		 set_tm.tm_hour, set_tm.tm_min, set_tm.tm_sec);

I guess that should as well make a function to print the rtc_time
structure sice to simplify the code since this is not the only place we
use that.

> +	ret = ioctl(rtc_fd, RTC_SET_TIME, &set_tm);
> +	if (ret != 0) {
> +		tst_res(TFAIL | TERRNO, "RTC_SET_TIME ioctl failed");
> +		return;
> +	}
> +
> +	tst_res(TINFO, "RTC READ TEST:");

Here as well, we do not announce what we are about to test.

> +	/* Read current RTC Time */
> +	ret = ioctl(rtc_fd, RTC_RD_TIME, &read_tm);
> +	if (ret !=0) {
> +		tst_res(TFAIL | TERRNO, "RTC_RD_TIME ioctl failed");
> +		return;
> +	}
> +	tst_res(TINFO, "read RTC date/time is %d-%d-%d, %02d:%02d:%02d.",
> +		 read_tm.tm_mday, read_tm.tm_mon + 1, read_tm.tm_year + 1900,
> +		 read_tm.tm_hour, read_tm.tm_min, read_tm.tm_sec);
> +	tst_res(TPASS, "RTC READ TEST Passed");
> +
> +	if (rtc_tm_cmp(&set_tm, &read_tm)) {
> +		tst_res(TFAIL | TERRNO, "RTC SET TEST Failed");
> +		return;
> +	}
> +
> +	tst_res(TPASS, "RTC SET TEST Passed");
> +
> +	tst_res(TINFO, "RTC Tests Done!");

And we do not print info like this either.

> +}
> +
> +static void rtc_cleanup(viod)
> +{
> +	if(rtc_fd > 0){
> +		SAFE_CLOSE(rtc_fd);
> +	}
> +}
> +
> +static struct tst_test test={
> +	.setup = rtc_setup,
> +	.test_all = set_rtc_test,
> +	.options = rtc_options,
> +	.cleanup = rtc_cleanup,
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
