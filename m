Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE81B5EA1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3A2D3C2974
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 17:06:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C7DEF3C2922
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:30 +0200 (CEST)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A3BB201348
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 17:06:30 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id x25so6790920wmc.0
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DCSJ+gYvabfUAsQVl6bABL/rg2kbxdOTmB2wT6h8d34=;
 b=NBTYj6VLx0taakWUIm5Hh7F0H8eaVeeu+0QdRTryI/vm/A3acEFoE+qmZvq3Av03XQ
 Aa8FrC4vz0x0Lh2OI96K9/AYsRTuLqVtRhT9rGnSKO2Nvy2sQE/OMAx0GsdNLPhXJluw
 ZTCKjySYys6h/EwHf+9LgXLyDeMgwJs7uFrocyemNATcdcbA3v2PZjQdxEbghP9+IVxG
 DmrJwChuTzvygLLTf+5+WuXSR+KS46YfhrqybDeqhCnDUB3uaFbwPPqx16iL+HyfU3ct
 yL3lQbLuNvd4OguzhRBTO8Nkmri/6TTY/IPli4KHeyb6hfaMFnXCTkk7R0VlhnFkxSMl
 MJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DCSJ+gYvabfUAsQVl6bABL/rg2kbxdOTmB2wT6h8d34=;
 b=nW6ZxfEQSSJJhqUI5wKJ0FIQ7G7+KVgKbdBciNRBRXtBDF4C7TzyzYfpa4zyOzJnd4
 mZ9U2KLdEm6lZpE3hKBhMiQuB60coh6W4i22qGgpZCx4iCBM79YouVnIoDOnnrTqfF84
 vwOUphDid81svTMbXVbjumpdMfkBGHTgttiaGYNFQSntOXHAe9ySAXBQNtbhIRhfGYMI
 MTwybQtlC8jlIB3i/2JWeHhLFbU4XlOKqdIOilbDqEVxQriKe1KQy3UJgmjcIV7X9tmt
 nb+SHhHtV6KPzjwiOK75l8BJI+oU0YruzZnwDGrWehO/aLEHJ8/aFEXUR3lQOYTcB0pF
 y0dA==
X-Gm-Message-State: AGi0PuaIPQdsYmMOPeFqGv+wgmSsewKKr+sM5/ONJAlsRBTDgBHuAtJX
 uhjgIs142w/y6OoanHTOzSbqRRbcuIQ=
X-Google-Smtp-Source: APiQypKDQMXbfkaPC27XzUmC+hxvRwWpEMzjDnfVh+DtF4xPI8tFDj2FSzQb9zTxUeCQOGaxXyU5bw==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr4622016wme.89.1587654389333; 
 Thu, 23 Apr 2020 08:06:29 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id d133sm4663678wmc.27.2020.04.23.08.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 08:06:28 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 17:06:24 +0200
Message-Id: <20200423150626.12672-2-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423150626.12672-1-fbozuta1@gmail.com>
References: <20200423150626.12672-1-fbozuta1@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] testcases/kernel/syscalls/ioctl: Add test for
 RTC ioctls used to read and set RTC time
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

RTC_RD_TIME - Getting RTC time

    Returns this RTC's time in the following structure:

        struct rtc_time {
            int tm_sec;
            int tm_min;
            int tm_hour;
            int tm_mday;
            int tm_mon;
            int tm_year;
            int tm_wday;     /* unused */
            int tm_yday;     /* unused */
            int tm_isdst;    /* unused */
        };

    The fields in this structure have the same meaning and
    ranges as the tm structure described in gmtime man page.
    A pointer to this structure should be passed as the third
    ioctl argument.

RTC_SET_TIME - Setting RTC time

    Sets this RTC's time to the time specified by the rtc_time
    structure pointed to by the third ioctl argument. To set the
    RTC's time the process must be privileged (i.e., have the
    CAP_SYS_TIME capability).

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 runtest/syscalls                              |   2 +
 testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c | 121 ++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 44254d7da..c6b8a85ad 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -539,6 +539,8 @@ ioctl_ns07 ioctl_ns07
 
 ioctl_sg01 ioctl_sg01
 
+ioctl_rtc01 ioctl_rtc01
+
 inotify_init1_01 inotify_init1_01
 inotify_init1_02 inotify_init1_02
 
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index 97fbb9681..b297407bd 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -14,3 +14,4 @@
 /ioctl_ns06
 /ioctl_ns07
 /ioctl_sg01
+/ioctl_rtc01
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c b/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
new file mode 100644
index 000000000..e097f8f65
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Filip Bozuta Filip.Bozuta@rt-rk.com
+ */
+
+/*
+ * Test RTC ioctls with RTC_RD_TIME and RTC_SET_TIME requests
+ *
+ * Reads the current time from RTC device using RTC_RD_TIME
+ * request and displays the time information as follows:
+ * hour:minute, month day.month.year
+ *
+ * Sets a new time in RTC device using RTC_SET_TIME request
+ * and displays the new time information as follws:
+ * hour:minute, month day.month.year
+ *
+ * Reads the new time from RTC device using RTC_RD_TIME
+ * request and checks whether the read time information
+ * is same as the one set by RTC_SET_TIME
+
+ * Runs RTC_SET_TIME to set back the current time read by
+ * RTC_RD_TIME at the beginning of the test
+ */
+
+#include <stdint.h>
+#include <errno.h>
+#include <linux/rtc.h>
+#include "tst_test.h"
+
+static void setup(void)
+{
+	int exists = access("/dev/rtc", O_RDONLY);
+
+	if (exists < 0)
+		tst_brk(TCONF, "RTC device driver file not found");
+}
+
+char *read_time_request = "RTC_RD_TIME";
+char *set_time_request = "RTC_SET_TIME";
+
+static void run(void)
+{
+	int fd;
+
+	struct rtc_time rtc_read_time;
+	struct rtc_time rtc_cur_time;
+	struct rtc_time rtc_set_time = {
+		.tm_sec = 0, .tm_min = 15, .tm_hour = 13,
+		.tm_mday = 26, .tm_mon = 8, .tm_year = 119};
+
+	int time_read_supported, time_set_supported = 0;
+
+	fd = SAFE_OPEN("/dev/rtc", O_RDONLY);
+
+	if (fd == -1)
+		tst_brk(TCONF, "RTC device driver file could not be opened");
+
+	if (ioctl(fd, RTC_RD_TIME, &rtc_cur_time) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				read_time_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "time successfully read from RTC device");
+		tst_res(TINFO, "current RTC time: %d:%d, %d.%d.%d",
+			rtc_cur_time.tm_hour, rtc_cur_time.tm_min,
+			rtc_cur_time.tm_mday, rtc_cur_time.tm_mon,
+			rtc_cur_time.tm_year);
+		time_read_supported = 1;
+	}
+
+	if (ioctl(fd, RTC_SET_TIME, &rtc_set_time) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				set_time_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "time successfully set to RTC device");
+		tst_res(TINFO, "new RTC time: %d:%d, %d.%d.%d",
+			rtc_set_time.tm_hour, rtc_set_time.tm_min,
+			rtc_set_time.tm_mday, rtc_set_time.tm_mon,
+			rtc_set_time.tm_year);
+		time_set_supported = 1;
+	}
+
+	if (time_read_supported && time_set_supported) {
+		ioctl(fd, RTC_RD_TIME, &rtc_read_time);
+
+		char time_data[][10] = {"minute", "hour", "month",
+			"month day", "year"};
+		int read_time_data[] = {
+			rtc_read_time.tm_min, rtc_read_time.tm_hour,
+			rtc_read_time.tm_mday, rtc_read_time.tm_mon,
+			rtc_read_time.tm_year};
+		int set_time_data[] = {
+			rtc_set_time.tm_min, rtc_set_time.tm_hour,
+			rtc_set_time.tm_mday, rtc_set_time.tm_mon,
+			rtc_set_time.tm_year};
+		for (int i = 0; i < 5; i++)
+			if (read_time_data[i] == set_time_data[i])
+				tst_res(TPASS, "%s reads new %s as expected",
+					read_time_request, time_data[i]);
+			else
+				tst_res(TFAIL, "%s reads different %s than set",
+					read_time_request, time_data[i]);
+	}
+
+	if (time_set_supported)
+		ioctl(fd, RTC_SET_TIME, &rtc_cur_time);
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
