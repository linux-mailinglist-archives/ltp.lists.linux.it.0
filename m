Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8011BA2DE
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BD473C2867
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:44:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A385C3C2865
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:43:57 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D5FB21400352
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:43:56 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id h12so4620652pjz.1
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 04:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MBvp4rNZq4zequSo6tD1QjtomwCkQXCO11ChIwKnGaw=;
 b=FokTD4gckciIH5enoCGvqUOJlAdMxb9kEr/OBJ1Zqv3BYyI6E03zkHHhXb9bXx60wH
 sGoAFxMJfvAS7QvZsP4tpqI+9LoF6RslTNqDqdLrPRKUXGLNpF2VviwZSz5RTObklfyS
 celH+4Fa8GQoAvaMUkwYgBeSBbPqFsOrK9gl+QmEeKx2dXxizmtqEeyAXC2D/mG9tI3e
 P3KoRRCB0EUf4C5hp2g4N0HKvBRAKh6Fbdy6FlqHmpEFJoR1ycaXmq/2gdUftRMD20xC
 pDpSps4CESJhYE/nGNJErZ3rXnCgspTj7IiFa9V6bkAg3cnnuwRmglSz50STZPzEPY4i
 dieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBvp4rNZq4zequSo6tD1QjtomwCkQXCO11ChIwKnGaw=;
 b=m9O4YX20Hc2woDQ6PyyFUvOcIBEsMRiF//G35cBZu4rUc95CKk+tNbfvZayOdWyBor
 OO2w4GWEK/201IyP5/QJrIfkIlTO9A8AwjZINgAZToclDtDonnvv7DJbP40IisZy2Fqf
 WYmhbW3Vw8coOLsLVRsIJWitaruXi3qOEEAOZ29flVfyQEHJg0DRj7UVXZOX6i0yiN4s
 llspdgt5TLoNP71zjb3c8d0uqci+uTIWvjAokn6CyizZpgWmEnbtuPqIoqusTpdESEXN
 BxezkrAQq+dJ51eYe8kyOtmyohdsoyQ2GqhyjHRKILny7fZsIIYSeyEf1ZvBVbg+rP9e
 js3A==
X-Gm-Message-State: AGi0PuYYL1iDRyaT6Ku/MDLYZQdCQCTyAWaprJcXFsTcDO+QVlSpuBwT
 4XE2Vb/eBLqS02XB6jEgTzLJiqiP/Bg=
X-Google-Smtp-Source: APiQypIyj9PlQ6+sOG6X87pVyLlCKRXhQGawUNG5PDnH0pxVyPJWBrMxxMBxyRNP7Nq8cJ6LmholBQ==
X-Received: by 2002:a17:90a:d17:: with SMTP id
 t23mr24112728pja.77.1587987834762; 
 Mon, 27 Apr 2020 04:43:54 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id b15sm12308304pfd.139.2020.04.27.04.43.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 04:43:54 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 27 Apr 2020 17:13:45 +0530
Message-Id: <4be02b8b3fed66adf3e165dc92d5d5b779799fd6.1587987802.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
References: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/timer_settime: Add support for time64
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

This adds support for time64 tests to the existing timer_settime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           | 34 ++++++++++
 .../syscalls/timer_settime/timer_settime01.c  | 51 +++++++++++----
 .../syscalls/timer_settime/timer_settime02.c  | 65 ++++++++++++++-----
 3 files changed, 122 insertions(+), 28 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 601f934da670..94d03cecdabe 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -252,6 +252,40 @@ static inline int sys_timer_gettime64(kernel_timer_t timerid, void *its)
 	return tst_syscall(__NR_timer_gettime64, timerid, its);
 }
 
+static inline int sys_timer_settime(kernel_timer_t timerid, int flags,
+				    void *its, void *old_its)
+{
+	return tst_syscall(__NR_timer_settime, timerid, flags, its, old_its);
+}
+
+static inline int sys_timer_settime64(kernel_timer_t timerid, int flags,
+				      void *its, void *old_its)
+{
+	return tst_syscall(__NR_timer_settime64, timerid, flags, its, old_its);
+}
+
+static inline void tst_its_set_time(struct tst_its *its, long long value_sec,
+				long long value_nsec, long long interval_sec,
+				long long interval_nsec)
+{
+	switch (its->type) {
+	case TST_LIBC_TIMESPEC:
+		its->ts.libc_its.it_value.tv_sec = value_sec;
+		its->ts.libc_its.it_value.tv_nsec = value_nsec;
+		its->ts.libc_its.it_interval.tv_sec = interval_sec;
+		its->ts.libc_its.it_interval.tv_nsec = interval_nsec;
+	break;
+	case TST_KERN_TIMESPEC:
+		its->ts.kern_its.it_value.tv_sec = value_sec;
+		its->ts.kern_its.it_value.tv_nsec = value_nsec;
+		its->ts.kern_its.it_interval.tv_sec = interval_sec;
+		its->ts.kern_its.it_interval.tv_nsec = interval_nsec;
+	break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its->type);
+	}
+}
+
 /*
  * Returns tst_ts seconds.
  */
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index da365d221086..8c00718eedaf 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -25,15 +25,15 @@
 #include <errno.h>
 #include <time.h>
 #include <signal.h>
-#include "tst_test.h"
-#include "lapi/common_timers.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
-static struct timespec timenow;
-static struct itimerspec new_set, old_set;
+static struct tst_ts timenow;
+static struct tst_its new_set, old_set;
 static kernel_timer_t timer;
 
 static struct testcase {
-	struct itimerspec	*old_ptr;
+	struct tst_its		*old_ptr;
 	int			it_value_tv_sec;
 	int			it_interval_tv_sec;
 	int			flag;
@@ -45,10 +45,32 @@ static struct testcase {
 	{&old_set, 5, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	int (*func)(kernel_timer_t timerid, int flags, void *its,
+		    void *old_its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = sys_clock_gettime, .func = sys_timer_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .func = sys_timer_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
 static void run(unsigned int n)
 {
-	unsigned int i;
+	struct test_variants *tv = &variants[tst_variant];
 	struct testcase *tc = &tcases[n];
+	long long val;
+	unsigned int i;
 
 	tst_res(TINFO, "Testing for %s:", tc->description);
 
@@ -78,21 +100,24 @@ static void run(unsigned int n)
 		memset(&new_set, 0, sizeof(new_set));
 		memset(&old_set, 0, sizeof(old_set));
 
-		new_set.it_value.tv_sec = tc->it_value_tv_sec;
-		new_set.it_interval.tv_sec = tc->it_interval_tv_sec;
+		new_set.type = old_set.type = tv->type;
+
+		val = tc->it_value_tv_sec;
 
 		if (tc->flag & TIMER_ABSTIME) {
-			if (clock_gettime(clock, &timenow) < 0) {
+			timenow.type = tv->type;
+			if (tv->gettime(clock, tst_ts_get(&timenow)) < 0) {
 				tst_res(TFAIL,
 					"clock_gettime(%s) failed - skipping the test",
 					get_clock_str(clock));
 				continue;
 			}
-			new_set.it_value.tv_sec += timenow.tv_sec;
+			val += tst_ts_get_sec(timenow);
 		}
 
-		TEST(tst_syscall(__NR_timer_settime, timer,
-			tc->flag, &new_set, tc->old_ptr));
+		tst_its_set_time(&new_set, val, 0, tc->it_interval_tv_sec, 0);
+
+		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "%s failed",
@@ -116,6 +141,7 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGALRM, sighandler);
 }
 
@@ -123,6 +149,7 @@ static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f18ddc13af98"},
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index bcabb76956f8..9ca62e15b690 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -25,10 +25,12 @@
 
 #include <errno.h>
 #include <time.h>
-#include "tst_test.h"
-#include "lapi/common_timers.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
-static struct itimerspec new_set, old_set;
+static struct tst_its new_set, old_set;
+static struct tst_its *pnew_set = &new_set, *pold_set = &old_set, *null_set = NULL;
+static void *faulty_set;
 static kernel_timer_t timer;
 static kernel_timer_t timer_inval = -1;
 
@@ -44,23 +46,50 @@ static const char * const descriptions[] = {
 
 static struct testcase {
 	kernel_timer_t		*timer_id;
-	struct itimerspec	*new_ptr;
-	struct itimerspec	*old_ptr;
+	struct tst_its		**new_ptr;
+	struct tst_its		**old_ptr;
 	int			it_value_tv_nsec;
 	int			error;
 } tcases[] = {
-	{&timer, NULL, &old_set, 0, EINVAL},
-	{&timer, &new_set, &old_set, -1, EINVAL},
-	{&timer, &new_set, &old_set, NSEC_PER_SEC + 1, EINVAL},
-	{&timer_inval, &new_set, &old_set, 0, EINVAL},
-	{&timer, (struct itimerspec *) -1, &old_set, 0, EFAULT},
-	{&timer, &new_set, (struct itimerspec *) -1, 0, EFAULT},
+	{&timer, &null_set, &pold_set, 0, EINVAL},
+	{&timer, &pnew_set, &pold_set, -1, EINVAL},
+	{&timer, &pnew_set, &pold_set, NSEC_PER_SEC + 1, EINVAL},
+	{&timer_inval, &pnew_set, &pold_set, 0, EINVAL},
+	{&timer, (struct tst_its **)&faulty_set, &pold_set, 0, EFAULT},
+	{&timer, &pnew_set, (struct tst_its **)&faulty_set, 0, EFAULT},
 };
 
+static struct test_variants {
+	int (*func)(kernel_timer_t timerid, int flags, void *its,
+		    void *old_its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_timer_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .func = sys_timer_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	faulty_set = tst_get_bad_addr(NULL);
+}
+
 static void run(unsigned int n)
 {
-	unsigned int i;
+	struct test_variants *tv = &variants[tst_variant];
 	struct testcase *tc = &tcases[n];
+	void *new, *old;
+	unsigned int i;
 
 	tst_res(TINFO, "Testing for %s:", descriptions[n]);
 
@@ -91,11 +120,13 @@ static void run(unsigned int n)
 		memset(&new_set, 0, sizeof(new_set));
 		memset(&old_set, 0, sizeof(old_set));
 
-		new_set.it_value.tv_sec  = 5;
-		new_set.it_value.tv_nsec = tc->it_value_tv_nsec;
+		new_set.type = old_set.type = tv->type;
+		tst_its_set_time(&new_set, 5, tc->it_value_tv_nsec, 0, 0);
+
+		new = (tc->new_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->new_ptr);
+		old = (tc->old_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->old_ptr);
 
-		TEST(tst_syscall(__NR_timer_settime, *tc->timer_id,
-					0, tc->new_ptr,	tc->old_ptr));
+		TEST(tv->func(*tc->timer_id, 0, new, old));
 
 		if (tc->error != TST_ERR) {
 			tst_res(TFAIL | TTERRNO,
@@ -119,6 +150,8 @@ static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f18ddc13af98"},
 		{}
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
