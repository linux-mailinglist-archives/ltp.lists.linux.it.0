Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DD2E17CD
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:36:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDFA63C5710
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:36:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7313B3C5711
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:49 +0100 (CET)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0DD541000456
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:49 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id y8so8444830plp.8
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 19:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EaBLj/Ro+pgYI5qrG3jHHMK8T0PA7sDu9E79pmTrSh4=;
 b=sW+aTCBXHy66/DoHn0RFV1F3rkNTin9LLJ3293A4Ro0eJ7JSvWpJN3tIEluvKnkNYB
 TPGGE+zJGbTWSi0+OAS1qzpFkd0XxGPz7Wtn3BatwyPF9YgJ38q8pJsNUaTrlfxDb6uX
 MW5sDoC++zZ0XcYKF9/OVf5irFA0BFWXIH49jpIFvQk3Rt6hKDm6N03M0E5UyRfuCq/3
 0Dybgf/eXxC5bsu3pz2ZBxborKNyHZSGeoxBNqFgm9ixyeoj41GO2qM+Fujfeo+JdsGn
 GQM0Or5FcGLM0kfqLhMwJFD72Z6bklenZR4Lp9FvgpVvA3vyQCxcYGHuMoXk4VWk8g2l
 vcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EaBLj/Ro+pgYI5qrG3jHHMK8T0PA7sDu9E79pmTrSh4=;
 b=NrhWfquZUk3xPQJ9UdoSvFf4pb4WukiJi04YFExK8h1KwCq0vsxteYWyuMBV5m8uOf
 iMPwF8YCKKI9sRn/DawIOGvAT6wyWIjy7y7HMyBQ4/+iSlDVPty/9DC7l0/V97r6U9wf
 yF5kWlo1opyANonqOeWrkvqVjIKfUP9UIxU5e77yqByfyQ9kqv6j+Au0jiQaI8a2ZOzq
 boFOLacXV4CXIFACKXFTT2B8OdUHO3PxjDoDquOXwYIqvi9wX4lMOljA31G+0Y1WEqfX
 rwVhdjnFxK4PakDvZDp2V/n6VB0ZZ7qpIY4t1/UF1DCVJmP+ucvkLLb0UTSk2FvRhVga
 4SSQ==
X-Gm-Message-State: AOAM533bbvesX5dhmIr+Mh0IqoaxS0gWjsS7zgu2UrBxfCTYrxT/gApB
 WXRW5AuIZDKtwkeqE3lRDGf2j0q4a9qmK2Ad
X-Google-Smtp-Source: ABdhPJxexoMQbAqvmm40m54WasIcHRPWn8xOTxE/kcAJNwtX0p0/8jvDU5ghYgDJAvoMaYv/BHwRSg==
X-Received: by 2002:a17:90a:ba84:: with SMTP id
 t4mr24823606pjr.110.1608694547502; 
 Tue, 22 Dec 2020 19:35:47 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id n1sm22809020pfu.28.2020.12.22.19.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 19:35:47 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Wed, 23 Dec 2020 11:35:17 +0800
Message-Id: <20201223033517.1464263-4-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223033517.1464263-1-gengcixi@gmail.com>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] rtc02: add rtc set time verify case
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
 testcases/kernel/device-drivers/rtc/rtc02.c   | 108 ++++++++++++++++++
 3 files changed, 110 insertions(+)
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
index 000000000..cb8f7fea0
--- /dev/null
+++ b/testcases/kernel/device-drivers/rtc/rtc02.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Unisoc Communications Inc.
+ *
+ * Filename : rtc02.c
+ * Abstract : This file is a implementation test rtc set function.
+ */
+
+/*
+ * Test description
+ *
+ * Test for the Real Time Clock driver.
+ * Veirify that,
+ * 1) set a RTC time
+ * 2) read the RTC time after set RTC time at once
+ * 3) compare the set time and the read is identical
+ *
+ */
+
+#include "tst_rtctime.h"
+#include "tst_wallclock.h"
+#include "tst_test.h"
+
+static struct rtc_time show_tm;
+
+static char *tst_show_rtctime(struct rtc_time *tm)
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
+static void rtc_setup(void)
+{
+	tst_rtctime_save();
+}
+
+static int rtc_tm_cmp(struct rtc_time *set_tm, struct rtc_time *read_tm)
+{
+	if ((set_tm->tm_sec == read_tm->tm_sec)
+		&& (set_tm->tm_min == read_tm->tm_min)
+		&& (set_tm->tm_hour == read_tm->tm_hour)
+		&& (set_tm->tm_mday == read_tm->tm_mday)
+		&& (set_tm->tm_mon == read_tm->tm_mon)
+		&& (set_tm->tm_year == read_tm->tm_year)) {
+		return 0;
+	}
+	return -1;
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
+	tst_res(TINFO, "To set RTC date/time is: %s", tst_show_rtctime(&set_tm));
+
+	ret = tst_rtc_settime(&set_tm);
+	if (ret != 0) {
+		tst_res(TFAIL | TERRNO, "RTC_SET_TIME failed");
+		return;
+	}
+
+	/* Read current RTC Time */
+	ret = tst_rtc_gettime(&read_tm);
+	if (ret != 0) {
+		tst_res(TFAIL | TERRNO, "RTC_RD_TIME failed");
+		return;
+	}
+	tst_res(TINFO, "read RTC date/time is: %s", tst_show_rtctime(&read_tm));
+
+	if (rtc_tm_cmp(&set_tm, &read_tm)) {
+		tst_res(TFAIL | TERRNO, "RTC SET TEST Failed");
+		return;
+	}
+	tst_res(TPASS, "The read RTC time is consistent with set");
+
+}
+
+static void rtc_cleanup(void)
+{
+	tst_rtctime_restore();
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
