Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD901A790A
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 13:01:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C90D23C2B43
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 13:01:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7B68E3C656B
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 13:00:53 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 315C1200CEA
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 13:00:52 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id t40so5049270pjb.3
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sq0LoT++ojllxtkOSs+QllPxW1xuyO266AF5ue/cffE=;
 b=ZptszZYALBU9wDauZ5Ube74U4xDIVyJ7fBw9hHaNbaaDplelOJTihWxMAcQvFawjs6
 uXShlDU55r4cYYmnDd3X/005P8eUknjgQR5hNKZ1Fla3XOS2KkkNb+tc1zRlejLBkLyS
 Kcc8ftkruMWpBtFxciAZm0CEU/Ts2xsnBzl1+IUDPIWyrAUa3eHoRx1Y2V3nsljwctan
 pf4TXu2XKpjBYwbkHGxlwcRo6v3rhmlYiyYXAM30xbLzKqTVg+7c9q+3Vhg9qvtzGobI
 T+eRSdMNnCI5nOIjIA0q1c8/pBrqITM5lmuRCfLRqs758ax2eQiuGxvDcVrwmru+9jzG
 ZBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sq0LoT++ojllxtkOSs+QllPxW1xuyO266AF5ue/cffE=;
 b=tnfgVKBHHNGQLwJx7BsMiGJk6T5MdzSjry5Zlk81MtLZNz371SrvafPXF3PG0kPMMa
 NVVH9kkCacuGACQaxXarAwV2h0h02GE/Y11fFNHPHp9EvCquWITzjyAPvoSOZcXtQnvq
 M48+tNsK9HUFAzHCKSX5vjcda2FHhmV9l8llyOAcG90c2KWn31wnce+EDSHeOPckKGrS
 dbM35fVHF2huL1ezz8qcidRiPNJ9wtlDydvUbrBsf+5zi/HEqhpRw+DciAXKy2KZLe0u
 jojYsOFmAgU0I4ghXwRNlkWVoJ5RZeHT031Oe+bishsNYt2K6+nokkhZAarK2nFJmFbH
 6Mtw==
X-Gm-Message-State: AGi0PubE1rnT4VKFd415pAcdmNoruBU0e7HX6UDTSgE1hVFVYueZPazI
 7yPRdkff7jy4EVphKxUhy9YZIrlLuTE=
X-Google-Smtp-Source: APiQypJEroB+1Gr+ovCToJEDTLHyagw/QesDAdNNLNsgsopbZtApTdj/d7q9so1DPfADuIj6sw8fMA==
X-Received: by 2002:a17:902:bb93:: with SMTP id
 m19mr22160254pls.258.1586862050152; 
 Tue, 14 Apr 2020 04:00:50 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id t15sm9890120pgv.61.2020.04.14.04.00.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 04:00:49 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 14 Apr 2020 16:30:39 +0530
Message-Id: <eb1713120882ae6095294381f68558021c177b45.1586861885.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1586861885.git.viresh.kumar@linaro.org>
References: <cover.1586861885.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/2] syscalls/clock_gettime: Add support for time64
 tests
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

This adds support for time64 tests to the existing clock_gettime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  28 ++++
 .../syscalls/clock_gettime/clock_gettime.h    |  29 ++++
 .../syscalls/clock_gettime/clock_gettime01.c  | 125 +++++++++---------
 .../syscalls/clock_gettime/clock_gettime02.c  |  80 +++++++----
 .../syscalls/clock_gettime/clock_gettime03.c  |  80 +++++++++--
 5 files changed, 236 insertions(+), 106 deletions(-)
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime.h

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 3c8426fbe37d..5c71f3b8b9f9 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -38,6 +38,34 @@ struct __kernel_timespec {
 };
 #endif
 
+/*
+ * timespec_updated routines return:
+ * 0: On success, i.e. timespec updated correctly.
+ * -1: Error, timespec not updated.
+ * -2: Error, tv_nsec is corrupted.
+ */
+static inline int tst_timespec_updated_32(void *data)
+{
+	struct timespec *spec = data;
+
+	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 0 : -1;
+}
+
+static inline int tst_timespec_updated_64(void *data)
+{
+	struct __kernel_timespec *spec = data;
+
+	if (spec->tv_nsec != 0 || spec->tv_sec != 0) {
+		/* Upper 32 bits of tv_nsec should be cleared */
+		if (spec->tv_nsec >> 32)
+			return -2;
+		else
+			return 0;
+	} else {
+		return -1;
+	}
+}
+
 /*
  * Converts timeval to microseconds.
  */
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime.h b/testcases/kernel/syscalls/clock_gettime/clock_gettime.h
new file mode 100644
index 000000000000..6976e6884de9
--- /dev/null
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime.h
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef CLOCK_GETTIME_H
+#define CLOCK_GETTIME_H
+
+#include "tst_timer.h"
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+
+#ifdef TST_ABI32
+static inline int libc_clock_gettime(clockid_t clk_id, void *tp)
+{
+	return clock_gettime(clk_id, tp);
+}
+#endif
+
+static inline int sys_clock_gettime(clockid_t clk_id, void *tp)
+{
+	return tst_syscall(__NR_clock_gettime, clk_id, tp);
+}
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+static inline int sys_clock_gettime64(clockid_t clk_id, void *tp)
+{
+	return tst_syscall(__NR_clock_gettime64, clk_id, tp);
+}
+#endif
+
+#endif /* CLOCK_GETTIME_H */
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
index d365823b2f0f..001ac3049a23 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
@@ -17,22 +17,17 @@
  */
 
 #include "config.h"
-#include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "lapi/abisize.h"
+
+#include "clock_gettime.h"
 
 struct test_case {
 	clockid_t clktype;
 	int allow_inval;
 };
 
-struct tmpfunc {
-	int (*func)(clockid_t clk_id, struct timespec *tp);
-	char *desc;
-};
-
-struct test_case tc[] = {
+static struct test_case tc[] = {
 	{
 	 .clktype = CLOCK_REALTIME,
 	 },
@@ -63,73 +58,71 @@ struct test_case tc[] = {
 	 },
 };
 
-static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
-{
-	return tst_syscall(__NR_clock_gettime, clk_id, tp);
-}
+#ifdef TST_ABI32
+static struct timespec spec32;
+static struct __kernel_old_timespec kspec32;
+#endif
+
+static struct __kernel_timespec kspec64;
+
+static struct test_variants {
+	int (*func)(clockid_t clk_id, void *tp);
+	int (*check)(void *spec);
+	void *spec;
+	int spec_size;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "ABI32 vDSO or syscall"},
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &spec32, .spec_size = sizeof(spec32), .desc = "ABI32 syscall with libc spec"},
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_32, .spec = &kspec32, .spec_size = sizeof(kspec32), .desc = "ABI32 syscall with kernel spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "ABI64 syscall with kernel spec"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .check = tst_timespec_updated_64, .spec = &kspec64, .spec_size = sizeof(kspec64), .desc = "ABI64 syscall time64 with kernel spec"},
+#endif
+};
 
-static int check_spec(struct timespec *spec)
+static void setup(void)
 {
-	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void verify_clock_gettime(unsigned int i)
 {
-	size_t sz;
-	struct timespec spec;
+	struct test_variants *tv = &variants[tst_variant];
+	int ret;
 
-	/*
-	 * check clock_gettime() syscall AND libc (or vDSO) functions
-	 */
-	struct tmpfunc tf[] = {
-		{ .func = sys_clock_gettime, .desc = "syscall"      },
-		{ .func = clock_gettime, .desc = "vDSO or syscall"  },
-	};
+	memset(tv->spec, 0, tv->spec_size);
 
-	for (sz = 0; sz < ARRAY_SIZE(tf); sz++) {
-
-		memset(&spec, 0, sizeof(struct timespec));
-
-		TEST(tf[sz].func(tc[i].clktype, &spec));
-
-		if (TST_RET == -1) {
-
-			/* errors: allow unsupported clock types */
-
-			if (tc[i].allow_inval && TST_ERR == EINVAL) {
-
-				tst_res(TPASS, "clock_gettime(2): unsupported "
-						"clock %s (%s) failed as "
-						"expected",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-
-			} else {
-
-				tst_res(TFAIL | TTERRNO, "clock_gettime(2): "
-						"clock %s (%s) failed "
-						"unexpectedly",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			}
+	TEST(tv->func(tc[i].clktype, tv->spec));
 
+	if (TST_RET == -1) {
+		/* errors: allow unsupported clock types */
+		if (tc[i].allow_inval && TST_ERR == EINVAL) {
+			tst_res(TPASS, "clock_gettime(2): unsupported clock %s failed as expected",
+				tst_clock_name(tc[i].clktype));
 		} else {
+			tst_res(TFAIL | TTERRNO, "clock_gettime(2): clock %s failed unexpectedly",
+				tst_clock_name(tc[i].clktype));
+		}
 
-			/* success: also check if timespec was changed */
-
-			if (check_spec(&spec)) {
-				tst_res(TPASS, "clock_gettime(2): clock %s "
-						"(%s) passed",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			} else {
-
-				tst_res(TFAIL, "clock_gettime(2): clock %s "
-						"(%s) passed, unchanged "
-						"timespec",
-						tst_clock_name(tc[i].clktype),
-						tf[sz].desc);
-			}
+	} else {
+		/* success: also check if timespec was changed */
+		ret = tv->check(tv->spec);
+		if (!ret) {
+			tst_res(TPASS, "clock_gettime(2): clock %s passed",
+				tst_clock_name(tc[i].clktype));
+		} else if (ret == -1) {
+			tst_res(TFAIL, "clock_gettime(2): clock %s passed, unchanged timespec",
+				tst_clock_name(tc[i].clktype));
+		} else if (ret == -2) {
+			tst_res(TFAIL, "clock_gettime(2): clock %s passed, Corrupted timespec",
+				tst_clock_name(tc[i].clktype));
 		}
 	}
 }
@@ -137,5 +130,7 @@ static void verify_clock_gettime(unsigned int i)
 static struct tst_test test = {
 	.test = verify_clock_gettime,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 };
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
index b4bc6e2d55d4..01bc8e230478 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
@@ -19,10 +19,10 @@
  */
 
 #include "config.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
-#include "tst_timer.h"
 #include "tst_safe_clocks.h"
+#include "lapi/abisize.h"
+
+#include "clock_gettime.h"
 
 struct test_case {
 	clockid_t clktype;
@@ -30,7 +30,7 @@ struct test_case {
 	int allow_inval;
 };
 
-struct test_case tc[] = {
+static struct test_case tc[] = {
 	{
 	 .clktype = MAX_CLOCKS,
 	 .exp_err = EINVAL,
@@ -81,52 +81,74 @@ struct test_case tc[] = {
 	 },
 };
 
+#ifdef TST_ABI32
+static struct timespec spec32;
+static struct __kernel_old_timespec kspec32;
+#endif
+
+static struct __kernel_timespec kspec64;
+
 /*
  * bad pointer w/ libc causes SIGSEGV signal, call syscall directly
  */
-static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
+static struct test_variants {
+	int (*func)(clockid_t clk_id, void *tp);
+	void *spec;
+	int spec_size;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_clock_gettime, .spec = &spec32, .desc = "ABI32 syscall with libc spec"},
+	{ .func = sys_clock_gettime, .spec = &kspec32, .desc = "ABI32 syscall with kernel spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .spec = &kspec64, .desc = "ABI64 syscall with kernel spec"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .spec = &kspec64, .desc = "ABI64 syscall time64 with kernel spec"},
+#endif
+};
+
+static void setup(void)
 {
-	return tst_syscall(__NR_clock_gettime, clk_id, tp);
+	tst_res(TINFO, "Testing variant: %d: %s", tst_variant, variants[tst_variant].desc);
 }
 
 static void verify_clock_gettime(unsigned int i)
 {
-	struct timespec spec, *specptr;
-
-	specptr = &spec;
+	struct test_variants *tv = &variants[tst_variant];
+	void *specptr;
 
 	/* bad pointer cases */
 	if (tc[i].exp_err == EFAULT)
 		specptr = tst_get_bad_addr(NULL);
+	else
+		specptr = tv->spec;
 
-	TEST(sys_clock_gettime(tc[i].clktype, specptr));
+	TEST(tv->func(tc[i].clktype, specptr));
 
-	if (TST_RET == -1) {
-
-		if ((tc[i].exp_err == TST_ERR) ||
-			(tc[i].allow_inval && TST_ERR == EINVAL)) {
-
-			tst_res(TPASS | TTERRNO, "clock_gettime(2): "
-					"clock %s failed as expected",
-					tst_clock_name(tc[i].clktype));
-
-		} else {
-
-			tst_res(TFAIL | TTERRNO, "clock_gettime(2): "
-					"clock %s failed unexpectedly",
-					tst_clock_name(tc[i].clktype));
-		}
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "clock_gettime(2): clock %s passed unexcpectedly",
+			tst_clock_name(tc[i].clktype));
+		return;
+	}
 
+	if ((tc[i].exp_err == TST_ERR) ||
+	    (tc[i].allow_inval && TST_ERR == EINVAL)) {
+		tst_res(TPASS | TTERRNO, "clock_gettime(2): clock %s failed as expected",
+			tst_clock_name(tc[i].clktype));
 	} else {
-
-		tst_res(TFAIL, "clock_gettime(2): clock %s passed"
-				" unexcpectedly",
-				tst_clock_name(tc[i].clktype));
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2): clock %s failed unexpectedly",
+			tst_clock_name(tc[i].clktype));
 	}
 }
 
 static struct tst_test test = {
 	.test = verify_clock_gettime,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 };
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
index cf4706fa0c30..56b5e1983025 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -19,9 +19,24 @@
 
 #define _GNU_SOURCE
 #include "tst_safe_clocks.h"
-#include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "tst_test.h"
+#include "lapi/abisize.h"
+
+#include "clock_gettime.h"
+
+static inline long long timespec_diff_ms(void *t1, void *t2)
+{
+	struct timespec *ts1 = t1, *ts2 = t2;
+
+	return tst_timespec_diff_ms(*ts1, *ts2);
+}
+
+static inline long long timespec64_diff_ms(void *t1, void *t2)
+{
+	struct __kernel_timespec *ts1 = t1, *ts2 = t2;
+
+	return tst_timespec64_diff_ms(*ts1, *ts2);
+}
 
 static struct tcase {
 	int clk_id;
@@ -38,22 +53,56 @@ static struct tcase {
 	{CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC, 100},
 };
 
-static struct timespec now;
 static int parent_ns;
 
-static void child(struct tcase *tc)
+#ifdef TST_ABI32
+static struct timespec spec32_now, spec32_then, spec32_pthen;
+static struct __kernel_old_timespec kspec32_now, kspec32_then, kspec32_pthen;
+#endif
+
+static struct __kernel_timespec kspec64_now, kspec64_then, kspec64_pthen;
+
+static struct test_variants {
+	int (*func)(clockid_t clk_id, void *tp);
+	long long (*diff)(void *t1, void *t2);
+	void *now;
+	void *then;
+	void *pthen;
+	int spec_size;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_gettime, .diff = timespec_diff_ms, .now = &spec32_now, .then = &spec32_then, .pthen = &spec32_pthen, .desc = "ABI32 vDSO or syscall"},
+	{ .func = sys_clock_gettime, .diff = timespec_diff_ms, .now = &spec32_now, .then = &spec32_then, .pthen = &spec32_pthen, .desc = "ABI32 syscall with libc spec"},
+	{ .func = sys_clock_gettime, .diff = timespec_diff_ms, .now = &kspec32_now, .then = &kspec32_then, .pthen = &kspec32_pthen, .desc = "ABI32 syscall with kernel spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .diff = timespec64_diff_ms, .now = &kspec64_now, .then = &kspec64_then, .pthen = &kspec64_pthen, .desc = "ABI64 syscall with kernel spec"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .diff = timespec64_diff_ms, .now = &kspec64_now, .then = &kspec64_then, .pthen = &kspec64_pthen, .desc = "ABI64 syscall time64 with kernel spec"},
+#endif
+};
+
+static void child(struct test_variants *tv, struct tcase *tc)
 {
-	struct timespec then;
-	struct timespec parent_then;
 	long long diff;
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &then);
+	if (tv->func(tc->clk_id, tv->then)) {
+		tst_brk(TBROK | TERRNO, "%d clock_gettime(%s) failed",
+			__LINE__, tst_clock_name(tc->clk_id));
+	}
 
 	SAFE_SETNS(parent_ns, CLONE_NEWTIME);
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &parent_then);
+	if (tv->func(tc->clk_id, tv->pthen)) {
+		tst_brk(TBROK | TERRNO, "%d clock_gettime(%s) failed",
+			__LINE__, tst_clock_name(tc->clk_id));
+	}
 
-	diff = tst_timespec_diff_ms(then, now);
+	diff = tv->diff(tv->then, tv->now);
 
 	if (diff/1000 != tc->off) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
@@ -63,7 +112,7 @@ static void child(struct tcase *tc)
 		        tst_clock_name(tc->clk_id), diff);
 	}
 
-	diff = tst_timespec_diff_ms(parent_then, now);
+	diff = tv->diff(tv->pthen, tv->now);
 
 	if (diff/1000) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
@@ -76,6 +125,7 @@ static void child(struct tcase *tc)
 
 static void verify_ns_clock(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
 
 	SAFE_UNSHARE(CLONE_NEWTIME);
@@ -83,14 +133,19 @@ static void verify_ns_clock(unsigned int n)
 	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
 	                 tc->clk_off, tc->off);
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &now);
+	if (tv->func(tc->clk_id, tv->now)) {
+		tst_brk(TBROK | TERRNO, "%d clock_gettime(%s) failed",
+			__LINE__, tst_clock_name(tc->clk_id));
+	}
 
 	if (!SAFE_FORK())
-		child(tc);
+		child(tv, tc);
 }
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	parent_ns = SAFE_OPEN("/proc/self/ns/time_for_children", O_RDONLY);
 }
 
@@ -104,6 +159,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_ns_clock,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.forks_child = 1,
 	.needs_kconfigs = (const char *[]) {
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
