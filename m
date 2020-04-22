Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B11591B4B52
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 589B93C2960
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 19:08:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9D82E3C2965
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:46 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1FFEB1A003D3
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 17:28:46 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id j2so2890023wrs.9
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=0r/xWIvmPDnt8Bxq3xIxt1Kohh78VdbqxQOscqnwL1I=;
 b=bFBCLJh7a1GQU9V1D3JIdziIzw+ksLOpzwZejACVNTVPdhai+m3q5P7iKn5hQ7/A19
 ZYSyCC6qe9E8GhZfwqihjfG0oSdjMCFmDay2JNwoKGninrmkNA02YEExK/Pd02UqjrDk
 ojmgWn9+cajz2Nnf27LWRd/5fEOp9/nE6v4mFxsk2XudVBnIUhiEtnaqh7ln0eyN+nuw
 +mVlx1AymzTTEYhWdcMxP0ALGt9mE7aLl5oK+zkGl5yFKxEe/ouGNzQwhIxB4CfCxbsN
 VcE530KYRKNdQmd+kRFzTIn6RuCPdn2VMy00/iSNCYU8c8KTt0RnaUQHPEmMFS6D2Jw4
 WL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=0r/xWIvmPDnt8Bxq3xIxt1Kohh78VdbqxQOscqnwL1I=;
 b=gG3b2OhhW8fzY3VkThCRn3izoHEwpymnHwj2s5bOMOjtK94s50mDBXkG7LtRqcgMrN
 1/gwcXVLLphBQzM7YDhemgKzMWayXsvC06qPMhtJs2HsEk6YNn+n2Qj0gYC5tdWlpXbR
 LkWSpKAGobvqInEEtS9ZoEeTcp9HDKs7mQrH1L+ZbeWXa846b1+Tz2rt8jxDCGeGQ8Rg
 3K0hoJBXhuqcdBAhMK5eTaK+q3oexAn7fTtoGBiRTOPkbf5wxB0Lyvt1VtIfiBjOEIxT
 9DL6kg3dHW9s6IKLrWZmRVLBOgOOO59e/Jq+of6vM3OYDkcj7pXQlaEvJ0btte8MXW87
 gK/Q==
X-Gm-Message-State: AGi0PuYeQQc8v/24NLuzVdHeFk0jnFPA67iJ4UO5MMYTZXljcwfncPRR
 Yabqx/T7GkVwQDwzbPnZkDk1ju2fzYo=
X-Google-Smtp-Source: APiQypIvXcgFH0BhWFuKM7LE0rsWSpIGt8Vgq8fh523ODP0aSaV8Gky8B/An2q5NCy+ZykaF/2xHKA==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr29705101wrq.262.1587569325473; 
 Wed, 22 Apr 2020 08:28:45 -0700 (PDT)
Received: from localhost.localdomain ([87.116.179.159])
 by smtp.gmail.com with ESMTPSA id s14sm7963872wmh.18.2020.04.22.08.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 08:28:44 -0700 (PDT)
From: Filip Bozuta <fbozuta1@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 17:28:41 +0200
Message-Id: <20200422152841.13432-4-fbozuta1@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422152841.13432-1-fbozuta1@gmail.com>
References: <20200422152841.13432-1-fbozuta1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.17.1"
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 22 Apr 2020 19:07:52 +0200
Subject: [LTP] [PATCH 3/3] testcases/kernel/syscalls/ioctl: Add test for RTC
 ioctls used to turn on/off RTC interrupts
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

RTC_AIE_ON, RTC_AIE_OFF - Alarm interrupt enabling on/off

    Enable or disable the alarm interrupt, for RTCs that support
    alarms.  The third ioctl's argument is ignored.

RTC_UIE_ON, RTC_UIE_OFF - Update interrupt enabling on/off

    Enable or disable the interrupt on every clock update, for
    RTCs that support this once-per-second interrupt. The third
    ioctl's argument is ignored.

RTC_PIE_ON, RTC_PIE_OFF - Periodic interrupt enabling on/off

    Enable or disable the periodic interrupt, for RTCs that sup‐
    port these periodic interrupts. The third ioctl's argument
    is ignored. Only a privileged process (i.e., one having the
    CAP_SYS_RESOURCE capability) can enable the periodic interrupt
    if the frequency is currently set above the value specified in
    /proc/sys/dev/rtc/max-user-freq.

RTC_WIE_ON, RTC_WIE_OFF - Watchdog interrupt enabling on/off

    Enable or disable the Watchdog interrupt, for RTCs that sup-
    port this Watchdog interrupt. The third ioctl's argument is
    ignored.

Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore    |  1 +
 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c | 88 +++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_rtc03.c


--------------2.17.1
Content-Type: text/x-patch; name="0003-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="0003-testcases-kernel-syscalls-ioctl-Add-test-for-RTC-ioc.patch"

diff --git a/runtest/syscalls b/runtest/syscalls
index 0e358337f..d5b9789d3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -541,6 +541,7 @@ ioctl_sg01 ioctl_sg01
 
 ioctl_rtc01 ioctl_rtc01
 ioctl_rtc02 ioctl_rtc02
+ioctl_rtc03 ioctl_rtc03
 
 inotify_init1_01 inotify_init1_01
 inotify_init1_02 inotify_init1_02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index b9ed19724..f16c11f58 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -16,3 +16,4 @@
 /ioctl_sg01
 /ioctl_rtc01
 /ioctl_rtc02
+/ioctl_rtc03
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_rtc03.c b/testcases/kernel/syscalls/ioctl/ioctl_rtc03.c
new file mode 100644
index 000000000..74ca3fd2a
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_rtc03.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Filip Bozuta Filip.Bozuta@rt-rk.com
+ */
+
+/*
+ * Test RTC ioctls with requests RTC_AIE_ON, RTC_AIE_OFF,
+ * RTC_PIE_ON, RTC_PIE_OFF, RTC_UIE_ON, RTC_UIE_OFF,
+ * RTC_WIE_ON, RTC_WIE_OFF
+ *
+ * Runs ioctls with the above mentioned requests one by one
+ * and sequentially turns on and off RTC alarm, periodic,
+ * update and watchdog interrupt.
+ */
+
+#include <stdint.h>
+#include <errno.h>
+#include <string.h>
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
+static char interrupts[][10] = {"alarm", "periodic", "update", "watchdog"};
+static int interrupt_requests[] = {
+	RTC_AIE_ON, RTC_PIE_ON, RTC_UIE_ON,
+	RTC_WIE_ON, RTC_AIE_OFF, RTC_PIE_OFF,
+	RTC_UIE_OFF, RTC_WIE_OFF};
+static char requests_text[][15] = {
+	"RTC_AIE_ON", "RTC_PIE_ON", "RTC_UIE_ON",
+	"RTC_WIE_ON", "RTC_AIE_OFF", "RTC_PIE_OFF",
+	"RTC_UIE_OFF", "RTC_WIE_OFF"};
+
+static void test_request(unsigned int n)
+{
+	int fd;
+
+	int on_request = interrupt_requests[n];
+	int off_request = interrupt_requests[n + 4];
+
+	char on_request_text[15], off_request_text[15];
+
+	strcpy(on_request_text, requests_text[n]);
+	strcpy(off_request_text, requests_text[n + 4]);
+
+	fd = SAFE_OPEN("/dev/rtc", O_RDWR);
+
+	if (fd == -1)
+		tst_brk(TCONF, "RTC device driver file could not be opened");
+
+	if (ioctl(fd, on_request) == -1) {
+		if (errno == ENOTTY) {
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				on_request_text);
+		} else {
+			tst_res(TFAIL, "unexpected ioctl error");
+		}
+	} else {
+		tst_res(TPASS, "%s interrupt enabled", interrupts[n]);
+	}
+
+	if (ioctl(fd, off_request) == -1) {
+		if (errno == ENOTTY) {
+			tst_res(TCONF, "ioctl %s not supported on RTC device",
+				off_request_text);
+		} else {
+			tst_res(TFAIL, "unexpected ioctl error");
+		}
+	} else {
+		tst_res(TPASS, "%s interrupt disabled", interrupts[n]);
+	}
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(interrupts),
+	.test = test_request,
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


