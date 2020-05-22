Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB751DE4DA
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A50093C4CD9
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 288463C2360
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:58 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0DD4560094E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:57 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id q8so5049747pfu.5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Agu8MIqSIsSezw6cmB/d5cuoRRJu9W81zdsPNSafNwQ=;
 b=U1J3avqW8t0HHfqE0EFKbH9fT6gwLYXClbgCSA1DC3ts4RUrP+7MQI154M54x+6wfx
 DS/qOnrFnoz6r+aOWk0Gn1piA470mRw/smvrI3W7Gc10v9EMol8WJen58wHNqLU8OBqD
 a+VQMwn+EwnRYyFn1J1w5HxMgsDXEz97tJ+exzkY7Z0XJZm/I0wlvo0iddGr8mvIWR08
 ZmjRyEO+xwLA1D6m+DI4moL89TboCQWW9TRy1eXloV+E7nGN/c0bEchBxbymozmiIlna
 69G6dNaab6FRj1lA5GT3YyHkjMk+jEWNn0BYDf8uB2wyke52Kp4G6itNchl+BIk+ylMj
 JTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Agu8MIqSIsSezw6cmB/d5cuoRRJu9W81zdsPNSafNwQ=;
 b=eDxRwh31iz2qOqwvkYewfb35bNW6I3VdcawSbjWCp7a7mXBVkS1ltyUF4vTz8aVpGt
 5vEYOEPYGb0XOemKh+Oxal5YI5pHrNXrCD5qDCy8VOE0nKej1/jWVrO+ddhQc2wxRrrA
 wkk1prw8hcoJkcLioY4fzLJDEnbvfFtkr7HQe7UybnIr+D5HgkG0umskXPZ8GfWJSUjx
 l7tlqwp0EXLv4aMmKr+OCQW9MND7fS22ehUcpiSSa1TFc1Qma44s22DH+s8Es2QG3a0q
 +N6kHpdKjHMBtsOCLQDpdcWB7F65/nHDOHobcoksNiJKZIaCzvee6QBLAwYlDxsBvaIs
 WUBg==
X-Gm-Message-State: AOAM532aswNKlfJzPhgZBflZX4AknAKmK68J9LWMos1NXd4PWu7qNpnd
 K/tgqUQ9gIsdnpa8nXODRyASks8NCRA=
X-Google-Smtp-Source: ABdhPJyhOhL4tjeFKlUqazoR7FvSNZCkFPHMnEnrXHSItiUSHpmdC5kTLuN1oeF81FOEH1lGKj2Xhw==
X-Received: by 2002:a62:79c2:: with SMTP id u185mr3360291pfc.159.1590144714970; 
 Fri, 22 May 2020 03:51:54 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id a5sm6829825pfk.210.2020.05.22.03.51.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:51:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:24 +0530
Message-Id: <cac0f83154c9e1bd5a636b4b03d6d48f818f6657.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V4 04/17] syscalls/sched_rr_get_interval: Add support
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
 .../sched_rr_get_interval01.c                 | 116 ++++++--------
 .../sched_rr_get_interval02.c                 | 122 ++++++---------
 .../sched_rr_get_interval03.c                 | 146 ++++++++----------
 4 files changed, 173 insertions(+), 227 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index bb24636b015a..7e15b9821d5a 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -12,6 +12,7 @@
 #ifndef TST_TIMER
 #define TST_TIMER
 
+#include <sched.h>
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
@@ -247,6 +248,21 @@ static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
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
 static inline int sys_timer_gettime(timer_t timerid, void *its)
 {
 	return tst_syscall(__NR_timer_gettime, timerid, its);
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index b6084f673ca7..9bad698aa6ec 100644
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
@@ -62,81 +48,69 @@
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
-{
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
+#include "tst_timer.h"
 
-	setup();
+struct tst_ts tp;
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
-		tst_count = 0;
+#if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-		/*
-		 * Call sched_rr_get_interval(2) with pid=0 so that it will
-		 * write into the timespec structure pointed to by tp, the
-		 * round robin time quantum for the current process.
-		 */
-		TEST(sched_rr_get_interval(0, &tp));
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
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
+
+	/*
+	 * Call sched_rr_get_interval(2) with pid=0 so that it will
+	 * write into the timespec structure pointed to by tp, the
+	 * round robin time quantum for the current process.
+	 */
+	TEST(tv->func(0, tst_ts_get(&tp)));
 
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
index 6bf743f78c5e..8da42e97404b 100644
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
@@ -63,84 +49,72 @@
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
+#include "tst_timer.h"
 
-char *TCID = "sched_rr_get_interval02";
-int TST_TOTAL = 1;
+struct tst_ts tp;
 
-struct timespec tp;
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
-int main(int ac, char **av)
-{
-
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+#if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
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
 
+	tst_ts_set_sec(&tp, 99);
+	tst_ts_set_nsec(&tp, 99);
+
+	/*
+	 * Call sched_rr_get_interval(2) with pid=0 so that it will
+	 * write into the timespec structure pointed to by tp the
+	 * round robin time quantum for the current process.
+	 */
+	TEST(tv->func(0, tst_ts_get(&tp)));
+
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
index 56f2fcf28269..0ccf47d2a561 100644
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
@@ -68,104 +54,100 @@
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
+static struct test_variants {
+	int (*func)(pid_t pid, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .func = libc_sched_rr_get_interval, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
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
-
-	tst_exit();
+#if (__NR_sched_rr_get_interval != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-}
+#if (__NR_sched_rr_get_interval_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_sched_rr_get_interval64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
 
+	if (tc->exp_errno == EFAULT)
+		ts = bad_addr;
+	else
+		ts = tst_ts_get(tc->tp);
+
+	/*
+	 * Call sched_rr_get_interval(2)
+	 */
+	TEST(tv->func(*tc->pid, ts));
+
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
