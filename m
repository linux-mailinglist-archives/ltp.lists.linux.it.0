Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9326C1C3
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C65573C4EA8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 101803C4EAA
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:35 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8F1E4600579
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:34 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id r19so2964301pls.1
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqeJmD7nGYOdVFdRxLdoOlYzfj4FCL7bisTu6DMhm4A=;
 b=HcTzaKe2kh405LhA9YrtxHx2qY1jTRPwN1BkjhIbqcPRX4oVjgGWr2yvyg6t6SJtZO
 ajlZ+xuNnW5bxV6vRxzrXFC5rOMIKBmGVLeVT/pS+p2/Guaj2/E2m8+0hnAZmOIMv+LV
 trPOAGGvjfxfFqwKfhBkcINjaVsULX8Qy+p9Z8nsuc2PW5JXC0cfynT+NX9ZOn/uUDC/
 FRRSBnVvINWtJV9iV2i7CFKuCeEgP2pRJ5kTGWE39UcKO72nGAQfQeQXoXXqtwbM4goC
 qNkMh1TiFZm81h1hwQ2l1zIaDDwPQbIGa+mmTNyqN+pR5MT8odHk6o/12o69W2vGCoxf
 ZCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqeJmD7nGYOdVFdRxLdoOlYzfj4FCL7bisTu6DMhm4A=;
 b=mafQPF0554JObKeMCm+J+eZa5xB8aKs+tDmzUu5ISxfHFOD/Vq9EeMVlduZHKM7SHk
 rRWX23iTgLtEpcaH0zgmERvzzOQCZyQCdjjvHOti2XcVc2WiRKgzRRTHiip0fZVrZcKo
 ZuXDvqnFUoLvl8m4/uduAhiNtcsvf4nbThZqv+WnAThpgy4UJzqW8z8QJRQXuk+n1KoQ
 Q6CDP8O881loDg86Ktq5/GCDgAjZNctxlg4wAoBoj5aJBuJqfNP5ZkXBTqL1VtI8GbXc
 HWxkHxbVEaU+H5gRgR7vpO1rOwLepxFo2LEMr71E7P3Tv/mK+V6mVrR6kkoIu7/pjN5l
 H/Dw==
X-Gm-Message-State: AOAM5334Jdt5/NQ0xpCQh6JUhNomG6+ABhzESevj9RFUASBZ/adem6MO
 w5vcztPms8Vj/zyavK0knLXeJ/GIZZ0nMw==
X-Google-Smtp-Source: ABdhPJzC4+KfvlQbIcgV1p8vBT7U62XqnUZUT9JQVqS1gERUurVKTtImwsSywttpUOEH8wgNOWSraQ==
X-Received: by 2002:a17:90a:dd46:: with SMTP id
 u6mr3570500pjv.67.1600252712659; 
 Wed, 16 Sep 2020 03:38:32 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id s22sm17636069pfd.90.2020.09.16.03.38.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:50 +0530
Message-Id: <98c41b19bf7e98930fd7a541ae6a67805262c396.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2 05/17] syscalls: clock_settime: Reuse struct
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
 .../syscalls/clock_settime/clock_settime01.c  | 26 ++++++++-----------
 .../syscalls/clock_settime/clock_settime02.c  | 20 ++++++--------
 .../syscalls/clock_settime/clock_settime03.c  | 22 ++++++----------
 3 files changed, 27 insertions(+), 41 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime01.c b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
index ba6045fc5c8f..19bddbcd30ef 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime01.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
@@ -14,6 +14,7 @@
  */
 
 #include "config.h"
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
 
@@ -23,41 +24,36 @@
 
 static struct tst_ts *begin, *change, *end;
 
-static struct test_variants {
-	int (*gettime)(clockid_t clk_id, void *ts);
-	int (*settime)(clockid_t clk_id, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .gettime = libc_clock_gettime, .settime = libc_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .clock_gettime = libc_clock_gettime, .clock_settime = libc_clock_settime, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	begin->type = change->type = end->type = variants[tst_variant].type;
+	begin->type = change->type = end->type = variants[tst_variant].ts_type;
 	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
-static void do_clock_gettime(struct test_variants *tv, struct tst_ts *ts)
+static void do_clock_gettime(struct time64_variants *tv, struct tst_ts *ts)
 {
 	int ret;
 
-	ret = tv->gettime(CLOCK_REALTIME, tst_ts_get(ts));
+	ret = tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(ts));
 	if (ret == -1)
 		tst_brk(TBROK | TERRNO, "clock_settime(CLOCK_REALTIME) failed");
 }
 
 static void verify_clock_settime(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	long long elapsed;
 
 	/* test 01: move forward */
@@ -65,7 +61,7 @@ static void verify_clock_settime(void)
 
 	*change = tst_ts_add_us(*begin, DELTA_US);
 
-	TEST(tv->settime(CLOCK_REALTIME, tst_ts_get(change)));
+	TEST(tv->clock_settime(CLOCK_REALTIME, tst_ts_get(change)));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "clock_settime(2) failed for clock %s",
 			tst_clock_name(CLOCK_REALTIME));
@@ -86,7 +82,7 @@ static void verify_clock_settime(void)
 
 	*change = tst_ts_sub_us(*begin, DELTA_US);
 
-	TEST(tv->settime(CLOCK_REALTIME, tst_ts_get(change)));
+	TEST(tv->clock_settime(CLOCK_REALTIME, tst_ts_get(change)));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "clock_settime(2) failed for clock %s",
 			tst_clock_name(CLOCK_REALTIME));
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime02.c b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
index 0a8245dd4889..88d4492456f8 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime02.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
@@ -9,6 +9,7 @@
  */
 
 #include "config.h"
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
 
@@ -91,18 +92,13 @@ struct test_case tc[] = {
 
 static struct tst_ts spec;
 
-static struct test_variants {
-	int (*gettime)(clockid_t clk_id, void *ts);
-	int (*settime)(clockid_t clk_id, void *ts);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -115,13 +111,13 @@ static void setup(void)
 
 static void verify_clock_settime(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	void *ts;
 
-	spec.type = tv->type;
+	spec.type = tv->ts_type;
 
 	if (tc[i].replace == 0) {
-		TEST(tv->gettime(CLOCK_REALTIME, tst_ts_get(&spec)));
+		TEST(tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(&spec)));
 		if (TST_RET == -1) {
 			tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
 				tst_clock_name(CLOCK_REALTIME));
@@ -142,7 +138,7 @@ static void verify_clock_settime(unsigned int i)
 	else
 		ts = tst_ts_get(&spec);
 
-	TEST(tv->settime(tc[i].type, ts));
+	TEST(tv->clock_settime(tc[i].type, ts));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "clock_settime(2): clock %s passed unexpectedly, expected %s",
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
index ad6183e4ce3e..fef3c10e98b1 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -8,6 +8,7 @@
 
 #include <signal.h>
 #include "config.h"
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
 
@@ -17,32 +18,25 @@
 static struct tst_ts start, end;
 static struct tst_its its;
 
-static struct test_variants {
-	int (*clock_gettime)(clockid_t clk_id, void *ts);
-	int (*clock_settime)(clockid_t clk_id, void *ts);
-	int (*timer_settime)(kernel_timer_t timerid, int flags, void *its,
-			     void *old_its);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_clock_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .clock_settime = sys_clock_settime, .timer_settime = sys_timer_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .clock_settime = sys_clock_settime64, .timer_settime = sys_timer_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
-	start.type = end.type = its.type = tv->type;
+	start.type = end.type = its.type = tv->ts_type;
 
 	/* Check if the kernel is y2038 safe */
-	if (tv->type == TST_KERN_OLD_TIMESPEC &&
+	if (tv->ts_type == TST_KERN_OLD_TIMESPEC &&
 	    sizeof(start.ts.kern_old_ts.tv_sec) == 4) {
 		tst_brk(TCONF, "Not Y2038 safe to run test");
 	}
@@ -50,7 +44,7 @@ static void setup(void)
 
 static void run(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	unsigned long long time = 0x7FFFFFFE; /* Time just before y2038 */
 	struct sigevent ev = {
 		.sigev_notify = SIGEV_SIGNAL,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
