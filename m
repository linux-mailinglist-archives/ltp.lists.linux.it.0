Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D53432C5294
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 12:07:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 987EE3C4E24
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 12:07:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6163C3C223E
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 12:07:25 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D81F51401262
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 12:07:24 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id l1so989116pld.5
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 03:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz2u2xDgI52XElaZ4gjRNcfQC07dEaixAMEwmBFqSF8=;
 b=Aj/S7njxAu4Kgdc7GJeJuiWPEXULaLOPVtQLfB77ecqpHjrg4QjdT2i63vdlHeF+lO
 aSujkeUhHI7uOZPYnQ9O6Yj2ELiuLkCEImf8xKRH2MmfIUBh00UtCCCzomTdhZDQqg72
 TOyAdwKiEMpoIrI90eQkrUfM4PfKIdr0k2l8O+IrwO3k+J2dZZsBk72qTZsITOzjSvFm
 +1ttfv+0eA+YSadeppD9jV254dcaC4vDZyKQZBYn0A7DCYnYC1tDZaCgEOTB1iNiPD0+
 qk8rgINd6Hka1Tb0op41SfWl9U1O2mu/ThSqtDZe7JxG9sGjcGWdn2UdzG9Btvyvgcce
 MrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zz2u2xDgI52XElaZ4gjRNcfQC07dEaixAMEwmBFqSF8=;
 b=qXy0RlCm7NeJBH+DExJdrx5L2rIBLn9UcS/jSdqNhRqudwNOaaX8PWyIYCcJGMFWu7
 mYQ3a5fhszC4pb/1liw2b7O3NwmrP7v+2gZI12PusxbakqZ/1iNH/ScDTbAY/bDNc2Qi
 X42Uq1zcP2oJ1mbsHcI1E793ue4Z7ZiHJY6Ht2X9Au3fQbSBb//5LnpyiYb8rvY2v6wQ
 jflUWihYo5fwKHE9MQfa4hQDZmsRNc1ysf8Q4eXSDSuYohDaX2LYzD0+q5Btz0K5rL4f
 wkpC436MPsXqKsNH5bovlLILV85/UWtptiua9byd4dzOTJhWQ2vRjcTyrGkTJmFhPiP6
 eaKg==
X-Gm-Message-State: AOAM532xtuic4nhPlY7F6yfOboMYxgvRm52v02zCFSqMZKofg9e4Go/N
 5p+d44rZoLaz8BPfzZ/JZTg+Q/3ZBoxzZQ==
X-Google-Smtp-Source: ABdhPJwRQ6A2xMuI4Mqg9rH1emNwUs8iSGmtrc1G20q01fYP46HSMBlun38/S2iyiNWaxuG9WaMZjw==
X-Received: by 2002:a17:902:7594:b029:d5:eda6:fb45 with SMTP id
 j20-20020a1709027594b02900d5eda6fb45mr2315500pll.5.1606388842991; 
 Thu, 26 Nov 2020 03:07:22 -0800 (PST)
Received: from bj616583pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id x28sm4611407pfr.186.2020.11.26.03.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 03:07:22 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Thu, 26 Nov 2020 19:07:10 +0800
Message-Id: <20201126110710.436277-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] device-drivers/rtc: add rtc02 test
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
Cc: Xiaopeng Bai <xiaopeng.bai@unisoc.com>, orsonzhai@gmail.com,
 Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

add new testcase for Real Time Clock driver

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
Signed-off-by: Xiaopeng Bai <xiaopeng.bai@unisoc.com>
---
 runtest/kernel_misc                         |   1 +
 testcases/kernel/device-drivers/rtc/rtc02.c | 119 ++++++++++++++++++++
 2 files changed, 120 insertions(+)
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
diff --git a/testcases/kernel/device-drivers/rtc/rtc02.c b/testcases/kernel/device-drivers/rtc/rtc02.c
new file mode 100644
index 000000000..cce799670
--- /dev/null
+++ b/testcases/kernel/device-drivers/rtc/rtc02.c
@@ -0,0 +1,119 @@
+/*
+ * Test for the Real Time Clock driver.
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2019, Unisoc Communications Inc.
+ *
+ * Author: Xiaopeng Bai <xiaopeng.bai@unisoc.com>
+ * Author: Cixi Geng  <cixi.gegn1@unisoc.com>
+ *
+ */
+
+#include <sys/ioctl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <linux/rtc.h>
+#include <errno.h>
+#include <time.h>
+
+#include "tst_test.h"
+
+int rtc_fd = -1;
+
+static char *rtc_dev = "/dev/rtc";
+
+static struct tst_option rtc_options[] = {
+	{"d:", &rtc_dev, "test driver device name"},
+	{NULL, NULL, NULL}
+};
+
+static void help(void)
+{
+	printf("  -d xxx --> rtc device node, default is %s\n",
+	rtc_dev);
+}
+
+static void rtc_setup(void)
+{
+	if (access(rtc_dev, F_OK) == -1)
+		tst_brk(TBROK | TERRNO, "setenv() failed");
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
+
+	return -1;
+}
+
+static void set_rtc_test(void)
+{
+	struct rtc_time set_tm, read_tm;
+	int ret;
+
+	rtc_fd = SAFE_OPEN(rtc_dev, O_RDONLY);
+
+	tst_res(TINFO, "RTC SET TEST :");
+
+	/* set rtc to 2020.10.9 13:23:30 */
+	set_tm.tm_sec = 30;
+	set_tm.tm_min = 23;
+	set_tm.tm_hour = 13;
+	set_tm.tm_mday = 9;
+	set_tm.tm_mon = 9;
+	set_tm.tm_year = 120;
+	tst_res(TINFO, "set RTC date/time is %d-%d-%d, %02d:%02d:%02d.",
+		 set_tm.tm_mday, set_tm.tm_mon + 1, set_tm.tm_year + 1900,
+		 set_tm.tm_hour, set_tm.tm_min, set_tm.tm_sec);
+
+	ret = ioctl(rtc_fd, RTC_SET_TIME, &set_tm);
+	if (ret != 0) {
+		tst_res(TFAIL | TERRNO, "RTC_SET_TIME ioctl failed");
+		return;
+	}
+
+	tst_res(TINFO, "RTC READ TEST:");
+	/* Read current RTC Time */
+	ret = ioctl(rtc_fd, RTC_RD_TIME, &read_tm);
+	if (ret !=0) {
+		tst_res(TFAIL | TERRNO, "RTC_RD_TIME ioctl failed");
+		return;
+	}
+	tst_res(TINFO, "read RTC date/time is %d-%d-%d, %02d:%02d:%02d.",
+		 read_tm.tm_mday, read_tm.tm_mon + 1, read_tm.tm_year + 1900,
+		 read_tm.tm_hour, read_tm.tm_min, read_tm.tm_sec);
+	tst_res(TPASS, "RTC READ TEST Passed");
+
+	if (rtc_tm_cmp(&set_tm, &read_tm)) {
+		tst_res(TFAIL | TERRNO, "RTC SET TEST Failed");
+		return;
+	}
+
+	tst_res(TPASS, "RTC SET TEST Passed");
+
+	tst_res(TINFO, "RTC Tests Done!");
+}
+
+static void rtc_cleanup(viod)
+{
+	if(rtc_fd > 0){
+		SAFE_CLOSE(rtc_fd);
+	}
+}
+
+static struct tst_test test={
+	.setup = rtc_setup,
+	.test_all = set_rtc_test,
+	.options = rtc_options,
+	.cleanup = rtc_cleanup,
+	.needs_root = 1,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
