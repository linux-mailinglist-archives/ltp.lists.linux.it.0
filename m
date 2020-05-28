Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA931E5E80
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:39:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32F1A3C31FF
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:39:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 144933C31C0
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:39:39 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B1F22143E7DB
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:39:38 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id y11so3177001plt.12
 for <ltp@lists.linux.it>; Thu, 28 May 2020 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgZUkcHCLAjdVs8BHPDbCGZTAtukCgdtJTglUHYwc0g=;
 b=rTRnVCuXK0Q235qLfKAzwE3fBVyMKaz6jBJ0L+g6dYoJRIAvRJNID7u+XYFwq1JPTs
 oaRx8RRf0+C/BnfMp7F/YCj49gK/2fh4SfPtNiPJsyTHVL6mRDJrNgjvZY9bAv13zY4b
 YnJhFyrxi87urRvXNP1aJlDPTBStkQan79I+rEDH+VONRypH+mIZSQugR9Q6+6ZuwCfK
 X1UK8PcGtc9vw6oPcpn4we/9yNqNpYVeur4Ff/hfbAbzfFIWryWzgZOWg4FZOYlQs813
 XjUMtZaVkvO07mLx/q6/YHCRKnEO9GIRDy7JIj2PetUomCNjB30zkRrsS265hFUt4pSn
 lUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgZUkcHCLAjdVs8BHPDbCGZTAtukCgdtJTglUHYwc0g=;
 b=WhnASYHkVEt2ow2zLmGIhopOlnoJMHXwLpWF1V+yKZr8g9Kc53qgIuui09hDYlYWrp
 7nZ0Z23NYa0MbvWJf3hnsuHUbuSCIoZ/tXMm8d5n/Vi9CNeQoyUDY5BJ4lQQTVJ/d6UZ
 j6PTwitI1Z7WKXkRHVoon5QZSJIhf8RQ+BwgroJEUp6q4BwaMSlNkboihodBynP9jTQi
 y5KQNWAsvVSoQEMGBEu6fhWzAuX0RXYga1M9F3adKD/o4WhJyGbYh0gekQ+fHP2qx9y7
 2FVY+iP1sLmlMMhitDc7A6yB44IUPfCryMw4ypePPdlviLWbUZwN9QPBCwZCLDEF5niF
 BKlw==
X-Gm-Message-State: AOAM532xKCgwbF8vJKTZxgN5LONupKXeNrhHMFCZSVLmdvy3tOal6uxC
 6WiutA8SUoPiQkroypDci0T308KsasQ=
X-Google-Smtp-Source: ABdhPJyTeBbpOjZ66PNNrC9RubnCvFkn15aZjyxg05IKi2Hows8tohH4SAf/FI5eqJk1cV/XfE3DAw==
X-Received: by 2002:a17:902:bb87:: with SMTP id
 m7mr3095436pls.270.1590665976762; 
 Thu, 28 May 2020 04:39:36 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id w12sm4968184pjy.15.2020.05.28.04.39.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 04:39:35 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 17:09:32 +0530
Message-Id: <1d2d85f41a436c77365061ee2eef3d69665d6c4b.1590665818.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V3] syscalls: clock_settime: Add test around y2038
 vulnerability
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

This adds a test around the y2038 vulnerability, it sets the system time
to just before y2038 time (i.e. max value that can be stored in s32),
and adds a timer to expire just after crossing it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V3:
- Check for size of structure instead of running clock_settime().
- Check for 50 ms of delta in the time difference.

 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_settime/.gitignore  |   1 +
 .../syscalls/clock_settime/clock_settime03.c  | 116 ++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_settime/clock_settime03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 8457db34e999..d7c3cbed611a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -101,6 +101,7 @@ leapsec01 leapsec01
 
 clock_settime01 clock_settime01
 clock_settime02 clock_settime02
+clock_settime03 clock_settime03
 
 clone01 clone01
 clone02 clone02
diff --git a/testcases/kernel/syscalls/clock_settime/.gitignore b/testcases/kernel/syscalls/clock_settime/.gitignore
index 28121755006b..b66169b3eb7b 100644
--- a/testcases/kernel/syscalls/clock_settime/.gitignore
+++ b/testcases/kernel/syscalls/clock_settime/.gitignore
@@ -1,2 +1,3 @@
 clock_settime01
 clock_settime02
+clock_settime03
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
new file mode 100644
index 000000000000..2d65564190b0
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar<viresh.kumar@linaro.org>
+ *
+ * Check Year 2038 related vulnerabilities.
+ */
+
+#include <signal.h>
+#include "config.h"
+#include "tst_timer.h"
+#include "tst_safe_clocks.h"
+
+#define TIMER_DELTA	3
+#define ALLOWED_DELTA	(50 * 1000) /* 50 ms */
+
+static struct tst_ts start, end;
+static struct tst_its its;
+
+static struct test_variants {
+	int (*clock_gettime)(clockid_t clk_id, void *ts);
+	int (*clock_settime)(clockid_t clk_id, void *ts);
+	int (*timer_settime)(timer_t timerid, int flags, void *its,
+			     void *old_its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	start.type = end.type = its.type = tv->type;
+
+	/* Check if the kernel is y2038 safe */
+	if (tv->type != TST_KERN_OLD_TIMESPEC &&
+	    sizeof(start.ts.kern_old_ts) == 8)
+		tst_brk(TFAIL, "Not Y2038 safe to run test");
+}
+
+static void run(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	unsigned long long time = 0x7FFFFFFE; /* Time just before y2038 */
+	struct sigevent ev = {
+		.sigev_notify = SIGEV_SIGNAL,
+		.sigev_signo = SIGABRT,
+	};
+	long long diff;
+	timer_t timer;
+	sigset_t set;
+	int sig, ret;
+
+	if (sigemptyset(&set) == -1)
+		tst_brk(TBROK, "sigemptyset() failed");
+
+	if (sigaddset(&set, SIGABRT) == -1)
+		tst_brk(TBROK, "sigaddset() failed");
+
+	if (sigprocmask(SIG_BLOCK, &set, NULL) == -1)
+		tst_brk(TBROK, "sigprocmask() failed");
+
+	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME_ALARM, &ev, &timer));
+	if (TST_RET != 0)
+		tst_brk(TBROK | TERRNO, "timer_create() failed");
+
+	tst_ts_set_sec(&start, time);
+	tst_ts_set_nsec(&start, 0);
+
+	ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&start));
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "clock_settime() failed");
+
+	tst_its_set_time(&its, time + TIMER_DELTA, 0, 0, 0);
+
+	TEST(tv->timer_settime(timer, TIMER_ABSTIME, tst_its_get(&its), NULL));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "timer_settime() failed");
+
+	if (sigwait(&set, &sig) == -1)
+		tst_brk(TBROK, "sigwait() failed");
+
+	ret = tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(&end));
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "clock_gettime() failed");
+
+	if (sig == SIGABRT) {
+		diff = tst_ts_diff_ms(end, start);
+
+		if (diff < TIMER_DELTA * 1000 - ALLOWED_DELTA ||
+		    diff > TIMER_DELTA * 1000 + ALLOWED_DELTA)
+			tst_res(TINFO, "Slept for unexpected duration, expected:%d, actual:%lld",
+				TIMER_DELTA * 1000, diff);
+		tst_res(TPASS, "clock_settime(): Y2038 test passed");
+		return;
+	}
+
+	tst_res(TFAIL, "clock_settime(): Y2038 test failed");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_root = 1,
+	.restore_wallclock = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
