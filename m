Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C931BA2E2
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:44:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 350763C5FBA
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:44:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 81E7A3C2861
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:44:03 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 767CA1A005E6
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:44:02 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id a32so7417334pje.5
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 04:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWrYp2uU+2Oeq0Dsvfe736xwL/qnKb3dJSG8lZqTBdw=;
 b=JbZPIne7VMyD+LjiqCzh8Lgc1hdA8TNQMkLb8hI7F1jTRTUR29YLX6xVks/px55EID
 iAAiqxVR0ELvjrq731wQqYRXP2j0dfcc+ANIwg6vXl3zMMz0oOUXBS4nP+O/K4UAulEm
 8mC7JGtbDdfyuCVLoho6AUju05SlCfDKIpte+Fdk2gVRCPO1I0Iyf+VhWZd7vpsA9947
 ApwCpI51lPySOJZIG9SZ+7uBXVDKG3F4pVQLnPsXVeAWkhfQ4dU56prTo9nLtkxfyi4o
 kvndTZLsukFmJ/Mo7ZI3APxGSl2Fiqxdc8vklgoWBbH1mwtc2SgiFE6K4A3vxL3wdDwQ
 wMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWrYp2uU+2Oeq0Dsvfe736xwL/qnKb3dJSG8lZqTBdw=;
 b=eMS2WLghp6RVtQ/FkEZU27xB/j7xTs6a0Bf/x9vSYlTgxkrD3r+nbDtqseB5qu4+l7
 9HD+CY8kbX4JzMQnQFhh6dJzbbA+Jg/woixoEBPi6p4mNR32TfPPcrBH5J7E/MbFxlMZ
 gtIyS2eihfTh/tv37FgMPbZVKZlGG2LKB3rZX/nItu2r8xxNvJxkZVOIcYKQ3F3ONRTC
 VsnnZlxow0oGP1FuaKXu8UmOKH357ulJ81lwDNl/Ja5FFw9np5nmcH8ybjQMpZGvkUJD
 u58WRE9WhGG6sF0SvCpWwtoURbQckaS5aoctgJXrsOVkJ9p3MPV5NzO0pnPDg9kuAqcu
 Ic0A==
X-Gm-Message-State: AGi0PuYXZKnLU+N51SwGXF110FjlNBKY61uI111O9WCZX9O8kbbUlVnv
 Ez/Jsg2NLhJf14XS7w2TDu9OlkE+Buc=
X-Google-Smtp-Source: APiQypKMrjzhfKyZU/ANKdWjP4iyqQiC346XR1QFLzy13AsiLDrp0UBhQiLfN55cuFfd9CHU9Kl/MA==
X-Received: by 2002:a17:90a:d504:: with SMTP id
 t4mr23435615pju.123.1587987840501; 
 Mon, 27 Apr 2020 04:44:00 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id j22sm4844049pgh.67.2020.04.27.04.43.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 04:43:59 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 27 Apr 2020 17:13:47 +0530
Message-Id: <2bab832039bfc76266a5882507a8f4c593a0a637.1587987802.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
References: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] syscalls/sched_rr_get_interval: Add support for
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

This adds support for time64 tests to the existing
sched_rr_get_interval() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  16 +++
 .../sched_rr_get_interval01.c                 | 113 +++++++--------
 .../sched_rr_get_interval02.c                 | 119 ++++++++--------
 .../sched_rr_get_interval03.c                 | 133 +++++++++---------
 4 files changed, 192 insertions(+), 189 deletions(-)

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
index b6084f673ca7..c3171c8c8fb8 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -64,79 +64,72 @@
  *
  ****************************************************************/
 
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
index 6bf743f78c5e..d5c020ff4e3b 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -65,82 +65,75 @@
  *
  ****************************************************************/
 
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
index 56f2fcf28269..3cd4dafd089e 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -70,102 +70,103 @@
  *
  ****************************************************************/
 
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
