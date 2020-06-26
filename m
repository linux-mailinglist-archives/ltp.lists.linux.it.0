Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0920AC50
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 770F43C5848
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7AEEC3C2B6E
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:32 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BF9C4140119D
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:31 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id u185so2189832pfu.1
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PL/dCm76JeK1omvSJcyrmaZgledJfVJsdrGkc4b5sv8=;
 b=fCNpNTzKOksgD+E4pU3co/5wtrBCWPL27WCgIavVGfw9RxSUJZ1LidqO4RALnb91Ah
 9fFkFdks9awzgWBOBu9EdWzNNxvP30tT41aieAWqWkMypWX3YjoNfNw6hmWx/yKvN/CL
 QQdc2U+x1mMmXV7s45WBDbI5981d4lrLE5cEoOssTjIcMLMvvejw7McoioisDPkfHe45
 tZXZb97HYl2x37FaDPadvNjt9HWhEzOUzJVNY+pOZwu3SiC2i219UmFsLggstR7j25+u
 oO8w2w0fjFYZRbkSrjTv9wwKBrxLMOD7+R0vsGKE1uZQLBqR/ydWwfVnwZOxEc0sZbCC
 h8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PL/dCm76JeK1omvSJcyrmaZgledJfVJsdrGkc4b5sv8=;
 b=EuXnk5qqn0EZvOYxSUz9VN+LRhQ+KOiS77ns5hcLwOXAAqP5GfHsE8Jkd8PSwZ9oVs
 4bo5j/bowuJHNwg2chIziVhVwcj1PIj7DbqStYJ2fOmjz4bjc6pGQkbqq0LkDXxuk6Ze
 /ccfuKvOtYvFN7BcKeFKDnap6pbJdgspMlxsvOT85cOVYfiErfuIvFlrq7Ax11PWieZC
 XlLLfH8pLEMW/D9jQVvahFKuLVj6EAPcx4N5lxAUyeYjbtaQC5EP0fODOheOq5IEG7DX
 qDHdZoNAUOIY6ih1qzbjVg/Ltmz00iY72QZr4bdpOHd4X/PR67b+X82aRgsy7SY5nsen
 Tn9w==
X-Gm-Message-State: AOAM531zVrksHpfrcHWhFK+PblzDrkgtW3/PS3KFfFw1isZcL2hi6fUK
 0n7IC4EchbbNdkDZFb4zMbzYjvMq3zU=
X-Google-Smtp-Source: ABdhPJwbtBXDPmbq8mYlMz1C2LOvVxaH3gxlGP6PzahQDLPA5ymzL68UYlnNLGLUSE6do3vMfsHVGQ==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr1362690pgh.225.1593152609939; 
 Thu, 25 Jun 2020 23:23:29 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id x8sm10820179pje.31.2020.06.25.23.23.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:23:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:32 +0530
Message-Id: <5b16889b19e969b79fa7d46c533bb5989ace1e46.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V7 19/19] syscalls: clock_settime: Add test around
 y2038 vulnerability
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
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/clock_settime/.gitignore  |   1 +
 .../syscalls/clock_settime/clock_settime03.c  | 119 ++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_settime/clock_settime03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 2d2e24615be6..718ac1148392 100644
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
index 000000000000..7245863137b5
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -0,0 +1,119 @@
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
+	tst_its_set_interval_sec(&its, 0);
+	tst_its_set_interval_nsec(&its, 0);
+	tst_its_set_value_sec(&its, time + TIMER_DELTA);
+	tst_its_set_value_nsec(&its, 0);
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
