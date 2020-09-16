Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBCE26C1C2
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5618D3C4EB3
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 48BB13C4EA5
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:32 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9E0B21400E7E
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:31 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id 7so3632243pgm.11
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQa9lISQli39PJ7zBdC0Sb8DVbbVwtNV6y95pE/JOKQ=;
 b=UwoNppNgQKoV6OLhM5NAaIyiPfhfCzqKfR7cebG1SH+3T68UH/uM7LGb29LOc82t+n
 ceEAzqUGgrKuNiNIElUgo7dOeA5cq1q1kW+PETGzsXwd/0VMfhmDx44bTAEFkhw/MXa8
 Y3g2HMSzX7NvEFTA2gAC1sCZ5aHkJ+RA3+sHjp/5+dRVQwbQhDDQv07SIOycI9TKAAHo
 cpcpIhPbQqaTIF0+Pv5AJPuEALtF0lFNFrYY87b8MVwuHWHCcIQyFyLZpNe7Ln0YDdtj
 uiPMsJwV/wBPpjprMHr7nJcluHmHFMre31U/V45OtormKYALrNM6Bcypk6yLxAXnMGwE
 DoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQa9lISQli39PJ7zBdC0Sb8DVbbVwtNV6y95pE/JOKQ=;
 b=Ne0S6elSujq0akyeLZ5wJPkNIn2jgEl4Xoddz2VGpAzrd+4YHsyEZ2Qbn4u4S/NQGc
 FMJhmGyu3f8QSefehC5MXlA7jfGSckJuDlyIwATwyWmbZdbe2DM1yNLPvYEPk+icUdle
 jJghlXX9qb3lrA7/W+vbRjUpkeEx2F5+2kZGlAKSxPK9KS2MajxKyZkU9tc55qTqLk02
 8MA90oXMwWE8RnQHrQcaEUuuzV0u35UzDDBeRnGkZA2xAqY4vGqD3q0NIRwT2yWNLSF6
 vs21iC0j8/LH0xjVB2szJgXF+5TavG5mvARCbWyCcQbdF/S5XtojmxxBZBJUIJOhst9J
 U53A==
X-Gm-Message-State: AOAM530Fhds2ZeHru/hcBSxQsSg33p3jiK28/WbWG6Shs+tiwcy2GH0r
 Bi+X4kEl0LqauN4t12Fu0RnfEtbJmX7e5Q==
X-Google-Smtp-Source: ABdhPJwgzRclcMUUkvBrBhgJ7GCi2yHRvBaVc1875yL2rf2demEP3w2JchDD+dJcaT41+NYClEF30w==
X-Received: by 2002:a62:5bc2:0:b029:13e:d13d:a130 with SMTP id
 p185-20020a625bc20000b029013ed13da130mr21120159pfb.24.1600252709764; 
 Wed, 16 Sep 2020 03:38:29 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id x3sm14401850pgg.54.2020.09.16.03.38.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:29 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:49 +0530
Message-Id: <0c7aa77cc46a311d366143c9f189d7ee41630ee7.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 04/17] syscalls: clock_nanosleep: Reuse struct
 time64_variants
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../clock_nanosleep/clock_nanosleep01.c       | 21 +++++++--------
 .../clock_nanosleep/clock_nanosleep03.c       | 26 ++++++++-----------
 .../clock_nanosleep/clock_nanosleep04.c       | 22 +++++++---------
 3 files changed, 29 insertions(+), 40 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 716f383bbeca..516ab50f16d6 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -17,6 +17,7 @@
 
 #include <limits.h>
 
+#include "time64_variants.h"
 #include "tst_safe_clocks.h"
 #include "tst_sig_proc.h"
 #include "tst_timer.h"
@@ -105,25 +106,21 @@ static struct test_case tcase[] = {
 static struct tst_ts *rq;
 static struct tst_ts *rm;
 
-static struct test_variants {
-	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .clock_nanosleep = libc_clock_nanosleep, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_nanosleep = sys_clock_nanosleep, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_nanosleep = sys_clock_nanosleep64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 void setup(void)
 {
-	rq->type = variants[tst_variant].type;
+	rq->type = variants[tst_variant].ts_type;
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGINT, sighandler);
 	bad_addr = tst_get_bad_addr(NULL);
@@ -131,7 +128,7 @@ void setup(void)
 
 static void do_test(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
 	pid_t pid = 0;
 	void *request, *remain;
@@ -157,9 +154,9 @@ static void do_test(unsigned int i)
 	else
 		remain = tst_ts_get(rm);
 
-	TEST(tv->func(tc->clk_id, tc->flags, request, remain));
+	TEST(tv->clock_nanosleep(tc->clk_id, tc->flags, request, remain));
 
-	if (tv->func == libc_clock_nanosleep) {
+	if (tv->clock_nanosleep == libc_clock_nanosleep) {
 		/*
 		 * The return value and error number are differently set for
 		 * libc syscall as compared to kernel syscall.
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
index 0a7ea5586327..bd2c38ee3401 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep03.c
@@ -16,6 +16,7 @@
  */
 
 #include <stdlib.h>
+#include "time64_variants.h"
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
@@ -23,40 +24,35 @@
 #define OFFSET_S 10
 #define SLEEP_US 100000
 
-static struct test_variants {
-	int (*gettime)(clockid_t clk_id, void *ts);
-	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .clock_gettime = libc_clock_gettime, .clock_nanosleep = libc_clock_nanosleep, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .clock_nanosleep = sys_clock_nanosleep, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .clock_nanosleep = sys_clock_nanosleep64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
-static void do_clock_gettime(struct test_variants *tv, struct tst_ts *ts)
+static void do_clock_gettime(struct time64_variants *tv, struct tst_ts *ts)
 {
 	int ret;
 
-	ret = tv->gettime(CLOCK_MONOTONIC, tst_ts_get(ts));
+	ret = tv->clock_gettime(CLOCK_MONOTONIC, tst_ts_get(ts));
 	if (ret == -1)
 		tst_brk(TBROK | TERRNO, "clock_settime(CLOCK_MONOTONIC) failed");
 }
 
 static void verify_clock_nanosleep(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct tst_ts start, end, sleep_abs;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
-	start.type = end.type = sleep_abs.type = tv->type;
+	start.type = end.type = sleep_abs.type = tv->ts_type;
 
 	SAFE_UNSHARE(CLONE_NEWTIME);
 
@@ -67,12 +63,12 @@ static void verify_clock_nanosleep(void)
 	sleep_abs = tst_ts_add_us(start, 1000000 * OFFSET_S + SLEEP_US);
 
 	if (!SAFE_FORK()) {
-		TEST(tv->func(CLOCK_MONOTONIC, TIMER_ABSTIME, tst_ts_get(&sleep_abs), NULL));
+		TEST(tv->clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, tst_ts_get(&sleep_abs), NULL));
 		/*
 		 * The return value and error number are differently set for
 		 * libc syscall as compared to kernel syscall.
 		 */
-		if ((tv->func == libc_clock_nanosleep) && TST_RET) {
+		if ((tv->clock_nanosleep == libc_clock_nanosleep) && TST_RET) {
 			TST_ERR = TST_RET;
 			TST_RET = -1;
 		}
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
index 1f2d3c4f83ec..c5aeed505685 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep04.c
@@ -7,6 +7,7 @@
 #include <stdio.h>
 #include <time.h>
 #include <unistd.h>
+#include "time64_variants.h"
 #include "tst_safe_clocks.h"
 #include "tst_timer.h"
 
@@ -15,20 +16,15 @@ static clockid_t tcase[] = {
 	CLOCK_REALTIME,
 };
 
-static struct test_variants {
-	int (*gettime)(clockid_t clk_id, void *ts);
-	int (*func)(clockid_t clock_id, int flags, void *request, void *remain);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .gettime = libc_clock_gettime, .func = libc_clock_nanosleep, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .clock_gettime = libc_clock_gettime, .clock_nanosleep = libc_clock_nanosleep, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_clock_nanosleep != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .func = sys_clock_nanosleep, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .clock_nanosleep = sys_clock_nanosleep, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_nanosleep_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .func = sys_clock_nanosleep64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .clock_nanosleep = sys_clock_nanosleep64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -39,10 +35,10 @@ void setup(void)
 
 static void do_test(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
-	struct tst_ts ts = {.type = tv->type};
+	struct time64_variants *tv = &variants[tst_variant];
+	struct tst_ts ts = {.type = tv->ts_type};
 
-	TEST(tv->gettime(tcase[i], tst_ts_get(&ts)));
+	TEST(tv->clock_gettime(tcase[i], tst_ts_get(&ts)));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
 			tst_clock_name(tcase[i]));
@@ -51,7 +47,7 @@ static void do_test(unsigned int i)
 
 	ts = tst_ts_add_us(ts, 10000);
 
-	TEST(tv->func(tcase[i], TIMER_ABSTIME, tst_ts_get(&ts), NULL));
+	TEST(tv->clock_nanosleep(tcase[i], TIMER_ABSTIME, tst_ts_get(&ts), NULL));
 
 	if (TST_RET) {
 		tst_res(TFAIL | TTERRNO, "clock_nanosleep(2) failed for clock %s",
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
