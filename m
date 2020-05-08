Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A41CA214
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:25:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C59F63C2822
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:25:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A941C3C7091
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:23 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0CA16601BD2
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:22 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id fu13so3661697pjb.5
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRQ0M2mToomU62cFanQKDr33M4FWAQNFIlLfcrKbuXY=;
 b=cV921NDYKeFRyzWil4ZVKuBM66nVCJ5f4oy//NUh5VCCDrBFlGpDQgguG7q7xcG5dr
 EhC2466LaSSUsz7fbmFgnBOQPc9xBxPXeFNqd6D9Ssv+5IFY0l7b0DcEIq2Nn4ZysrML
 nX2QPP60RI4kEtD4BzdfAwcvqoICBy9S9fAGINLPAv2pQgnaP25esN4y0IGcNWCu/es1
 KQ1NIip8Xohxv1jrZEzyHxTylbQ0n5Ni9PjxH0bC2Xr+jiefVsw/Dzvq4wG6TnsPEMC0
 Mo/fcgtqngtu3pl5043DzRc+nKNNlgg2yK0I5ZpfNaE2+ThZhTmI+v3tEi+xD0+tPydX
 chjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRQ0M2mToomU62cFanQKDr33M4FWAQNFIlLfcrKbuXY=;
 b=JVuT1Pvg1nY+pJgELzfz/fJ62U5UQjUpY49pPUVNSmgVeVi6AwcXG5N1n7qeHsOlFj
 fdocK3EPN3F/t8v1nNrKOU1mwub9F2YOmsJlWGLocGfEsOxLIydUv8NDW+oBtPPoLg1n
 kdFrbOzC/Skx1DXQ/FpDMEQ5gYZCYPJ/W2Z1eD1kGG5NudMEyJqEh0tICc6YphOGwyHg
 E/J0tdrZhojYwu4HdsvXMvQGaMh0wk6dRMOlZ1mIEVNeymmZTysg8IfLur9CUOZb5lfA
 zk4wcMzl9RaPVSSq/mB4x+KwSpAa2JXsQ5sIYw7v7BGfH10DjKItWAZ37+TphXRaKYhh
 WiVQ==
X-Gm-Message-State: AGi0Pub4Tx29YY92EeFkzOygAme2HcmEBTXrwkIVo4sIYUbqoCy+Pap4
 uht8H4ASFWBlAOY3DaRdyzwsTGxfOjM=
X-Google-Smtp-Source: APiQypJWn89Qfx7IuW6XCBUrmYyLd84v5aUb0M9SWIxlGnvERrlowM3rpfJNYiNaGhFGLaEg01oNVw==
X-Received: by 2002:a17:902:8a85:: with SMTP id
 p5mr523306plo.305.1588911859666; 
 Thu, 07 May 2020 21:24:19 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id r78sm349387pfr.10.2020.05.07.21.24.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:53:49 +0530
Message-Id: <edfc65153757bad8b4be32d30a4f733109d32b59.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 04/17] syscalls/sched_rr_get_interval: Add support
 for time64 tests
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

This adds support for time64 tests to the existing
sched_rr_get_interval() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  16 ++
 .../sched_rr_get_interval01.c                 | 131 +++++++--------
 .../sched_rr_get_interval02.c                 | 137 +++++++---------
 .../sched_rr_get_interval03.c                 | 151 ++++++++----------
 4 files changed, 198 insertions(+), 237 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index a728d78d7def..a726298b407d 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -12,6 +12,7 @@
 #ifndef TST_TIMER
 #define TST_TIMER
 
+#include <sched.h>
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
@@ -242,6 +243,21 @@ static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
 			   request, remain);
 }
 
+static inline int libc_sched_rr_get_interval(pid_t pid, void *ts)
+{
+	return sched_rr_get_interval(pid, ts);
+}
+
+static inline int sys_sched_rr_get_interval(pid_t pid, void *ts)
+{
+	return tst_syscall(__NR_sched_rr_get_interval, pid, ts);
+}
+
+static inline int sys_sched_rr_get_interval64(pid_t pid, void *ts)
+{
+	return tst_syscall(__NR_sched_rr_get_interval_time64, pid, ts);
+}
+
 static inline int sys_timer_gettime(kernel_timer_t timerid, void *its)
 {
 	return tst_syscall(__NR_timer_gettime, timerid, its);
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index b6084f673ca7..deae3314221f 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -1,20 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-/**********************************************************
  *
  *    TEST IDENTIFIER	: sched_rr_get_interval01
  *
@@ -62,81 +48,74 @@
  *				-P x : Pause for x seconds between iterations.
  *				-t   : Turn on syscall timing.
  *
- ****************************************************************/
+ */
 
-#include <errno.h>
 #include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_rr_get_interval01";
-int TST_TOTAL = 1;
-
-struct timespec tp;
-
-int main(int ac, char **av)
+#include "tst_timer.h"
+#include "lapi/abisize.h"
+
+struct tst_ts tp;
+
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
 {
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		/*
-		 * Call sched_rr_get_interval(2) with pid=0 so that it will
-		 * write into the timespec structure pointed to by tp, the
-		 * round robin time quantum for the current process.
-		 */
-		TEST(sched_rr_get_interval(0, &tp));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "sched_rr_get_interval() returned %ld",
-				 TEST_RETURN);
-		} else {
-			tst_resm(TFAIL | TTERRNO,
-				 "Test Failed, sched_rr_get_interval()"
-				 "returned %ld", TEST_RETURN);
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
-
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
-{
-	tst_require_root();
+	struct test_variants *tv = &variants[tst_variant];
 	/*
 	 * Initialize scheduling parameter structure to use with
 	 * sched_setscheduler()
 	 */
 	struct sched_param p = { 1 };
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	TEST_PAUSE;
+	tp.type = tv->type;
 
 	/* Change scheduling policy to SCHED_RR */
-	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
-	}
+	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
+		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
+static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 
+	/*
+	 * Call sched_rr_get_interval(2) with pid=0 so that it will
+	 * write into the timespec structure pointed to by tp, the
+	 * round robin time quantum for the current process.
+	 */
+	TEST(tv->func(0, tst_ts_get(&tp)));
+
+	if (!TST_RET) {
+		tst_res(TPASS, "sched_rr_get_interval() passed");
+	} else {
+		tst_res(TFAIL | TTERRNO, "Test Failed, sched_rr_get_interval() returned %ld",
+			TST_RET);
+	}
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 6bf743f78c5e..019f2c1bdfb3 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -1,20 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-/**********************************************************
  *
  *    TEST IDENTIFIER	: sched_rr_get_interval02
  *
@@ -63,84 +49,77 @@
  *				-P x : Pause for x seconds between iterations.
  *				-t   : Turn on syscall timing.
  *
- ****************************************************************/
+ */
 
-#include <errno.h>
 #include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_rr_get_interval02";
-int TST_TOTAL = 1;
-
-struct timespec tp;
-
-int main(int ac, char **av)
-{
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		tp.tv_sec = 99;
-		tp.tv_nsec = 99;
-		/*
-		 * Call sched_rr_get_interval(2) with pid=0 sothat it will
-		 * write into the timespec structure pointed to by tp the
-		 * round robin time quantum for the current process.
-		 */
-		TEST(sched_rr_get_interval(0, &tp));
-
-		if ((TEST_RETURN == 0) && (tp.tv_sec == 0) && (tp.tv_nsec == 0)) {
-			tst_resm(TPASS, "Test passed");
-		} else {
-			tst_resm(TFAIL, "Test Failed, sched_rr_get_interval()"
-				 "returned %ld, errno = %d : %s, tp.tv_sec = %d,"
-				 " tp.tv_nsec = %ld", TEST_RETURN, TEST_ERRNO,
-				 strerror(TEST_ERRNO), (int)tp.tv_sec,
-				 tp.tv_nsec);
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
-	tst_exit();
-
-}
-
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+#include "tst_timer.h"
+#include "lapi/abisize.h"
+
+struct tst_ts tp;
+
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
 {
-	tst_require_root();
+	struct test_variants *tv = &variants[tst_variant];
 	/*
 	 * Initialize scheduling parameter structure to use with
 	 * sched_setscheduler()
 	 */
 	struct sched_param p = { 1 };
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	TEST_PAUSE;
+	tp.type = tv->type;
 
 	/* Change scheduling policy to SCHED_FIFO */
-	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
-	}
+	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
+		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
+static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_ts_set_sec(&tp, 99);
+	tst_ts_set_nsec(&tp, 99);
+
+	/*
+	 * Call sched_rr_get_interval(2) with pid=0 so that it will
+	 * write into the timespec structure pointed to by tp the
+	 * round robin time quantum for the current process.
+	 */
+	TEST(tv->func(0, tst_ts_get(&tp)));
 
+	if (!TST_RET && tst_ts_valid(&tp) == -1) {
+		tst_res(TPASS, "sched_rr_get_interval() passed");
+	} else {
+		tst_res(TFAIL | TTERRNO, "Test Failed, sched_rr_get_interval() returned %ld, tp.tv_sec = %lld, tp.tv_nsec = %lld",
+			TST_RET, tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
+	}
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 56f2fcf28269..1f66ff6b11e9 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -1,20 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-/**********************************************************
  *
  *    TEST IDENTIFIER	: sched_rr_get_interval03
  *
@@ -68,104 +54,105 @@
  *				-P x : Pause for x seconds between iterations.
  *				-t   : Turn on syscall timing.
  *
- ****************************************************************/
+ */
 
-#include <errno.h>
 #include <sched.h>
-#include "test.h"
-
-static void setup();
-static void cleanup();
-
-char *TCID = "sched_rr_get_interval03";
-struct timespec tp;
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
 static pid_t unused_pid;
 static pid_t inval_pid = -1;
 static pid_t zero_pid;
 
+struct tst_ts tp;
+static void *bad_addr;
+
 struct test_cases_t {
 	pid_t *pid;
-	struct timespec *tp;
+	struct tst_ts *tp;
 	int exp_errno;
 } test_cases[] = {
-	{
-	&inval_pid, &tp, EINVAL}, {
-	&unused_pid, &tp, ESRCH},
+	{ &inval_pid, &tp, EINVAL},
+	{ &unused_pid, &tp, ESRCH},
 #ifndef UCLINUX
-	    /* Skip since uClinux does not implement memory protection */
-	{
-	&zero_pid, (struct timespec *)-1, EFAULT}
+	/* Skip since uClinux does not implement memory protection */
+	{ &zero_pid, NULL, EFAULT}
 #endif
 };
 
-int TST_TOTAL = sizeof(test_cases) / sizeof(test_cases[0]);
-
-int main(int ac, char **av)
-{
-
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; ++i) {
-			/*
-			 * Call sched_rr_get_interval(2)
-			 */
-			TEST(sched_rr_get_interval(*(test_cases[i].pid),
-						   test_cases[i].tp));
-
-			if ((TEST_RETURN == -1) &&
-			    (TEST_ERRNO == test_cases[i].exp_errno)) {
-				tst_resm(TPASS, "Test Passed");
-			} else {
-				tst_resm(TFAIL | TTERRNO, "Test Failed,"
-					 " sched_rr_get_interval() returned %ld",
-					 TEST_RETURN);
-			}
-		}
-	}
-
-	/* cleanup and exit */
-	cleanup();
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
 
-	tst_exit();
+#if defined(TST_ABI64)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
 
-}
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
 
-/* setup() - performs all ONE TIME setup for this test */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
+	struct test_variants *tv = &variants[tst_variant];
 	/*
 	 * Initialize scheduling parameter structure to use with
 	 * sched_setscheduler()
 	 */
 	struct sched_param p = { 1 };
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	TEST_PAUSE;
+	bad_addr = tst_get_bad_addr(NULL);
+	tp.type = tv->type;
 
 	/* Change scheduling policy to SCHED_RR */
-	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1) {
-		tst_brkm(TBROK, cleanup, "sched_setscheduler() failed");
-	}
+	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
+		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
 
-	unused_pid = tst_get_unused_pid(cleanup);
+	unused_pid = tst_get_unused_pid();
 }
 
-/*
- *cleanup() -  performs all ONE TIME cleanup for this test at
- *		completion or premature exit.
- */
-void cleanup(void)
+static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_cases_t *tc = &test_cases[i];
+	struct timerspec *ts;
+
+	if (tc->exp_errno == EFAULT)
+		ts = bad_addr;
+	else
+		ts = tst_ts_get(tc->tp);
+
+	/*
+	 * Call sched_rr_get_interval(2)
+	 */
+	TEST(tv->func(*tc->pid, ts));
 
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "sched_rr_get_interval() passed unexcpectedly");
+		return;
+	}
+
+	if (tc->exp_errno == TST_ERR)
+		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as excpected");
+	else
+		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexcpectedly: %s",
+			tst_strerrno(tc->exp_errno));
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_root = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
