Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4AB1C51A0
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455F73C580D
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:13:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6BAD73C5800
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:30 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E330D1A01203
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:12:28 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id j21so748669pgb.7
 for <ltp@lists.linux.it>; Tue, 05 May 2020 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVPv+BrHLYaiYvYiE991nA1I3ifdnNY3ZQfgJbUYoio=;
 b=SCwOSkiPkYugWlMybaxcGiS3CG0Ic0mvL4R7JV/vt1NzJBeXf5Jg8iUkRXe8OtDsE/
 HtB+O9mPkzxLPhOenDH2GYt1zA8GUDFkIjvW5c+jhFg1i3GbCWzB7XvvTFkjDdqQeYGA
 o6Ca47sqPUJFNM1oBnZtJX+PtpscZzCaTkxfFzQMZiEerVdjqmcICQQ80+pLF37aVj4y
 5oAjYIM5SM0F4vmNBP3pI+RQtukVpPcgz+ZIRn+O14A9Zstkd91bRaFBUeVBW5vMh8Lh
 Jg0Dy6F+03aD2NtNnZunMXJ2WSIElJJ2qA3jsbnNffIBTEmBJynbdKWin5AYhmpKBJEo
 AKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVPv+BrHLYaiYvYiE991nA1I3ifdnNY3ZQfgJbUYoio=;
 b=lCzJhbAsdVydjQ3QQJTQULvgDsVc52ZqE/x16/g+2Mip6ILBnoPXG7LV33EQYh4LlP
 17PjTsiVGFTqTrad2RnLhvnsey0Vb2S3R6PsBsQ75aO87BfGp8Y8us/CUst0GRX/v7JT
 /+khG+7KxN9okQc6hE0JdmeY5QX75idjC0CZByKzIjyG6S5zcT/Nthyjce0svkAcGUz9
 T6LJCnQuNCAPKKBA4TxS8Q7Kdj9FHrEevUdP3h9OVJd3q6LgDcLpdd577XxStIBJ0LcF
 juPmQHzdZ4xTJiUNbHtFCQBa8GuLsCqMaIxdl0ZRIG3cTCWuuQne4FDDPYRVANEAalxk
 +BLA==
X-Gm-Message-State: AGi0PuaFgruJrJLldmMASFwfGVj5kE+jwqjzwqlBXJgn9evtYLpvY3jI
 j+LYQSKHQcy7rk85hAeZN1fB2uxz/EQ=
X-Google-Smtp-Source: APiQypKx7dM6Gh8f91RfohdJiV3NnnicoYwTMEFwuyLtlKwvY/pC/bivgsR01g/Qib/FD49UBlIM6w==
X-Received: by 2002:aa7:9491:: with SMTP id z17mr2204076pfk.264.1588669946804; 
 Tue, 05 May 2020 02:12:26 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 23sm1152532pgm.18.2020.05.05.02.12.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 02:12:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  5 May 2020 14:42:06 +0530
Message-Id: <62c763ca63684f75d3b9fcf3185edfffb7affafb.1588669892.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
References: <7e037dacaeb0c7f3bfd73cd11d80f3e1567dc052.1588669892.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 6/8] syscalls/mq_timed{send|receive}: Add support for
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

This adds support for time64 tests to the existing
mq_timed{send|receive}() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_timer.h                           | 41 +++++++++
 .../mq_timedreceive/mq_timedreceive01.c       | 83 ++++++++++++++----
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 87 +++++++++++++++----
 testcases/kernel/syscalls/utils/mq_timed.h    | 28 +++---
 4 files changed, 189 insertions(+), 50 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index b4280042c77f..28f11c7376b4 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -14,6 +14,7 @@
 
 #include <sched.h>
 #include <sys/time.h>
+#include <mqueue.h>
 #include <time.h>
 #include "tst_test.h"
 #include "lapi/common_timers.h"
@@ -255,6 +256,46 @@ static inline int sys_futex_time64(int *uaddr, int futex_op, int val, void *to,
 	return tst_syscall(__NR_futex_time64, uaddr, futex_op, val, to, uaddr2, val3);
 }
 
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
 static inline int libc_sched_rr_get_interval(pid_t pid, void *ts)
 {
 	return sched_rr_get_interval(pid, ts);
diff --git a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
index 1be515ced671..0ba88b9552cc 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -23,12 +23,13 @@
 
 #include <errno.h>
 #include <limits.h>
+#include "lapi/abisize.h"
 
 static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
 
 #include "mq_timed.h"
 
-static struct timespec ts;
+static struct tst_ts ts;
 
 static struct test_case tcase[] = {
 	{
@@ -95,21 +96,27 @@ static struct test_case tcase[] = {
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = -1, .tv_nsec = 0},
+		.tv_sec = -1,
+		.tv_nsec = 0,
+		.rq = &ts,
 		.ret = -1,
 		.err = EINVAL,
 	},
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = 0, .tv_nsec = -1},
+		.tv_sec = 0,
+		.tv_nsec = -1,
+		.rq = &ts,
 		.ret = -1,
 		.err = EINVAL,
 	},
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = 0, .tv_nsec = 1000000000},
+		.tv_sec = 0,
+		.tv_nsec = 1000000000,
+		.rq = &ts,
 		.ret = -1,
 		.err = EINVAL,
 	},
@@ -131,8 +138,44 @@ static struct test_case tcase[] = {
 	},
 };
 
+static struct test_variants {
+	int (*send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
+		    unsigned int msg_prio, void *abs_timeout);
+	ssize_t (*receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
+			   unsigned int *msg_prio, void *abs_timeout);
+
+	int (*gettime)(clockid_t clk_id, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = libc_clock_gettime, .send = libc_mq_timedsend, .receive = libc_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_mq_timedsend_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .send = sys_mq_timedsend64, .receive = sys_mq_timedreceive64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	ts.type = tv->type;
+
+	setup_common();
+}
+
 static void do_test(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	const struct test_case *tc = &tcase[i];
 	unsigned int j;
 	unsigned int prio;
@@ -140,19 +183,26 @@ static void do_test(unsigned int i)
 	char rmsg[len];
 	pid_t pid = -1;
 
+	tst_ts_set_sec(&ts, tc->tv_sec);
+	tst_ts_set_nsec(&ts, tc->tv_nsec);
+
 	if (tc->signal)
-		pid = set_sig(tc->rq);
+		pid = set_sig(tc->rq, tv->gettime);
 
 	if (tc->timeout)
-		set_timeout(tc->rq);
+		set_timeout(tc->rq, tv->gettime);
 
-	if (tc->send)
-		send_msg(*tc->fd, tc->len, tc->prio);
+	if (tc->send) {
+		if (tv->send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
+			tst_res(TFAIL | TTERRNO, "mq_timedsend() failed");
+			return;
+		}
+	}
 
 	if (tc->invalid_msg)
 		len -= 1;
 
-	TEST(mq_timedreceive(*tc->fd, rmsg, len, &prio, tc->rq));
+	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
 
 	if (pid > 0)
 		kill_pid(pid);
@@ -163,22 +213,22 @@ static void do_test(unsigned int i)
 	if (TST_RET < 0) {
 		if (tc->err != TST_ERR)
 			tst_res(TFAIL | TTERRNO,
-				"mq_timedreceive failed unexpectedly, expected %s",
+				"mq_timedreceive() failed unexpectedly, expected %s",
 				tst_strerrno(tc->err));
 		else
-			tst_res(TPASS | TTERRNO, "mq_timedreceive failed expectedly");
+			tst_res(TPASS | TTERRNO, "mq_timedreceive() failed expectedly");
 
 		return;
 	}
 
 	if (tc->len != TST_RET) {
-		tst_res(TFAIL, "mq_timedreceive wrong length %ld, expected %zu",
+		tst_res(TFAIL, "mq_timedreceive() wrong length %ld, expected %u",
 			TST_RET, tc->len);
 		return;
 	}
 
 	if (tc->prio != prio) {
-		tst_res(TFAIL, "mq_timedreceive wrong prio %d, expected %d",
+		tst_res(TFAIL, "mq_timedreceive() wrong prio %d, expected %d",
 			prio, tc->prio);
 		return;
 	}
@@ -186,20 +236,21 @@ static void do_test(unsigned int i)
 	for (j = 0; j < tc->len; j++) {
 		if (rmsg[j] != smsg[j]) {
 			tst_res(TFAIL,
-				"mq_timedreceive wrong data %d in %u, expected %d",
+				"mq_timedreceive() wrong data %d in %u, expected %d",
 				rmsg[j], i, smsg[j]);
 			return;
 		}
 	}
 
-	tst_res(TPASS, "mq_timedreceive returned %ld, priority %u, length: %zu",
+	tst_res(TPASS, "mq_timedreceive() returned %ld, priority %u, length: %zu",
 			TST_RET, prio, len);
 }
 
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcase),
 	.test = do_test,
-	.setup = setup_common,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.cleanup = cleanup_common,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
index 8f209d396040..2206b5199ab8 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -23,12 +23,14 @@
 
 #include <errno.h>
 #include <limits.h>
+#include "lapi/abisize.h"
 
 static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
-static struct timespec ts;
 
 #include "mq_timed.h"
 
+static struct tst_ts ts;
+
 static struct test_case tcase[] = {
 	{
 		.fd = &fd,
@@ -95,7 +97,9 @@ static struct test_case tcase[] = {
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = -1, .tv_nsec = 0},
+		.tv_sec = -1,
+		.tv_nsec = 0,
+		.rq = &ts,
 		.send = 1,
 		.ret = -1,
 		.err = EINVAL,
@@ -103,7 +107,9 @@ static struct test_case tcase[] = {
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = 0, .tv_nsec = -1},
+		.tv_sec = 0,
+		.tv_nsec = -1,
+		.rq = &ts,
 		.send = 1,
 		.ret = -1,
 		.err = EINVAL,
@@ -111,7 +117,9 @@ static struct test_case tcase[] = {
 	{
 		.fd = &fd,
 		.len = 16,
-		.rq = &(struct timespec) {.tv_sec = 0, .tv_nsec = 1000000000},
+		.tv_sec = 0,
+		.tv_nsec = 1000000000,
+		.rq = &ts,
 		.send = 1,
 		.ret = -1,
 		.err = EINVAL,
@@ -136,8 +144,44 @@ static struct test_case tcase[] = {
 	},
 };
 
+static struct test_variants {
+	int (*send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
+		    unsigned int msg_prio, void *abs_timeout);
+	ssize_t (*receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
+			   unsigned int *msg_prio, void *abs_timeout);
+
+	int (*gettime)(clockid_t clk_id, void *ts);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if defined(TST_ABI32)
+	{ .gettime = libc_clock_gettime, .send = libc_mq_timedsend, .receive = libc_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
+#endif
+
+#if (__NR_mq_timedsend_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .send = sys_mq_timedsend64, .receive = sys_mq_timedreceive64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec64"},
+#endif
+};
+
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	ts.type = tv->type;
+
+	setup_common();
+}
+
 static void do_test(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	const struct test_case *tc = &tcase[i];
 	unsigned int j;
 	unsigned int prio;
@@ -145,18 +189,24 @@ static void do_test(unsigned int i)
 	char rmsg[len];
 	pid_t pid = -1;
 
+	tst_ts_set_sec(&ts, tc->tv_sec);
+	tst_ts_set_nsec(&ts, tc->tv_nsec);
+
 	if (tc->signal)
-		pid = set_sig(tc->rq);
+		pid = set_sig(tc->rq, tv->gettime);
 
 	if (tc->timeout)
-		set_timeout(tc->rq);
+		set_timeout(tc->rq, tv->gettime);
 
 	if (tc->send) {
 		for (j = 0; j < MSG_LENGTH; j++)
-			send_msg(*tc->fd, tc->len, tc->prio);
+			if (tv->send(*tc->fd, smsg, tc->len, tc->prio, NULL) < 0) {
+				tst_res(TFAIL | TTERRNO, "mq_timedsend() failed");
+				return;
+			}
 	}
 
-	TEST(mq_timedsend(*tc->fd, smsg, tc->len, tc->prio, tc->rq));
+	TEST(tv->send(*tc->fd, smsg, tc->len, tc->prio, tst_ts_get(tc->rq)));
 
 	if (pid > 0)
 		kill_pid(pid);
@@ -164,10 +214,10 @@ static void do_test(unsigned int i)
 	if (TST_RET < 0) {
 		if (tc->err != TST_ERR)
 			tst_res(TFAIL | TTERRNO,
-				"mq_timedsend failed unexpectedly, expected %s",
+				"mq_timedsend() failed unexpectedly, expected %s",
 				tst_strerrno(tc->err));
 		else
-			tst_res(TPASS | TTERRNO, "mq_timedreceive failed expectedly");
+			tst_res(TPASS | TTERRNO, "mq_timedreceive() failed expectedly");
 
 		if (*tc->fd == fd)
 			cleanup_queue(fd);
@@ -175,7 +225,7 @@ static void do_test(unsigned int i)
 		return;
 	}
 
-	TEST(mq_timedreceive(*tc->fd, rmsg, len, &prio, tc->rq));
+	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
 
 	if (*tc->fd == fd)
 		cleanup_queue(fd);
@@ -183,26 +233,26 @@ static void do_test(unsigned int i)
 	if (TST_RET < 0) {
 		if (tc->err != TST_ERR) {
 			tst_res(TFAIL | TTERRNO,
-				"mq_timedreceive failed unexpectedly, expected %s",
+				"mq_timedreceive() failed unexpectedly, expected %s",
 				tst_strerrno(tc->err));
 			return;
 		}
 
 		if (tc->ret >= 0) {
-			tst_res(TFAIL | TTERRNO, "mq_timedreceive returned %ld, expected %d",
+			tst_res(TFAIL | TTERRNO, "mq_timedreceive() returned %ld, expected %d",
 					TST_RET, tc->ret);
 			return;
 		}
 	}
 
 	if (tc->len != TST_RET) {
-		tst_res(TFAIL, "mq_timedreceive wrong length %ld, expected %d",
+		tst_res(TFAIL, "mq_timedreceive() wrong length %ld, expected %u",
 			TST_RET, tc->len);
 		return;
 	}
 
 	if (tc->prio != prio) {
-		tst_res(TFAIL, "mq_timedreceive wrong prio %d, expected %d",
+		tst_res(TFAIL, "mq_timedreceive() wrong prio %d, expected %d",
 			prio, tc->prio);
 		return;
 	}
@@ -210,20 +260,21 @@ static void do_test(unsigned int i)
 	for (j = 0; j < tc->len; j++) {
 		if (rmsg[j] != smsg[j]) {
 			tst_res(TFAIL,
-				"mq_timedreceive wrong data %d in %u, expected %d",
+				"mq_timedreceive() wrong data %d in %u, expected %d",
 				rmsg[j], i, smsg[j]);
 			return;
 		}
 	}
 
-	tst_res(TPASS, "mq_timedreceive returned %ld, priority %u, length: %zu",
+	tst_res(TPASS, "mq_timedreceive() returned %ld, priority %u, length: %zu",
 			TST_RET, prio, len);
 }
 
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcase),
 	.test = do_test,
-	.setup = setup_common,
+	.test_variants = ARRAY_SIZE(variants),
+	.setup = setup,
 	.cleanup = cleanup_common,
 	.forks_child = 1,
 };
diff --git a/testcases/kernel/syscalls/utils/mq_timed.h b/testcases/kernel/syscalls/utils/mq_timed.h
index a163ddcee3af..85b316334d7f 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -19,12 +19,15 @@
 #define MQ_TIMED_H
 
 #include "mq.h"
+#include "tst_timer.h"
 
 struct test_case {
 	int *fd;
 	unsigned int len;
 	unsigned int prio;
-	struct timespec *rq;
+	struct tst_ts *rq;
+	long tv_sec;
+	long tv_nsec;
 	int invalid_msg;
 	int send;
 	int signal;
@@ -33,27 +36,20 @@ struct test_case {
 	int err;
 };
 
-static pid_t set_sig(struct timespec *ts)
+static pid_t set_sig(struct tst_ts *ts,
+		     int (*gettime)(clockid_t clk_id, void *ts))
 {
-	clock_gettime(CLOCK_REALTIME, ts);
-	ts->tv_sec += 3;
+	gettime(CLOCK_REALTIME, tst_ts_get(ts));
+	*ts = tst_ts_add_us(*ts, 3000000);
 
 	return create_sig_proc(SIGINT, 40, 200000);
 }
 
-static void set_timeout(struct timespec *ts)
+static void set_timeout(struct tst_ts *ts,
+			int (*gettime)(clockid_t clk_id, void *ts))
 {
-	clock_gettime(CLOCK_REALTIME, ts);
-	ts->tv_nsec += 50000000;
-	ts->tv_sec += ts->tv_nsec / 1000000000;
-	ts->tv_nsec %= 1000000000;
-}
-
-static void send_msg(int fd, int len, int prio)
-{
-	if (mq_timedsend(fd, smsg, len, prio,
-		&((struct timespec){0})) < 0)
-		tst_brk(TBROK | TERRNO, "mq_timedsend failed");
+	gettime(CLOCK_REALTIME, tst_ts_get(ts));
+	*ts = tst_ts_add_us(*ts, 50000);
 }
 
 static void kill_pid(pid_t pid)
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
