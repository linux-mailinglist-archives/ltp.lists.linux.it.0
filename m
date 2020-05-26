Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 651671E21AD
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 14:11:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51EA93C32CC
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 14:11:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 109DE3C325C
 for <ltp@lists.linux.it>; Tue, 26 May 2020 14:10:57 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3CA92600C80
 for <ltp@lists.linux.it>; Tue, 26 May 2020 14:10:57 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id 131so1729460pfv.13
 for <ltp@lists.linux.it>; Tue, 26 May 2020 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/vJtrINbAAGIxb4a2seKMwVBQENSfK2GOrKhr9y9ZQ=;
 b=kSGiBegoDYXAGTtiXtLiSupitGlMH7iwd6AJkGR6Ux3+j2/OT5Xym/iUu0HhrnBlUm
 XYlb3+K84MKtXVaJhmMBGE9PyFrq1gqi+Yf2ooR1fQmVmpUyP8mCfNdd1t22jCmSudM0
 +VuY8isIa6lhuHv4lbGrwkO6dZkdvWqgPj9wRLznYPbTXdmwRhdf3pVGMy2EuFjPHJqb
 UAaJBSZgQqbQH2dt+Au2aBtPQoeMlVz/U6rtD7E9EfASgNdtgnD3NR+Nkiz8UNM1dmic
 QKoQF62qMh74DhMaAXQvUvECpZYLV3uLrA0b473D0jYN9ea6iyC+OfUBgkb9AzXBlcGp
 NgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/vJtrINbAAGIxb4a2seKMwVBQENSfK2GOrKhr9y9ZQ=;
 b=K345ZCkwVgAdwV1kPxDGYNQhqP5z5LYu39KxU3c6xaDMOqCggtGvY8It1rXJ7wlY55
 7hJwgTKrUyZ96WYL7GV97ORfIlUtDQRngj2RXpeoFdYngGzZETHpIruDyHSiUjTiJ0iq
 xi8rjTBgQA3WX1nahiVlRsAui/UnbKZIpO0MdrlB1QfnWhawJWpRNX9c2sn4PUexkrcf
 v1iM6i2VDQ/uXZFNDYq70iUepaF9ELKsF8Cbtv0ElHoMrkmxcBmxN7WH+ASbgJMpL9Ba
 TJXAkWm8o7S+/Uh+9w1qKAiNmrcoKZzkjKo4KVxW3pLFZQnl+CyDWtfNxAN/mQ3occ4q
 hc0w==
X-Gm-Message-State: AOAM531IeASaSTo9PCtebIhi1KzyhuP/3eanGPMeH9fWFDlVUm1HILsE
 dKjOM0MsGQGp4ksmvMV3jfvOBmh5AQc=
X-Google-Smtp-Source: ABdhPJwrT4yyuzg45oeD2DH0MZXIKATByHcwgvwlT2qkTq7R3th8o2cZM0TGKuZWcpmye2upW8f/uw==
X-Received: by 2002:a63:4563:: with SMTP id u35mr770386pgk.163.1590495055039; 
 Tue, 26 May 2020 05:10:55 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id y5sm13958632pge.50.2020.05.26.05.10.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 05:10:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it,
	arnd@arndb.de
Date: Tue, 26 May 2020 17:40:51 +0530
Message-Id: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: clock_settime: Add test around y2038
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds a test around the y2038 vulnerability, it sets the system time
to just before y2038 time (i.e. max value that can be stored in s32),
and adds a timer to expire just after crossing it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Arnd/Cyril,

There is some problem with this test, I am trying to fire the timer
after 4 seconds, but it fires in no time. I am not sure on what's
incorrect here.

 runtest/syscalls                              |  1 +
 .../kernel/syscalls/clock_settime/.gitignore  |  1 +
 .../syscalls/clock_settime/clock_settime03.c  | 96 +++++++++++++++++++
 3 files changed, 98 insertions(+)
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
index 000000000000..94e2d4ce4b9e
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -0,0 +1,96 @@
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
+#define EXPIREDELTA 4
+
+static struct tst_ts ts;
+static struct tst_its its;
+
+static struct test_variants {
+	int (*clock_settime)(clockid_t clk_id, void *ts);
+	int (*timer_settime)(timer_t timerid, int flags, void *its,
+			     void *old_its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	ts.type = its.type = variants[tst_variant].type;
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
+	tst_ts_set_sec(&ts, time);
+	tst_ts_set_nsec(&ts, 0);
+
+	ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "clock_settime() failed");
+
+	tst_its_set_time(&its, time + EXPIREDELTA, 0, 0, 0);
+
+	TEST(tv->timer_settime(timer, TIMER_ABSTIME, tst_its_get(&its), NULL));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "timer_settime() failed");
+
+	if (sigwait(&set, &sig) == -1)
+		tst_brk(TBROK, "sigwait() failed");
+
+	if (sig == SIGABRT) {
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
