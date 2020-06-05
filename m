Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AD1EF26D
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 09:48:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83EE83C2F79
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 09:48:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6BEFA3C2232
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:48:22 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D8E0420E74F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:48:21 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id a127so4523927pfa.12
 for <ltp@lists.linux.it>; Fri, 05 Jun 2020 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JGBBvI36wCGos6gXklWMaqqlNYB2AMjdJo/M3bRyYc=;
 b=oCOS2ZLCgTv99Mxa8SAp3Czp3PH4TSepMR+U+bjLurUIPNIt3f0rxyM9d6N4oiX5I1
 rfeKEQySc2Q/5eg/mhySts9bdXxP+fwE48RvpbKBBzoUXM++Z/AtTQc0ByKfH458ZcBs
 cppzlYPrgfZtjFyTTwBZe8rx29aW2pODcZvFtY6FX0uG27ComcywQRFPEgq6jp41TYD7
 q6xKIq5vYVWZCoWQtIe9o6ebXufzcdA1B2wOLpxDvNM2v+fthQu1U0a/FgWB8ikg8703
 jmP8JTXQTLf+j9qytcd/7ShBNlr+9SdgpmE+ebJrhznuZD/5bc8EcnwaXhZ6QFP2hpO4
 b/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1JGBBvI36wCGos6gXklWMaqqlNYB2AMjdJo/M3bRyYc=;
 b=qXuwtagA8MCHuY3g7JoH9rPAreZm9IQ7CFahAmw1F79+bh+eU9LCXGQLOUeCaQ9ElJ
 KgbVI01/rPJ1RqBjvMYmlU1s16xljORmqdftr1WcuO1rjY4OH/EIKS/aQt0MFLbgb5MS
 f6xmmBLvS+pCGuULzertd9Se0WZRpxHCZNTKuyXrAUTLSQDY7ZUXFHxrAG0Mw8cHCxU7
 AdJX+Jmj7tdXbW/Hvt5LTzVnJR/TQg54GwSbzZycJ4MztI2+zDOetw+1XnFcIQ2LBzVN
 sySNxePgf5qoPm11onKv0TdtcjWYIEdu03o7SoOTjPpMVKoAqS+7Ue/ab3j3n4ao6Reb
 oGgA==
X-Gm-Message-State: AOAM531fNeELHBiMck1N8eduiYpCs+5Vxf296d+RRp3Ef0cWjv5EIJ6H
 ZSAJ4oXVC+kujt2Ph3bh6eI+cA6C01U=
X-Google-Smtp-Source: ABdhPJyK2mBzRRiB1Q+yRs1QQ5jQZLy2EaWVfETSdn5RIe5wQCsFvgmLcyqw1waqsFjoHtViZnRCmg==
X-Received: by 2002:a63:f316:: with SMTP id l22mr7924616pgh.38.1591343299877; 
 Fri, 05 Jun 2020 00:48:19 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id w186sm6845523pff.83.2020.06.05.00.48.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 00:48:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  5 Jun 2020 13:18:13 +0530
Message-Id: <e15907ed42f0276f09c4120b9255db5764d4e9b6.1591343286.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/clock_gettime: Add test to check bug during
 successive readings
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

An issue was reported recently where a bug was found during successive
reading of 64 bit time on arm32 platforms. Add a test for that.

https://github.com/richfelker/musl-cross-make/issues/96

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/clock_gettime/.gitignore  |  1 +
 .../syscalls/clock_gettime/clock_gettime04.c  | 96 +++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f9a6397560fa..d7c3cbed611a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -96,6 +96,7 @@ clock_nanosleep04 clock_nanosleep04
 clock_gettime01 clock_gettime01
 clock_gettime02 clock_gettime02
 clock_gettime03 clock_gettime03
+clock_gettime04 clock_gettime04
 leapsec01 leapsec01
 
 clock_settime01 clock_settime01
diff --git a/testcases/kernel/syscalls/clock_gettime/.gitignore b/testcases/kernel/syscalls/clock_gettime/.gitignore
index 9d06613b6f41..304eedab68c6 100644
--- a/testcases/kernel/syscalls/clock_gettime/.gitignore
+++ b/testcases/kernel/syscalls/clock_gettime/.gitignore
@@ -1,4 +1,5 @@
 clock_gettime01
 clock_gettime02
 clock_gettime03
+clock_gettime04
 leapsec01
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
new file mode 100644
index 000000000000..139883033dce
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar<viresh.kumar@linaro.org>
+ *
+ * Check time difference between successive readings and report a bug if
+ * difference found to be over 5 ms.
+ */
+
+#include "config.h"
+#include "tst_timer.h"
+#include "tst_safe_clocks.h"
+
+clockid_t clks[] = {
+	CLOCK_REALTIME,
+	CLOCK_REALTIME_COARSE,
+	CLOCK_MONOTONIC,
+	CLOCK_MONOTONIC_COARSE,
+	CLOCK_MONOTONIC_RAW,
+	CLOCK_BOOTTIME,
+};
+
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .gettime = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_clock_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void run(unsigned int i)
+{
+	struct tst_ts ts_start, ts_end;
+	long long start, end, diff;
+	struct test_variants *tv;
+	int count = 10000;
+	unsigned int j;
+
+	while (--count) {
+		/* Store reference time in start */
+		if (clks[i] == CLOCK_REALTIME) {
+			struct timeval tval;
+
+			/* Compare CLOCK_REALTIME with gettimeofday() as well */
+			if (gettimeofday(&tval, NULL) < 0)
+				tst_brk(TBROK | TERRNO, "gettimeofday() failed");
+
+			start = tst_timeval_to_ms(tval);
+		} else {
+			tv = &variants[0];
+			ts_start.type = tv->type;
+			tv->gettime(clks[i], tst_ts_get(&ts_start));
+			start = tst_ts_to_ms(ts_start);
+		}
+
+		for (j = 0; j < ARRAY_SIZE(variants); j++) {
+			tv = &variants[j];
+			ts_end.type = tv->type;
+
+			tv->gettime(clks[i], tst_ts_get(&ts_end));
+			end = tst_ts_to_ms(ts_end);
+
+			diff = end - start;
+			if (diff < 0) {
+				tst_res(TFAIL, "%s: Time travelled backwards: %lld",
+						tst_clock_name(clks[i]), diff);
+				return;
+			}
+
+			if (diff >= 5) {
+				tst_res(TFAIL, "%s: Difference between successive readings greater than 5 ms: %lld",
+						tst_clock_name(clks[i]), diff);
+				return;
+			}
+
+			/* Refresh time in start */
+			start = end;
+		}
+	}
+
+	tst_res(TPASS, "%s: Difference between successive readings is reasonable",
+		tst_clock_name(clks[i]));
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(clks),
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
