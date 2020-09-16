Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB726C1CC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FB1F3C2B15
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7515C3C4E9F
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:14 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DAAAF140017E
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:13 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id a9so1381057pjg.1
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5CU7f+O91bpJCj2wracDBqxaz6T4VC11JvTQalKp7ZY=;
 b=GZ1pDijLqMm+vWD4QmCV8y+pjMh4OWPC1rPfrOKt8pmNJskc3sspGl/p/HT54sQkaO
 9uGXx1dGWFPjBR6v62DgY5FI8wfnrP6sjFkPRryPcUdMkJDMMqrQjDpkTVC6V8jpFy9B
 u1tKR7J0O8nhWTio5gYWnMNuoC+pmyNU2ROZsmsjCm0oYZiHeelkNtjTKIxK4ddWLeKb
 TT5h0HDmM21DAUTYl+Q1F/18bd4hdm/MifMPWlbMMwGia/7hdSrHhikYy2+I/lZhpZEG
 LleACkM+1nnGNlwTvzyhVjxy70Fh8hBOPFSqQU7TV3OIAOSRfdiAtSgMvgxQIWrWxayj
 sPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5CU7f+O91bpJCj2wracDBqxaz6T4VC11JvTQalKp7ZY=;
 b=tyl/J14mn92yw7KTTIUR9INnybWFj5fIZ8QDqN/gqctoeDEH2uQ39rsgBgDzohg1iR
 ws6ywc0UBHEVc7ZKtxth0TpZOcQoW14ak+9yb4ATjAJocunVYCXQTPOdZa+5PT+xKcG3
 pf7Gg51erRtsVsFjVnYMNRXIaGQuC7nMnwGj6viROA6dpl4wxtaNxqKLkTHDapGnqth7
 lqKxy2yAso+AeeVvVDqN7cn9HOs6nSltvZjHXHQqfHCAMQGPm0s96GurQuNh4MFz/qai
 Nkj/YRFCUF6hiU/FhJrW19gxyvGNgNdHBb17hGpyGOOu+bG8oaVA4E/D9n/pw9Nzb2hx
 mtqA==
X-Gm-Message-State: AOAM532n4kc7w7OvtgheTop0sg6TF/HRZK4gA20H/KBDr8LN2yNGXBG7
 JMWXIH/6Jc1s8CEEHy51c4/YAlo1MMmiMA==
X-Google-Smtp-Source: ABdhPJyClbLYA08EyN9Fwkz8v74IPoU3TszIVlpeDPIAaGRO0HG591prGfws/WSOF4nGBuCBQbWZ9g==
X-Received: by 2002:a17:902:9697:b029:d1:e598:4001 with SMTP id
 n23-20020a1709029697b02900d1e5984001mr5837388plp.59.1600252752049; 
 Wed, 16 Sep 2020 03:39:12 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id e207sm17774546pfh.171.2020.09.16.03.39.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:39:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:58 +0530
Message-Id: <08bc9e62e02f92af3d3308897c738f592c5cc6ba.1600252542.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH V2 13/17] syscalls: timer_settime: Reuse struct
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
