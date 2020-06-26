Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3420AC3E
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:23:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A203C2B7A
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:23:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0F6883C585A
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:48 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DE2CA600B8E
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:21:52 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id d12so3914105ply.1
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERU/2N+jHtSJmjAASD07ZLHpWznQ7nOWmKAaoBHiLqY=;
 b=JaNdQehD89oVIuVRnlrVdw9BAVtAHoiYsE6CuJVHj5ICLLUX4OUp+MPRduLzERPbpl
 St6eOnrAItWds9hvTnPkGWuxs4Pze5wRWp8AijOESKbrayivy4trS2zYGc9qH17pxGdp
 uXy5Da1WU9b4QfF9/BJLpZOaMjFo12eo9cw0u4E/jOO4fkd1VLCpWPQj4KEtHvvwJQmU
 9z/r7CxwNMjKrNv5mmjdFyrKy0GjDQ4Q/0eG5y1C1kb5qgl6n9ejxkBtEdWIHRiEVtol
 FNM0vaPoOwf9G6HKS4gvNiGvdxaE+esJlw2qH13oq0S2IrdXSFNuNL+MRaMZDbPow8d4
 BSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERU/2N+jHtSJmjAASD07ZLHpWznQ7nOWmKAaoBHiLqY=;
 b=eZb7+mcQTAnVoRyafvrLWK+iCp7GaMFAzPsxgj2TkK5CJmDErs1ef0qH8SM4VM4lT6
 2xayNnijv7DAMY/ybZ+aaFv9TYww91rfYRaloz9VmbK7HtWqGxwMrZSm0s0+vbqIvLlZ
 ya0rijtB856y2rIaxFfHEygmU18+/Snc58XGVGu4JBqCwNIReq18pxGilmCMUI17EyFR
 QGJwkPwAgwcMny0tHwSPlnEQJyFB2WSBFiQhkxaYNvIjbAyiTggZhjfumj2MawSzFWK9
 i6fnpGdamAyEviELv6+Er0aJndwZDf0kJwRMZpo6HRIdvaDr0bXfokV3GeZSBTwLAPHf
 T0XA==
X-Gm-Message-State: AOAM5320IO0r0K2OZZQnd+TdAkJkjMPI6tqqZHwGxdmh9oW5nTiWGvTj
 +LY3bSbHSisFgmnx1IbVhvdpYPxe8ms=
X-Google-Smtp-Source: ABdhPJydiJ684fbELrToN5q5GhlwIUBJAz3xJhl4sM1DfKD+/KzeL6FENAy4BnIp7GuV6eCfQV+PxQ==
X-Received: by 2002:a17:902:9a94:: with SMTP id
 w20mr1295355plp.177.1593152566291; 
 Thu, 25 Jun 2020 23:22:46 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id v13sm10570909pjd.9.2020.06.25.23.22.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:22:45 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:16 +0530
Message-Id: <ff846fd931de19b2bbb44b2bc0631f4883a8e8bf.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V7 03/19] syscalls/timer_settime: Add support for
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
 .../syscalls/timer_settime/timer_settime01.c  | 51 ++++++++++----
 .../syscalls/timer_settime/timer_settime02.c  | 69 ++++++++++++++-----
 2 files changed, 88 insertions(+), 32 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index da365d221086..08fb56e4943a 100644
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
-static kernel_timer_t timer;
+static struct tst_ts timenow;
+static struct tst_its new_set, old_set;
+static timer_t timer;
 
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
+	int (*func)(timer_t timerid, int flags, void *its,
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
 
@@ -78,21 +95,27 @@ static void run(unsigned int n)
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
+		tst_its_set_interval_sec(&new_set, tc->it_interval_tv_sec);
+		tst_its_set_interval_nsec(&new_set, 0);
+		tst_its_set_value_sec(&new_set, val);
+		tst_its_set_value_nsec(&new_set, 0);
+
+		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
 
 		if (TST_RET != 0) {
 			tst_res(TFAIL | TTERRNO, "%s failed",
@@ -116,6 +139,7 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	SAFE_SIGNAL(SIGALRM, sighandler);
 }
 
@@ -123,6 +147,7 @@ static struct tst_test test = {
 	.test = run,
 	.needs_root = 1,
 	.tcnt = ARRAY_SIZE(tcases),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f18ddc13af98"},
diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime02.c b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
index bcabb76956f8..e82adddc3189 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime02.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime02.c
@@ -25,12 +25,13 @@
 
 #include <errno.h>
 #include <time.h>
-#include "tst_test.h"
-#include "lapi/common_timers.h"
+#include "tst_timer.h"
 
-static struct itimerspec new_set, old_set;
-static kernel_timer_t timer;
-static kernel_timer_t timer_inval = -1;
+static struct tst_its new_set, old_set;
+static struct tst_its *pnew_set = &new_set, *pold_set = &old_set, *null_set = NULL;
+static void *faulty_set;
+static timer_t timer;
+static timer_t timer_inval = -1;
 
 /* separate description-array to (hopefully) improve readability */
 static const char * const descriptions[] = {
@@ -43,24 +44,47 @@ static const char * const descriptions[] = {
 };
 
 static struct testcase {
-	kernel_timer_t		*timer_id;
-	struct itimerspec	*new_ptr;
-	struct itimerspec	*old_ptr;
+	timer_t			*timer_id;
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
+	int (*func)(timer_t timerid, int flags, void *its,
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
 
@@ -91,11 +115,16 @@ static void run(unsigned int n)
 		memset(&new_set, 0, sizeof(new_set));
 		memset(&old_set, 0, sizeof(old_set));
 
-		new_set.it_value.tv_sec  = 5;
-		new_set.it_value.tv_nsec = tc->it_value_tv_nsec;
+		new_set.type = old_set.type = tv->type;
+		tst_its_set_interval_sec(&new_set, 0);
+		tst_its_set_interval_nsec(&new_set, 0);
+		tst_its_set_value_sec(&new_set, 5);
+		tst_its_set_value_nsec(&new_set, tc->it_value_tv_nsec);
+
+		new = (tc->new_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->new_ptr);
+		old = (tc->old_ptr == (struct tst_its **)&faulty_set) ? faulty_set : tst_its_get(*tc->old_ptr);
 
-		TEST(tst_syscall(__NR_timer_settime, *tc->timer_id,
-					0, tc->new_ptr,	tc->old_ptr));
+		TEST(tv->func(*tc->timer_id, 0, new, old));
 
 		if (tc->error != TST_ERR) {
 			tst_res(TFAIL | TTERRNO,
@@ -119,6 +148,8 @@ static struct tst_test test = {
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
