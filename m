Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CA1D928D
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:52:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19D363C24D4
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:52:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 21FA53C4E92
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:32 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C1106201034
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:28 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id z26so6085716pfk.12
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Dc9njSXYKH/Owvk6k22AHf6Z/dhhRKRvi6t8+vHLeU=;
 b=LMURCbziXukO/8RyKvXc35i6hv+a4KF2Pq/xz0HWGeF5JWYqsfozioytD1F4pv99/M
 W7fpkU74xj88odL77vF4bduBa6MMu5l5BEVArDiHc77TUOYHSY0cdnjNbnyn7NDHZZoG
 UcDsFDJHv7siH1oK9mM9i6R/XVEAWORIgvLNprtr4TRxufSHRI/QFxtpfaAbhT7nAw22
 Ol+/kR2PegeA10dAlIrtgcszYbjExTiBExYYg7+BhnRdwQPO7UhIPsj0YsVilD4JvhhQ
 fAJ6+imMc1c7J/mtYW4vYrR4M9YkRKJyJ8hTRBvCtaLuaPa7u1b8tkR6Nyao0Ps31sqy
 RYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Dc9njSXYKH/Owvk6k22AHf6Z/dhhRKRvi6t8+vHLeU=;
 b=me50fFLMxwX/oRqwSvy8FqfY+zF+rxD2MRcrjPbWUgqfYCp+OEHRZwYQFTupImKbeO
 xEJJrUEtITq5FbmjTJKMZwAyOKzyoFRphz64Tg9BMXd5TGC7Vr2luKIR3B1R6IjKA+p7
 /+D5l3vOkHg/t6WoMkvHtxWv4vq3XzQbulz60CYWetD6+8R1b/EzUwzLU5abCrDO/bp/
 dHjsEHTLkX3MthQM7Z93V63qGqVXURfX1La1lc9x8AYgCZHnDVPgXAcbASmI2fc1NMWP
 Y/66xsAYCtBfdWaePq7elTCHq3ktBTrg8b6COfghIqZXy3eIkks1Zn4r/0O1ESvLjvg7
 KMng==
X-Gm-Message-State: AOAM530CLbLRWKee4KJwepi0Eq29ilRA5Dod14kWSvxXrTxDaeaTbEYr
 PTAKxJhjsf7dimMlEuAercDgnPtwNNE=
X-Google-Smtp-Source: ABdhPJypkW+cRJPe9JhxiLkgf5mjh6KeWfmGSfQOTfNs10oaZ/lBM8JVoKF+/dxvkZQQ4La9C07aWw==
X-Received: by 2002:a63:801:: with SMTP id 1mr17966572pgi.278.1589878286794;
 Tue, 19 May 2020 01:51:26 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id f21sm10835620pfn.71.2020.05.19.01.51.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:11 +0530
Message-Id: <a6c2c59a9cffb86d751b911384a560803e723623.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589877853.git.viresh.kumar@linaro.org>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] syscalls: Don't pass struct timespec to
 tst_syscall()
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

There are compatibility issues here as we are calling the direct
syscalls with the "struct timespec" (which is a libc definition). We
must use struct __kernel_old_timespec instead.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_clocks.h          |  8 +++++---
 lib/tst_clocks.c              |  6 +++---
 lib/tst_test.c                | 16 ++++++++--------
 lib/tst_timer.c               | 23 +++++++++++++++--------
 lib/tst_timer_test.c          |  2 +-
 lib/tst_wallclock.c           | 17 +++++++++--------
 testcases/cve/cve-2016-7117.c |  2 +-
 7 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/include/tst_clocks.h b/include/tst_clocks.h
index 80030c6b0c68..bb149acd2f83 100644
--- a/include/tst_clocks.h
+++ b/include/tst_clocks.h
@@ -9,11 +9,13 @@
 #ifndef TST_CLOCKS__
 #define TST_CLOCKS__
 
-int tst_clock_getres(clockid_t clk_id, struct timespec *res);
+struct __kernel_old_timespec;
 
-int tst_clock_gettime(clockid_t clk_id, struct timespec *ts);
+int tst_clock_getres(clockid_t clk_id, struct __kernel_old_timespec *res);
 
-int tst_clock_settime(clockid_t clk_id, struct timespec *ts);
+int tst_clock_gettime(clockid_t clk_id, struct __kernel_old_timespec *ts);
+
+int tst_clock_settime(clockid_t clk_id, struct __kernel_old_timespec *ts);
 
 /*
  * Converts clock id to a readable name.
diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index 2eaa73b11abe..8d8c2f7666fa 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -11,17 +11,17 @@
 #include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
-int tst_clock_getres(clockid_t clk_id, struct timespec *res)
+int tst_clock_getres(clockid_t clk_id, struct __kernel_old_timespec *res)
 {
 	return tst_syscall(__NR_clock_getres, clk_id, res);
 }
 
-int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
+int tst_clock_gettime(clockid_t clk_id, struct __kernel_old_timespec *ts)
 {
 	return tst_syscall(__NR_clock_gettime, clk_id, ts);
 }
 
-int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
+int tst_clock_settime(clockid_t clk_id, struct __kernel_old_timespec *ts)
 {
 	return tst_syscall(__NR_clock_settime, clk_id, ts);
 }
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 0e58060e0159..8f6b07072429 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -49,7 +49,7 @@ static float timeout_mul = -1;
 static pid_t main_pid, lib_pid;
 static int mntpoint_mounted;
 static int ovl_mounted;
-static struct timespec tst_start_time; /* valid only for test pid */
+static struct tst_ts tst_start_time = { .type = TST_KERN_OLD_TIMESPEC }; /* valid only for test pid */
 
 struct results {
 	int passed;
@@ -1081,12 +1081,12 @@ static void run_tests(void)
 
 static unsigned long long get_time_ms(void)
 {
-	struct timespec ts;
+	struct tst_ts ts = { .type = TST_KERN_OLD_TIMESPEC };
 
-	if (tst_clock_gettime(CLOCK_MONOTONIC, &ts))
+	if (tst_clock_gettime(CLOCK_MONOTONIC, &ts.ts.kern_old_ts))
 		tst_brk(TBROK | TERRNO, "tst_clock_gettime()");
 
-	return tst_timespec_to_ms(ts);
+	return tst_ts_to_ms(ts);
 }
 
 static void add_paths(void)
@@ -1108,7 +1108,7 @@ static void add_paths(void)
 
 static void heartbeat(void)
 {
-	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
+	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time.ts.kern_old_ts))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
 	kill(getppid(), SIGUSR1);
@@ -1190,13 +1190,13 @@ static void sigint_handler(int sig LTP_ATTRIBUTE_UNUSED)
 
 unsigned int tst_timeout_remaining(void)
 {
-	static struct timespec now;
+	struct tst_ts now = { .type = TST_KERN_OLD_TIMESPEC };
 	unsigned int elapsed;
 
-	if (tst_clock_gettime(CLOCK_MONOTONIC, &now))
+	if (tst_clock_gettime(CLOCK_MONOTONIC, &now.ts.kern_old_ts))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
-	elapsed = (tst_timespec_diff_ms(now, tst_start_time) + 500) / 1000;
+	elapsed = (tst_ts_diff_ms(now, tst_start_time) + 500) / 1000;
 	if (results->timeout > elapsed)
 		return results->timeout - elapsed;
 
diff --git a/lib/tst_timer.c b/lib/tst_timer.c
index 62d8f9080f38..97817770ec7e 100644
--- a/lib/tst_timer.c
+++ b/lib/tst_timer.c
@@ -12,12 +12,13 @@
 #include "tst_clocks.h"
 #include "lapi/posix_clocks.h"
 
-static struct timespec start_time, stop_time;
+static struct tst_ts start_time = { .type = TST_KERN_OLD_TIMESPEC };
+static struct tst_ts stop_time = { .type = TST_KERN_OLD_TIMESPEC };
 static clockid_t clock_id;
 
 void tst_timer_check(clockid_t clk_id)
 {
-	if (tst_clock_gettime(clk_id, &start_time)) {
+	if (tst_clock_gettime(clk_id, &start_time.ts.kern_old_ts)) {
 		if (errno == EINVAL) {
 			tst_brk(TCONF,
 			         "Clock id %s(%u) not supported by kernel",
@@ -33,27 +34,33 @@ void tst_timer_start(clockid_t clk_id)
 {
 	clock_id = clk_id;
 
-	if (tst_clock_gettime(clock_id, &start_time))
+	if (tst_clock_gettime(clock_id, &start_time.ts.kern_old_ts))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 }
 
 int tst_timer_expired_ms(long long ms)
 {
-	struct timespec cur_time;
+	struct tst_ts cur_time = { .type = TST_KERN_OLD_TIMESPEC };
 
-	if (tst_clock_gettime(clock_id, &cur_time))
+	if (tst_clock_gettime(clock_id, &cur_time.ts.kern_old_ts))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 
-	return tst_timespec_diff_ms(cur_time, start_time) >= ms;
+	return tst_ts_diff_ms(cur_time, start_time) >= ms;
 }
 
 void tst_timer_stop(void)
 {
-	if (tst_clock_gettime(clock_id, &stop_time))
+	if (tst_clock_gettime(clock_id, &stop_time.ts.kern_old_ts))
 		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
 }
 
 struct timespec tst_timer_elapsed(void)
 {
-	return tst_timespec_diff(stop_time, start_time);
+	struct tst_ts ts;
+	struct timespec tspec;
+
+	ts = tst_ts_diff(stop_time, start_time);
+	tspec.tv_sec = ts.ts.kern_old_ts.tv_sec;
+	tspec.tv_nsec = ts.ts.kern_old_ts.tv_nsec;
+	return tspec;
 }
diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index 196c51272d34..6aa5711643fe 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -341,7 +341,7 @@ static int set_latency(void)
 
 static void timer_setup(void)
 {
-	struct timespec t;
+	struct __kernel_old_timespec t;
 	int ret;
 
 	if (setup)
diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 282d6ada3008..a267792756ee 100644
--- a/lib/tst_wallclock.c
+++ b/lib/tst_wallclock.c
@@ -14,7 +14,8 @@
 #include "tst_wallclock.h"
 #include "lapi/posix_clocks.h"
 
-static struct timespec real_begin, mono_begin;
+static struct tst_ts real_begin = { .type = TST_KERN_OLD_TIMESPEC };
+static struct tst_ts mono_begin = { .type = TST_KERN_OLD_TIMESPEC };
 
 static int clock_saved;
 
@@ -22,10 +23,10 @@ void tst_wallclock_save(void)
 {
 	/* save initial monotonic time to restore it when needed */
 
-	if (tst_clock_gettime(CLOCK_REALTIME, &real_begin))
+	if (tst_clock_gettime(CLOCK_REALTIME, &real_begin.ts.kern_old_ts))
 		tst_brk(TBROK | TERRNO, "tst_clock_gettime() realtime failed");
 
-	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_begin)) {
+	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_begin.ts.kern_old_ts)) {
 		if (errno == EINVAL) {
 			tst_brk(TCONF | TERRNO,
 				"tst_clock_gettime() didn't support CLOCK_MONOTONIC_RAW");
@@ -39,22 +40,22 @@ void tst_wallclock_save(void)
 
 void tst_wallclock_restore(void)
 {
-	static struct timespec mono_end, elapsed, adjust;
+	struct tst_ts elapsed, adjust, mono_end = { .type = TST_KERN_OLD_TIMESPEC };
 
 	if (!clock_saved)
 		return;
 
 	clock_saved = 0;
 
-	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_end))
+	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_end.ts.kern_old_ts))
 		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
 
-	elapsed = tst_timespec_diff(mono_end, mono_begin);
+	elapsed = tst_ts_diff(mono_end, mono_begin);
 
-	adjust = tst_timespec_add(real_begin, elapsed);
+	adjust = tst_ts_add(real_begin, elapsed);
 
 	/* restore realtime clock based on monotonic delta */
 
-	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
+	if (tst_clock_settime(CLOCK_REALTIME, &adjust.ts.kern_old_ts))
 		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
 }
diff --git a/testcases/cve/cve-2016-7117.c b/testcases/cve/cve-2016-7117.c
index dca002924728..cbbc1c182079 100644
--- a/testcases/cve/cve-2016-7117.c
+++ b/testcases/cve/cve-2016-7117.c
@@ -73,7 +73,7 @@ static struct mmsghdr msghdrs[2] = {
 	}
 };
 static char rbuf[sizeof(MSG)];
-static struct timespec timeout = { .tv_sec = RECV_TIMEOUT };
+static struct __kernel_old_timespec timeout = { .tv_sec = RECV_TIMEOUT };
 static struct tst_fzsync_pair fzsync_pair;
 static void *send_and_close(void *);
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
