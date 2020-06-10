Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D241F4BD3
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 05:39:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB7163C02D9
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 05:39:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C45273C01FA
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 05:39:15 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B41871A0088E
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 05:39:14 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id 64so483233pfv.11
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xP5hijCm0AZ2Qj3bGFXdk6M12LcVRIFAVkgME+2gYNw=;
 b=VCCT2urjR5dYLbkXuytnQjl5uSoTRFGrHLVkpJHKTjt6dFznI2bjCsbFl7hjt0Ga3N
 g5tvzIk0bYlDlso1Pjg7JbjCEYTEVlyg6sjV4fwUtcgij9UrODaPg1OXIGeMSdZjjnOT
 u4zwR2bNShqdwzpeCm0p4kAlA0nkAq53WXSLoL26wBB2SRLW1TEA0shQW06szwq/E5rj
 d2tXHO2IDXa0fVk0bcvmH/vPAzdB6ahfGTOxLKumTtqErrhc1KGGC5r7wEHPxBbT0oe5
 hxWXzel8KXDYJXekf7H/LpJ0Qk+yTj1JNeuKYvkTCgggfuh46VbxpLasdxSLERogX4Xx
 UFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xP5hijCm0AZ2Qj3bGFXdk6M12LcVRIFAVkgME+2gYNw=;
 b=m2VchNflUPTOcG6TrPCGIk17ZX5PiLJLMcguI/Ie/vNDMKPe0izbsBy8b2KGISQRhv
 WvNio56ebrNVOl00o39JpywQG/JKuUA0EQNsTD0KH+JIAJ8L3+IgRW0ps9aGECJDboDQ
 NWADGMjn22ZSOKYLxHt1qhSaARIX0eBepDJtBk7lKv8BP4/cEG0rso4yqOE8yN+Fb5Qq
 hjEok2hlstIYUSa/7XXK6b2VcnDjCeJLwG82mkx8dC+HrkSk19gBjlWhU93zzQNv1vZi
 btexnq6e78FIYrg7sKmcf/mku1t+54HTv811t9HsueuRmspBaoE5xkbnKMcyXQhUuGkZ
 s9FQ==
X-Gm-Message-State: AOAM530XV2Eg1kTKAhjMAy9lYXSaK6AksJbBj2kUNSGACj+wWGFrM49P
 yYcp8IUrmUuqwbIk6zvj70hMZxA0K1A=
X-Google-Smtp-Source: ABdhPJwZFJR2eXilW+pk1fnBuGklXrFf0dfMULLwnETa357k6t/XUtoscbUN3vFk/IRW2w7rBnXOow==
X-Received: by 2002:aa7:9093:: with SMTP id i19mr893706pfa.152.1591760352629; 
 Tue, 09 Jun 2020 20:39:12 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id j24sm9772737pga.51.2020.06.09.20.39.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 20:39:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 10 Jun 2020 09:08:47 +0530
Message-Id: <9621b4f97b539f2e080b00491eb9ba4973878028.1591760262.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
References: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V6 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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

This adds support for time64 tests to the existing timer_gettime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V6: Drop the binary files included by mistake.

 include/tst_timer.h                           |  45 +++++++
 .../syscalls/timer_gettime/timer_gettime01.c  | 124 ++++++++----------
 2 files changed, 97 insertions(+), 72 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 256e1d71e1bc..708a1e9e9a7a 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -15,6 +15,7 @@
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
+#include "lapi/common_timers.h"
 #include "lapi/syscalls.h"
 
 /*
@@ -112,6 +113,16 @@ struct __kernel_timespec {
 	__kernel_time64_t       tv_sec;                 /* seconds */
 	long long               tv_nsec;                /* nanoseconds */
 };
+
+struct __kernel_old_itimerspec {
+	struct __kernel_old_timespec it_interval;    /* timer period */
+	struct __kernel_old_timespec it_value;       /* timer expiration */
+};
+
+struct __kernel_itimerspec {
+	struct __kernel_timespec it_interval;    /* timer period */
+	struct __kernel_timespec it_value;       /* timer expiration */
+};
 #endif
 
 enum tst_ts_type {
@@ -129,6 +140,14 @@ struct tst_ts {
 	} ts;
 };
 
+struct tst_its {
+	enum tst_ts_type type;
+	union {
+		struct __kernel_old_itimerspec kern_old_its;
+		struct __kernel_itimerspec kern_its;
+	} ts;
+};
+
 static inline void *tst_ts_get(struct tst_ts *t)
 {
 	if (!t)
@@ -147,6 +166,22 @@ static inline void *tst_ts_get(struct tst_ts *t)
 	}
 }
 
+static inline void *tst_its_get(struct tst_its *t)
+{
+	if (!t)
+		return NULL;
+
+	switch (t->type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return &t->ts.kern_old_its;
+	case TST_KERN_TIMESPEC:
+		return &t->ts.kern_its;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t->type);
+		return NULL;
+	}
+}
+
 static inline int libc_clock_getres(clockid_t clk_id, void *ts)
 {
 	return clock_getres(clk_id, ts);
@@ -212,6 +247,16 @@ static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
 			   request, remain);
 }
 
+static inline int sys_timer_gettime(timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime, timerid, its);
+}
+
+static inline int sys_timer_gettime64(timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime64, timerid, its);
+}
+
 /*
  * Returns tst_ts seconds.
  */
diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index 1c75f1cf0e45..d2b89eab4223 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -1,24 +1,5 @@
-/******************************************************************************
- * Copyright (c) Crackerjack Project., 2007                                   *
- * Porting from Crackerjack to LTP is done by:                                *
- *              Manas Kumar Nayak <maknayak@in.ibm.com>                       *
- * Copyright (c) 2013 Cyril Hrubis <chrubis@suse.cz>                          *
- *                                                                            *
- * This program is free software;  you can redistribute it and/or modify      *
- * it under the terms of the GNU General Public License as published by       *
- * the Free Software Foundation; either version 2 of the License, or          *
- * (at your option) any later version.                                        *
- *                                                                            *
- * This program is distributed in the hope that it will be useful,            *
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of            *
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See                  *
- * the GNU General Public License for more details.                           *
- *                                                                            *
- * You should have received a copy of the GNU General Public License          *
- * along with this program;  if not, write to the Free Software Foundation,   *
- * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA           *
- *                                                                            *
- ******************************************************************************/
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) Crackerjack Project., 2007 */
 
 #include <time.h>
 #include <signal.h>
@@ -26,71 +7,70 @@
 #include <stdio.h>
 #include <errno.h>
 
-#include "test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
 
-char *TCID = "timer_gettime01";
-int TST_TOTAL = 3;
+static struct test_variants {
+	int (*func)(timer_t timer, void *its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timer_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+#if (__NR_timer_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
-static void setup(void)
-{
-	TEST_PAUSE;
-	tst_tmpdir();
-}
+static timer_t timer;
 
-int main(int ac, char **av)
+static void setup(void)
 {
-	int lc;
-
 	struct sigevent ev;
-	struct itimerspec spec;
-	int timer;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 
 	ev.sigev_value = (union sigval) 0;
 	ev.sigev_signo = SIGALRM;
 	ev.sigev_notify = SIGEV_SIGNAL;
-	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
-
-	if (TEST_RETURN != 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "Failed to create timer");
 
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
+	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
 
-		TEST(ltp_syscall(__NR_timer_gettime, timer, &spec));
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "timer_gettime(CLOCK_REALTIME) Passed");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(CLOCK_REALTIME) Failed");
-		}
-
-		TEST(ltp_syscall(__NR_timer_gettime, -1, &spec));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EINVAL) {
-			tst_resm(TPASS,	"timer_gettime(-1) Failed: EINVAL");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "timer_create() failed");
+		return;
+	}
+}
 
-		TEST(ltp_syscall(__NR_timer_gettime, timer, NULL));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT) {
-			tst_resm(TPASS,	"timer_gettime(NULL) Failed: EFAULT");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
+static void verify(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_its spec = {.type = tv->type, };
+
+	TEST(tv->func(timer, tst_its_get(&spec)));
+	if (TST_RET == 0) {
+		tst_res(TPASS, "timer_gettime() Passed");
+	} else {
+		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
 	}
 
-	cleanup();
-	tst_exit();
+	TEST(tv->func((timer_t)-1, tst_its_get(&spec)));
+	if (TST_RET == -1 && TST_ERR == EINVAL)
+		tst_res(TPASS, "timer_gettime(-1) Failed: EINVAL");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
+
+	TEST(tv->func(timer, NULL));
+	if (TST_RET == -1 && TST_ERR == EFAULT)
+		tst_res(TPASS, "timer_gettime(NULL) Failed: EFAULT");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
 }
+
+static struct tst_test test = {
+	.test_all = verify,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
