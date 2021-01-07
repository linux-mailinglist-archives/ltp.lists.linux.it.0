Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B042ED124
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 14:49:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 008DB3C6550
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 14:49:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AD4F33C31D5
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 14:49:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E1AE960012E
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 14:49:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D085B718;
 Thu,  7 Jan 2021 13:49:16 +0000 (UTC)
Date: Thu, 7 Jan 2021 14:50:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: gengcixi@gmail.com
Message-ID: <X/cRkxEahPFoAYms@yuki.lan>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-2-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223033517.1464263-2-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add tst_rtctime* for rtc test
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
>     get rtc time and set rtc time in default /dev/rtc;
>     Implemented a function that covert rtc time to time_t
>     this will be used in tst_rtc_save and tst_rtc_restore
> 
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> ---
>  include/tst_rtctime.h |  15 ++++
>  lib/tst_rtctime.c     | 161 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 176 insertions(+)
>  create mode 100644 include/tst_rtctime.h
>  create mode 100644 lib/tst_rtctime.c
> 
> diff --git a/include/tst_rtctime.h b/include/tst_rtctime.h
> new file mode 100644
> index 000000000..61ec6f0eb
> --- /dev/null
> +++ b/include/tst_rtctime.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

This is not correct format for the identifiers, the comment has to start
with //

Also the default license for new LTP code i GPL-2.0-or-later, so please
us that unless you have a reason to stick to GPL-2.0.

> +/*
> + * Copyright (C) 2020 Unisoc Inc.
> + */
> +
> +#ifndef TST_RTCTIME
> +#define TST_RTCTIME
> +
> +#include <linux/rtc.h>
> +
> +int tst_rtc_gettime(struct rtc_time *rtc_tm);
> +
> +int tst_rtc_settime(struct rtc_time *rtc_tm);

Should we add a path to the RTC device to these functions as well?

Are there any boards that have more than one RTC where we would need to
loop over all available devices during the test?

> +#endif /* TST_RTCTIME */
> diff --git a/lib/tst_rtctime.c b/lib/tst_rtctime.c
> new file mode 100644
> index 000000000..580ef0fdf
> --- /dev/null
> +++ b/lib/tst_rtctime.c
> @@ -0,0 +1,161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Unisoc Communications Inc.
> + *
> + * Filename : tst_rtctime.c
> + * Abstract : This file is a implementation for rtc set read,covert to tm functions
> + */
> +
> +#include <linux/rtc.h>
> +#include <stdbool.h>
> +#include <limits.h>
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_rtctime.h"
> +
> +#define LEAPS_THRU_END_OF(y) ((y) / 4 - (y) / 100 + (y) / 400)
> +
> +static const unsigned char rtc_days_in_month[] = {
> +	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
> +};
> +
> +static inline bool is_leap_year(unsigned int year)
> +{
> +	return (!(year % 4) && (year % 100)) || !(year % 400);
> +}
> +
> +static long long tst_mktime(const unsigned int year0, const unsigned int mon0,
> +		const unsigned int day, const unsigned int hour,
> +		const unsigned int min, const unsigned int sec)
> +{
> +	unsigned int mon = mon0, year = year0;
> +
> +	/* 1..12 -> 11,12,1..10 */
> +	mon -= 2;
> +	if (0 >= (int) (mon)) {
> +		mon += 12;	/* Puts Feb last since it has leap day */
> +		year -= 1;
> +	}
> +
> +	return ((((long long)
> +		(year/4 - year/100 + year/400 + 367*mon/12 + day) +
> +		year*365 - 719499
> +		)*24 + hour /* now have hours - midnight tomorrow handled here */
> +		)*60 + min /* now have minutes */
> +		)*60 + sec; /* finally seconds */
> +}
> +
> +/*
> + * The number of days in the month.
> + */
> +static int rtc_month_days(unsigned int month, unsigned int year)
> +{
> +	return rtc_days_in_month[month] + (is_leap_year(year) && month == 1);
> +}
> +
> +/*
> + * tst_rtc_time_to_tm - Converts time_t to rtc_time.
> + * Convert seconds since 01-01-1970 00:00:00 to Gregorian date.
> + */
> +void tst_rtc_time_to_tm(long long time, struct rtc_time *tm)
> +{
> +	unsigned int month, year, secs;
> +	int days;
> +
> +	/* time must be positive */
> +	days = time / 86400;
> +	secs = time % 86400;
> +
> +	/* day of the week, 1970-01-01 was a Thursday */
> +	tm->tm_wday = (days + 4) % 7;
> +
> +	year = 1970 + days / 365;
> +	days -= (year - 1970) * 365
> +		+ LEAPS_THRU_END_OF(year - 1)
> +		- LEAPS_THRU_END_OF(1970 - 1);
> +	while (days < 0) {
> +		year -= 1;
> +		days += 365 + is_leap_year(year);
> +	}
> +	tm->tm_year = year - 1900;
> +	tm->tm_yday = days + 1;
> +
> +	for (month = 0; month < 11; month++) {
> +		int newdays;
> +
> +		newdays = days - rtc_month_days(month, year);
> +		if (newdays < 0)
> +			break;
> +		days = newdays;
> +	}
> +	tm->tm_mon = month;
> +	tm->tm_mday = days + 1;
> +
> +	tm->tm_hour = secs / 3600;
> +	secs -= tm->tm_hour * 3600;
> +	tm->tm_min = secs / 60;
> +	tm->tm_sec = secs - tm->tm_min * 60;
> +
> +	tm->tm_isdst = 0;
> +}
> +
> +/*
> + * tst_rtc_tm_to_time - Converts rtc_time to time_t.
> + * Convert Gregorian date to seconds since 01-01-1970 00:00:00.
> + */
> +long long tst_rtc_tm_to_time(struct rtc_time *tm)
> +{
> +	return tst_mktime(((unsigned int)tm->tm_year + 1900), tm->tm_mon + 1,
> +			tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec);

So I guess that the reason why we can't use libc mktime() and gmtime_r()
is that time_t is 32bit on older 32bit architectures, right?

> +}
> +
> +static int rtc_supported_by_kernel(const char *rtc_dev)
> +{
> +	int exists = access(rtc_dev, F_OK);
> +
> +	if (exists < 0)
> +		tst_brk(TCONF, "RTC device %s not available", rtc_dev);
> +	return 0;
> +}

This function should be called by the tests rather than from the test
library.

> +static int tst_rtc_ioctl(unsigned long request, struct rtc_time *rtc_tm)
> +{
> +	int ret;
> +	int rtc_fd = -1;
> +	static const char *rtc_dev = "/dev/rtc";
> +
> +	if (!rtc_supported_by_kernel(rtc_dev))
> +		rtc_fd = SAFE_OPEN(rtc_dev, O_RDONLY);
> +
> +	ret = ioctl(rtc_fd, request, rtc_tm);
> +
> +	if (ret != 0)
> +		return -1;
> +
> +	if (rtc_fd > 0)
> +		SAFE_CLOSE(rtc_fd);
> +
> +	return 0;
> +}
> +
> +int tst_rtc_gettime(struct rtc_time *rtc_tm)
> +{
> +	int ret;
> +
> +	ret = tst_rtc_ioctl(RTC_RD_TIME, rtc_tm);
> +
> +	if (ret != 0)
> +		return -1;
> +	return 0;
> +}
> +
> +int tst_rtc_settime(struct rtc_time *rtc_tm)
> +{
> +	int ret;
> +
> +	ret = tst_rtc_ioctl(RTC_SET_TIME, rtc_tm);
> +
> +	if (ret != 0)
> +		return -1;
> +	return 0;
> +}

These two functions can be static inline and declared in the header as:


static inline int tst_rtc_settime(struct rtc_time *rtc_tm)
{
	return tst_rtc_ioctl(RTC_SET_TIME, rtc_tm);
}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
