Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677D2F0E56
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A84E53C54C7
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AF1483C5FD3
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:28 +0100 (CET)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1E8191400BC8
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:28 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id s15so9121353plr.9
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2l6Qw6kf1gd/PeDnYzrnzXCxQWfwnKKWt7sJn+if94Y=;
 b=OGtzjrZ4ECnka6ui1VMEgpyac7vBqnZECMhBj6iS6zBMsBFopNAcjX6liRPAZrfw/Q
 3eEdNIskJ2bq7Fzd7JCVSz11iptrwBQxamwV9P2hII7y3jvwfHwzry57cnvAu9kYMb0x
 NR+WFy9RwM8ZMSE0JO/gKGg9h5awFMHjO24nJK85dQo3dmp0/G8em0JuFrX53Dx9K8CU
 ZUkH/gy1ACsEK9rKw1taKONr7tOqBzek8nSG5D5S959tZIuea8fgt1UPxhR2bYNSUa5p
 M3oId3ZDG7efayGqRQ2NlW2v6U0tW/gcelTJiplPeZf/aj9eShFJ8DQJnEsaQsEOeMQ5
 RUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2l6Qw6kf1gd/PeDnYzrnzXCxQWfwnKKWt7sJn+if94Y=;
 b=ZZrpJE0m/RUrMgSGvZ8Hk+JHn+D8w2Lr09oW1/3dgD7YlF1kdnZsFBWut+wdQDrK/Y
 Z3/JM4B6tL0I5aPSphaOhN5pZ8zZt+F4QRz0YyBSPureiMSUA4oGIjkKnlu61fwW7GFn
 10mfzoowm2hmJezvcDhPB85whALoUond0L7fuICtuu2ZkzAJ7H0Cf3gKtxiQpj/4a0n8
 EDiiaie6uxNON4J+BkDQGx4juYjaOPV6FvtvJygzm9y9qD4nuhFYnKJpYdHkjuvNurhq
 WtMngMyKjAz/a/fXY05MsNpN07+AtZJPu3DCuQF17Syyk0Iqxhe1uyWwzFALzr97q6Jw
 +Sww==
X-Gm-Message-State: AOAM533XdSHMyxDG9YzM8l/vjTAWH404oBxYchmIjXJmZcvVPfxIuF0c
 WFei7q+Ai/BaZDfXsfiG0hPriaI4H3ahgW4j
X-Google-Smtp-Source: ABdhPJxyWcBh96zpTZkY+BHYIFI1IhF3vgbb6+NFdLjM7kUxbUynFAoXVl+F6mPiXcwZs5ElSSURuQ==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr17391980pjr.33.1610354486543; 
 Mon, 11 Jan 2021 00:41:26 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u12sm19186901pgi.91.2021.01.11.00.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 00:41:26 -0800 (PST)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Mon, 11 Jan 2021 16:37:08 +0800
Message-Id: <20210111083711.1715851-2-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111083711.1715851-1-gengcixi@gmail.com>
References: <20210111083711.1715851-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/3] lib: add tst_rtctime* for rtc test
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

Add:
    get rtc time and set rtc time;
    Implemented a function that covert rtc time to time_t
    this will be used in tst_rtc_save and tst_rtc_restore

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 include/tst_rtctime.h |  15 ++++
 lib/tst_rtctime.c     | 159 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 include/tst_rtctime.h
 create mode 100644 lib/tst_rtctime.c

diff --git a/include/tst_rtctime.h b/include/tst_rtctime.h
new file mode 100644
index 000000000..416a83a57
--- /dev/null
+++ b/include/tst_rtctime.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 Unisoc Inc.
+ */
+
+#ifndef TST_RTCTIME
+#define TST_RTCTIME
+
+#include <linux/rtc.h>
+
+int tst_rtc_gettime(char *rtc_dev, struct rtc_time *rtc_tm);
+
+int tst_rtc_settime(char *rtc_dev, struct rtc_time *rtc_tm);
+
+#endif /* TST_RTCTIME */
diff --git a/lib/tst_rtctime.c b/lib/tst_rtctime.c
new file mode 100644
index 000000000..1ea4891cc
--- /dev/null
+++ b/lib/tst_rtctime.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Unisoc Communications Inc.
+ *
+ * Filename : tst_rtctime.c
+ * Abstract : This file is a implementation for rtc set read,covert to tm functions
+ */
+
+#include <linux/rtc.h>
+#include <stdbool.h>
+#include <limits.h>
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_rtctime.h"
+
+#define LEAPS_THRU_END_OF(y) ((y) / 4 - (y) / 100 + (y) / 400)
+
+static const unsigned char rtc_days_in_month[] = {
+	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
+};
+
+static inline bool is_leap_year(unsigned int year)
+{
+	return (!(year % 4) && (year % 100)) || !(year % 400);
+}
+
+static long long tst_mktime(const unsigned int year0, const unsigned int mon0,
+		const unsigned int day, const unsigned int hour,
+		const unsigned int min, const unsigned int sec)
+{
+	unsigned int mon = mon0, year = year0;
+
+	/* 1..12 -> 11,12,1..10 */
+	mon -= 2;
+	if (0 >= (int) (mon)) {
+		mon += 12;	/* Puts Feb last since it has leap day */
+		year -= 1;
+	}
+
+	return ((((long long)
+		(year/4 - year/100 + year/400 + 367*mon/12 + day) +
+		year*365 - 719499
+		)*24 + hour /* now have hours - midnight tomorrow handled here */
+		)*60 + min /* now have minutes */
+		)*60 + sec; /* finally seconds */
+}
+
+/*
+ * The number of days in the month.
+ */
+static int rtc_month_days(unsigned int month, unsigned int year)
+{
+	return rtc_days_in_month[month] + (is_leap_year(year) && month == 1);
+}
+
+/*
+ * tst_rtc_time_to_tm - Converts time_t to rtc_time.
+ * Convert seconds since 01-01-1970 00:00:00 to Gregorian date.
+ */
+void tst_rtc_time_to_tm(long long time, struct rtc_time *tm)
+{
+	unsigned int month, year, secs;
+	int days;
+
+	/* time must be positive */
+	days = time / 86400;
+	secs = time % 86400;
+
+	/* day of the week, 1970-01-01 was a Thursday */
+	tm->tm_wday = (days + 4) % 7;
+
+	year = 1970 + days / 365;
+	days -= (year - 1970) * 365
+		+ LEAPS_THRU_END_OF(year - 1)
+		- LEAPS_THRU_END_OF(1970 - 1);
+	while (days < 0) {
+		year -= 1;
+		days += 365 + is_leap_year(year);
+	}
+	tm->tm_year = year - 1900;
+	tm->tm_yday = days + 1;
+
+	for (month = 0; month < 11; month++) {
+		int newdays;
+
+		newdays = days - rtc_month_days(month, year);
+		if (newdays < 0)
+			break;
+		days = newdays;
+	}
+	tm->tm_mon = month;
+	tm->tm_mday = days + 1;
+
+	tm->tm_hour = secs / 3600;
+	secs -= tm->tm_hour * 3600;
+	tm->tm_min = secs / 60;
+	tm->tm_sec = secs - tm->tm_min * 60;
+
+	tm->tm_isdst = 0;
+}
+
+/*
+ * tst_rtc_tm_to_time - Converts rtc_time to time_t.
+ * Convert Gregorian date to seconds since 01-01-1970 00:00:00.
+ */
+long long tst_rtc_tm_to_time(struct rtc_time *tm)
+{
+	return tst_mktime(((unsigned int)tm->tm_year + 1900), tm->tm_mon + 1,
+			tm->tm_mday, tm->tm_hour, tm->tm_min, tm->tm_sec);
+}
+
+static int rtc_supported_by_kernel(const char *rtc_dev)
+{
+	int exists = access(rtc_dev, F_OK);
+
+	if (exists < 0)
+		tst_brk(TCONF, "RTC device %s not available", rtc_dev);
+	return 0;
+}
+
+static int tst_rtc_ioctl(char *rtc_dev, unsigned long request, struct rtc_time *rtc_tm)
+{
+	int ret;
+	int rtc_fd = -1;
+
+	rtc_fd = SAFE_OPEN(rtc_dev, O_RDONLY);
+
+	ret = ioctl(rtc_fd, request, rtc_tm);
+
+	if (ret != 0)
+		return -1;
+
+	if (rtc_fd > 0)
+		SAFE_CLOSE(rtc_fd);
+
+	return 0;
+}
+
+int tst_rtc_gettime(char *rtc_dev, struct rtc_time *rtc_tm)
+{
+	int ret;
+
+	ret = tst_rtc_ioctl(rtc_dev, RTC_RD_TIME, rtc_tm);
+
+	if (ret != 0)
+		return -1;
+	return 0;
+}
+
+int tst_rtc_settime(char *rtc_dev, struct rtc_time *rtc_tm)
+{
+	int ret;
+
+	ret = tst_rtc_ioctl(rtc_dev, RTC_SET_TIME, rtc_tm);
+
+	if (ret != 0)
+		return -1;
+	return 0;
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
