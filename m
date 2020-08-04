Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272423BAB6
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 14:50:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 359863C32CE
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 14:50:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AC5EE3C2555
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:50:26 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8D0A3601560
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 14:48:57 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id z5so22045978pgb.6
 for <ltp@lists.linux.it>; Tue, 04 Aug 2020 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=4isy8uAeFE2hqmUU0fWwNrFG8LT41rGX8ZI9jGp4swU=;
 b=bBePxoWftmDKUtaebl2QSZeq3tMxYOmYTOeYNCZjfxUdgXRet2aETAj5jr8KpUdEzP
 51Ti1/M1Xw+xMG+wD/LnRVW9hkL3o5diDZ0M7dz4g6z+xWU/D+BKFsLb5Ajk8EwnIp55
 rsI8DESKcN5JC3GBqi+RDRQwS5EuhfRNGqlW0Hzwf2Y9GgHhX+Uzd6zLTRSXP4D8kZed
 UP1/2PFLPeVqb5/iLLg0gCoPQMapgP0amHvcFh6Wit5WLiWuFWkBME8WgUuiHoSOjDiN
 Bffi2op3onCrxptnwBlAZId8hcjdrU79NhQaTawBRSW6vOxrjoAW0x6uNCPZSMB2+MRG
 wDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4isy8uAeFE2hqmUU0fWwNrFG8LT41rGX8ZI9jGp4swU=;
 b=AHyofqu46/sTDlhnyiM2h4Yw+gHiDWCvN7OSTkJBJCKmaSOtPR6UPzOO0xafYs0RTi
 ZxI33WvHVNx9e2fTRv0itMHQ8tTn89cXjFW3pwJDH94Byi4VluhWvAxY1jXLc4B97IDq
 ndJIiO04oamJfROeWEjbGC4H3v3nU1XM2RivtNZSSm8n6lSYHAMjSkB2UhGFgH3e7EYf
 SlA95fOHCioRT0XP1qVdX6m7LekvxR10y9J6iXjQDOpGwf10BXSIyPOhh02xdPL5dM92
 vLpXtPTsF+sR1J5hqHrpSuQabwgHYcsIBAytBkuJU4hCsw57eDATsFXGOXlqa0Fc7cwm
 YgpA==
X-Gm-Message-State: AOAM530hWVaJwVrHtr1KQZLq60owBP5eNE8iB4RGk1l8resRi5Hgz8ej
 tt8aDHjZOQS47cypfYBtUOzvlFJjMZI=
X-Google-Smtp-Source: ABdhPJzZepMOGlr6gcytW+JN8ZbjfVy1vNZvyoYgFkF6v2prip5ykWd3SUlhzGe+iKputQ2eujBoHQ==
X-Received: by 2002:a65:400a:: with SMTP id f10mr18529978pgp.197.1596545416536; 
 Tue, 04 Aug 2020 05:50:16 -0700 (PDT)
Received: from localhost ([122.162.173.150])
 by smtp.gmail.com with ESMTPSA id 80sm12640219pfy.147.2020.08.04.05.50.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 05:50:15 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 18:20:08 +0530
Message-Id: <96ce72a605e365a040b258db9323d3962ab80e29.1596545279.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V8] syscalls: clock_settime: Add test around y2038
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds a test around the y2038 vulnerability, it sets the system time
to just before y2038 time (i.e. max value that can be stored in s32),
and adds a timer to expire just after crossing it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V8:
- Check compatibility issues for TST_KERN_OLD_TIMESPEC and not the new
  timespec.
- s/TFAIL/TCONF/ in setup()
- Use kernel_timer_t
- rearrange code and don't expect timer to fire before.

 runtest/syscalls                                   |   1 +
 testcases/kernel/syscalls/clock_settime/.gitignore |   1 +
 .../syscalls/clock_settime/clock_settime03.c       | 123 +++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 testcases/kernel/syscalls/clock_settime/clock_settime03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 3c6e78a4c6d0..3c2f5f6c0b37 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -99,6 +99,7 @@ leapsec01 leapsec01
 
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
index 000000000000..da062a8d0333
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -0,0 +1,123 @@
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
+	int (*timer_settime)(kernel_timer_t timerid, int flags, void *its,
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
+	if (tv->type == TST_KERN_OLD_TIMESPEC &&
+	    sizeof(start.ts.kern_old_ts) == 8)
+		tst_brk(TCONF, "Not Y2038 safe to run test");
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
+	kernel_timer_t timer;
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
+	if (sig != SIGABRT) {
+		tst_res(TFAIL, "clock_settime(): Y2038 test failed");
+		return;
+	}
+
+	diff = tst_ts_diff_ms(end, start);
+
+	if (diff < TIMER_DELTA * 1000) {
+		tst_res(TFAIL, "Timer expired too soon, after %llims", diff);
+		return;
+	}
+
+	if (diff > TIMER_DELTA * 1000 + ALLOWED_DELTA)
+		tst_res(TINFO, "Time expired too late, after %llims", diff);
+	else
+		tst_res(TPASS, "clock_settime(): Y2038 test passed");
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
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
