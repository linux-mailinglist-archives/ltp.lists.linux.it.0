Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10A260AD6
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:22:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF2383C53C2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AD2D53C53E6
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:28 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3FBC7600BC5
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:28 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id np15so8277661pjb.0
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GWy0uWZeo6ljRwWDS/gLrb1Oi0Lsbp5dMByqTvjrTXY=;
 b=j1D5prUoCp5ozeeZ3ypqHq1SuEdfoUbuQL8sAjgT7P9S9PEmpc3bl4dRgSCstfDhqt
 25es1KBt7O0q5x1EhOrTVZ+9+2sugAcDPUNI4OCTvf9JAgtisqc6DEZ3AFdgStFbE+l6
 +VvX7LM+62ScuY9A6iiZoKDQhvLhNTf3vR92jszc8tyvues+vyW8ctfHOdVny5DqQgIv
 vPntjPvbuCLYhH4FkgE+oUusK3qzSImbTVX2LowQgp1JKplnl70sgKFAj4dyehiTDGRp
 7TCiGRJ0L7i08tsomNxnDjypb4JwWcfrv+WL8yBIqX20uzecGWoTnYyIy45on3igg2WS
 eIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWy0uWZeo6ljRwWDS/gLrb1Oi0Lsbp5dMByqTvjrTXY=;
 b=Y+0QYiem+KOlqTfdE6WVrWhWBd/ju5OmAkDqNDo2v1K+O6TOlGfmL2Vqhc6QXJRqiN
 ZXueOns843xqthp/RXsgOpKW68lGNU5BOevVVm8R6LGD7IU1c3ICywUBqy5JRC3tVrBt
 yrR5HQnmiMq371BilepbLJTJCYiDM3CSZtpRQBDbJ0Cs6CObNhjNSji/RJD2CGxoubUr
 u86ZbHjeJmfLma1IZVe+LJF4k/UxdLj60QuVK3PlaB7QLtyyU5caW/rwjPYsiNw/L9LL
 yYs7NITo7/22vke/nUIWAo697RTEGHY30e01/m2/xw7IkAn6+v+tIYRrg6b+yup+dDRq
 +VzQ==
X-Gm-Message-State: AOAM530K6tg9htBuXVdwyT93cYrlqUVihGcSilTEhk6NFLTRZRm4vznI
 2w4UYpSCaAQUt6tAQ+UNdmkGC5kR8MCC/A==
X-Google-Smtp-Source: ABdhPJwWTWsd2vI37RTpvg+LDAz61MpYsD9NINQgj6rDcVXfRCoUm8M6yeMAMhBcA/HZBGVAxEVgJA==
X-Received: by 2002:a17:90b:4b11:: with SMTP id
 lx17mr2597386pjb.22.1599546026263; 
 Mon, 07 Sep 2020 23:20:26 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id ih12sm11594464pjb.24.2020.09.07.23.20.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:27 +0530
Message-Id: <e19e515d1ed0a1c88aaba0f9c926725e999f6efb.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 14/16] syscalls: timerfd: Reuse struct time64_variants
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
 testcases/kernel/syscalls/timerfd/timerfd01.c | 27 ++++++++-----------
 testcases/kernel/syscalls/timerfd/timerfd04.c | 20 ++++++--------
 .../syscalls/timerfd/timerfd_gettime01.c      |  8 +++---
 .../syscalls/timerfd/timerfd_settime01.c      | 17 +++++-------
 .../syscalls/timerfd/timerfd_settime02.c      | 15 +++++------
 5 files changed, 35 insertions(+), 52 deletions(-)

diff --git a/testcases/kernel/syscalls/timerfd/timerfd01.c b/testcases/kernel/syscalls/timerfd/timerfd01.c
index 039d962ca228..cede40dafb2b 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd01.c
@@ -17,6 +17,7 @@
 
 #define _GNU_SOURCE
 #include <poll.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_timerfd.h"
 
@@ -28,28 +29,22 @@ static struct tcase {
 	{CLOCK_REALTIME, "CLOCK REALTIME"},
 };
 
-static struct test_variants {
-	int (*cgettime)(clockid_t clk_id, void *ts);
-	int (*tfd_gettime)(int fd, void *its);
-	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timerfd_gettime != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime, .tfd_gettime = sys_timerfd_gettime, .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .tfd_gettime = sys_timerfd_gettime, .tfd_settime = sys_timerfd_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timerfd_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime64, .tfd_gettime = sys_timerfd_gettime64, .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .tfd_gettime = sys_timerfd_gettime64, .tfd_settime = sys_timerfd_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static unsigned long long getustime(int clockid)
 {
-	struct test_variants *tv = &variants[tst_variant];
-	struct tst_ts tp = {.type = tv->type, };
+	struct time64_variants *tv = &variants[tst_variant];
+	struct tst_ts tp = {.type = tv->ts_type, };
 
-	if (tv->cgettime((clockid_t) clockid, tst_ts_get(&tp))) {
+	if (tv->clock_gettime((clockid_t) clockid, tst_ts_get(&tp))) {
 		tst_res(TFAIL | TERRNO, "clock_gettime() failed");
 		return 0;
 	}
@@ -60,7 +55,7 @@ static unsigned long long getustime(int clockid)
 static void settime(int tfd, struct tst_its *tmr, int tflags,
                     unsigned long long tvalue, int tinterval)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_its_set_value_from_us(tmr, tvalue);
 	tst_its_set_interval_from_us(tmr, tinterval);
@@ -97,11 +92,11 @@ static void waittmr(int tfd, unsigned int exp_ticks)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	int tfd;
 	unsigned long long tnow;
 	uint64_t uticks;
-	struct tst_its tmr = {.type = tv->type, };
+	struct tst_its tmr = {.type = tv->ts_type, };
 	struct tcase *clks = &tcases[n];
 
 	tst_res(TINFO, "testing %s", clks->name);
@@ -122,7 +117,7 @@ static void run(unsigned int n)
 	settime(tfd, &tmr, TFD_TIMER_ABSTIME, tnow + 50 * 1000, 50 * 1000);
 
 	memset(&tmr, 0, sizeof(tmr));
-	tmr.type = tv->type;
+	tmr.type = tv->ts_type;
 
 	if (tv->tfd_gettime(tfd, tst_its_get(&tmr)))
 		tst_res(TFAIL | TERRNO, "timerfd_gettime() failed");
diff --git a/testcases/kernel/syscalls/timerfd/timerfd04.c b/testcases/kernel/syscalls/timerfd/timerfd04.c
index b6409574a219..798d95e607ed 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd04.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd04.c
@@ -15,6 +15,7 @@
  */
 
 #include <stdlib.h>
+#include "time64_variants.h"
 #include "tst_safe_clocks.h"
 #include "tst_safe_timerfd.h"
 #include "tst_timer.h"
@@ -34,18 +35,13 @@ static struct tcase {
 	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, -10},
 };
 
-static struct test_variants {
-	int (*cgettime)(clockid_t clk_id, void *ts);
-	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime, .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .clock_gettime = sys_clock_gettime, .tfd_settime = sys_timerfd_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .cgettime = sys_clock_gettime64, .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .clock_gettime = sys_clock_gettime64, .tfd_settime = sys_timerfd_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -56,18 +52,18 @@ static void setup(void)
 
 static void verify_timerfd(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct tst_ts start, end;
 	struct tst_its it;
 	struct tcase *tc = &tcases[n];
 
-	start.type = end.type = it.type = tv->type;
+	start.type = end.type = it.type = tv->ts_type;
 	SAFE_UNSHARE(CLONE_NEWTIME);
 
 	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
 	                 tc->clk_off, tc->off);
 
-	if (tv->cgettime(tc->clk_id, tst_ts_get(&start))) {
+	if (tv->clock_gettime(tc->clk_id, tst_ts_get(&start))) {
 		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
 			tst_clock_name(tc->clk_id));
 		return;
@@ -98,7 +94,7 @@ static void verify_timerfd(unsigned int n)
 
 	SAFE_WAIT(NULL);
 
-	if (tv->cgettime(CLOCK_MONOTONIC, tst_ts_get(&end))) {
+	if (tv->clock_gettime(CLOCK_MONOTONIC, tst_ts_get(&end))) {
 		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
 			tst_clock_name(CLOCK_MONOTONIC));
 		return;
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
index 49f5aa59a96b..aba77c05d796 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
@@ -12,6 +12,7 @@
 
 #define _GNU_SOURCE
 
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_timerfd.h"
 
@@ -32,10 +33,7 @@ static struct test_case_t {
 	{&fd, NULL, EINVAL},
 };
 
-static struct test_variants {
-	int (*tfd_gettime)(int fd, void *its);
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timerfd_gettime != __LTP__NR_INVALID_SYSCALL)
 	{ .tfd_gettime = sys_timerfd_gettime, .desc = "syscall with old kernel spec"},
 #endif
@@ -70,7 +68,7 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct test_case_t *test = &test_cases[n];
 	void *its;
 
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
index 781c0fdb1cb7..36577e2c4c0b 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
@@ -13,6 +13,7 @@
 
 #define _GNU_SOURCE
 
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "lapi/timerfd.h"
 
@@ -35,27 +36,23 @@ static struct test_case_t {
 
 static struct tst_its new_value;
 
-static struct test_variants {
-	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .tfd_settime = sys_timerfd_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .tfd_settime = sys_timerfd_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
 	bad_addr = tst_get_bad_addr(NULL);
-	new_value.type = tv->type;
+	new_value.type = tv->ts_type;
 
 	clockfd = timerfd_create(CLOCK_REALTIME, 0);
 	if (clockfd == -1) {
@@ -77,7 +74,7 @@ static void cleanup(void)
 
 static void run(unsigned int n)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct test_case_t *test = &test_cases[n];
 	void *its;
 
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
index ab978bde5820..bd92ee964644 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
@@ -15,6 +15,7 @@
  *  timerfd: Protect the might cancel mechanism proper
  */
 #include <unistd.h>
+#include "time64_variants.h"
 #include "tst_timer.h"
 #include "tst_safe_timerfd.h"
 #include "tst_fuzzy_sync.h"
@@ -29,26 +30,22 @@ static int fd = -1;
 static struct tst_its its;
 static struct tst_fzsync_pair fzsync_pair;
 
-static struct test_variants {
-	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
-	{ .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .tfd_settime = sys_timerfd_settime, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
-	{ .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .tfd_settime = sys_timerfd_settime64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
-	its.type = tv->type;
+	its.type = tv->ts_type;
 
 	fd = SAFE_TIMERFD_CREATE(CLOCK_REALTIME, 0);
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
