Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0A2F0E58
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:42:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 891C43C5FCD
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:42:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7794E3C6465
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:33 +0100 (CET)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0E54B6008FF
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:33 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id m6so10519915pfm.6
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I6VlR1dFz++wJJ/KqklHb/FWO01JGThPvwu4mnrJtls=;
 b=jJwwlHA3Amn67x4t3BxCGwAN8wLY22cQ5S+NNo+O/saIGF52zEnMGzEwdK43CcqRNk
 T+O4L+rPoV6dC1FOUV2YcByhJg0IS3Zk2s77etpUGGJyQ6VqL8HpOauinzNknXn+Ps9t
 NbL/ZIgGm53+4fmrI+BQoCIt/KKosOvg3K7Y4pKjtQYDKtyGribiUO0ODagbutVR8I7K
 LHAkZ6LWqs9Q+UzWvucDoLnL8yl6GqZsKkhcuMEFE8Iw9ohh2clwHJpCMhEsUNyHKMW0
 x1AJahjuE6r1qUszVJ+VVRcm2CYpwqvoqYJx16S6drgwetR9Cup+VMIUk7MtZcuJ9OOC
 ffmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I6VlR1dFz++wJJ/KqklHb/FWO01JGThPvwu4mnrJtls=;
 b=A9XPCqzhFUbp1kDjUd17KPb3JBkuS7yOqjOa7KSzVadY52zCbnvJKx0Wv+wujZUVeg
 azLY7s2pEPUNar49DplICIJe7SJAB8mug0zttt/B+LOHLLbqrGejz5zXhD3LexfT7lfG
 o8nms54f/HC0FhOEmIjTaJiVxsfqMDnCNJgVOq/DqEkAXkkbpVe3FqwLg5FhhPw67Xp/
 Xirh9deEiaIjaJEfGYlvwhMTUDQPalsWq18Oc8V70MbqZCGeg1Swbbw1bUSto9QRyplM
 WRV8mjMp6jujUxK6zZ41tCRNpoeym2Dwe4Q+ozvM/kItV9BKzGB2uj0+utjL0Opa+4Xf
 xW0w==
X-Gm-Message-State: AOAM533HcOG3zL98MwLWR1RNPvuXyZPCFlR7p6qe/w1H+lDdJU5p6Aav
 ta4sqPeb68bWTlLOXzOhCrM=
X-Google-Smtp-Source: ABdhPJzOq9iJF+xuGMbkWKqak+6aU9Yku/y1AlE5JePlx/TQt/uRWg7MZuW/SazY8VvJTJvgJLveWA==
X-Received: by 2002:a63:585a:: with SMTP id i26mr18578323pgm.330.1610354491431; 
 Mon, 11 Jan 2021 00:41:31 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u12sm19186901pgi.91.2021.01.11.00.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 00:41:31 -0800 (PST)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Mon, 11 Jan 2021 16:37:10 +0800
Message-Id: <20210111083711.1715851-4-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111083711.1715851-1-gengcixi@gmail.com>
References: <20210111083711.1715851-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 3/3] device-drivers/rtc: add verify rtc set time
 case
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

Test for the Real Time Clock driver.
 * Veirify that,
 * 1) set a RTC time
 * 2) read the RTC time after set RTC time at once
 * 3) compare the set time and the read is identical

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 runtest/kernel_misc                           |   1 +
 .../kernel/device-drivers/rtc/.gitignore      |   1 +
 testcases/kernel/device-drivers/rtc/rtc02.c   | 111 ++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 testcases/kernel/device-drivers/rtc/rtc02.c

diff --git a/runtest/kernel_misc b/runtest/kernel_misc
index 7937c7bbf..abb75ebaf 100644
--- a/runtest/kernel_misc
+++ b/runtest/kernel_misc
@@ -1,6 +1,7 @@
 kmsg01 kmsg01
 fw_load fw_load
 rtc01 rtc01
+rtc02 rtc02
 block_dev block_dev
 tpci tpci
 tbio tbio
diff --git a/testcases/kernel/device-drivers/rtc/.gitignore b/testcases/kernel/device-drivers/rtc/.gitignore
index 8412fe679..0c0161eba 100644
--- a/testcases/kernel/device-drivers/rtc/.gitignore
+++ b/testcases/kernel/device-drivers/rtc/.gitignore
@@ -1 +1,2 @@
 /rtc01
+/rtc02
diff --git a/testcases/kernel/device-drivers/rtc/rtc02.c b/testcases/kernel/device-drivers/rtc/rtc02.c
new file mode 100644
index 000000000..a4c758fcd
--- /dev/null
+++ b/testcases/kernel/device-drivers/rtc/rtc02.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Unisoc Communications Inc.
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * test rtc devices set time functioin
+ *
+ * The steps:
+ *
+ * - save rtc time and set a RTC time
+ * - read the RTC time after set RTC time at once
+ * - compare the set time and the read is identical
+ * - in the cleanup function, restore rtc time.
+ *
+\*/
+
+#include <stdio.h>
+#include "tst_rtctime.h"
+#include "tst_wallclock.h"
+#include "tst_test.h"
+
+static char *rtc_dev = "/dev/rtc";
+
+static char *rtctime_to_str(struct rtc_time *tm)
+{
+	static char rtctime_buf[20];
+
+	sprintf(rtctime_buf, "%04d-%02d-%02d %02d:%02d:%02d",
+		tm->tm_year + 1900,
+		tm->tm_mon + 1,
+		tm->tm_mday,
+		tm->tm_hour,
+		tm->tm_min,
+		tm->tm_sec);
+	return rtctime_buf;
+}
+
+static int rtc_tm_cmp(struct rtc_time *set_tm, struct rtc_time *read_tm)
+{
+	return !((set_tm->tm_sec == read_tm->tm_sec)
+		&& (set_tm->tm_min == read_tm->tm_min)
+		&& (set_tm->tm_hour == read_tm->tm_hour)
+		&& (set_tm->tm_mday == read_tm->tm_mday)
+		&& (set_tm->tm_mon == read_tm->tm_mon)
+		&& (set_tm->tm_year == read_tm->tm_year));
+}
+
+static void set_rtc_test(void)
+{
+	struct rtc_time read_tm;
+	int ret;
+
+	struct rtc_time set_tm = {
+		.tm_sec = 30,
+		.tm_min = 23,
+		.tm_hour = 13,
+		.tm_mday = 9,
+		.tm_mon = 9,
+		.tm_year = 120,
+	};
+
+	/* set rtc to 2020.10.9 13:23:30 */
+	tst_res(TINFO, "To set RTC date/time is: %s", rtctime_to_str(&set_tm));
+
+	ret = tst_rtc_settime(rtc_dev, &set_tm);
+	if (ret != 0) {
+		tst_res(TFAIL | TERRNO, "RTC_SET_TIME failed");
+		return;
+	}
+
+	/* Read current RTC Time */
+	ret = tst_rtc_gettime(rtc_dev, &read_tm);
+	if (ret != 0) {
+		tst_res(TFAIL | TERRNO, "RTC_RD_TIME failed");
+		return;
+	}
+	tst_res(TINFO, "read RTC date/time is: %s", rtctime_to_str(&read_tm));
+
+	if (rtc_tm_cmp(&set_tm, &read_tm)) {
+		tst_res(TFAIL | TERRNO, "RTC SET TEST Failed");
+		return;
+	}
+	tst_res(TPASS, "The read RTC time is consistent with set time");
+
+}
+
+static void rtc_setup(void)
+{
+	int exists = access(rtc_dev, F_OK);
+
+	if (exists < 0)
+		tst_brk(TCONF, "RTC device %s not available", rtc_dev);
+
+	tst_rtc_clock_save(rtc_dev);
+}
+
+static void rtc_cleanup(void)
+{
+	tst_rtc_clock_restore(rtc_dev);
+}
+
+static struct tst_test test = {
+	.setup = rtc_setup,
+	.test_all = set_rtc_test,
+	.cleanup = rtc_cleanup,
+	/* tests needs to run with UID=0 */
+	.needs_root = 1,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
