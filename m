Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 367CA1B5EA2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8FBB3C61C2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 73CD73C2953
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:31 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 02A47601BD9
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:31 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id j2so7241057wrs.9
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Pj0eLXODiyCxFSSi6Nw4I/ny4gAk5xIA/gNMvyHgn4U=;
 b=oO0K98t6OiotpPy+A9AYPaM7b1kZiEAzHylHw6dity0wWl1Et2ebzUsaR1xgsrt0OK
 pSSRVqhTOkw2Gpv7LE0uSHLAitHNMaDhantO21/yN37ltge7sG6WstT348jq4WihuJtq
 DpSNLHRZN4LiqV4UlvbgzGrLl5xhXDi97qsqV76J9DVbp++TJ1V19fnSp4icAPRmGLLa
 Kvgojq85l6WWWQldzWpdWkcRE4/CeWB4uvIfk9mfNXjBSyKeEjMKl0U+HKVApr4yxxg7
 h3X6ochz24pIpgIz1MBhWPY0p4REmXmRucr9UWIR1WFFPGekgL4ECINK6oYcDcRYpkBc
 g/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Pj0eLXODiyCxFSSi6Nw4I/ny4gAk5xIA/gNMvyHgn4U=;
 b=FM6/B55kwoSaib4Ov4Urht7gX3g23wsg0qd5ZR1z3UPXWejui1MDiDjttvALfnKBPD
 B7AlYrHaGfQIQbaRM5MoKlHsCOyS1+jdtq7Cu5Qm3lYaO1bRxbXb9QeKR6xlnP+oQXnX
 aSh1QvgQC/ysYqDCkI1q0CrrBGAL1pqQKm9JHcFf4RzVdzTYWXi3aGDLAhTQj3VnALHe
 lrmIciTsErnJamZvv6UJbIOENFoNjeMy/texmx/DIHACzw5RmJNBoTOxhEVzjzvrrNuG
 y8cK/TPU+uMNy0nvBwNCaPAM8c+qAoea/MgKxwZ9LXWMDJuC9xhuz1u573RMAAsQwQ5X
 GtMA==
X-Gm-Message-State: AGi0PuZIcpjtBLHGHKN5FDCFdxeR/79kwGW53EnHcbZtTUxVjIcJIce/
 s+KuyV9Mjyp7AMZIKqdTBTQnCmPd/X0=
X-Google-Smtp-Source: APiQypJi4LL25AbcV0MAtKnqPHQc2rR16Md6/5tpSuuIxCjVFkvnCOYyjmR9G+hYLdhucaqYqsUwWw==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr5848077wrw.198.1587654390215; 
 Thu, 23 Apr 2020 08:06:30 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id d133sm4663678wmc.27.2020.04.23.08.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 08:06:29 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 17:06:25 +0200
Message-Id: <20200423150626.12672-3-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423150626.12672-1-fbozuta1@gmail.com>
References: <20200423150626.12672-1-fbozuta1@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] testcases/kernel/syscalls/ioctl: Add test for
 RTC ioctls used to read and set RTC alarm time
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Filip Bozuta <Filip.Bozuta@rt-rk.com>

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
 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc02.c

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
index 000000000..6a750a02a
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc02.c
@@ -0,0 +1,115 @@
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
+ *
+ * Runs RTC_ALM_SET to set back the current alarm time read by
+ * RTC_ALM_READ at the beginning of the test
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
+	struct rtc_time rtc_cur_alarm;
+	struct rtc_time rtc_set_alarm = {
+		.tm_sec = 13, .tm_min = 35, .tm_hour = 12};
+
+	int alarm_read_supported, alarm_set_supported = 0;
+
+	fd = SAFE_OPEN("/dev/rtc", O_RDONLY);
+
+	if (fd == -1)
+		tst_brk(TCONF, "RTC device driver file could not be opened");
+
+	if (ioctl(fd, RTC_ALM_READ, &rtc_cur_alarm) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				read_alarm_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "alarm time successfully read from RTC device");
+		tst_res(TINFO, "current RTC alarm time: %d:%d:%d",
+			rtc_cur_alarm.tm_hour, rtc_cur_alarm.tm_min,
+			rtc_cur_alarm.tm_sec);
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
+	if (alarm_set_supported)
+		ioctl(fd, RTC_ALM_SET, &rtc_cur_alarm);
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
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
