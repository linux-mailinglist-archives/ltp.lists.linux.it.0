Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EE51B36DD
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E04733C6238
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 07:38:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7F38B3C6232
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:40 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7CEC61400B85
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 07:37:39 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id e6so440322pjt.4
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 22:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5prdJ/FUr1k8TOp+2oPpNcMtjojrFvOSBobVQMCu4sY=;
 b=w60BJzBZ67Zrswl5GlvG9wVj54ANk8JcO9i4EU9MDQX47APX1Nh83X6hI48lSvd6AS
 eHa900Mo7zgfW7MG7etKJtmM4uUco00WkTOdUssuWnIGh5pi1a40btImNNuIQlDsbQU3
 KPaE5M1rvk6GT94cdI2txH+BYUQiLjrfcaj1xtYj7PTINH0tMyo16Q3cvwZOvXcg6Mkl
 2oWvNAgA9DWGkhBna/9SP2duViM308It1slXg+ewLjaev/U1cnY/PaCFFWWOGXSksSSF
 b0T3hIHJNk6sUPGkueCAOoORXYUa/oRTtyw0bxTY6NnR+6y+Fp6NhKKyesUrZeI2KQvO
 fGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5prdJ/FUr1k8TOp+2oPpNcMtjojrFvOSBobVQMCu4sY=;
 b=IpnTcDhFO/C5kjXd3AirmVGidG5yhBLaUj+OV9LVf9jn+HCMGNIwOP5bS3K8jN9OGD
 5CcSgYitNZfcla8J3Nwm7CzCnIPbs0Glo+0Yr7+dOAW+ZhjAS6G4axoP2uPWRKOICJvI
 o+4OgTlYFW8hLo3wWcsF5bYXKByDFXtQC/fIFUN497OvXRcR6U3Vtea7BbIom7nfiyKl
 acYceRqrpisimsrT66oudbQnvBgY2STISkI+9X28SfHW//w6whSfqyrDs3L5o4n2+Sfi
 F6IFSD/STVziDirNq1LYI+JyUxt+IyoUKFBx0ehL3ElSx42vyIwsQZfhLvEjssO0rxfz
 K25Q==
X-Gm-Message-State: AGi0Publ2IiKtfZTzgqEWDoYVvgEOXQ7D9Y2Juf9sqmJkp31qVglzWp1
 ZyCxKkmpnDcUPyi4raLr4SboLtfPgoQ=
X-Google-Smtp-Source: APiQypL5ubXKpO46Gk+VkXqIEuxm32Sc2/NJ30U+RfVbE2AZtTijFCJ42zFSyvrkBnu25OgSl/Mtmw==
X-Received: by 2002:a17:902:9a08:: with SMTP id
 v8mr25032200plp.70.1587533857363; 
 Tue, 21 Apr 2020 22:37:37 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id z25sm1756996pfa.213.2020.04.21.22.37.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Apr 2020 22:37:36 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 11:07:23 +0530
Message-Id: <22ce1a3bac6cdc36916277cc040711cd0bf27fe5.1587533697.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1587533697.git.viresh.kumar@linaro.org>
References: <cover.1587533697.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V4 2/5] syscalls/clock_settime: Add support for time64
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

This adds support for time64 tests to the existing clock_settime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           | 15 +++
 .../syscalls/clock_settime/clock_settime01.c  | 87 ++++++++++++++---
 .../syscalls/clock_settime/clock_settime02.c  | 95 ++++++++++++-------
 3 files changed, 146 insertions(+), 51 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index f40b93a624b3..fef201ee04df 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -163,6 +163,21 @@ static inline int sys_clock_gettime64(clockid_t clk_id, struct tst_ts *t)
 	return tst_syscall(__NR_clock_gettime64, clk_id, tst_get_ts(t));
 }
 
+static inline int libc_clock_settime(clockid_t clk_id, struct tst_ts *t)
+{
+	return clock_settime(clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_settime(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_settime, clk_id, tst_get_ts(t));
+}
+
+static inline int sys_clock_settime64(clockid_t clk_id, struct tst_ts *t)
+{
+	return tst_syscall(__NR_clock_settime64, clk_id, tst_get_ts(t));
+}
+
 /*
  * tst_ts_nonzero return:
  * 0: On success, i.e. timespec updated correctly.
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime01.c b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
index 62d3491544a6..199264974ed0 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime01.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime01.c
@@ -16,31 +16,72 @@
 #include "config.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "lapi/abisize.h"
 
 #define DELTA_SEC 10
 #define DELTA_US (long long) (DELTA_SEC * 1000000)
 #define DELTA_EPS (long long) (DELTA_US * 0.1)
 
-static struct timespec *begin, *change, *end;
+static struct tst_ts *begin, *change, *end;
+
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, struct tst_ts *spec);
+	int (*settime)(clockid_t clk_id, struct tst_ts *spec);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = libc_clock_gettime, .settime = libc_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
+{
+	begin->type = change->type = end->type = variants[tst_variant].type;
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+}
 
 static void verify_clock_settime(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	long long elapsed;
 
 	/* test 01: move forward */
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, begin);
+	TEST(tv->gettime(CLOCK_REALTIME, begin));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	*change = tst_timespec_add_us(*begin, DELTA_US);
+	*change = tst_ts_add_us(*begin, DELTA_US);
 
-	if (clock_settime(CLOCK_REALTIME, change) != 0)
-		tst_brk(TBROK | TTERRNO, "could not set realtime change");
+	TEST(tv->settime(CLOCK_REALTIME, change));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_settime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, end);
+	TEST(tv->gettime(CLOCK_REALTIME, end));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	elapsed = tst_timespec_diff_us(*end, *begin);
+	elapsed = tst_ts_diff_us(*end, *begin);
 
 	if (elapsed >= DELTA_US && elapsed < (DELTA_US + DELTA_EPS))
 		tst_res(TPASS, "clock_settime(2): was able to advance time");
@@ -49,16 +90,30 @@ static void verify_clock_settime(void)
 
 	/* test 02: move backward */
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, begin);
+	TEST(tv->gettime(CLOCK_REALTIME, begin));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	*change = tst_timespec_sub_us(*begin, DELTA_US);
+	*change = tst_ts_sub_us(*begin, DELTA_US);
 
-	if (clock_settime(CLOCK_REALTIME, change) != 0)
-		tst_brk(TBROK | TTERRNO, "could not set realtime change");
+	TEST(tv->settime(CLOCK_REALTIME, change));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_settime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	SAFE_CLOCK_GETTIME(CLOCK_REALTIME, end);
+	TEST(tv->gettime(CLOCK_REALTIME, end));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+			tst_clock_name(CLOCK_REALTIME));
+		return;
+	}
 
-	elapsed = tst_timespec_diff_us(*end, *begin);
+	elapsed = tst_ts_diff_us(*end, *begin);
 
 	if (~(elapsed) <= DELTA_US && ~(elapsed) > (DELTA_US - DELTA_EPS))
 		tst_res(TPASS, "clock_settime(2): was able to recede time");
@@ -68,6 +123,8 @@ static void verify_clock_settime(void)
 
 static struct tst_test test = {
 	.test_all = verify_clock_settime,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.needs_root = 1,
 	.restore_wallclock = 1,
 	.bufs = (struct tst_buffers []) {
diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime02.c b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
index e16e9061a972..29548d5a4be2 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime02.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime02.c
@@ -9,19 +9,19 @@
  */
 
 #include "config.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
 #include "tst_timer.h"
 #include "tst_safe_clocks.h"
+#include "lapi/abisize.h"
 
 #define DELTA_SEC 10
 #define NSEC_PER_SEC (1000000000L)
 
 struct test_case {
 	clockid_t type;
-	struct timespec newtime;
 	int exp_err;
 	int replace;
+	long tv_sec;
+	long tv_nsec;
 };
 
 struct test_case tc[] = {
@@ -29,24 +29,29 @@ struct test_case tc[] = {
 	 .type = CLOCK_REALTIME,
 	 .exp_err = EFAULT,
 	 .replace = 1,
+	 .tv_sec = 0,
+	 .tv_nsec = 0,
 	 },
 	{				/* case 02: REALTIME: tv_sec = -1     */
 	 .type = CLOCK_REALTIME,
-	 .newtime.tv_sec = -1,
 	 .exp_err = EINVAL,
 	 .replace = 1,
+	 .tv_sec = -1,
+	 .tv_nsec = 0,
 	 },
 	{				/* case 03: REALTIME: tv_nsec = -1    */
 	 .type = CLOCK_REALTIME,
-	 .newtime.tv_nsec = -1,
 	 .exp_err = EINVAL,
 	 .replace = 1,
+	 .tv_sec = 0,
+	 .tv_nsec = -1,
 	 },
 	{				/* case 04: REALTIME: tv_nsec = 1s+1  */
 	 .type = CLOCK_REALTIME,
-	 .newtime.tv_nsec = NSEC_PER_SEC + 1,
 	 .exp_err = EINVAL,
 	 .replace = 1,
+	 .tv_sec = 0,
+	 .tv_nsec = NSEC_PER_SEC + 1,
 	 },
 	{				/* case 05: MONOTONIC		      */
 	 .type = CLOCK_MONOTONIC,
@@ -83,64 +88,82 @@ struct test_case tc[] = {
 	 },
 };
 
-/*
- * Some tests may cause libc to segfault when passing bad arguments.
- */
-static int sys_clock_settime(clockid_t clk_id, struct timespec *tp)
+static struct tst_ts spec;
+
+static struct test_variants {
+	int (*gettime)(clockid_t clk_id, struct tst_ts *spec);
+	int (*settime)(clockid_t clk_id, struct tst_ts *spec);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .settime = sys_clock_settime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .settime = sys_clock_settime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
 {
-	return tst_syscall(__NR_clock_settime, clk_id, tp);
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 }
 
 static void verify_clock_settime(unsigned int i)
 {
-	struct timespec spec, *specptr;
+	struct test_variants *tv = &variants[tst_variant];
 
-	specptr = &spec;
+	spec.type = tv->type;
 
 	if (tc[i].replace == 0) {
-
-		SAFE_CLOCK_GETTIME(CLOCK_REALTIME, specptr);
+		TEST(tv->gettime(CLOCK_REALTIME, &spec));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "clock_gettime(2) failed for clock %s",
+				tst_clock_name(CLOCK_REALTIME));
+			return;
+		}
 
 		/* add 1 sec to wall clock */
-		specptr->tv_sec += 1;
-
+		spec = tst_ts_add_us(spec, 1000000);
 	} else {
-
 		/* use given time spec */
-		*specptr = tc[i].newtime;
+		tst_ts_set_sec(&spec, tc[i].tv_sec);
+		tst_ts_set_nsec(&spec, tc[i].tv_nsec);
 	}
 
 	/* bad pointer case */
 	if (tc[i].exp_err == EFAULT)
-		specptr = tst_get_bad_addr(NULL);
-
-	TEST(sys_clock_settime(tc[i].type, specptr));
+		spec.type = TST_KERN_BAD_ADDR;
 
-	if (TST_RET == -1) {
+	TEST(tv->settime(tc[i].type, &spec));
 
-		if (tc[i].exp_err == TST_ERR) {
-			tst_res(TPASS | TTERRNO,
-				"clock_settime(%s): failed as expected",
-				tst_clock_name(tc[i].type));
-			return;
-		}
-
-		tst_res(TFAIL | TTERRNO, "clock_settime(2): clock %s "
-			"expected to fail with %s",
+	if (TST_RET != -1) {
+		tst_res(TFAIL | TTERRNO, "clock_settime(2): clock %s passed unexpectedly, expected %s",
 			tst_clock_name(tc[i].type),
 			tst_strerrno(tc[i].exp_err));
+		return;
+	}
 
+	if (tc[i].exp_err == TST_ERR) {
+		tst_res(TPASS | TTERRNO, "clock_settime(%s): failed as expected",
+			tst_clock_name(tc[i].type));
 		return;
 	}
 
-	tst_res(TFAIL | TTERRNO, "clock_settime(2): clock %s passed "
-				 "unexpectedly, expected %s",
-				 tst_clock_name(tc[i].type),
-				 tst_strerrno(tc[i].exp_err));
+	tst_res(TFAIL | TTERRNO, "clock_settime(2): clock %s " "expected to fail with %s",
+		tst_clock_name(tc[i].type), tst_strerrno(tc[i].exp_err));
 }
 
 static struct tst_test test = {
 	.test = verify_clock_settime,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.tcnt = ARRAY_SIZE(tc),
 	.needs_root = 1,
 	.restore_wallclock = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
