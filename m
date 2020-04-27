Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 518D41BA2DD
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:43:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEC7E3C5FAF
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 13:43:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BFB3D3C226E
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:43:54 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1D8CB600055
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 13:43:48 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id d24so6901855pll.8
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6RK2zcqDPbliDyVIr+ebj/39AkPWV8aT3yNFgZOwgs=;
 b=fiKezj5tnll1ilxYgOsiaR4lVXui6H4IiH6vaGlhUEnaCpzTWDxEcpVmqZublgojvn
 Pv79/oOULaghrsQOTUdR9EEueI/urvSZyr+9F2qfD0d4eTbeP5mVNs5hZ9qRTwwxk+C4
 kQLTQ/daqZ/BSp1JSN3yZYM4eOoVimEjaR50YZW4oXgdm/I8FesTKQT55BLCbda9KZQi
 Xbrf3QfZtDVNMKGng5KuSn4R1Yr63V8b7Xc9+FgngWNxP2QtjpWuGwW4h4j+GcaOP1Jx
 jB3lbYMSCINJFD9gyKnsdvvuB1l2s6Az159IzcwM4b2HY0BMEQvhecg9ViFdrdEk5KFY
 WVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6RK2zcqDPbliDyVIr+ebj/39AkPWV8aT3yNFgZOwgs=;
 b=LshAvShx7kVCDPTx/7EJu6Qe2eyrDcUY58nkdNtjvmwemZmjsaWo4yDMdJZCjsD1jb
 XXMQ/32Muw1wA9GwzpQ2yAZEd2anjLPDan1QWvaw5nFDRkiVt1gnzau0Y5wIQTHdj5er
 Q2SuxZdFkY8xVSLu+DzSg7eHtaxKnkcKTLgOv4dp3ir4Utd/SaNmi4xVSn8Rul6/7bVe
 y2c91hqslXornbqyIkY3PQptdhMNlBT/LwaJvaCjp45kt8CBbkFOH4IhkIakCkMqb+ym
 foWywB/NTTG+MgVQW7y+NtAIpnU+wfDzleh0GJaiq7+uBIPEkaRxGTjpg/lODlympZfN
 EM2Q==
X-Gm-Message-State: AGi0PuZVe60wZ6MSmTxfQEnV1bCQ5eTOYGw5GDD/tQUySlPVSJ7x1SYN
 1k524VFzZga19ntZBelVXUJaCgNzYfY=
X-Google-Smtp-Source: APiQypInoDHBF+Zj6scENZcfZSA1ahm9rTotnk4iTo8y/W/lkMIcT1Rsagm7I4Ehx1j85dhqz+4U4Q==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr22358471plr.223.1587987832060; 
 Mon, 27 Apr 2020 04:43:52 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id mn1sm10911016pjb.24.2020.04.27.04.43.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 04:43:51 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 27 Apr 2020 17:13:44 +0530
Message-Id: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] syscalls/timer_gettime: Add support for time64
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

This adds support for time64 tests to the existing timer_gettime()
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           |  40 +++++++
 .../syscalls/timer_gettime/timer_gettime01.c  | 112 +++++++++---------
 2 files changed, 98 insertions(+), 54 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 256e1d71e1bc..601f934da670 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -15,6 +15,7 @@
 #include <sys/time.h>
 #include <time.h>
 #include "tst_test.h"
+#include "lapi/common_timers.h"
 #include "lapi/syscalls.h"
 
 /*
@@ -112,6 +113,11 @@ struct __kernel_timespec {
 	__kernel_time64_t       tv_sec;                 /* seconds */
 	long long               tv_nsec;                /* nanoseconds */
 };
+
+struct __kernel_itimerspec {
+	struct __kernel_timespec it_interval;    /* timer period */
+	struct __kernel_timespec it_value;       /* timer expiration */
+};
 #endif
 
 enum tst_ts_type {
@@ -129,6 +135,14 @@ struct tst_ts {
 	} ts;
 };
 
+struct tst_its {
+	enum tst_ts_type type;
+	union {
+		struct itimerspec libc_its;
+		struct __kernel_itimerspec kern_its;
+	} ts;
+};
+
 static inline void *tst_ts_get(struct tst_ts *t)
 {
 	if (!t)
@@ -147,6 +161,22 @@ static inline void *tst_ts_get(struct tst_ts *t)
 	}
 }
 
+static inline void *tst_its_get(struct tst_its *t)
+{
+	if (!t)
+		return NULL;
+
+	switch (t->type) {
+	case TST_LIBC_TIMESPEC:
+		return &t->ts.libc_its;
+	case TST_KERN_TIMESPEC:
+		return &t->ts.kern_its;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", t->type);
+		return NULL;
+	}
+}
+
 static inline int libc_clock_getres(clockid_t clk_id, void *ts)
 {
 	return clock_getres(clk_id, ts);
@@ -212,6 +242,16 @@ static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
 			   request, remain);
 }
 
+static inline int sys_timer_gettime(kernel_timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime, timerid, its);
+}
+
+static inline int sys_timer_gettime64(kernel_timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime64, timerid, its);
+}
+
 /*
  * Returns tst_ts seconds.
  */
diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
index 1c75f1cf0e45..bd8a8e4763a1 100644
--- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
@@ -26,71 +26,75 @@
 #include <stdio.h>
 #include <errno.h>
 
-#include "test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
+#include "lapi/abisize.h"
 
-char *TCID = "timer_gettime01";
-int TST_TOTAL = 3;
+static struct test_variants {
+	int (*func)(kernel_timer_t timer, void *its);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .func = sys_timer_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+#endif
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+#if defined(TST_ABI64)
+	{ .func = sys_timer_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
 
-static void setup(void)
-{
-	TEST_PAUSE;
-	tst_tmpdir();
-}
+#if (__NR_timer_gettime64 != __LTP__NR_INVALID_SYSCALL)
+	{ .func = sys_timer_gettime64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
 
-int main(int ac, char **av)
-{
-	int lc;
+static kernel_timer_t timer;
 
+static void setup(void)
+{
 	struct sigevent ev;
-	struct itimerspec spec;
-	int timer;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 
 	ev.sigev_value = (union sigval) 0;
 	ev.sigev_signo = SIGALRM;
 	ev.sigev_notify = SIGEV_SIGNAL;
-	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
-
-	if (TEST_RETURN != 0)
-		tst_brkm(TBROK | TERRNO, cleanup, "Failed to create timer");
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
-
-		TEST(ltp_syscall(__NR_timer_gettime, timer, &spec));
-		if (TEST_RETURN == 0) {
-			tst_resm(TPASS, "timer_gettime(CLOCK_REALTIME) Passed");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(CLOCK_REALTIME) Failed");
-		}
-
-		TEST(ltp_syscall(__NR_timer_gettime, -1, &spec));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EINVAL) {
-			tst_resm(TPASS,	"timer_gettime(-1) Failed: EINVAL");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
-
-		TEST(ltp_syscall(__NR_timer_gettime, timer, NULL));
-		if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT) {
-			tst_resm(TPASS,	"timer_gettime(NULL) Failed: EFAULT");
-		} else {
-			tst_resm(TFAIL | TERRNO,
-			         "timer_gettime(-1) = %li", TEST_RETURN);
-		}
+
+	TEST(tst_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
+
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "timer_create() failed");
+		return;
+	}
+}
+
+static void verify(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_its spec = {.type = tv->type, };
+
+	TEST(tv->func(timer, tst_its_get(&spec)));
+	if (TST_RET == 0) {
+		tst_res(TPASS, "timer_gettime() Passed");
+	} else {
+		tst_res(TFAIL | TTERRNO, "timer_gettime() Failed");
 	}
 
-	cleanup();
-	tst_exit();
+	TEST(tv->func((kernel_timer_t)-1, tst_its_get(&spec)));
+	if (TST_RET == -1 && TST_ERR == EINVAL)
+		tst_res(TPASS, "timer_gettime(-1) Failed: EINVAL");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
+
+	TEST(tv->func(timer, NULL));
+	if (TST_RET == -1 && TST_ERR == EFAULT)
+		tst_res(TPASS, "timer_gettime(NULL) Failed: EFAULT");
+	else
+		tst_res(TFAIL | TTERRNO, "timer_gettime(-1) = %li", TST_RET);
 }
+
+static struct tst_test test = {
+	.test_all = verify,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
