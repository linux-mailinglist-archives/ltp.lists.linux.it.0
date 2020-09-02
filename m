Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F525AE33
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 17:01:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EDCE3C5A86
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 17:01:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DC8903C2D5C
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:01:39 +0200 (CEST)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EF377600A4A
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 17:01:38 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id 17so2979864pfw.9
 for <ltp@lists.linux.it>; Wed, 02 Sep 2020 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibkzAM0Gfsl0ZT6U7rsTph3UzwgYmHzA7Mo4FRc1I08=;
 b=CHHQb+FC+7ts/tc3YZPx5yRwfuGrUo1PORm3vxf3X5+XamH9EZNHsVv8+tzB2r0a1H
 auVNYz1+gZfW1Z8HB1yPIzcL0qlQKIXyGiFRPzzhd46qjQIHMPb/8S5FLlBFdcccnkMz
 zytAWhqJ9wLyeJsVE7ukVHANczwoymAk7U7EcGQfyEjKiD9/24EXcODHbsqyfecD48gy
 LgMmkndpfJAxpQ/TruyrhzV1f1BWqNtJERMof2+ygr5WT30oJZQhVAciQLC4xQgAgBxa
 5Je8Jv9adpI/CzqJd65SGyZx3GF0jp+Q4pA2FSg8B0OOcD+9EWRE8kzUS9icJ9bJZrob
 nlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibkzAM0Gfsl0ZT6U7rsTph3UzwgYmHzA7Mo4FRc1I08=;
 b=l5bMnq4bagkm0R/wdEqKnZmmVKAK4TL+GrpzmFa9IHJqtmeJyEkQFCEWl1bJxuEi5T
 v/PNkNotnVEpjhDKgBNxgBIxz0OWnjpvRhdcZLC2aIG3/JiuO69R5qopI835m5+Z2uCq
 yd1/T/GGwx25cP+yDI4RjkbBtWKnWpQjA/jnbBzOHeyf8vk3t5Kn+5JltgXc0UnjHV7X
 /muW6piM+Gp6d2C4T/f1HDMKrshZP37AlMtrT5U9md4tA3KgJOAg7BMR0/lqdCGeEwUc
 saoumHIDMYBJiLhm4ZO9m9mddrl1ix8y+7QWEtxIGhA73vI8S0N8VC37ivb50hSPkMzS
 CNow==
X-Gm-Message-State: AOAM531wkR5O91ScW9nH8c2v6q2N/fhI0Ces+ACxzeNAznyQhvvzoUDT
 0kk8Yfxr5IY/3qT6LAtA57QE1+pMKxU7Mg==
X-Google-Smtp-Source: ABdhPJydzSrA0wsR/82dDsdk76SX/BD5hPbCYIElxnyOdlJScAyIMw8JRcKddSVXs3ifzx8lrmjiUw==
X-Received: by 2002:aa7:91d9:: with SMTP id z25mr3615946pfa.116.1599058864999; 
 Wed, 02 Sep 2020 08:01:04 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id o15sm5567044pgi.74.2020.09.02.08.01.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Sep 2020 08:01:04 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  2 Sep 2020 20:30:44 +0530
Message-Id: <9ba8ffe0a93eb8d6c722ce22e9042f146f83bec9.1599058700.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V11 1/2] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for semtimedop() and its time64 variant to the
existing semop() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V11:
- s/all_variants/semtimedop_only/
- Change timeout to 10 us for all the tests except semop03, that fails
  randomly if the timeout is less than 10 ms.

 testcases/kernel/syscalls/ipc/semop/semop.h   | 55 +++++++++++++++++++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 26 ++++++++-
 testcases/kernel/syscalls/ipc/semop/semop02.c | 44 +++++++++++----
 testcases/kernel/syscalls/ipc/semop/semop03.c | 15 ++++-
 4 files changed, 125 insertions(+), 15 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
new file mode 100644
index 000000000000..1fac31818108
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef SEMOP_VAR__
+#define SEMOP_VAR__
+
+#include <sys/sem.h>
+#include "tst_timer.h"
+
+static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
+		void *timeout)
+{
+	return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
+}
+
+static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
+					size_t nsops, void *timeout)
+{
+	return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
+}
+
+struct test_variants {
+	int (*semop)(int semid, struct sembuf *sops, size_t nsops);
+	int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: syscall"},
+
+#if (__NR_semtimedop != __LTP__NR_INVALID_SYSCALL)
+	{ .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
+#endif
+
+#if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
+#endif
+};
+
+static inline int call_semop(struct test_variants *tv, int semid,
+		struct sembuf *sops, size_t nsops, void *timeout)
+{
+	if (tv->semop)
+		return tv->semop(semid, sops, nsops);
+
+	return tv->semtimedop(semid, sops, nsops, timeout);
+}
+
+static inline void semop_supported_by_kernel(struct test_variants *tv)
+{
+       /* Check if the syscall is implemented on the platform */
+       TEST(call_semop(tv, 0, NULL, 0, NULL));
+       if (TST_RET == -1 && TST_ERR == ENOSYS)
+               tst_brk(TCONF, "Test not supported on kernel/platform");
+}
+
+#endif /* SEMOP_VAR__ */
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index 2daf6bbc5c4e..add9d07f3ad4 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -12,6 +12,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 #define NSEMS 4
 
@@ -21,14 +22,23 @@ static key_t semkey;
 static unsigned short int sarr[PSEMS];
 static union semun get_arr = {.array = sarr};
 static struct sembuf sops[PSEMS];
+static struct tst_ts timeout;
 
-static void run(void)
+static struct test_case_t {
+	struct tst_ts *to;
+} tc[] = {
+	{NULL},
+	{&timeout}
+};
+
+static void run(unsigned int n)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	union semun arr = { .val = 0 };
 	int fail = 0;
 	int i;
 
-	TEST(semop(sem_id, sops, NSEMS));
+	TEST(call_semop(tv, sem_id, sops, NSEMS, tst_ts_get(tc[n].to)));
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "semop() failed");
 		return;
@@ -56,8 +66,16 @@ static void run(void)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	int i;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 0);
+	tst_ts_set_nsec(&timeout, 10000);
+
 	semkey = GETIPCKEY();
 
 	sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
@@ -80,7 +98,9 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.test_all = run,
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 0dff8e537719..8d59e12bde92 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -10,6 +10,8 @@
  * EFBIG   - sem_num > number of semaphores in a set
  * EAGAIN  - semop = 0 for non-zero semaphore and IPC_NOWAIT passed in flags
  * EAGAIN  - semop = -1 for zero semaphore and IPC_NOWAIT passed in flags
+ * EAGAIN  - semop = 0 and timeout happens
+ * EAGAIN  - semop = -1 and timeout happens
  *
  * Copyright (c) International Business Machines  Corp., 2001
  *	03/2001 - Written by Wayne Boyer
@@ -23,17 +25,20 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static int valid_sem_id = -1;
 static int noperm_sem_id = -1;
 static int bad_sem_id = -1;
 static short sem_op_max, sem_op_1 = 1, sem_op_negative = -1, sem_op_zero = 0;
 static struct sembuf *faulty_buf;
+static struct tst_ts timeout;
 
 #define NSOPS	1
 #define	BIGOPS	1024
 
 static struct test_case_t {
+	int semtimedop_only;
 	int *semid;
 	struct sembuf **buf;
 	short *sem_op;
@@ -44,25 +49,35 @@ static struct test_case_t {
 	int arr_val;
 	int error;
 } tc[] = {
-	{&valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
-	{&noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
-	{&valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
-	{&valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
-	{&bad_sem_id,   NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
-	{&valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
-	{&valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
-	{&valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
-	{&valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
-	{&valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN}
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
+	{0, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
+	{0, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
+	{0, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
+	{0, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
+	{0, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
+	{0, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, EAGAIN},
 };
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct passwd *ltpuser;
 	key_t semkey;
 	union semun arr;
 	struct seminfo ipc_buf;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 0);
+	tst_ts_set_nsec(&timeout, 10000);
+
 	ltpuser = SAFE_GETPWNAM("nobody");
 	SAFE_SETUID(ltpuser->pw_uid);
 
@@ -88,6 +103,7 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	union semun arr = {.val = tc[i].arr_val};
 	struct sembuf buf = {
 		.sem_op = *tc[i].sem_op,
@@ -96,6 +112,11 @@ static void run(unsigned int i)
 	};
 	struct sembuf *ptr = &buf;
 
+	if (tc[i].semtimedop_only && tv->semop) {
+		tst_res(TCONF, "Test not supported for variant");
+		return;
+	}
+
 	if (*tc[i].semid == valid_sem_id) {
 		if (semctl(valid_sem_id, tc[i].ctl_sem_num, SETVAL, arr) == -1)
 			tst_brk(TBROK | TERRNO, "semctl() SETVAL failed");
@@ -104,7 +125,7 @@ static void run(unsigned int i)
 	if (tc[i].buf)
 		ptr = *tc[i].buf;
 
-	TEST(semop(*(tc[i].semid), ptr, tc[i].t_ops));
+	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, tst_ts_get(&timeout)));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -136,6 +157,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 25123f08c239..43d22a8ee1a7 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -15,9 +15,11 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static key_t semkey;
 static int sem_id = -1;
+static struct tst_ts timeout;
 
 struct test_case_t {
 	union semun semunptr;
@@ -34,13 +36,14 @@ struct test_case_t {
 
 static void do_child(int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct sembuf s_buf = {
 		.sem_op = tc[i].op,
 		.sem_flg = tc[i].flg,
 		.sem_num = tc[i].num,
 	};
 
-	TEST(semop(sem_id, &s_buf, 1));
+	TEST(call_semop(tv, sem_id, &s_buf, 1, tst_ts_get(&timeout)));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "call succeeded when error expected");
 		exit(0);
@@ -62,6 +65,15 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 0);
+	tst_ts_set_nsec(&timeout, 10000000);
+
 	SAFE_SIGNAL(SIGHUP, sighandler);
 	semkey = GETIPCKEY();
 
@@ -119,6 +131,7 @@ static void run(unsigned int i)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
