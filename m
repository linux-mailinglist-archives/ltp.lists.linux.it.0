Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954C1DE4E2
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D59A53C4CB1
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 599CC3C4CC1
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:15 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E41D320137F
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:13 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id n11so4823380pgl.9
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGzHlGyt9aUvg1XoNzsQPssfC3pVwqCVfVN+5B4Y1mU=;
 b=w5pN8yh+i74uCyFJssIPirFsBPvInX8+SYAqZcobkhO0TkrtiPNzZ8WGdpRWKH+YT6
 2VrEjv/Hy5Zh36tQOaTmmXznLcusKZY+WtLK2i+M74QpDc0HDqI/23Jy4FR1sI/FF5bs
 liW5i0WLwOKN+3PqMYzFPwW3O+YVF2LNqWnBSM8PXigt4Mj7d6z0XdZVOvXlnAqrUaDv
 f8CRAJAwqdAffALhJTLulAFQhAUI8Df960OCmaiJZij2wWsZp2ZiyLN7m6FyFsLfjc0E
 1WMBB71kzK56SLI90yDjWybS2mU2twvkWYJEo0rDD1eOq6ztCYUGbEwHTpl1NnNYTiZB
 N5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGzHlGyt9aUvg1XoNzsQPssfC3pVwqCVfVN+5B4Y1mU=;
 b=qF/yMa2Wgce2p1t3C+BVXZwTJfrBqkX9y7x9leM3DINEibREDy2BMwV0B+TehtpiG2
 OcHEfBzayhae16rsH6+P8sduy5fjFq800DLijqX022J/NnP8IjA5YEa+j0uUAFK/9PV6
 8WsHkGy3mVgvymTCL6XCU5qeL1CGpG7aFMzRLVjSDPi3ITULLWltnRIyFR4TUZHsgMO2
 3eK+7RCZc24FrDVYI5N8DZ+gtwmJRL0Uc2K/pMd7ge1r0S43IcDUYKRKlgTpnETn837q
 cgcYyBcYNfc39xnrCkiYG45QqbTnkWonPhQDmofrdH6wCBsszMcyZGpUIvzhKzIqoU8W
 4FVw==
X-Gm-Message-State: AOAM5336ThIccR7I1Gng78qE5Q5UQEGNgq/FwHY8O4U3krn2+FEX0aQ2
 KUTjFYfTVr126wYajCkSm0wiifusTEo=
X-Google-Smtp-Source: ABdhPJztpEE4IFWiEIx0TLFOHPvG/ZmGryWY0o+bZFsPd9sXniu8j7jMHWQR3mWCWL2N7VR6fSkazw==
X-Received: by 2002:a65:4489:: with SMTP id l9mr13213379pgq.223.1590144731792; 
 Fri, 22 May 2020 03:52:11 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id iq13sm6507476pjb.48.2020.05.22.03.52.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:30 +0530
Message-Id: <2cf4c3529c78c4e60af7dccb0d8fca4d132da1d4.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V4 10/17] syscalls/mq_timed{send|receive}: Add support
 for time64 tests
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
 include/tst_timer.h                           | 41 ++++++++
 .../mq_timedreceive/mq_timedreceive01.c       | 92 ++++++++++++------
 .../syscalls/mq_timedsend/mq_timedsend01.c    | 96 +++++++++++++------
 testcases/kernel/syscalls/utils/mq_timed.h    | 42 +++-----
 4 files changed, 182 insertions(+), 89 deletions(-)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index 11869257c3d7..144acfe7b8f9 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -14,6 +14,7 @@
 
 #include <sched.h>
 #include <sys/time.h>
+#include <mqueue.h>
 #include <time.h>
 #include "tst_test.h"
 #include "lapi/common_timers.h"
@@ -260,6 +261,46 @@ static inline int sys_futex_time64(int *uaddr, int futex_op, int val, void *to,
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
index 1be515ced671..876b54c81332 100644
--- a/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
+++ b/testcases/kernel/syscalls/mq_timedreceive/mq_timedreceive01.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Crackerjack Project., 2007-2008, Hitachi, Ltd
  * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
@@ -6,19 +7,6 @@
  * Takahiro Yasui <takahiro.yasui.mp@hitachi.com>,
  * Yumiko Sugita <yumiko.sugita.yf@hitachi.com>,
  * Satoshi Fujiwara <sa-fuji@sdl.hitachi.co.jp>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
@@ -28,7 +16,7 @@ static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
 
 #include "mq_timed.h"
 
-static struct timespec ts;
+static struct tst_ts ts;
 
 static struct test_case tcase[] = {
 	{
@@ -95,21 +83,27 @@ static struct test_case tcase[] = {
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
@@ -131,8 +125,40 @@ static struct test_case tcase[] = {
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
+	{ .gettime = libc_clock_gettime, .send = libc_mq_timedsend, .receive = libc_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_mq_timedsend != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_mq_timedsend_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .send = sys_mq_timedsend64, .receive = sys_mq_timedreceive64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
@@ -140,19 +166,26 @@ static void do_test(unsigned int i)
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
@@ -163,22 +196,22 @@ static void do_test(unsigned int i)
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
@@ -186,20 +219,21 @@ static void do_test(unsigned int i)
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
index 8f209d396040..4ff1da65c570 100644
--- a/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
+++ b/testcases/kernel/syscalls/mq_timedsend/mq_timedsend01.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Crackerjack Project., 2007-2008, Hitachi, Ltd
  * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
@@ -6,29 +7,17 @@
  * Takahiro Yasui <takahiro.yasui.mp@hitachi.com>,
  * Yumiko Sugita <yumiko.sugita.yf@hitachi.com>,
  * Satoshi Fujiwara <sa-fuji@sdl.hitachi.co.jp>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #include <errno.h>
 #include <limits.h>
 
 static int fd, fd_root, fd_nonblock, fd_maxint = INT_MAX - 1, fd_invalid = -1;
-static struct timespec ts;
 
 #include "mq_timed.h"
 
+static struct tst_ts ts;
+
 static struct test_case tcase[] = {
 	{
 		.fd = &fd,
@@ -95,7 +84,9 @@ static struct test_case tcase[] = {
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
@@ -103,7 +94,9 @@ static struct test_case tcase[] = {
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
@@ -111,7 +104,9 @@ static struct test_case tcase[] = {
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
@@ -136,8 +131,40 @@ static struct test_case tcase[] = {
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
+	{ .gettime = libc_clock_gettime, .send = libc_mq_timedsend, .receive = libc_mq_timedreceive, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+
+#if (__NR_mq_timedsend != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime, .send = sys_mq_timedsend, .receive = sys_mq_timedreceive, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_mq_timedsend_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .gettime = sys_clock_gettime64, .send = sys_mq_timedsend64, .receive = sys_mq_timedreceive64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
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
@@ -145,18 +172,24 @@ static void do_test(unsigned int i)
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
@@ -164,10 +197,10 @@ static void do_test(unsigned int i)
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
@@ -175,7 +208,7 @@ static void do_test(unsigned int i)
 		return;
 	}
 
-	TEST(mq_timedreceive(*tc->fd, rmsg, len, &prio, tc->rq));
+	TEST(tv->receive(*tc->fd, rmsg, len, &prio, tst_ts_get(tc->rq)));
 
 	if (*tc->fd == fd)
 		cleanup_queue(fd);
@@ -183,26 +216,26 @@ static void do_test(unsigned int i)
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
@@ -210,20 +243,21 @@ static void do_test(unsigned int i)
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
index a163ddcee3af..1d5515f9d629 100644
--- a/testcases/kernel/syscalls/utils/mq_timed.h
+++ b/testcases/kernel/syscalls/utils/mq_timed.h
@@ -1,30 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef MQ_TIMED_H
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
@@ -33,27 +24,20 @@ struct test_case {
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
