Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 282491B4B51
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D96EB3C2968
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3D0CF3C2961
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:46 +0200 (CEST)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1EDD360005F
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:42 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id b11so2904507wrs.6
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=HxrZc9zc4ZjTST37zog4fquwDCH1gPYecn/te+GmoFs=;
 b=HmrbCsKYW85eXEzYNNKskcH7qNbDt0hd73M5slmrM96jOjDHox30bxP6i3SbqzJoFx
 PF/2c86DXH3WnB+HYso8SnnbBcVnIzndHu4xB41AthxMkqmbslUZhfjx05KGYR4b0a4A
 MA7fciebtbS38nHtgmIWcnS5qeMydu55UFNFbnKWRcWQNjgXM6/c3bgF6OuaZdZGaBOE
 e7h08eHvemURRdR9nqusKNNnMZzjd22ZOkUV6MTIBQgeugBc8WIF+/4Qrvdwd6zlAfKc
 fxoxJWv9p5R1DCP0KhLVuXmEnLyEEoZE3gfRNM5sK8dGNDlQRAOTiGUcjGDwkDA1m+Bm
 227g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=HxrZc9zc4ZjTST37zog4fquwDCH1gPYecn/te+GmoFs=;
 b=KabjpDJ3JkngnZNX7NK7tp7SkOYZfxJXaCgLjMoxphY5GpbP5HAHpomwdrp+zjEw4U
 QhTx7A2vuDj2XlmSdDl6SKmOpLwViF0OLsVQSXHviRJNANV5NwZjWdPCby0yYb/zfcVh
 lcaIMzbiF/yf1UUCU+Qdl1PudxQLN4ygTSKC66yV/tsEXZx/L91N0g9OMVUWSDwd5yul
 hMS500iLxDyePu6/C97CQt9XAPVzRVwHaHwGVGfl0J2i7XTTbXism2P/OcrfkyLzZNlg
 KCYpbQD1Hr+ED5UmnhU0bSPro0OUjd6wUhoyHGjtLmXq/BOkFG1d7GqjrRFPoQ9EJlj+
 a30A==
X-Gm-Message-State: AGi0PuZDeqxmgoiA2+gwcvwjbihjZ5NO13wTazXr3P5iube07i8krrMh
 BIRLVlJm1FSYeFtJon33XMtl25E290k=
X-Google-Smtp-Source: APiQypJtB+tAEf8CWJpyJN4d8vSFog4yOaXRjybKkSpPAkFnO2s5h+z/xe3CAZosyJjvfGOV5XAwow==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr10791925wru.29.1587569323571; 
 Wed, 22 Apr 2020 08:28:43 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id s14sm7963872wmh.18.2020.04.22.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 08:28:43 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 17:28:39 +0200
Message-Id: <20200422152841.13432-2-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422152841.13432-1-fbozuta1@gmail.com>
References: <20200422152841.13432-1-fbozuta1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.17.1"
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 22 Apr 2020 19:07:52 +0200
Subject: [LTP] [PATCH 1/3] testcases/kernel/syscalls/ioctl: Add test for RTC
 ioctls used to read and set RTC time
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
 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c | 112 ++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc01.c


--------------2.17.1
Content-Type: text/x-patch; name="0001-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0001-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"

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
index 000000000..78747ac21
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc01.c
@@ -0,0 +1,112 @@
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
+	struct rtc_time rtc_set_time = {0, 15, 13, 26, 8, 119, 0, 0, 0};
+
+	int time_read_supported, time_set_supported = 0;
+
+	fd = SAFE_OPEN("/dev/rtc", O_RDONLY);
+
+	if (fd == -1)
+		tst_brk(TCONF, "RTC device driver file could not be opened");
+
+	if (ioctl(fd, RTC_RD_TIME, &rtc_read_time) == -1) {
+		if (errno == ENOTTY)
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				read_time_request);
+		else
+			tst_res(TFAIL | TERRNO, "unexpected ioctl error");
+	} else {
+		tst_res(TPASS, "time successfully read from RTC device");
+		tst_res(TINFO, "current RTC time: %d:%d, %d.%d.%d",
+			rtc_read_time.tm_hour, rtc_read_time.tm_min,
+			rtc_read_time.tm_mday, rtc_read_time.tm_mon,
+			rtc_read_time.tm_year);
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


