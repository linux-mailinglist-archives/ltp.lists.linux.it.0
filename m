Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5121B1DE4D7
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 951BD3C4CCF
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 38F823C4C1E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:48 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 562191A016F9
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:47 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id s10so4849350pgm.0
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zWxBFp46kUwkdvJv4BdzzMb1JroGhGie/PTfmvR/2Ek=;
 b=T68siDA3FAUapexSk9KhF+WBVKEJ2eipjFNCZheG9ba4CjRRg60OT+8Cey1Y6hDCk9
 s5kM3/2HXeKetTBWbcgIGeRu+YM8K3OpuveJ64p6OP2Pge9FPNoinPGW2vm0TmdfqLeZ
 cOh/ARNAqMm2dgFHZ5ifN30kVZLib38XwrXejvhcCaacinAxSJ6gbrPgWjzqViPdJRqO
 qDRD0wTanT1DZjDdoHmj/TjF7HMTLvjVHH/zFvpWHVMIqRKpHsjtVnkNWMSkRKPkQ+lE
 3WU3lfbrfILXYApKO9LjTgO4AGSpiBusYr4qP+q7+oXupH6bOZx44t2qLtBJUZwntFYI
 HSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zWxBFp46kUwkdvJv4BdzzMb1JroGhGie/PTfmvR/2Ek=;
 b=RRg4sulJ37265K2VSGdsuBgAotMvXsh6iNM1Q2lZaK6+dzVNI6lisiNnggimlavMaJ
 6py8kb6SqCV64E/QslJpVOfDqkmRdSVcA0E1Zfplw+f6cnMGKpoXVxMLlqtDAf8JFuSn
 DgrRelRofP8aXSRp3ZFP5GgJaQnCuEM8vanxuMykSSL188DwF/FCSkOX5faMIPyzHuIF
 I6nzDUbhwO7lW5Wc+53ZlIltHgEAS4RLJFubKdfFZnB93pWynaqiLJSfMwRkKVpoT3jW
 UCuhOpaDn+R6dcgJUvAPQvDAK6GZd4nejVYFzfnXpyr80OVAS2qvrHc6SY9y3QSU2ds4
 zIeg==
X-Gm-Message-State: AOAM530TRau8JZa7u9Zre8bFi8ETVTZ7t8bVYowYxHsE4LB8//fppbfn
 79gY8UiShSykOXLVj/MLro0FWIR1Aq0=
X-Google-Smtp-Source: ABdhPJz5+cX06Px7M0XA0dmu3plE6FbKoMlGyHIdGy+pIsiuFU/KcBVKod0Wg6B5wigO1yF5DSwb0A==
X-Received: by 2002:a63:7f5d:: with SMTP id p29mr12776696pgn.337.1590144705501; 
 Fri, 22 May 2020 03:51:45 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id l33sm7030224pje.22.2020.05.22.03.51.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:51:44 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:21 +0530
Message-Id: <a4a628a637a6eeeed4249656836bd217f5cbb9ac.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V4 01/17] syscalls/timer_gettime: Add support for
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
 include/tst_timer.h                           |  45 +++++++
 .../syscalls/timer_gettime/timer_gettime01.c  | 124 ++++++++----------
 2 files changed, 97 insertions(+), 72 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 256e1d71e1bc..d9afbe0ece71 100644
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
+		struct __kernel_itimerspec kern_old_its;
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
