Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9496E249DCD
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:27:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B18E3C5840
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:27:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 070463C04C3
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:27:53 +0200 (CEST)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 211262009DE
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:27:53 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id f5so10736419plr.9
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 05:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIUwOjFADudfqSUMD8uLl8KDBQC1e5lt4GGKeay6cy0=;
 b=Rl7RPCo5BQpixW2fIDWHSiYn1wQbSH+NbIV7G11E7QgEqn9P1/RRURsa2a4X3h2MF2
 mT2+aQ/sV0WTIBFJ9eNrNQ720u73pnBRmsah1H9uB/Ipf/AdtaleujMWc9L6GBq2ek2y
 0XmrWhbzDCntPSFXlsvDdBbFvxYdJHMTHYsegGI00cZ4hRs1KkOB66Ic18uPsE+eld0e
 gUcZBN5wEEFqoUHgIOuQOt9fmm8tZWR4K3td9pRxq58Iy/3OkX0vBoRT5xnaT9YpLLsE
 9bFuMK8ONJvJqwrpPwGW99qO00RJvl1FElnKqzyI7SG9lVvj3glrlHTjvppdLuQ+K8Vh
 GEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIUwOjFADudfqSUMD8uLl8KDBQC1e5lt4GGKeay6cy0=;
 b=hNXXczPnBORO8qLlgSzBi38QPBGa2RVdhRSesWigAQFne6f1xZOJD2fXwXj8Rj+oEx
 auFh0v34Bp5rey2EtTpKY0ZfQG2oXxkfqmxUV8rpXIkwd43PVHZuTZr59vRZHFOPIsji
 2ObjlbdHI9t61vaNJBCT2YVn7stzlR8nWoqmG3Fj05WXK35g8G5Aspu6vG6JYbBtpNql
 WEwg63q6FawIvS6SPtKXsX8AJulsCLVQ8PcPYoypOZkXWex7sjHlORB1fxR9FGO9Oj9o
 j4J29jrGa4BttfrpDui0rGFwtJIjvfr+fLpoo/q375vZb7OXBBqww/KZmaiUa0SjFUJX
 eahQ==
X-Gm-Message-State: AOAM533UA7ozKbiTVaj23OK4ZM05bBPZtRSnznDCEDLDnvVJupm+sown
 ZAzgwcVE0q8YWMO7/DDdsLhp+gdnz9EXwA==
X-Google-Smtp-Source: ABdhPJyv+dzKmYhqhSIlaMThaUE+nc4E5mTYBYVKrSlmTcJRNUwOgTC+kqM784zxvogrHqMJKqVxtg==
X-Received: by 2002:a17:902:76cb:: with SMTP id
 j11mr19373299plt.29.1597840071034; 
 Wed, 19 Aug 2020 05:27:51 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id v128sm28728520pfc.14.2020.08.19.05.27.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 05:27:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 19 Aug 2020 17:57:45 +0530
Message-Id: <b0d7642a89808c93e059beda06d8519361784686.1597839878.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <20200807132700.GB9851@yuki.lan>
References: <20200807132700.GB9851@yuki.lan>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V9 1/2] syscalls/semtimedop: Add support for
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for semtimedop() and its time64 variant to the
existing semop() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V9:
- Removed vDSO from comment
- Add additional failure tests for EGAIN errors
- Moved timeout configuration change to setup()
- Test added for NULL timeout

 testcases/kernel/syscalls/ipc/semop/semop.h   | 55 +++++++++++++++++++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 26 ++++++++-
 testcases/kernel/syscalls/ipc/semop/semop02.c | 42 ++++++++++----
 testcases/kernel/syscalls/ipc/semop/semop03.c | 15 ++++-
 4 files changed, 123 insertions(+), 15 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
new file mode 100644
index 000000000000..e920d3bc6d5f
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
+		struct sembuf *sops, size_t nsops, struct tst_ts *timeout)
+{
+	if (tv->semop)
+		return tv->semop(semid, sops, nsops);
+
+	return tv->semtimedop(semid, sops, nsops, tst_ts_get(timeout));
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
index 2daf6bbc5c4e..9e71a2744517 100644
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
+	TEST(call_semop(tv, sem_id, sops, NSEMS, tc[n].to));
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
+	tst_ts_set_sec(&timeout, 1);
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
index 0dff8e537719..d0fed5321502 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -23,17 +23,20 @@
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
+	int all_variants;
 	int *semid;
 	struct sembuf **buf;
 	short *sem_op;
@@ -44,25 +47,35 @@ static struct test_case_t {
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
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, BIGOPS, 1, E2BIG},
+	{1, &noperm_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EACCES},
+	{1, &valid_sem_id, &faulty_buf, &sem_op_1, 0, 0, 0, NSOPS, 1, EFAULT},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, 0, 0, 0, 1, EINVAL},
+	{1, &bad_sem_id, NULL, &sem_op_1, 0, 0, 0, NSOPS, 1, EINVAL},
+	{1, &valid_sem_id, NULL, &sem_op_max, 0, 0, 0, 1, 1, ERANGE},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
+	{1, &valid_sem_id, NULL, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
+	{1, &valid_sem_id, NULL, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
+	{1, &valid_sem_id, NULL, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_zero, 0, 0, SEM_UNDO, 1, 1, EAGAIN},
+	{0, &valid_sem_id, NULL, &sem_op_negative, 0, 0, SEM_UNDO, 1, 0, EAGAIN},
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
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
 	ltpuser = SAFE_GETPWNAM("nobody");
 	SAFE_SETUID(ltpuser->pw_uid);
 
@@ -88,6 +101,7 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	union semun arr = {.val = tc[i].arr_val};
 	struct sembuf buf = {
 		.sem_op = *tc[i].sem_op,
@@ -96,6 +110,11 @@ static void run(unsigned int i)
 	};
 	struct sembuf *ptr = &buf;
 
+	if (!tc[i].all_variants && tv->semop == semop) {
+		tst_res(TCONF, "Test not supported for variant");
+		return;
+	}
+
 	if (*tc[i].semid == valid_sem_id) {
 		if (semctl(valid_sem_id, tc[i].ctl_sem_num, SETVAL, arr) == -1)
 			tst_brk(TBROK | TERRNO, "semctl() SETVAL failed");
@@ -104,7 +123,7 @@ static void run(unsigned int i)
 	if (tc[i].buf)
 		ptr = *tc[i].buf;
 
-	TEST(semop(*(tc[i].semid), ptr, tc[i].t_ops));
+	TEST(call_semop(tv, *(tc[i].semid), ptr, tc[i].t_ops, &timeout));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -136,6 +155,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 25123f08c239..dc776a090f48 100644
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
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
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
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
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
