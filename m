Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D91B36DE
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08CF83C2990
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 083063C2976
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:43 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F317C600780
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:40 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id h69so533498pgc.8
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oiSJHv6pZZuiXn78/JXl20AHmlGGHbwjum7y4IqJcDw=;
 b=qX0VxZOmr+0bau0FMDTHPdn2V8PtXwLibaa6+gL8irqUcXs1eyoykxsUly8dYezRjV
 fDdMXn1Z6C387XXlhR6DYgUqNjqhQMvcmaVDVT6p3v2aAcOaOTl1BKZRVIFaSS0xTXyd
 tGMRf6xgxc6dK61msAxy2nbwQ9SlX7YRV/1DmerI7cPjZI3Jn1IVOU3pNlqmbYP+tex+
 Y864iqFRAQfI/KAroYhWN/xgoZO+fXwlRKFongYvzIKvVINbb+w3ZBJCTrA2DwmIKcFy
 OuFwZ9N6/VaZ9R9S6noIY8c0Y/TSiUjsFY0Xwyq1O3A20LNirD6rJIU7FEbPYvecWDos
 cu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiSJHv6pZZuiXn78/JXl20AHmlGGHbwjum7y4IqJcDw=;
 b=g3ADZQy0rgmIBsQwIX3WgAHdObNk30Rwp6MMZGHqFiDj5B+Vat9lL+PS3bvFIeP7dQ
 ZbBTpdLXPNx3Wmxk+WTI70m98Q1RPEtmd4lG7pl/dznNhXJ5XPrBh7W/4ifeg5uNz4Ct
 dlyPpR9CuVDmIqNCmck7isIFxvdX4qN+RvDJzc/zPja37k1XnKXUh1A+WWBmN3Rcaqxs
 HanG1FmJ3poR1fRTtiZE88iv4FBnhVtsjVXWqEflZnPl+CTlKea596YRRXFcY5LpWncO
 ixMTw49T7XHTrSctT4LeAcprUc5wSKFx48gVx39nR0GhpDOlRXd5dYL+ROW7k2okJTX2
 nGOQ==
X-Gm-Message-State: AGi0PuYxWcDVZAzYIKbax+fEdeGWeR9uBXDNjLOmJCVY6WoUyx5KkGYl
 LCzJUDMoue54/yomLg85hCpHm5mWyig=
X-Google-Smtp-Source: APiQypL05faybGMya/CT5cgXIlNjGYtvt+Y9lMg2KAz82r63ATQ2ighJDdp8nZoX2IkNcUe/hSeXIg==
X-Received: by 2002:aa7:9811:: with SMTP id e17mr24706864pfl.70.1587533860394; 
 Tue, 21 Apr 2020 22:37:40 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id u24sm3947169pgo.65.2020.04.21.22.37.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 22:37:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 11:07:24 +0530
Message-Id: <094a99ff886cfffb06b3d9696d1a515ac3c5a8cb.1587533697.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587533697.git.viresh.kumar@linaro.org>
References: <cover.1587533697.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V4 3/5] syscalls/clock_getres: Add support for time64
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
index fef201ee04df..df59c6aac0a5 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -133,6 +133,9 @@ struct tst_ts {
 
 static inline void *tst_get_ts(struct tst_ts *t)
 {
+	if (!t)
+		return NULL;
+
 	switch (t->type) {
 	case TST_LIBC_TIMESPEC:
 		return &t->libc_ts;
@@ -148,6 +151,21 @@ static inline void *tst_get_ts(struct tst_ts *t)
 	}
 }
 
+static inline int libc_clock_getres(clockid_t clk_id, struct tst_ts *t)
+{
+	return clock_getres(clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_getres(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_getres, clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_getres64(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_getres_time64, clk_id, tst_get_ts(t));
+}
+
 static inline int libc_clock_gettime(clockid_t clk_id, struct tst_ts *t)
 {
 	return clock_gettime(clk_id, tst_get_ts(t));
diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
index fcdf53b9cb79..1e961a3f8a25 100644
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
+	int (*func)(clockid_t clk_id, struct tst_ts *spec);
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
+	TEST(tv->func(tcase[i].clk_id, *tv->spec));
 
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
