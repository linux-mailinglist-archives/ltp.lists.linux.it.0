Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 109711DE4D9
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E9F33C13E0
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:52:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 68E173C4CDE
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:55 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 154891A00CD6
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:51:54 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id k7so4765920pjs.5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mwE6KptDvG+hADHK35pXKn3oUIBlPZlYVKCLhaYmU0=;
 b=WRCfhEYHQcpKJ7SVfckLGK/Vdm8KQAxiAc1PmxrS5BFnKkKJwpkC8x6zJgdvYNDvTg
 FzHdU98xobv+anavQW7VtVxtq0k70r3S1u3Et9WPWKh6u3hG0liTdIvr7RgSLEEN1/Ns
 r8y9brMCVcU4zQQTZirEDnR4IvhuL4koEdCPb9r6TAvQFqsyUubgL15CL0MUOarpd7YM
 eyl9+GTp68qU/XrnmTLupOX/E78ea4zyInJE/lmae5K1ZCmmVDDQNQ3Qllp61BnClXnK
 eFktOjQBsn9r/43WbFFPoeCCap97IUIfg9k0Z8aBpOKyOvVKVypFJbm++Wbdgd/PBksF
 7yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mwE6KptDvG+hADHK35pXKn3oUIBlPZlYVKCLhaYmU0=;
 b=Ns/7LRvh5buFFa1ycLcp29lItMFSgB5NAnUAIR4deLBBdV5f38U4CfVA/g7Yvo0RP5
 2ReZTfctMhIeBdbn3dj633EAeRdYz9HZN5RyJf+r2/4Tqtegh7qZuwW2om7jDn/87Rpi
 PgPpFkP6yo+DPji/sKk+rPLzUt7tkP8mJEUEa8N826cMsGPXKg34bmd2u4ril1gZZLNe
 CGTNnACCkLS+25fjINIonlv8XBlaCl7bT5+UPYvKFn67J4k66BrL9HTHpfohRv80YODe
 zx0w9EXsT9OJe6rvOOKo1BIMvjrIVhXZ9SA3rZ3So8ofix5TBBoZhZXt+3gl5njk20/b
 Qeyw==
X-Gm-Message-State: AOAM533cnGi4CyraC/U5CLA3wku/o0zEVFsPAKYK/MYKZypuI+0qG013
 YeD/EonbNnbZIWn11Ck4NV8gHWhXNgM=
X-Google-Smtp-Source: ABdhPJzef00hYAOC7y2+yOqQtT8qkNNDuaCJzAP5/1qr2eJeZXyTpeZo7XZJjAkv6h38mBuZBj3/3Q==
X-Received: by 2002:a17:902:8f90:: with SMTP id
 z16mr14494214plo.195.1590144711981; 
 Fri, 22 May 2020 03:51:51 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id c8sm3638917pgb.72.2020.05.22.03.51.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:51:51 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:23 +0530
Message-Id: <84610bf1f39ad6187da8665137b786aa1925cd97.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V4 03/17] syscalls/timerfd: Add support for time64
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

This adds support for time64 tests to the existing timerfd_gettime() and
timerfd_settime() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  48 +++++++
 testcases/kernel/syscalls/timerfd/timerfd01.c |  53 +++++--
 testcases/kernel/syscalls/timerfd/timerfd04.c |  51 +++++--
 .../syscalls/timerfd/timerfd_gettime01.c      | 133 ++++++++---------
 .../syscalls/timerfd/timerfd_settime01.c      | 136 ++++++++----------
 .../syscalls/timerfd/timerfd_settime02.c      |  28 +++-
 6 files changed, 279 insertions(+), 170 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 44cc764e3950..bb24636b015a 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -269,6 +269,54 @@ static inline int sys_timer_settime64(timer_t timerid, int flags, void *its,
 	return tst_syscall(__NR_timer_settime64, timerid, flags, its, old_its);
 }
 
+static inline int sys_timerfd_gettime(int fd, void *its)
+{
+	return tst_syscall(__NR_timerfd_gettime, fd, its);
+}
+
+static inline int sys_timerfd_gettime64(int fd, void *its)
+{
+	return tst_syscall(__NR_timerfd_gettime64, fd, its);
+}
+
+static inline int sys_timerfd_settime(int fd, int flags, void *its,
+				      void *old_its)
+{
+	return tst_syscall(__NR_timerfd_settime, fd, flags, its, old_its);
+}
+
+static inline int sys_timerfd_settime64(int fd, int flags, void *its,
+				      void *old_its)
+{
+	return tst_syscall(__NR_timerfd_settime64, fd, flags, its, old_its);
+}
+
+static inline long long tst_its_get_val_sec(struct tst_its its)
+{
+	switch (its.type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return its.ts.kern_old_its.it_value.tv_sec;
+	case TST_KERN_TIMESPEC:
+		return its.ts.kern_its.it_value.tv_sec;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its.type);
+		return -1;
+	}
+}
+
+static inline long long tst_its_get_val_nsec(struct tst_its its)
+{
+	switch (its.type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return its.ts.kern_old_its.it_value.tv_nsec;
+	case TST_KERN_TIMESPEC:
+		return its.ts.kern_its.it_value.tv_nsec;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its.type);
+		return -1;
+	}
+}
+
 static inline void tst_its_set_time(struct tst_its *its, long long value_sec,
 				long long value_nsec, long long interval_sec,
 				long long interval_nsec)
diff --git a/testcases/kernel/syscalls/timerfd/timerfd01.c b/testcases/kernel/syscalls/timerfd/timerfd01.c
index 45d4c5d5ea0d..262db0e55450 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd01.c
@@ -17,7 +17,6 @@
 
 #define _GNU_SOURCE
 #include <poll.h>
-#include "tst_test.h"
 #include "tst_timer.h"
 #include "tst_safe_timerfd.h"
 
@@ -29,25 +28,46 @@ static struct tcase {
 	{CLOCK_REALTIME, "CLOCK REALTIME"},
 };
 
+static struct test_variants {
+	int (*cgettime)(clockid_t clk_id, void *ts);
+	int (*tfd_gettime)(int fd, void *its);
+	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timerfd_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .cgettime = sys_clock_gettime, .tfd_gettime = sys_timerfd_gettime, .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timerfd_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .cgettime = sys_clock_gettime64, .tfd_gettime = sys_timerfd_gettime64, .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
 static unsigned long long getustime(int clockid)
 {
-	struct timespec tp;
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts tp = {.type = tv->type, };
 
-	if (clock_gettime((clockid_t) clockid, &tp)) {
+	if (tv->cgettime((clockid_t) clockid, tst_ts_get(&tp))) {
 		tst_res(TFAIL | TERRNO, "clock_gettime() failed");
 		return 0;
 	}
 
-	return 1000000ULL * tp.tv_sec + tp.tv_nsec / 1000;
+	return 1000000ULL * tst_ts_get_sec(tp) + tst_ts_get_nsec(tp) / 1000;
 }
 
-static void settime(int tfd, struct itimerspec *tmr, int tflags,
+static void settime(int tfd, struct tst_its *tmr, int tflags,
                     unsigned long long tvalue, int tinterval)
 {
-	tmr->it_value = tst_timespec_from_us(tvalue);
-	tmr->it_interval = tst_timespec_from_us(tinterval);
+	struct test_variants *tv = &variants[tst_variant];
+	struct timespec value = tst_timespec_from_us(tvalue);
+	struct timespec interval = tst_timespec_from_us(tinterval);
 
-	SAFE_TIMERFD_SETTIME(tfd, tflags, tmr, NULL);
+	tst_its_set_time(tmr, value.tv_sec, value.tv_nsec, interval.tv_sec, interval.tv_nsec);
+
+	if (tv->tfd_settime(tfd, tflags, tst_its_get(tmr), NULL))
+		tst_res(TFAIL, "timerfd_settime() failed");
 }
 
 static void waittmr(int tfd, unsigned int exp_ticks)
@@ -78,10 +98,11 @@ static void waittmr(int tfd, unsigned int exp_ticks)
 
 static void run(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	int tfd;
 	unsigned long long tnow;
 	uint64_t uticks;
-	struct itimerspec tmr;
+	struct tst_its tmr = {.type = tv->type, };
 	struct tcase *clks = &tcases[n];
 
 	tst_res(TINFO, "testing %s", clks->name);
@@ -102,11 +123,12 @@ static void run(unsigned int n)
 	settime(tfd, &tmr, TFD_TIMER_ABSTIME, tnow + 50 * 1000, 50 * 1000);
 
 	memset(&tmr, 0, sizeof(tmr));
-	if (timerfd_gettime(tfd, &tmr))
-		tst_res(TFAIL | TERRNO, "timerfd_gettime() failed");
+	tmr.type = tv->type;
 
+	if (tv->tfd_gettime(tfd, tst_its_get(&tmr)))
+		tst_res(TFAIL | TERRNO, "timerfd_gettime() failed");
 
-	if (tmr.it_value.tv_sec != 0 || tmr.it_value.tv_nsec > 50 * 1000000)
+	if (tst_its_get_val_sec(tmr) != 0 || tst_its_get_val_nsec(tmr) > 50 * 1000000)
 		tst_res(TFAIL, "Timer read back value not relative");
 	else
 		tst_res(TPASS, "Timer read back value is relative");
@@ -132,8 +154,15 @@ static void run(unsigned int n)
 	SAFE_CLOSE(tfd);
 }
 
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tcases),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/timerfd/timerfd04.c b/testcases/kernel/syscalls/timerfd/timerfd04.c
index 7197fc67ed47..ee5382dd52f8 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd04.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd04.c
@@ -19,7 +19,6 @@
 #include "tst_safe_timerfd.h"
 #include "tst_timer.h"
 #include "lapi/namespaces_constants.h"
-#include "tst_test.h"
 
 #define SLEEP_US 40000
 
@@ -35,26 +34,56 @@ static struct tcase {
 	{CLOCK_BOOTTIME, CLOCK_BOOTTIME, -10},
 };
 
+static struct test_variants {
+	int (*cgettime)(clockid_t clk_id, void *ts);
+	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .cgettime = sys_clock_gettime, .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .cgettime = sys_clock_gettime64, .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+static void setup(void)
+{
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
+
 static void verify_timerfd(unsigned int n)
 {
-	struct timespec start, end;
-	struct itimerspec it = {};
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts start, end;
+	struct tst_its it;
 	struct tcase *tc = &tcases[n];
 
+	start.type = end.type = it.type = tv->type;
 	SAFE_UNSHARE(CLONE_NEWTIME);
 
 	SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
 	                 tc->clk_off, tc->off);
 
-	SAFE_CLOCK_GETTIME(tc->clk_id, &start);
+	if (tv->cgettime(tc->clk_id, tst_ts_get(&start))) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(tc->clk_id));
+		return;
+	}
 
-	it.it_value = tst_timespec_add_us(start, 1000000 * tc->off + SLEEP_US);
+	end = tst_ts_add_us(start, 1000000 * tc->off + SLEEP_US);
+	tst_its_set_time(&it, tst_ts_get_sec(end), tst_ts_get_nsec(end), 0, 0);
 
 	if (!SAFE_FORK()) {
 		uint64_t exp;
 		int fd = SAFE_TIMERFD_CREATE(tc->clk_id, 0);
 
-		SAFE_TIMERFD_SETTIME(fd, TFD_TIMER_ABSTIME, &it, NULL);
+		if (tv->tfd_settime(fd, TFD_TIMER_ABSTIME, tst_its_get(&it), NULL)) {
+			tst_res(TFAIL, "timerfd_settime() failed");
+			return;
+		}
 
 		SAFE_READ(1, fd, &exp, sizeof(exp));
 
@@ -67,9 +96,13 @@ static void verify_timerfd(unsigned int n)
 
 	SAFE_WAIT(NULL);
 
-	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC, &end);
+	if (tv->cgettime(CLOCK_MONOTONIC, tst_ts_get(&end))) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_MONOTONIC));
+		return;
+	}
 
-	long long diff = tst_timespec_diff_us(end, start);
+	long long diff = tst_ts_diff_us(end, start);
 
 	if (diff > 5 * SLEEP_US) {
 		tst_res(TFAIL, "timerfd %s slept too long %lli",
@@ -90,6 +123,8 @@ static void verify_timerfd(unsigned int n)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_timerfd,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 	.forks_child = 1,
 	.needs_kconfigs = (const char *[]) {
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
index 5f3240bdc7d7..49f5aa59a96b 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
-/*
  * DESCRIPTION
  *  Verify that,
  *   1. fd is not a valid file descriptor, EBADF would return.
@@ -24,99 +12,96 @@
 
 #define _GNU_SOURCE
 
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-
-#include "test.h"
-#include "safe_macros.h"
-#include "lapi/timerfd.h"
+#include "tst_timer.h"
+#include "tst_safe_timerfd.h"
 
 char *TCID = "timerfd_gettime01";
 
 static int bad_clockfd = -1;
 static int clockfd;
 static int fd;
+static void *bad_addr;
 
 static struct test_case_t {
 	int *fd;
-	struct itimerspec *curr_value;
+	struct tst_its *curr_value;
 	int exp_errno;
 } test_cases[] = {
 	{&bad_clockfd, NULL, EBADF},
-	{&clockfd, (struct itimerspec *)-1, EFAULT},
+	{&clockfd, NULL, EFAULT},
 	{&fd, NULL, EINVAL},
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-static void setup(void);
-static void timerfd_gettime_verify(const struct test_case_t *);
-static void cleanup(void);
+static struct test_variants {
+	int (*tfd_gettime)(int fd, void *its);
+	char *desc;
+} variants[] = {
+#if (__NR_timerfd_gettime != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_gettime = sys_timerfd_gettime, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timerfd_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_gettime = sys_timerfd_gettime64, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
-int main(int argc, char *argv[])
+static void setup(void)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+	bad_addr = tst_get_bad_addr(NULL);
 
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		for (i = 0; i < TST_TOTAL; i++)
-			timerfd_gettime_verify(&test_cases[i]);
+	clockfd = timerfd_create(CLOCK_REALTIME, 0);
+	if (clockfd == -1) {
+		tst_brk(TFAIL | TERRNO, "timerfd_create() fail");
+		return;
 	}
 
-	cleanup();
-	tst_exit();
+	fd = SAFE_OPEN("test_file", O_RDWR | O_CREAT, 0644);
 }
 
-static void setup(void)
+static void cleanup(void)
 {
-	if ((tst_kvercmp(2, 6, 25)) < 0)
-		tst_brkm(TCONF, NULL, "This test needs kernel 2.6.25 or newer");
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	clockfd = timerfd_create(CLOCK_REALTIME, 0);
-	if (clockfd == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "timerfd_create() fail");
+	if (clockfd > 0)
+		close(clockfd);
 
-	fd = SAFE_OPEN(cleanup, "test_file", O_RDWR | O_CREAT, 0644);
+	if (fd > 0)
+		close(fd);
 }
 
-static void timerfd_gettime_verify(const struct test_case_t *test)
+static void run(unsigned int n)
 {
-	TEST(timerfd_gettime(*test->fd, test->curr_value));
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case_t *test = &test_cases[n];
+	void *its;
 
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "timerfd_gettime() succeeded unexpectedly");
+	if (test->exp_errno == EFAULT)
+		its = bad_addr;
+	else
+		its = tst_its_get(test->curr_value);
+
+	TEST(tv->tfd_gettime(*test->fd, its));
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "timerfd_gettime() succeeded unexpectedly");
 		return;
 	}
 
-	if (TEST_ERRNO == test->exp_errno) {
-		tst_resm(TPASS | TTERRNO,
-			 "timerfd_gettime() failed as expected");
+	if (TST_ERR == test->exp_errno) {
+		tst_res(TPASS | TTERRNO,
+			"timerfd_gettime() failed as expected");
 	} else {
-		tst_resm(TFAIL | TTERRNO,
-			 "timerfd_gettime() failed unexpectedly; expected: "
-			 "%d - %s", test->exp_errno, strerror(test->exp_errno));
+		tst_res(TFAIL | TTERRNO,
+			"timerfd_gettime() failed unexpectedly; expected: "
+			"%d - %s", test->exp_errno, strerror(test->exp_errno));
 	}
 }
 
-static void cleanup(void)
-{
-	if (clockfd > 0)
-		close(clockfd);
-
-	if (fd > 0)
-		close(fd);
-
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.min_kver = "2.6.25",
+};
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
index 2e65d23ae825..2fd64c1c6a04 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2014 Fujitsu Ltd.
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
-/*
  * DESCRIPTION
  *  Verify that,
  *   1. fd is not a valid file descriptor, EBADF would return.
@@ -25,13 +13,7 @@
 
 #define _GNU_SOURCE
 
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_timer.h"
 #include "lapi/timerfd.h"
 
 char *TCID = "timerfd_settime01";
@@ -39,80 +21,51 @@ char *TCID = "timerfd_settime01";
 static int bad_clockfd = -1;
 static int clockfd;
 static int fd;
+static void *bad_addr;
 
 static struct test_case_t {
 	int *fd;
 	int flags;
-	struct itimerspec *old_value;
+	struct tst_its *old_value;
 	int exp_errno;
 } test_cases[] = {
 	{&bad_clockfd, 0, NULL, EBADF},
-	{&clockfd, 0, (struct itimerspec *)-1, EFAULT},
+	{&clockfd, 0, NULL, EFAULT},
 	{&fd, 0, NULL, EINVAL},
 	{&clockfd, -1, NULL, EINVAL},
 };
 
-int TST_TOTAL = ARRAY_SIZE(test_cases);
-static void setup(void);
-static void timerfd_settime_verify(const struct test_case_t *);
-static void cleanup(void);
-static struct itimerspec new_value;
+static struct tst_its new_value;
 
-int main(int argc, char *argv[])
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
+static struct test_variants {
+	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		for (i = 0; i < TST_TOTAL; i++)
-			timerfd_settime_verify(&test_cases[i]);
-	}
-
-	cleanup();
-	tst_exit();
-}
+#if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
 
 static void setup(void)
 {
-	if ((tst_kvercmp(2, 6, 25)) < 0)
-		tst_brkm(TCONF, NULL, "This test needs kernel 2.6.25 or newer");
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	struct test_variants *tv = &variants[tst_variant];
 
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	bad_addr = tst_get_bad_addr(NULL);
+	new_value.type = tv->type;
 
 	clockfd = timerfd_create(CLOCK_REALTIME, 0);
-	if (clockfd == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "timerfd_create() fail");
-
-	fd = SAFE_OPEN(cleanup, "test_file", O_RDWR | O_CREAT, 0644);
-}
-
-static void timerfd_settime_verify(const struct test_case_t *test)
-{
-	TEST(timerfd_settime(*test->fd, test->flags, &new_value,
-			     test->old_value));
-
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "timerfd_settime() succeeded unexpectedly");
+	if (clockfd == -1) {
+		tst_brk(TFAIL | TERRNO, "timerfd_create() fail");
 		return;
 	}
 
-	if (TEST_ERRNO == test->exp_errno) {
-		tst_resm(TPASS | TTERRNO,
-			 "timerfd_settime() failed as expected");
-	} else {
-		tst_resm(TFAIL | TTERRNO,
-			 "timerfd_settime() failed unexpectedly; expected: "
-			 "%d - %s", test->exp_errno, strerror(test->exp_errno));
-	}
+	fd = SAFE_OPEN("test_file", O_RDWR | O_CREAT, 0644);
 }
 
 static void cleanup(void)
@@ -122,6 +75,43 @@ static void cleanup(void)
 
 	if (fd > 0)
 		close(fd);
+}
+
+static void run(unsigned int n)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct test_case_t *test = &test_cases[n];
+	void *its;
+
+	if (test->exp_errno == EFAULT)
+		its = bad_addr;
+	else
+		its = tst_its_get(test->old_value);
 
-	tst_rmdir();
+	TEST(tv->tfd_settime(*test->fd, test->flags, tst_its_get(&new_value),
+			     its));
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "timerfd_settime() succeeded unexpectedly");
+		return;
+	}
+
+	if (TST_ERR == test->exp_errno) {
+		tst_res(TPASS | TTERRNO,
+			"timerfd_settime() failed as expected");
+	} else {
+		tst_res(TFAIL | TTERRNO,
+			"timerfd_settime() failed unexpectedly; expected: "
+			"%d - %s", test->exp_errno, strerror(test->exp_errno));
+	}
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.min_kver = "2.6.25",
+};
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
index 0565802f4288..c15b69dca9ca 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
@@ -15,8 +15,8 @@
  *  timerfd: Protect the might cancel mechanism proper
  */
 #include <unistd.h>
+#include "tst_timer.h"
 #include "tst_safe_timerfd.h"
-#include "tst_test.h"
 #include "tst_fuzzy_sync.h"
 #include "tst_taint.h"
 
@@ -27,11 +27,30 @@
 #endif
 
 static int fd = -1;
-static struct itimerspec its;
+static struct tst_its its;
 static struct tst_fzsync_pair fzsync_pair;
 
+static struct test_variants {
+	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_timerfd_settime != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_settime = sys_timerfd_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_timerfd_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .tfd_settime = sys_timerfd_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	its.type = tv->type;
+
 	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
 	fd = SAFE_TIMERFD_CREATE(CLOCK_REALTIME, 0);
 
@@ -48,7 +67,9 @@ static void cleanup(void)
 
 static int punch_clock(int flags)
 {
-	return timerfd_settime(fd, flags, &its, NULL);
+	return variants[tst_variant].tfd_settime(fd, flags, tst_its_get(&its),
+						 NULL);
+
 }
 
 static void *thread_run(void *arg)
@@ -91,6 +112,7 @@ static void run(void)
 
 static struct tst_test test = {
 	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.min_kver = "2.6.25",
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
