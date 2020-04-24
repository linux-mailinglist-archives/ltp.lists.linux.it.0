Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770E1B6EC8
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:18:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 653DE3C2924
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:18:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7EEF33C28F1
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:18:54 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 902A6601CEA
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:18:53 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id t40so3603482pjb.3
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/1SRRXVc2luE4sHhQmn/5TAapTeUZolV7AoabXjI0YY=;
 b=LNj3xWFHNCdnpq9D5kgS8f0Qwc7tDKdyCncy1/JvGZCJsLvjlOABE/G3v8e6IyqzuT
 ogc4vo3AIbJgWXFoNa4eJP9gAhHBO4wUZAr8OVbeN49ZGzd2eA/rJ9oX5dBKBKqiSnyx
 bXW8T2hITju8cURWtCRSUAJfjO/gXHs6WBBkRc6DRpUbShfZlguNKABMWo8zD8o29HEQ
 FDdhE0ghIseCrPfwHGtiCfM3WbdIP2pq9eAIw5L9yF1ToDz8v+A9K6xRFvxLZVTD7Mpq
 X8WyCDhIux+gh9a7dd41DI8/TAuKXXwTgoF/6utzt0GHoGLBrMXMzudYL5sfcS6/q+fc
 jJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/1SRRXVc2luE4sHhQmn/5TAapTeUZolV7AoabXjI0YY=;
 b=LQAkaRqkeY6l+JYbiAKBTjK4OLxxv6TpZdxs4cHkiAXlYOfw7I6tG3tuWApDh609pS
 V6xOTzwr6mxvHgiySOqw6tP/A2UHdlJGc7fN52amZ9O44zsaDN+W0mDvp5qrATSCvHUq
 TVr4qBhcQNBByyR+1OMsAoEVAS0yTSH9gGHTISY8J2Aj7p0t2FW/ML/PYTCWjdBqW7Sr
 /0l3YWr6zO/B9tdqys+9EjaEX/FMe0SIFvfOK8r7Umx/HVbS80hGocWpwI21FvZb/KAu
 rji8+EnEhyBzTcPXkCgU2wY9k8oPryDf27KAzW1EWKRilfCtSzBgcGBOfdIB2AhtnXoM
 bQkA==
X-Gm-Message-State: AGi0PuYmT6BAr8r88AY+JaE2SIsjsk3Xoa5tRtAbJ4ejjfdEryFnS1Gt
 ZuBFEjWf87HdYzPCtCwwwYtjIsTg5RY=
X-Google-Smtp-Source: APiQypJon8tSXCTtr3OUGsSQjtXGUtlTBzFMNKf2Pg8J4z+7bImKxLxwtoAhl04eHVIzS+5i4PiR/Q==
X-Received: by 2002:a17:902:eb4b:: with SMTP id
 i11mr7693639pli.19.1587712731671; 
 Fri, 24 Apr 2020 00:18:51 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id q97sm4361869pjb.7.2020.04.24.00.18.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 00:18:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 24 Apr 2020 12:48:44 +0530
Message-Id: <1f2c00709d36aa9bc810f201e3adb93808816851.1587712683.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587533697.git.viresh.kumar@linaro.org>
References: <a143f48ffeec14739d35c07dfb95f237981a322d.1587712683.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V5 3/5] syscalls/clock_getres: Add support for time64
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

This adds support for time64 tests to the existing clock_getres()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           | 18 ++++++
 .../syscalls/clock_getres/clock_getres01.c    | 58 ++++++++++++-------
 2 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 0c6b934157f9..4823d350fdc6 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -131,6 +131,9 @@ struct tst_ts {
 
 static inline void *tst_ts_get(struct tst_ts *t)
 {
+	if (!t)
+		return NULL;
+
 	switch (t->type) {
 	case TST_LIBC_TIMESPEC:
 		return &t->ts.libc_ts;
@@ -144,6 +147,21 @@ static inline void *tst_ts_get(struct tst_ts *t)
 	}
 }
 
+static inline int libc_clock_getres(clockid_t clk_id, void *ts)
+{
+	return clock_getres(clk_id, ts);
+}
+
+static inline int sys_clock_getres(clockid_t clk_id, void *ts)
+{
+	return tst_syscall(__NR_clock_getres, clk_id, ts);
+}
+
+static inline int sys_clock_getres64(clockid_t clk_id, void *ts)
+{
+	return tst_syscall(__NR_clock_getres_time64, clk_id, ts);
+}
+
 static inline int libc_clock_gettime(clockid_t clk_id, void *ts)
 {
 	return clock_gettime(clk_id, ts);
diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
index fcdf53b9cb79..5b83c2460f05 100644
--- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
+++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
@@ -12,11 +12,9 @@
 
 #include <errno.h>
 
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
 #include "lapi/posix_clocks.h"
-
-static struct timespec *res;
+#include "lapi/abisize.h"
 
 static struct test_case {
 	char *name;
@@ -37,29 +35,45 @@ static struct test_case {
 	{"-1", -1, -1, EINVAL},
 };
 
-static const char *variant_desc[] = {
-	"default (vdso or syscall)",
-	"syscall",
-	"syscall with NULL res parameter" };
+static struct tst_ts *tspec, *nspec = NULL;
+
+static struct test_variants {
+	int (*func)(clockid_t clk_id, void *ts);
+	enum tst_ts_type type;
+	struct tst_ts **spec;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = libc_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &tspec, .desc = "vDSO or syscall with libc spec"},
+	{ .func = libc_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &nspec, .desc = "vDSO or syscall with libc spec with NULL res"},
+	{ .func = sys_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &tspec, .desc = "syscall with libc spec"},
+	{ .func = sys_clock_getres, .type = TST_LIBC_TIMESPEC, .spec = &nspec, .desc = "syscall with libc spec with NULL res"},
+	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &tspec, .desc = "syscall with kernel spec32"},
+	{ .func = sys_clock_getres, .type = TST_KERN_OLD_TIMESPEC, .spec = &nspec, .desc = "syscall with kernel spec32 with NULL res"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_clock_getres, .type = TST_KERN_TIMESPEC, .spec = &tspec, .desc = "syscall with kernel spec64"},
+	{ .func = sys_clock_getres, .type = TST_KERN_TIMESPEC, .spec = &nspec, .desc = "syscall with kernel spec64 with NULL res"},
+#endif
+
+#if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &tspec, .desc = "syscall time64 with kernel spec64"},
+	{ .func = sys_clock_getres64, .type = TST_KERN_TIMESPEC, .spec = &nspec, .desc = "syscall time64 with kernel spec64 with NULL res"},
+#endif
+};
 
 static void setup(void)
 {
-	tst_res(TINFO, "Testing variant: %s", variant_desc[tst_variant]);
+	tspec->type = variants[tst_variant].type;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void do_test(unsigned int i)
 {
-	switch (tst_variant) {
-	case 0:
-		TEST(clock_getres(tcase[i].clk_id, res));
-		break;
-	case 1:
-		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id, res));
-		break;
-	case 2:
-		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id, NULL));
-		break;
-	}
+	struct test_variants *tv = &variants[tst_variant];
+
+	TEST(tv->func(tcase[i].clk_id, tst_ts_get(*tv->spec)));
 
 	if (TST_RET != tcase[i].ret) {
 		if (TST_ERR == EINVAL) {
@@ -84,10 +98,10 @@ static void do_test(unsigned int i)
 static struct tst_test test = {
 	.test = do_test,
 	.tcnt = ARRAY_SIZE(tcase),
-	.test_variants = 3,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.bufs = (struct tst_buffers []) {
-		{&res, .size = sizeof(*res)},
+		{&tspec, .size = sizeof(*tspec)},
 		{},
 	}
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
