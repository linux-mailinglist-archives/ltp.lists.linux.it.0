Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9C260AD3
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 508443C53B9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9D4DA3C53F4
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:20 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 13EEE201008
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:20 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so7730125pjb.4
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5CU7f+O91bpJCj2wracDBqxaz6T4VC11JvTQalKp7ZY=;
 b=FJrX6eTIrNFeEHZ7d0acVXCtbfZrzwX+45AclxrREubve4Sx168pA9nWVkI603M3pI
 80EVzzHxjpBiGv9BVcJwrb7CdvPPIfpejBzzIzO8jfs1wzlMCrSjyETQX5MIVXKCLLYw
 H2MPhzJkfLuOixtfw3xmLolB4TKlngrNxQ2SCK333ilh8agVGR8IGl7s/K3ZRjvwzRkp
 MgHT93hMfJ5yhHJQ3yKAE1GXESuDNNhWRietkeIr5FB++ZcmlPRqyePjOa8/CY1zmyPd
 nZ8mKKARFEdUOtcB9f9TbrRXQOkhpJ+u+cywpNIJt5Cho4EsDesw+CtcsbTqH07W0l6Z
 h/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5CU7f+O91bpJCj2wracDBqxaz6T4VC11JvTQalKp7ZY=;
 b=X1HTQjjAhOyfWCxEY9Jn6b28semCK4c7P/Um6djR35G/q3tWhR/Efpv2GcNrDH3RA4
 dsNo/jbePMgr8bYT4yW8cjDVuY5Wf6NFDne06o3vM0cbWV9RIM23ctdNndYwUlE6RV/b
 jNh8BzYBujHEYRjaNe6z/yi6XyjlWYRGLEcRGmfkbtF8EfIkiMXD1Dx+VjpCaLzJrTRk
 aLBKbI2qo5FL+qvVyIoVCIA+zBILwOZ1kRfL0x9HMHqcEzbMJx1YLnjbNjAmmSIdOzBs
 FelAAzGJtFHfQ2ylT/e9LVSaZdpC/nYvb/t6h7luNXU9uWoUDY/kMid3QPp5dH7HHYpV
 evTw==
X-Gm-Message-State: AOAM5337zKWD0EMzqKE6ULRWvUNSno2E3HDpRtufzgMY9cVMV218uc05
 ovga8+Uu/70kxz2aAamF3gWVo1V9ef7iyw==
X-Google-Smtp-Source: ABdhPJy2v3fMDGLi63Si+1F97MDzKRLpxpJoVYVHQTNMlyToFFlUXET3sGYryCOnb/wV2dOaBaBXig==
X-Received: by 2002:a17:90a:d485:: with SMTP id
 s5mr2523171pju.193.1599546018230; 
 Mon, 07 Sep 2020 23:20:18 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id z7sm7420032pfj.75.2020.09.07.23.20.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:25 +0530
Message-Id: <a6f51cfc469d9eb80e698cfcdbb1d96f8615d9e3.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 12/16] syscalls: timer_settime: Reuse struct
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
 .../syscalls/timer_settime/timer_settime01.c  | 25 ++++++++-----------
 .../syscalls/timer_settime/timer_settime02.c  | 18 ++++++-------
 2 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 415c6290fe2f..67143e8f88b2 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -26,6 +26,7 @@
 #include <errno.h>
 #include <time.h>
 #include <signal.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 static struct tst_ts timenow;
@@ -45,19 +46,13 @@ static struct testcase {
 	{&old_set, 50000, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
-static struct test_variants {
-	int (*cgettime)(clockid_t clk_id, void *ts);
-	int (*tgettime)(kernel_timer_t timer, void *its);
-	int (*func)(kernel_timer_t timerid, int flags, void *its, void *old_its);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timer_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime, .tgettime = sys_timer_gettime, .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .timer_gettime = sys_timer_gettime, .timer_settime = sys_timer_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime64, .tgettime = sys_timer_gettime64, .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .timer_gettime = sys_timer_gettime64, .timer_settime = sys_timer_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -93,7 +88,7 @@ static void setup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct testcase *tc = &tcases[n];
 	long long val;
 	unsigned int i;
@@ -126,12 +121,12 @@ static void run(unsigned int n)
 		memset(&new_set, 0, sizeof(new_set));
 		memset(&old_set, 0, sizeof(old_set));
 
-		new_set.type = old_set.type = tv->type;
+		new_set.type = old_set.type = tv->ts_type;
 		val = tc->it_value_tv_usec;
 
 		if (tc->flag & TIMER_ABSTIME) {
-			timenow.type = tv->type;
-			if (tv->cgettime(clock, tst_ts_get(&timenow)) < 0) {
+			timenow.type = tv->ts_type;
+			if (tv->clock_gettime(clock, tst_ts_get(&timenow)) < 0) {
 				tst_res(TFAIL,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
@@ -143,14 +138,14 @@ static void run(unsigned int n)
 		tst_its_set_interval_from_us(&new_set, tc->it_interval_tv_usec);
 		tst_its_set_value_from_us(&new_set, val);
 
-		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
+		TEST(tv->timer_settime(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "timer_settime(%s) failed",
 				get_clock_str(clock));
 		}
 
-		TEST(tv->tgettime(timer, tst_its_get(&new_set)));
+		TEST(tv->timer_gettime(timer, tst_its_get(&new_set)));
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "timer_gettime(%s) failed",
 				get_clock_str(clock));
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index f1225c1ccfad..564f1c2ce323 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -25,6 +25,7 @@
 
 #include <errno.h>
 #include <time.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 static struct tst_its new_set, old_set;
@@ -58,18 +59,13 @@ static struct testcase {
 	{&timer, &pnew_set, (struct tst_its **)&faulty_set, 0, EFAULT},
 };
 
-static struct test_variants {
-	int (*func)(kernel_timer_t timerid, int flags, void *its,
-		    void *old_its);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timer_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .timer_settime = sys_timer_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .timer_settime = sys_timer_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -81,7 +77,7 @@ static void setup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct testcase *tc = &tcases[n];
 	void *new, *old;
 	unsigned int i;
@@ -115,7 +111,7 @@ static void run(unsigned int n)
 		memset(&new_set, 0, sizeof(new_set));
 		memset(&old_set, 0, sizeof(old_set));
 
-		new_set.type = old_set.type = tv->type;
+		new_set.type = old_set.type = tv->ts_type;
 		tst_its_set_interval_sec(&new_set, 0);
 		tst_its_set_interval_nsec(&new_set, 0);
 		tst_its_set_value_sec(&new_set, 5);
@@ -124,7 +120,7 @@ static void run(unsigned int n)
 		new = (tc->new_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->new_ptr);
 		old = (tc->old_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->old_ptr);
 
-		TEST(tv->func(*tc->timer_id, 0, new, old));
+		TEST(tv->timer_settime(*tc->timer_id, 0, new, old));
 
 		if (tc->error != TST_ERR) {
 			tst_res(TFAIL | TTERRNO,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
