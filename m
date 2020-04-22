Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C46991B36DA
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:37:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76EEA3C2987
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:37:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 59F2F3C622A
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:37 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C521610009E9
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:36 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id p25so504701pfn.11
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6grujlqAA7RUNfnS7a/3sE0sDnQsAU6vwNjch863ck=;
 b=YpQCIYYl2jMPCd9Uc48k7EGCOfBzTR9ChSFAC77L0QG4qvuXAU6KLz/GrIHmL2DHPP
 6AI1kaRFDpWNqzVT1XMj1nuu4lSxbHd/Q5Ns2wxVDB89L7LYoawN+OKLfDMlKMMbvp4S
 IVNdEZLpFnrUkei6XDI+hyeLgWH1Akrl7AKNlZ4XMWTMV8ZfE1KITPmuOTNo0Dmk5xnH
 RkPr/lyeKmMca6MqMHSEHoFENwWQLjfKbM5L3HH3vK/LAbwJWYPE3Dr+Wjld+Ly6zRQ3
 Q2nAaI0kNHMdBlPgYDgTFeLEcnIWr3hx+Rax4zn/oToH5gzxgzZ+Tge4VGJlPLfB6Z09
 y5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6grujlqAA7RUNfnS7a/3sE0sDnQsAU6vwNjch863ck=;
 b=ilZ7WYXnD8pHgwRH3/U+k7o5zC5HpkCH/KDk4kMMGZu7N6XP1StpRjWeWWaeSci7/E
 1oDsEIcIu43e7YKhIqa/C8tk5HcM80yEsH2FfXDFICUeVmsUbZZFi48eCnLqyzvIzPoB
 caOif2Xy/YMt2/ENnFHSYbY4lCG78lc1qtCEoTmsNT7VjWfGnqYMaSjAQQbGSvgdIOiQ
 Ry/13MJ6PWeApXKkYzHDdwmohMxLkD9qoMBMrM8MZGsbB0R2n4Bel1XXNib+XNJ/MDmO
 58MYwDDzWGXALvwr6Jpo2EKUmUYsP/8iaWuFNEwsYugfAQz3ff4etF68058NP37YMdOa
 6VKw==
X-Gm-Message-State: AGi0Puaf/Ov0QzEMgSfXBFArBgrLGRu5wdxZSJsCAH1mGG7ChA1cLVmN
 hzkMPjTKBZRqf0ztdFGEk0z+UT2O/os=
X-Google-Smtp-Source: APiQypKKOvZ1yj0C3JfA05MGW4Gswuw8/rpma4aDqVECeCyIY9BjUIevLvYAucqyWxnDHlLSwBFp9g==
X-Received: by 2002:a63:296:: with SMTP id 144mr24597644pgc.110.1587533854623; 
 Tue, 21 Apr 2020 22:37:34 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id i128sm4169080pfc.149.2020.04.21.22.37.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 22:37:34 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 11:07:22 +0530
Message-Id: <2e57919c45e9e9b23bd0e819ffc470a9326ecfb1.1587533697.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587533697.git.viresh.kumar@linaro.org>
References: <cover.1587533697.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V4 1/5] syscalls/clock_gettime: Add support for time64
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
 include/tst_timer.h                           |  65 +++++++++-
 .../syscalls/clock_gettime/clock_gettime01.c  | 116 ++++++++----------
 .../syscalls/clock_gettime/clock_gettime02.c  |  72 ++++++-----
 .../syscalls/clock_gettime/clock_gettime03.c  |  58 +++++++--
 4 files changed, 206 insertions(+), 105 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 4f97acd165b8..f40b93a624b3 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -15,6 +15,7 @@
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 
 /*
  * Converts timeval to microseconds.
@@ -116,7 +117,9 @@ struct __kernel_timespec {
 enum tst_ts_type {
 	TST_LIBC_TIMESPEC,
 	TST_KERN_OLD_TIMESPEC,
-	TST_KERN_TIMESPEC
+	TST_KERN_TIMESPEC,
+	/* Used for indicating failure test with bad address */
+	TST_KERN_BAD_ADDR
 };
 
 struct tst_ts {
@@ -128,6 +131,66 @@ struct tst_ts {
 	};
 };
 
+static inline void *tst_get_ts(struct tst_ts *t)
+{
+	switch (t->type) {
+	case TST_LIBC_TIMESPEC:
+		return &t->libc_ts;
+	case TST_KERN_OLD_TIMESPEC:
+		return &t->kern_old_ts;
+	case TST_KERN_TIMESPEC:
+		return &t->kern_ts;
+	case TST_KERN_BAD_ADDR:
+		return tst_get_bad_addr(NULL);
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t->type);
+		return NULL;
+	}
+}
+
+static inline int libc_clock_gettime(clockid_t clk_id, struct tst_ts *t)
+{
+	return clock_gettime(clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_gettime(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_gettime, clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_gettime64(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_gettime64, clk_id, tst_get_ts(t));
+}
+
+/*
+ * tst_ts_nonzero return:
+ * 0: On success, i.e. timespec updated correctly.
+ * -1: Error, timespec not updated.
+ * -2: Error, tv_nsec is corrupted.
+ */
+static inline int tst_ts_nonzero(struct tst_ts *t)
+{
+	switch (t->type) {
+	case TST_LIBC_TIMESPEC:
+		return (t->libc_ts.tv_nsec == 0 && t->libc_ts.tv_sec == 0) ? -1 : 0;
+	case TST_KERN_OLD_TIMESPEC:
+		return (t->kern_old_ts.tv_nsec == 0 && t->kern_old_ts.tv_sec == 0) ? -1 : 0;
+	case TST_KERN_TIMESPEC:
+		if (t->kern_ts.tv_nsec == 0 && t->kern_ts.tv_sec == 0)
+			return -1;
+
+		/* Upper 32 bits of tv_nsec should be cleared */
+		if (t->kern_ts.tv_nsec >> 32)
+			return -2;
+		else
+			return 0;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t->type);
+		return -1;
+	}
+}
+
 /*
  * Returns tst_ts seconds.
  */
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
index d365823b2f0f..ea87e4fb4e9a 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime01.c
@@ -19,20 +19,14 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "lapi/abisize.h"
 
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
@@ -63,73 +57,65 @@ struct test_case tc[] = {
 	 },
 };
 
-static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
-{
-	return tst_syscall(__NR_clock_gettime, clk_id, tp);
-}
+static struct tst_ts spec;
 
-static int check_spec(struct timespec *spec)
+static struct test_variants {
+	int (*func)(clockid_t clk_id, struct tst_ts *spec);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
 {
-	return (spec->tv_nsec != 0 || spec->tv_sec != 0) ? 1 : 0;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void verify_clock_gettime(unsigned int i)
 {
-	size_t sz;
-	struct timespec spec;
-
-	/*
-	 * check clock_gettime() syscall AND libc (or vDSO) functions
-	 */
-	struct tmpfunc tf[] = {
-		{ .func = sys_clock_gettime, .desc = "syscall"      },
-		{ .func = clock_gettime, .desc = "vDSO or syscall"  },
-	};
-
-	for (sz = 0; sz < ARRAY_SIZE(tf); sz++) {
+	struct test_variants *tv = &variants[tst_variant];
+	int ret;
 
-		memset(&spec, 0, sizeof(struct timespec));
+	memset(&spec, 0, sizeof(spec));
+	spec.type = tv->type;
 
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
+	TEST(tv->func(tc[i].clktype, &spec));
 
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
+		ret = tst_ts_nonzero(&spec);
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
@@ -137,5 +123,7 @@ static void verify_clock_gettime(unsigned int i)
 static struct tst_test test = {
 	.test = verify_clock_gettime,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 };
diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
index b4bc6e2d55d4..42784ae42c62 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime02.c
@@ -19,10 +19,9 @@
  */
 
 #include "config.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
+#include "lapi/abisize.h"
 
 struct test_case {
 	clockid_t clktype;
@@ -30,7 +29,7 @@ struct test_case {
 	int allow_inval;
 };
 
-struct test_case tc[] = {
+static struct test_case tc[] = {
 	{
 	 .clktype = MAX_CLOCKS,
 	 .exp_err = EINVAL,
@@ -81,52 +80,67 @@ struct test_case tc[] = {
 	 },
 };
 
+static struct tst_ts spec;
+
 /*
  * bad pointer w/ libc causes SIGSEGV signal, call syscall directly
  */
-static int sys_clock_gettime(clockid_t clk_id, struct timespec *tp)
+static struct test_variants {
+	int (*func)(clockid_t clk_id, struct tst_ts *t);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
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
 
 	/* bad pointer cases */
 	if (tc[i].exp_err == EFAULT)
-		specptr = tst_get_bad_addr(NULL);
-
-	TEST(sys_clock_gettime(tc[i].clktype, specptr));
+		spec.type = TST_KERN_BAD_ADDR;
+	else
+		spec.type = tv->type;
 
-	if (TST_RET == -1) {
+	TEST(tv->func(tc[i].clktype, &spec));
 
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
index cf4706fa0c30..ce536e566a46 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -21,7 +21,7 @@
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "tst_test.h"
+#include "lapi/abisize.h"
 
 static struct tcase {
 	int clk_id;
@@ -38,22 +38,48 @@ static struct tcase {
 	{CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC, 100},
 };
 
-static struct timespec now;
+static struct tst_ts now, then, parent_then;
 static int parent_ns;
 
-static void child(struct tcase *tc)
+static struct test_variants {
+	int (*func)(clockid_t clk_id, struct tst_ts *spec);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .func = sys_clock_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .func = sys_clock_gettime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void child(struct test_variants *tv, struct tcase *tc)
 {
-	struct timespec then;
-	struct timespec parent_then;
 	long long diff;
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &then);
+	if (tv->func(tc->clk_id, &then)) {
+		tst_res(TFAIL | TERRNO, "clock_gettime(%s) failed",
+			tst_clock_name(tc->clk_id));
+		return;
+	}
 
 	SAFE_SETNS(parent_ns, CLONE_NEWTIME);
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &parent_then);
+	if (tv->func(tc->clk_id, &parent_then)) {
+		tst_res(TFAIL | TERRNO, "clock_gettime(%s) failed",
+			tst_clock_name(tc->clk_id));
+		return;
+	}
 
-	diff = tst_timespec_diff_ms(then, now);
+	diff = tst_ts_diff_ms(then, now);
 
 	if (diff/1000 != tc->off) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
@@ -63,7 +89,7 @@ static void child(struct tcase *tc)
 		        tst_clock_name(tc->clk_id), diff);
 	}
 
-	diff = tst_timespec_diff_ms(parent_then, now);
+	diff = tst_ts_diff_ms(parent_then, now);
 
 	if (diff/1000) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
@@ -76,6 +102,7 @@ static void child(struct tcase *tc)
 
 static void verify_ns_clock(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
 
 	SAFE_UNSHARE(CLONE_NEWTIME);
@@ -83,14 +110,22 @@ static void verify_ns_clock(unsigned int n)
 	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
 	                 tc->clk_off, tc->off);
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &now);
+	if (tv->func(tc->clk_id, &now)) {
+		tst_res(TFAIL | TERRNO, "%d clock_gettime(%s) failed",
+			__LINE__, tst_clock_name(tc->clk_id));
+		return;
+	}
 
 	if (!SAFE_FORK())
-		child(tc);
+		child(tv, tc);
 }
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	now.type = then.type = parent_then.type = tv->type;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	parent_ns = SAFE_OPEN("/proc/self/ns/time_for_children", O_RDONLY);
 }
 
@@ -104,6 +139,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_ns_clock,
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 	.forks_child = 1,
 	.needs_kconfigs = (const char *[]) {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
