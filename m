Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0181D72AA
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:15:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 770AE3C4F35
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 10:15:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2EBF13C4F3C
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:26 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E94831A00678
 for <ltp@lists.linux.it>; Mon, 18 May 2020 10:15:25 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id z1so4622886pfn.3
 for <ltp@lists.linux.it>; Mon, 18 May 2020 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/zMFZOAQI5w9U0e9qm+U7hJCs8Dtn/aEf/uV5ZPrHI=;
 b=cjMe+/djRqLDlSRLN+NrD//Dw1URmAsVgy2/jffOw+kVuI8zaJJOWaSo6599SlrP2R
 hNQcS0GDfF2WkvC+U9DJJ6T20DFrXWCcJIkPD/ws6B5+lxGO94xsjMVOFiyYvLsVfDvs
 iEP+sDQJ5iIggOQvxvnf7ucqTQxvdVQk7DUFHubwgO63I5WY8NEw1zBE2c/KjKsP+aah
 vGORJU+K5KBMls5rhfn4pBnYOOfPYR0Gqx0jx9nXCqabCYYpEKYucHkT6je+4wXb//GY
 x4anQ+dtTKTiEkKDoJncPqPvvfVsHFNGqnbgEt/nBbsxz3o5NMK3K1eM9rW1mFpFKsjI
 uLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/zMFZOAQI5w9U0e9qm+U7hJCs8Dtn/aEf/uV5ZPrHI=;
 b=GsZl28lwjowcDLlygOhSDOaLeHGtK1GeE6vsPa7od9ARmGR4NAxVl88iusRDJZ0BDn
 w9AjAVtnPCA1z6+CRDxP8HCgkt69eRa5+CO1eEYr+HzFmxxQS+6/fY5PFMb4O5803J5V
 QtWCRO5EIVcqshLLo3tSZ+/DGMB6q810UMdsDcMWwg+LzTzVWkO0vCFODjjRctqLjR3Q
 +G7AT1q+gDXxJ85IHVQ2xEIoIsU4nW7toyTsy0W2sSbETx5gQnk2cbgxEmcE/35KsFYz
 IikL2BzmlrVbDPCqlCh5tHxDHcxa637QF6U8ehhySDmbomV23r8iazPN8sDvht5Pp2ks
 +4Kg==
X-Gm-Message-State: AOAM532/gZwcabEv4xffu/W4sHzGe11qRuvv5d2mQyppO9ZJUWKVaFxm
 yeC/nQcE+HsV4yiOjy55jUBZ2Zz/wCo=
X-Google-Smtp-Source: ABdhPJx1Kgqfe8pY3LV54SpZ9FYDWa5VpYasCrDKPYndHw1ZINubZCTPIXQfgqJKmzG/rMD+IpqD1g==
X-Received: by 2002:a65:614b:: with SMTP id o11mr5262245pgv.443.1589789723845; 
 Mon, 18 May 2020 01:15:23 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q201sm8186997pfq.40.2020.05.18.01.15.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 01:15:23 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 13:44:54 +0530
Message-Id: <7e3283352724efdd7386d49f2293c85e75981a9a.1589789487.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589789487.git.viresh.kumar@linaro.org>
References: <cover.1589789487.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V3 02/17] syscalls/timer_settime: Add support for
 time64 tests
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
 include/tst_timer.h                           | 34 +++++++++++
 .../syscalls/timer_settime/timer_settime01.c  | 46 ++++++++++----
 .../syscalls/timer_settime/timer_settime02.c  | 60 ++++++++++++++-----
 3 files changed, 112 insertions(+), 28 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index e67f31201a9d..c4107ed65dea 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -257,6 +257,40 @@ static inline int sys_timer_gettime64(kernel_timer_t timerid, void *its)
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
index da365d221086..fa6923b75d23 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -25,15 +25,14 @@
 #include <errno.h>
 #include <time.h>
 #include <signal.h>
-#include "tst_test.h"
-#include "lapi/common_timers.h"
+#include "tst_timer.h"
 
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
@@ -45,10 +44,28 @@ static struct testcase {
 	{&old_set, 5, 0, TIMER_ABSTIME, "using absolute time"},
 };
 
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, void *ts);
+	int (*func)(kernel_timer_t timerid, int flags, void *its,
+		    void *old_its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timer_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
 
@@ -78,21 +95,24 @@ static void run(unsigned int n)
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
@@ -116,6 +136,7 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGALRM, sighandler);
 }
 
@@ -123,6 +144,7 @@ static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f18ddc13af98"},
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index bcabb76956f8..975ce672de29 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -25,10 +25,11 @@
 
 #include <errno.h>
 #include <time.h>
-#include "tst_test.h"
-#include "lapi/common_timers.h"
+#include "tst_timer.h"
 
-static struct itimerspec new_set, old_set;
+static struct tst_its new_set, old_set;
+static struct tst_its *pnew_set = &new_set, *pold_set = &old_set, *null_set = NULL;
+static void *faulty_set;
 static kernel_timer_t timer;
 static kernel_timer_t timer_inval = -1;
 
@@ -44,23 +45,46 @@ static const char * const descriptions[] = {
 
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
+#if (__NR_timer_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timer_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
 
@@ -91,11 +115,13 @@ static void run(unsigned int n)
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
@@ -119,6 +145,8 @@ static struct tst_test test = {
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
