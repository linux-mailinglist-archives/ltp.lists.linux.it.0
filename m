Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4231B4B4F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B3F53C2989
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BA68B3C2965
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:45 +0200 (CEST)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1E211200E14
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:45 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id t14so2878251wrw.12
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=PexDh5GB85IiPjvrWe14CK4HoK5W7Cix7IIx9I08bcc=;
 b=JnMQOkj6v63l7KmfD2MAh+TQkmweuUg26ONRSLzMQiHtYKPJ7Jt59abmsd992YAyCA
 SSgnn9doyZlLN5QiO4UVC7Ca8+S21b+rtu7L8yrIVm1+L45fr31M2D1s2DuQrPU0SAQH
 zuH/dLHDMvuaeGGG0/imdIl9GECaRnWktWE7wXepBONNuGI/AgIxR3jX/RTpQe7Xgtng
 gHlGPMi2p8q4k4AJYgN5IIYyxNVlKDqqj4+m5FAlmK9crRgRo1StGRA5j/rZI07Vn5U1
 Jvi54UI6J2doE7CxNXKOIzurb3W1lO8/ctlSHUjw8dvH/1r5c7p2NcjF602CpyMCpiF1
 i5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=PexDh5GB85IiPjvrWe14CK4HoK5W7Cix7IIx9I08bcc=;
 b=JWoXF3OnvifMneFPlXhaAdpWKSSSJ8EkX/4HQQWcusIWkOImcabngjAi8mgMm5KnFk
 pGQoVWfijMQAhELp9fAURQYDHLTdE92Z4NSg8BEEXcbP4ZHrE8/3ItbwtY8pXZQQaW+C
 SiXnvD/Hd3OLT9A0KoMHvixCXaHQRLsfjPphjgeneOuKdAvYZwmli+eExsMyfeDlSx7E
 3AjDOCjpM1QHVDpBcY1x38dk+sww3oQIreaMoyoMBjAwMID7lamvsdeYa/fxI08I/mZ+
 mswJ40m59F1vnbVcl6GDlj4DRr9PYhb0cUY2pOpBZEtSUX3tB1ESTAuZgejP8JrX2fUj
 7ECw==
X-Gm-Message-State: AGi0PuYC+EKz359V9PmaNxRgyEJRFX6RJKSQgecoMgoeq0Bw/BKqjmiZ
 QnF+8L5gfiKnpA6KEreBhcFLVh6DQ60=
X-Google-Smtp-Source: APiQypKU8/z5uYuua5/icl7Z3gGWfAPuKx0Aj092/ql4gREdlgBLFr/LPQ8WsbPvAwXVcmR1hHUuLQ==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr29243032wrn.176.1587569324528; 
 Wed, 22 Apr 2020 08:28:44 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id s14sm7963872wmh.18.2020.04.22.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 08:28:44 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 17:28:40 +0200
Message-Id: <20200422152841.13432-3-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422152841.13432-1-fbozuta1@gmail.com>
References: <20200422152841.13432-1-fbozuta1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.17.1"
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 22 Apr 2020 19:07:52 +0200
Subject: [LTP] [PATCH 2/3] testcases/kernel/syscalls/ioctl: Add test for RTC
 ioctls used to read and set RTC alarm time
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
Cc: Aleksandar.Markovic@rt-rk.com, laurent@vivier.eu
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Filip Bozuta <Filip.Bozuta@rt-rk.com>

This is a multi-part message in MIME format.
--------------2.17.1
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


This patch tests functionalities of following ioctls:

RTC_ALM_READ, RTC_ALM_SET - Getting/Setting alarm time

    Read and set the alarm time, for RTCs that support alarms.
    The alarm interrupt must be separately enabled or disabled
    using the RTC_AIE_ON, RTC_AIE_OFF requests. The third ioctl's
    argument is a pointer to a rtc_time structure. Only the tm_sec,
    tm_min, and tm_hour fields of this structure are used.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c | 107 ++++++++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c


--------------2.17.1
Content-Type: text/x-patch; name="0002-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0002-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"

diff --git a/runtest/syscalls b/runtest/syscalls
index c6b8a85ad..0e358337f 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -540,6 +540,7 @@ ioctl_ns07 ioctl_ns07
 ioctl_sg01 ioctl_sg01
 
 ioctl_rtc01 ioctl_rtc01
+ioctl_rtc02 ioctl_rtc02
 
 inotify_init1_01 inotify_init1_01
 inotify_init1_02 inotify_init1_02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index b297407bd..b9ed19724 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -15,3 +15,4 @@
 /ioctl_ns07
 /ioctl_sg01
 /ioctl_rtc01
+/ioctl_rtc02
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c b/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c
new file mode 100644
index 000000000..dc3f53665
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Filip Bozuta Filip.Bozuta@rt-rk.com
+ */
+
+/*
+ * Test RTC ioctls with RTC_ALM_READ and RTC_ALM_SET requests
+ *
+ * Reads the current alarm time from RTC device using
+ * RTC_ALM_READ request and displays the alarm time
+ * information as follows: hour:minute:second
+ *
+ * Sets a new alarm time in RTC device using RTC_ALM_SET
+ * request and displays the new alarm time information
+ * as follows: hour:minute:second
+ *
+ * Reads the new alarm time from RTC device using RTC_ALM_READ
+ * request and checks whether the read alarm time information
+ * is same as the one set by RTC_ALM_SET
+ */
+
+#include <stdint.h>
+#include <errno.h>
+#include <linux/rtc.h>
+#include "tst_test.h"
+
+static void setup(void)
+{
+	int exists = ("/dev/rtc", O_RDONLY);
+
+	if (exists < 0)
+		tst_brk(TCONF, "RTC device driver file not available");
+}
+
+char *read_alarm_request = "RTC_ALM_READ";
+char *set_alarm_request = "RTC_ALM_SET";
+
+static void run(void)
+{
+	int fd;
+
+	struct rtc_time rtc_read_alarm;
+	struct rtc_time rtc_set_alarm = {13, 35, 12};
+
+	int alarm_read_supported, alarm_set_supported = 0;
+
+	fd = SAFE_OPEN("/dev/rtc", O_RDONLY);
+
+	if (fd == -1)
+		tst_brk(TCONF, "RTC device driver file could not be opened");
+
+	if (ioctl(fd, RTC_ALM_READ, &rtc_read_alarm) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				read_alarm_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "alarm time successfully read from RTC device");
+		tst_res(TINFO, "current RTC alarm time: %d:%d:%d",
+			rtc_read_alarm.tm_hour, rtc_read_alarm.tm_min,
+			rtc_read_alarm.tm_sec);
+		alarm_read_supported = 1;
+	}
+
+	if (ioctl(fd, RTC_ALM_SET, &rtc_set_alarm) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				set_alarm_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "alarm time successfully set to RTC device");
+		tst_res(TINFO, "new RTC alarm time: %d:%d:%d",
+			rtc_set_alarm.tm_hour, rtc_set_alarm.tm_min,
+			rtc_set_alarm.tm_sec);
+		alarm_set_supported = 1;
+	}
+
+	if (alarm_read_supported && alarm_set_supported) {
+		ioctl(fd, RTC_ALM_READ, &rtc_read_alarm);
+
+		char alarm_data[][10] = {"second", "minute", "hour"};
+		int read_alarm_data[] = {
+			rtc_read_alarm.tm_sec, rtc_read_alarm.tm_min,
+			rtc_read_alarm.tm_hour};
+		int set_alarm_data[] = {
+			rtc_set_alarm.tm_sec, rtc_set_alarm.tm_min,
+			rtc_set_alarm.tm_hour};
+		for (int i = 0; i < 3; i++)
+			if (read_alarm_data[i] == set_alarm_data[i])
+				tst_res(TPASS, "%s reads new %s as expected",
+					read_alarm_request, alarm_data[i]);
+			else
+				tst_res(TPASS, "%s reads different %s than set",
+					read_alarm_request, alarm_data[i]);
+	}
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.needs_device = 1,
+	.setup = setup,
+};

--------------2.17.1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--------------2.17.1--


