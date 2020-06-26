Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25B20AC3C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3CB3C585E
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C77ED3C583B
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:43 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C63172010B9
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:22:42 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id g17so3887935plq.12
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0hjiLk7barxMgCDPXbNf5gcVlXTuL9HIcuMHvA1m/Y=;
 b=n9V/KdLHsDhJYpTXoAR621xbTRFMK3faW9msA4gJGpdrf+vEbAg8WQSPaQ2t3+rUxZ
 tZuEOdipv09F5BrXdIo4+zPZYCIpqJf5medK2WOvhvN7S4RGsF3YRLhicxhP6T69a/G3
 Os+rnGF1BR5HsYT2NTwPuMluZ7kJ2DACitxrHDiohIydvi/OFqQksfk9rKHLI1sq7MN4
 yHazgPm+9Z3pXN+l2gIIG5XFhmsk+H4YGN40dnTFmYliMPuRLwTs/5kZ3sDGw8D4pNs3
 OhQoM1L/EeIWCjrDaljvkIk1jiiTxVThuG+vJJ8AXGAuBwJoAZrcQUHjieFekjnnAKN2
 BmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0hjiLk7barxMgCDPXbNf5gcVlXTuL9HIcuMHvA1m/Y=;
 b=nGRgnZUTKTe53SnbeSQlc96IW1IWpaBymiBPN7Hmh3C+9XTBr8EOs4lM7OjHkikpex
 ne+X3u8tZbBbZ9lqivKZz73EfSnRc7nPY8OZv9XLDpDzeNSmS8aMwPseluVcSDphiMzJ
 7Tw1BszC8yFYe4gI94d+yx1eF0rFwRLTNUom03tj3etPTL0/d+pKjit7TbvF+TqVLBCX
 EuxCm3OHsMsqptKa0VO/SLQfaWYuoaJxx39XvNCKg7AHJdS/n2dZ327iSFGKIjebvb2l
 5fgOgDmj/4hLbvt5H6IG7ErPLaDIvoaGxQbuYAa9anaQQANjt/07x20mnjGRszYFw1zm
 exzw==
X-Gm-Message-State: AOAM532Dgry8Vggc1P2yu1oqcd0MCS0agArBZ/Jn3UZXCJ6f3AVuEnbU
 gGGZWlaEOARGcMbt6iCL5zMoA7q6gtg=
X-Google-Smtp-Source: ABdhPJz5HuJVXus00upzmfsRdAyWcLCEs+dCNYdlwe8TD3RlgTaJ9aC3EGOwhgq0XjJk2Y97tNla6w==
X-Received: by 2002:a17:90a:7c07:: with SMTP id
 v7mr1742810pjf.38.1593152560759; 
 Thu, 25 Jun 2020 23:22:40 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id 4sm21557188pgk.68.2020.06.25.23.22.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:22:40 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:14 +0530
Message-Id: <6c96466165bb88f052676e6ce5c8eed41cbe628a.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V7 01/19] tst_timer: Add new definitions
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

This patch adds new helpers for itimerspec and wrapper functions for
multiple syscalls. These will be used by later patches.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h | 326 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 305 insertions(+), 21 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 82e3e1e308f1..7fd4a7093960 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -12,9 +12,12 @@
 #ifndef TST_TIMER
 #define TST_TIMER
 
+#include <sched.h>
 #include <sys/time.h>
+#include <mqueue.h>
 #include <time.h>
 #include "tst_test.h"
+#include "lapi/common_timers.h"
 #include "lapi/posix_types.h"
 #include "lapi/syscalls.h"
 
@@ -112,6 +115,16 @@ struct __kernel_timespec {
 	__kernel_time64_t       tv_sec;                 /* seconds */
 	long long               tv_nsec;                /* nanoseconds */
 };
+
+struct __kernel_old_itimerspec {
+	struct __kernel_old_timespec it_interval;    /* timer period */
+	struct __kernel_old_timespec it_value;       /* timer expiration */
+};
+
+struct __kernel_itimerspec {
+	struct __kernel_timespec it_interval;    /* timer period */
+	struct __kernel_timespec it_value;       /* timer expiration */
+};
 #endif
 
 enum tst_ts_type {
@@ -129,6 +142,14 @@ struct tst_ts {
 	} ts;
 };
 
+struct tst_its {
+	enum tst_ts_type type;
+	union {
+		struct __kernel_old_itimerspec kern_old_its;
+		struct __kernel_itimerspec kern_its;
+	} ts;
+};
+
 static inline void *tst_ts_get(struct tst_ts *t)
 {
 	if (!t)
@@ -147,6 +168,22 @@ static inline void *tst_ts_get(struct tst_ts *t)
 	}
 }
 
+static inline void *tst_its_get(struct tst_its *t)
+{
+	if (!t)
+		return NULL;
+
+	switch (t->type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return &t->ts.kern_old_its;
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
@@ -212,6 +249,117 @@ static inline int sys_clock_nanosleep64(clockid_t clk_id, int flags,
 			   request, remain);
 }
 
+static inline int sys_futex(int *uaddr, int futex_op, int val, void *to,
+			    int *uaddr2, int val3)
+{
+	return tst_syscall(__NR_futex, uaddr, futex_op, val, to, uaddr2, val3);
+}
+
+static inline int sys_futex_time64(int *uaddr, int futex_op, int val, void *to,
+				   int *uaddr2, int val3)
+{
+	return tst_syscall(__NR_futex_time64, uaddr, futex_op, val, to, uaddr2, val3);
+}
+
+static inline int libc_mq_timedsend(mqd_t mqdes, const char *msg_ptr,
+		size_t msg_len, unsigned int msg_prio, void *abs_timeout)
+{
+	return mq_timedsend(mqdes, msg_ptr, msg_len, msg_prio, abs_timeout);
+}
+
+static inline int sys_mq_timedsend(mqd_t mqdes, const char *msg_ptr,
+		size_t msg_len, unsigned int msg_prio, void *abs_timeout)
+{
+	return tst_syscall(__NR_mq_timedsend, mqdes, msg_ptr, msg_len, msg_prio,
+			   abs_timeout);
+}
+
+static inline int sys_mq_timedsend64(mqd_t mqdes, const char *msg_ptr,
+		size_t msg_len, unsigned int msg_prio, void *abs_timeout)
+{
+	return tst_syscall(__NR_mq_timedsend_time64, mqdes, msg_ptr, msg_len,
+			   msg_prio, abs_timeout);
+}
+
+static inline ssize_t libc_mq_timedreceive(mqd_t mqdes, char *msg_ptr,
+		size_t msg_len, unsigned int *msg_prio, void *abs_timeout)
+{
+	return mq_timedreceive(mqdes, msg_ptr, msg_len, msg_prio, abs_timeout);
+}
+
+static inline ssize_t sys_mq_timedreceive(mqd_t mqdes, char *msg_ptr,
+		size_t msg_len, unsigned int *msg_prio, void *abs_timeout)
+{
+	return tst_syscall(__NR_mq_timedreceive, mqdes, msg_ptr, msg_len,
+			   msg_prio, abs_timeout);
+}
+
+static inline ssize_t sys_mq_timedreceive64(mqd_t mqdes, char *msg_ptr,
+		size_t msg_len, unsigned int *msg_prio, void *abs_timeout)
+{
+	return tst_syscall(__NR_mq_timedreceive_time64, mqdes, msg_ptr, msg_len,
+			   msg_prio, abs_timeout);
+}
+
+static inline int libc_sched_rr_get_interval(pid_t pid, void *ts)
+{
+	return sched_rr_get_interval(pid, ts);
+}
+
+static inline int sys_sched_rr_get_interval(pid_t pid, void *ts)
+{
+	return tst_syscall(__NR_sched_rr_get_interval, pid, ts);
+}
+
+static inline int sys_sched_rr_get_interval64(pid_t pid, void *ts)
+{
+	return tst_syscall(__NR_sched_rr_get_interval_time64, pid, ts);
+}
+
+static inline int sys_timer_gettime(timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime, timerid, its);
+}
+
+static inline int sys_timer_gettime64(timer_t timerid, void *its)
+{
+	return tst_syscall(__NR_timer_gettime64, timerid, its);
+}
+
+static inline int sys_timer_settime(timer_t timerid, int flags, void *its,
+				    void *old_its)
+{
+	return tst_syscall(__NR_timer_settime, timerid, flags, its, old_its);
+}
+
+static inline int sys_timer_settime64(timer_t timerid, int flags, void *its,
+				      void *old_its)
+{
+	return tst_syscall(__NR_timer_settime64, timerid, flags, its, old_its);
+}
+
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
 /*
  * Returns tst_ts seconds.
  */
@@ -248,27 +396,6 @@ static inline long long tst_ts_get_nsec(struct tst_ts ts)
 	}
 }
 
-/*
- * Checks that timespec is valid, i.e. that the timestamp is not zero and that
- * the nanoseconds are normalized i.e. in <0, 1s) interval.
- *
- *  0: On success, i.e. timespec updated correctly.
- * -1: Error, timespec not updated.
- * -2: Error, tv_nsec is corrupted.
- */
-static inline int tst_ts_valid(struct tst_ts *t)
-{
-	long long nsec = tst_ts_get_nsec(*t);
-
-	if (nsec < 0 || nsec >= 1000000000)
-		return -2;
-
-	if (tst_ts_get_sec(*t) == 0 && tst_ts_get_nsec(*t) == 0)
-		return -1;
-
-	return 0;
-}
-
 /*
  * Sets tst_ts seconds.
  */
@@ -309,6 +436,163 @@ static inline void tst_ts_set_nsec(struct tst_ts *ts, long long nsec)
 	}
 }
 
+/*
+ * Returns tst_its it_interval seconds.
+ */
+static inline long long tst_its_get_interval_sec(struct tst_its its)
+{
+	switch (its.type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return its.ts.kern_old_its.it_interval.tv_sec;
+	case TST_KERN_TIMESPEC:
+		return its.ts.kern_its.it_interval.tv_sec;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its.type);
+		return -1;
+	}
+}
+
+/*
+ * Returns tst_its it_interval nanoseconds.
+ */
+static inline long long tst_its_get_interval_nsec(struct tst_its its)
+{
+	switch (its.type) {
+	case TST_KERN_OLD_TIMESPEC:
+		return its.ts.kern_old_its.it_interval.tv_nsec;
+	case TST_KERN_TIMESPEC:
+		return its.ts.kern_its.it_interval.tv_nsec;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its.type);
+		return -1;
+	}
+}
+
+/*
+ * Sets tst_its it_interval seconds.
+ */
+static inline void tst_its_set_interval_sec(struct tst_its *its, long long sec)
+{
+	switch (its->type) {
+	break;
+	case TST_KERN_OLD_TIMESPEC:
+		its->ts.kern_old_its.it_interval.tv_sec = sec;
+	break;
+	case TST_KERN_TIMESPEC:
+		its->ts.kern_its.it_interval.tv_sec = sec;
+	break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its->type);
+	}
+}
+
+/*
+ * Sets tst_its it_interval nanoseconds.
+ */
+static inline void tst_its_set_interval_nsec(struct tst_its *its, long long nsec)
+{
+	switch (its->type) {
+	break;
+	case TST_KERN_OLD_TIMESPEC:
+		its->ts.kern_old_its.it_interval.tv_nsec = nsec;
+	break;
+	case TST_KERN_TIMESPEC:
+		its->ts.kern_its.it_interval.tv_nsec = nsec;
+	break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its->type);
+	}
+}
+
+/*
+ * Returns tst_its it_value seconds.
+ */
+static inline long long tst_its_get_value_sec(struct tst_its its)
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
+/*
+ * Returns tst_its it_value nanoseconds.
+ */
+static inline long long tst_its_get_value_nsec(struct tst_its its)
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
+/*
+ * Sets tst_its it_value seconds.
+ */
+static inline void tst_its_set_value_sec(struct tst_its *its, long long sec)
+{
+	switch (its->type) {
+	break;
+	case TST_KERN_OLD_TIMESPEC:
+		its->ts.kern_old_its.it_value.tv_sec = sec;
+	break;
+	case TST_KERN_TIMESPEC:
+		its->ts.kern_its.it_value.tv_sec = sec;
+	break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its->type);
+	}
+}
+
+/*
+ * Sets tst_its it_value nanoseconds.
+ */
+static inline void tst_its_set_value_nsec(struct tst_its *its, long long nsec)
+{
+	switch (its->type) {
+	break;
+	case TST_KERN_OLD_TIMESPEC:
+		its->ts.kern_old_its.it_value.tv_nsec = nsec;
+	break;
+	case TST_KERN_TIMESPEC:
+		its->ts.kern_its.it_value.tv_nsec = nsec;
+	break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", its->type);
+	}
+}
+
+/*
+ * Checks that timespec is valid, i.e. that the timestamp is not zero and that
+ * the nanoseconds are normalized i.e. in <0, 1s) interval.
+ *
+ *  0: On success, i.e. timespec updated correctly.
+ * -1: Error, timespec not updated.
+ * -2: Error, tv_nsec is corrupted.
+ */
+static inline int tst_ts_valid(struct tst_ts *t)
+{
+	long long nsec = tst_ts_get_nsec(*t);
+
+	if (nsec < 0 || nsec >= 1000000000)
+		return -2;
+
+	if (tst_ts_get_sec(*t) == 0 && tst_ts_get_nsec(*t) == 0)
+		return -1;
+
+	return 0;
+}
+
 /*
  * Converts timespec to tst_ts.
  */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
