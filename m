Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 703211B6ECB
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:19:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC6FC3C6152
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:19:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DAEF53C28F1
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:18:58 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 13E141A010BA
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:18:57 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id v2so3424103plp.9
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 00:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EJVbgCRruPFiAN4f5aZIO5GW3FZq49SFmd31xK62yRM=;
 b=R9wZxOv3JqYUhn2fPu98tH3Y7y2sfJWwxxrVpLbg6szQAjEV+pR85yQD1rBsMu5xjB
 EOZMR3CiGELjnICTcVxg0xlzYN/ahlx7GmIWu2xdzzAd9OzKe+Kovu7RRLcKaJ2ls5rt
 TSynL9Q0i6lARF15ymFgwayvWahzXnBRuiLX6C0eE6/HxxJz52PKLQ4FiL3iDSus4qZW
 9M71kaDFGGOFhDrAwMFOoM43NLZ5ICvtYEp2ZkaIJBN9QqxHFZtXQ66JFIJwuVYOV7fY
 X1qf0tjyi6XQ3qrGwpX3mFhzrQPvSlD8vKxwapAWo1QBihmAa743NhWNukaKuYJmH7C+
 NP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EJVbgCRruPFiAN4f5aZIO5GW3FZq49SFmd31xK62yRM=;
 b=o2b7ipqha1eZbYlP8WOqVYoZfMBFUfecYULe1hREZ6cVbewUG9gJ8vvCLkKuo/vLEU
 kMwXn4mMONd8HDq9ROIi75cFUpbXRWeZVtvc/YNom7lAWsk6Slf8bVqFVmsi71DuKPo/
 XAZZbXS8ObJEVnIzqBDj/s33gZ1Km/RR+WheyItDP32VXwPrfnX5RyfwWs7EUGUdUkEw
 dovBdh59mlJCAVUoGCcHg+HTgjV6dfJ9E9A/lmEoSlH0WeARmwWcVupAinJvAtNujRy3
 LWtFmKvoUjdj6Xrqg8gIDp/KqaOUrNCWv40xtJHWMofPqIipF8hn54M9MuKsMK+xgcn9
 1oTA==
X-Gm-Message-State: AGi0PuYW9Mz6DFhzZ393A/+v4iRF/9umIySkA93x2PUpiXssQjOVcA8t
 B74KjNsSPXMdmNFYKgTLM6bUOyJ7x6Q=
X-Google-Smtp-Source: APiQypLj+QLjcRnIG7sq4s837Gteqw6+054T2BL6fGfeCW69JYhw8bvUp0qr6sg1awMobdO7aGBc2g==
X-Received: by 2002:a17:902:7481:: with SMTP id
 h1mr5749800pll.25.1587712734772; 
 Fri, 24 Apr 2020 00:18:54 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id x195sm5015045pfc.0.2020.04.24.00.18.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 00:18:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 24 Apr 2020 12:48:45 +0530
Message-Id: <f47b22174da8454ed6a58e984a3468af7fd5a1d5.1587712683.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <1f2c00709d36aa9bc810f201e3adb93808816851.1587712683.git.viresh.kumar@linaro.org>
References: <a143f48ffeec14739d35c07dfb95f237981a322d.1587712683.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V5 4/5] syscalls/clock_nanosleep: Add support for
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

This adds support for time64 tests to the existing clock_nanosleep()
syscall tests.

This also moves the tests from clock_nanosleep2/ directory to
clock_nanosleep/ directory as it was added mistakenly there, as there is
no clock_nanosleep2() syscall.

Also note that this patch doesn't update clock_nanosleep02.c test as
that uses the sample test pattern and will result in many other changes
to core libraries of LTP test suite.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  20 ++++
 runtest/syscalls                              |   2 +-
 .../syscalls/clock_nanosleep/.gitignore       |   1 +
 .../clock_nanosleep/clock_nanosleep01.c       | 100 +++++++++++++-----
 .../clock_nanosleep/clock_nanosleep03.c       |  66 ++++++++++--
 .../clock_nanosleep/clock_nanosleep04.c       |  88 +++++++++++++++
 .../syscalls/clock_nanosleep2/.gitignore      |   1 -
 .../kernel/syscalls/clock_nanosleep2/Makefile |  10 --
 .../clock_nanosleep2/clock_nanosleep2_01.c    |  45 --------
 9 files changed, 243 insertions(+), 90 deletions(-)
 create mode 100644 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/.gitignore
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/Makefile
 delete mode 100644 testcases/kernel/syscalls/clock_nanosleep2/clock_nanosleep2_01.c

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 4823d350fdc6..256e1d71e1bc 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -192,6 +192,26 @@ static inline int sys_clock_settime64(clockid_t clk_id, void *ts)
 	return tst_syscall(__NR_clock_settime64, clk_id, ts);
 }
 
+static inline int libc_clock_nanosleep(clockid_t clk_id, int flags,
+				       void *request, void *remain)
+{
+	return clock_nanosleep(clk_id, flags, request, remain);
+}
+
+static inline int sys_clock_nanosleep(clockid_t clk_id, int flags,
+				      void *request, void *remain)
+{
+	return tst_syscall(__NR_clock_nanosleep, clk_id, flags,
+			   request, remain);
+}
+
+static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
+				        void *request, void *remain)
+{
+	return tst_syscall(__NR_clock_nanosleep_time64, clk_id, flags,
+			   request, remain);
+}
+
 /*
  * Returns tst_ts seconds.
  */
diff --git a/runtest/syscalls b/runtest/syscalls
index f6df32859df6..6c23f75d3389 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -90,8 +90,8 @@ clock_adjtime02 clock_adjtime02
 clock_getres01 clock_getres01
 clock_nanosleep01 clock_nanosleep01
 clock_nanosleep02 clock_nanosleep02
-clock_nanosleep2_01 clock_nanosleep2_01
 clock_nanosleep03 clock_nanosleep03
+clock_nanosleep04 clock_nanosleep04
 
 clock_gettime01 clock_gettime01
 clock_gettime02 clock_gettime02
diff --git a/testcases/kernel/syscalls/clock_nanosleep/.gitignore b/testcases/kernel/syscalls/clock_nanosleep/.gitignore
index 406897cded6d..1ab03a335f37 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/.gitignore
+++ b/testcases/kernel/syscalls/clock_nanosleep/.gitignore
@@ -1,3 +1,4 @@
 /clock_nanosleep01
 /clock_nanosleep02
 /clock_nanosleep03
+/clock_nanosleep04
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index d1fb0ee664c9..85152d0a1713 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -9,10 +9,10 @@
 
 #include <limits.h>
 
-#include "lapi/syscalls.h"
+#include "tst_safe_clocks.h"
 #include "tst_sig_proc.h"
 #include "tst_timer.h"
-#include "tst_test.h"
+#include "lapi/abisize.h"
 
 static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 {
@@ -30,7 +30,8 @@ struct test_case {
 	int ttype;		   /* test type (enum) */
 	const char *desc;	   /* test description (name) */
 	int flags;		   /* clock_nanosleep flags parameter */
-	struct timespec rq;
+	long tv_sec;
+	long tv_nsec;
 	int exp_ret;
 	int exp_err;
 };
@@ -46,45 +47,74 @@ static struct test_case tcase[] = {
 		TYPE_NAME(NORMAL),
 		.clk_id = CLOCK_REALTIME,
 		.flags = 0,
-		.rq = (struct timespec) {.tv_sec = 0, .tv_nsec = -1},
-		.exp_ret = EINVAL,
-		.exp_err = 0,
+		.tv_sec = 0,
+		.tv_nsec = -1,
+		.exp_ret = -1,
+		.exp_err = EINVAL,
 	},
 	{
 		TYPE_NAME(NORMAL),
 		.clk_id = CLOCK_REALTIME,
 		.flags = 0,
-		.rq = (struct timespec) {.tv_sec = 0, .tv_nsec = 1000000000},
-		.exp_ret = EINVAL,
-		.exp_err = 0,
+		.tv_sec = 0,
+		.tv_nsec = 1000000000,
+		.exp_ret = -1,
+		.exp_err = EINVAL,
 	},
 	{
 		TYPE_NAME(NORMAL),
 		.clk_id = CLOCK_THREAD_CPUTIME_ID,
 		.flags = 0,
-		.rq = (struct timespec) {.tv_sec = 0, .tv_nsec = 500000000},
-		.exp_ret = EINVAL,
-		.exp_err = 0,
+		.tv_sec = 0,
+		.tv_nsec = 500000000,
+		.exp_ret = -1,
+		.exp_err = ENOTSUP,
 	},
 	{
 		TYPE_NAME(SEND_SIGINT),
 		.clk_id = CLOCK_REALTIME,
 		.flags = 0,
-		.rq = (struct timespec) {.tv_sec = 10, .tv_nsec = 0},
-		.exp_ret = EINTR,
-		.exp_err = 0,
+		.tv_sec = 10,
+		.tv_nsec = 0,
+		.exp_ret = -1,
+		.exp_err = EINTR,
 	},
 };
 
+static struct tst_ts rq;
+
+static struct test_variants {
+	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
 void setup(void)
 {
+	rq.type = variants[tst_variant].type;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGINT, sighandler);
 }
 
 static void do_test(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
-	struct timespec rm = {0};
+	struct tst_ts rm = {.type = tv->type, };
 	pid_t pid = 0;
 
 	tst_res(TINFO, "case %s", tc->desc);
@@ -92,7 +122,29 @@ static void do_test(unsigned int i)
 	if (tc->ttype == SEND_SIGINT)
 		pid = create_sig_proc(SIGINT, 40, 500000);
 
-	TEST(clock_nanosleep(tc->clk_id, tc->flags, &tc->rq, &rm));
+	tst_ts_set_sec(&rq, tc->tv_sec);
+	tst_ts_set_nsec(&rq, tc->tv_nsec);
+
+	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(&rq), tst_ts_get(&rm)));
+
+	if (tv->func == libc_clock_nanosleep) {
+		/*
+		 * The return value and error number are differently set for
+		 * libc syscall as compared to kernel syscall.
+		 */
+		if (TST_RET) {
+			TST_ERR = TST_RET;
+			TST_RET = -1;
+		}
+
+		/*
+		 * nsleep isn't implemented by kernelf or
+		 * CLOCK_THREAD_CPUTIME_ID and it returns ENOTSUP, but libc
+		 * changes that error value to EINVAL.
+		 */
+		if (tc->clk_id == CLOCK_THREAD_CPUTIME_ID)
+			tc->exp_err = EINVAL;
+	}
 
 	if (pid) {
 		SAFE_KILL(pid, SIGTERM);
@@ -100,12 +152,10 @@ static void do_test(unsigned int i)
 	}
 
 	if (tc->ttype == SEND_SIGINT) {
-		long long expect_ms = tst_timespec_to_ms(tc->rq);
-		long long remain_ms = tst_timespec_to_ms(rm);
-
-		tst_res(TINFO, "remain time: %lds %ldns", rm.tv_sec, rm.tv_nsec);
+		long long expect_ms = tst_ts_to_ms(rq);
+		long long remain_ms = tst_ts_to_ms(rm);
 
-		if (!rm.tv_sec && !rm.tv_nsec) {
+		if (tst_ts_valid(&rm)) {
 			tst_res(TFAIL | TTERRNO,
 				"The clock_nanosleep() haven't updated"
 				" timestamp with remaining time");
@@ -120,20 +170,20 @@ static void do_test(unsigned int i)
 		}
 	}
 
-	if (TST_RET != tc->exp_ret) {
+	if ((TST_RET != tc->exp_ret) || (TST_ERR != tc->exp_err)) {
 		tst_res(TFAIL | TTERRNO, "returned %ld, expected %d,"
 			" expected errno: %s (%d)", TST_RET,
 			tc->exp_ret, tst_strerrno(tc->exp_err), tc->exp_err);
 		return;
 	}
 
-	tst_res(TPASS, "returned %s (%ld)",
-		tst_strerrno(TST_RET), TST_RET);
+	tst_res(TPASS, "returned %s (%d)", tst_strerrno(TST_ERR), TST_ERR);
 }
 
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcase),
 	.test = do_test,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
index 68773d59e346..edcd57c076bf 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
@@ -19,33 +19,83 @@
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "tst_test.h"
+#include "lapi/abisize.h"
 
 #define OFFSET_S 10
 #define SLEEP_US 100000
 
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
 static void verify_clock_nanosleep(void)
 {
-	struct timespec start, end, sleep_abs;
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts start, end, sleep_abs;
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
+	start.type = end.type = sleep_abs.type = tv->type;
 
 	SAFE_UNSHARE(CLONE_NEWTIME);
 
 	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0", CLOCK_MONOTONIC, OFFSET_S);
 
-	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &start);
+	TEST(tv->gettime(CLOCK_MONOTONIC, tst_ts_get(&start)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_MONOTONIC));
+		return;
+	}
 
-	sleep_abs = tst_timespec_add_us(start, 1000000 * OFFSET_S + SLEEP_US);
+	sleep_abs = tst_ts_add_us(start, 1000000 * OFFSET_S + SLEEP_US);
 
 	if (!SAFE_FORK()) {
-		clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &sleep_abs, NULL);
+		TEST(tv->func(CLOCK_MONOTONIC, TIMER_ABSTIME, tst_ts_get(&sleep_abs), NULL));
+		/*
+		 * The return value and error number are differently set for
+		 * libc syscall as compared to kernel syscall.
+		 */
+		if ((tv->func == libc_clock_nanosleep) && TST_RET) {
+			TST_ERR = TST_RET;
+			TST_RET = -1;
+		}
+
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "clock_nanosleep(2) failed for clock %s",
+				tst_clock_name(CLOCK_MONOTONIC));
+		}
+
 		exit(0);
 	}
 
 	SAFE_WAIT(NULL);
 
-	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &end);
+	TEST(tv->gettime(CLOCK_MONOTONIC, tst_ts_get(&end)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_MONOTONIC));
+		return;
+	}
 
-	long long diff = tst_timespec_diff_us(end, start);
+	long long diff = tst_ts_diff_us(end, start);
 
 	if (diff > 5 * SLEEP_US) {
 		tst_res(TFAIL, "clock_nanosleep() slept too long %lli", diff);
@@ -62,11 +112,11 @@ static void verify_clock_nanosleep(void)
 
 static struct tst_test test = {
 	.test_all = verify_clock_nanosleep,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.forks_child = 1,
 	.needs_kconfigs = (const char *[]) {
 		"CONFIG_TIME_NS=y",
 		NULL
 	}
-
 };
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
new file mode 100644
index 000000000000..38bcfcb194b1
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) M. Koehrer <mathias_koehrer@arcor.de>, 2009
+ * Copyright (C) 2017 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#include <stdio.h>
+#include <time.h>
+#include <unistd.h>
+#include "tst_safe_clocks.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
+
+#define NSEC_IN_SEC 1000000000
+
+static clockid_t tcase[] = {
+	CLOCK_MONOTONIC,
+	CLOCK_REALTIME,
+};
+
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
+static void do_test(unsigned int i)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts ts = {.type = tv->type};
+	long long sec, nsec;
+
+	TEST(tv->gettime(tcase[i], tst_ts_get(&ts)));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(tcase[i]));
+		return;
+	}
+
+	sec = tst_ts_get_sec(ts);
+	nsec = tst_ts_get_nsec(ts);
+
+	nsec += NSEC_IN_SEC/10;
+	if (nsec >= NSEC_IN_SEC) {
+		sec += 1;
+		nsec %= NSEC_IN_SEC;
+	}
+
+	tst_ts_set_sec(&ts, sec);
+	tst_ts_set_nsec(&ts, nsec);
+
+	TEST(tv->func(tcase[i], TIMER_ABSTIME, tst_ts_get(&ts), NULL));
+
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "clock_nanosleep(2) failed for clock %s",
+			tst_clock_name(tcase[i]));
+	}
+
+	tst_res(TPASS, "clock_nanosleep(2) passed for clock %s",
+		tst_clock_name(tcase[i]));
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcase),
+	.test = do_test,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/clock_nanosleep2/.gitignore b/testcases/kernel/syscalls/clock_nanosleep2/.gitignore
deleted file mode 100644
index 5be9cd0e8a8d..000000000000
--- a/testcases/kernel/syscalls/clock_nanosleep2/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-/clock_nanosleep2_01
diff --git a/testcases/kernel/syscalls/clock_nanosleep2/Makefile b/testcases/kernel/syscalls/clock_nanosleep2/Makefile
deleted file mode 100644
index 262eef71b02b..000000000000
--- a/testcases/kernel/syscalls/clock_nanosleep2/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) International Business Machines  Corp., 2009
-
-top_srcdir		?= ../../../..
-
-include $(top_srcdir)/include/mk/testcases.mk
-
-LDLIBS			+= -lpthread -lrt
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/clock_nanosleep2/clock_nanosleep2_01.c b/testcases/kernel/syscalls/clock_nanosleep2/clock_nanosleep2_01.c
deleted file mode 100644
index d82d74d2d9fa..000000000000
--- a/testcases/kernel/syscalls/clock_nanosleep2/clock_nanosleep2_01.c
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) M. Koehrer <mathias_koehrer@arcor.de>, 2009
- * Copyright (C) 2017 Cyril Hrubis <chrubis@suse.cz>
- */
-
-#include <stdio.h>
-#include <time.h>
-#include <unistd.h>
-#include <sys/syscall.h>
-
-#include "tst_test.h"
-#include "lapi/syscalls.h"
-
-#define NSEC_IN_SEC 1000000000
-
-const clockid_t CLOCK_TO_USE = CLOCK_MONOTONIC;
-static int clock_nanosleep2(clockid_t clock_id, int flags,
-			    const struct timespec *req, struct timespec *rem)
-{
-	return tst_syscall(__NR_clock_nanosleep, clock_id, flags, req, rem);
-}
-
-static void verify_clock_nanosleep2(void)
-{
-	struct timespec ts;
-
-	clock_gettime(CLOCK_TO_USE, &ts);
-	ts.tv_nsec += NSEC_IN_SEC/10;
-	if (ts.tv_nsec >= NSEC_IN_SEC) {
-		ts.tv_sec += 1;
-		ts.tv_nsec %= NSEC_IN_SEC;
-	}
-
-	TEST(clock_nanosleep2(CLOCK_TO_USE, TIMER_ABSTIME, &ts, NULL));
-
-	if (TST_RET)
-		tst_res(TFAIL | TTERRNO, "clock_nanosleep2() failed");
-	else
-		tst_res(TPASS, "clock_nanosleep2() passed");
-}
-
-static struct tst_test test = {
-	.test_all = verify_clock_nanosleep2,
-};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
