Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76B1CA240
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50EA93C5447
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 06:28:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8DB823C6E5E
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:53 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A2256200AD7
 for <ltp@lists.linux.it>; Fri,  8 May 2020 06:24:52 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id 7so4707284pjo.0
 for <ltp@lists.linux.it>; Thu, 07 May 2020 21:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFprKD4QmPHv0U33KKZsv61v/Wuaug12p3KnTpwvIyQ=;
 b=La/xujWoI9Ink5iaZrgebfzvlIDzb2LTAF3Qsan1ziV6N71YYtZ25w9r+ior8EB+ma
 af62m68Z1JtLcTC9RCt1nN5+lkC2SIBgYaKgEm0NJoZ2KKTJmP32UZm/RX7xIRF9f37i
 7qu7KvhYQN2BkIGOYth7RjWzcNLqC14ELS9hCc5LdLbV1sXHXQEopA44Dqdud2n2zI/q
 goKcg2u+dC575uyu5mrSUKaPdGsBNcWW8yLTqdneWC1RSUlXRswgsbI607hK6M+JiLRw
 qq/RBYUTW0vqdIYMl1CbQWfyeYMe7pRfCa02wS14cESADjJ058k+PgoswOKJZlASut+L
 RM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFprKD4QmPHv0U33KKZsv61v/Wuaug12p3KnTpwvIyQ=;
 b=mTId9KwmUWXQUhX+UMbWv2sM+WFxu33SecIbW0NLAWzH2AWs1qXKlKDHWywwICHwlE
 boCQtsjYYjbeRfzwvWRg0bYnscaa5Cle2CilalWVEk/jogJSvvuRKEEB/OZrxVa2PfcI
 G4ip8BcXfx13UrfnEYKuRR8MZJmGntnXUyIsMAZiRofFpS+o/YZlzPGokCI5iaIU/Qr5
 rIhZ9Y1VGeOVsGKVN8iaeFrJmOvo02IAtCLaixe8JGnOm7CWFqeKlM7gRkOcU0eMKaR9
 VMn2p5eMfZN85uZefU8qWk7u7JRI5HsioKVsDP2R6zYXWQLZhpg0doApRTy9h8HpsEB3
 e8Og==
X-Gm-Message-State: AGi0PuZMnk30YazVhx3edaCGsl2wP6lXluYBu67nFyIQzfDmu4m1I78k
 QMSAkqCYcnqOixAOBLAliVs7dkG6IQc=
X-Google-Smtp-Source: APiQypJ/1A2uSusHsvWLh2sQJqr9pXKuLQ0U6WLh7aylutALaTBDiqX1+wP9x8cL1v9QUZk7E3qTgg==
X-Received: by 2002:a17:90a:fe94:: with SMTP id
 co20mr3853661pjb.213.1588911890635; 
 Thu, 07 May 2020 21:24:50 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id y13sm354570pfc.78.2020.05.07.21.24.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:24:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 09:54:00 +0530
Message-Id: <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1588911607.git.viresh.kumar@linaro.org>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for semtimedop() and its time64 variant to the
existing semop() syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/ipc/semop/semop.h   | 52 +++++++++++++++++++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 11 +++-
 testcases/kernel/syscalls/ipc/semop/semop02.c | 12 ++++-
 testcases/kernel/syscalls/ipc/semop/semop03.c | 12 ++++-
 testcases/kernel/syscalls/ipc/semop/semop04.c | 12 ++++-
 testcases/kernel/syscalls/ipc/semop/semop05.c | 12 ++++-
 6 files changed, 106 insertions(+), 5 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
new file mode 100644
index 000000000000..8d1245b65ec0
--- /dev/null
+++ b/testcases/kernel/syscalls/ipc/semop/semop.h
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#ifndef SEMOP_VAR__
+#define SEMOP_VAR__
+
+#include <sys/sem.h>
+#include "tst_timer.h"
+#include "lapi/abisize.h"
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
+	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
+#if defined(TST_ABI32)
+	{ .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
+	{ .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
+#endif
+
+#if defined(TST_ABI64)
+	{ .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
+#endif
+
+#if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec64"},
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
+#endif /* SEMOP_VAR__ */
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index bcb45fa69320..a4924376e32c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -41,6 +41,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 #define NSEMS	4		/* the number of primitive semaphores to test */
 
@@ -52,11 +53,16 @@ static struct sembuf sops[PSEMS];
 
 static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	union semun arr = { .val = 0 };
+	struct tst_ts timeout;
 	int fail = 0;
 	int i;
 
-	TEST(semop(sem_id, sops, NSEMS));
+	timeout.type = tv->type;
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, sem_id, sops, NSEMS, &timeout));
 
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "semop() failed");
@@ -94,6 +100,8 @@ static void setup(void)
 {
 	int i;
 
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	get_arr.array = malloc(sizeof(unsigned short int) * PSEMS);
 	if (get_arr.array == NULL)
 		tst_brk(TBROK, "malloc failed");
@@ -124,6 +132,7 @@ static void cleanup(void)
 
 static struct tst_test test = {
 	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index f24d284776a4..a51906340400 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -20,6 +20,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static int sem_id_1 = -1;	/* a semaphore set with read & alter permissions */
 static int sem_id_2 = -1;	/* a semaphore set without read & alter permissions */
@@ -52,6 +53,8 @@ static void setup(void)
 	struct seminfo ipc_buf;
 	union semun arr;
 
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	ltpuser = SAFE_GETPWNAM(nobody_uid);
 	SAFE_SETUID(ltpuser->pw_uid);
 
@@ -84,7 +87,13 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
-	TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops));
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, *(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops, &timeout));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -117,6 +126,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 4f5f78eb6d8d..d36194ce1f41 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -38,6 +38,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static key_t semkey;
 static int sem_id = -1;
@@ -47,6 +48,12 @@ static int tc[] = { -1, PSEMS + 1 }; /* negative and too many "primitive" semas
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_nsec(&timeout, 10000);
+
 	/* initialize two fields in the sembuf structure here */
 	s_buf.sem_op = 1;	/* add this value to struct sem.semval */
 	s_buf.sem_flg = SEM_UNDO;	/* undo when process exits */
@@ -61,7 +68,7 @@ static void run(unsigned int i)
 	 * use the TEST macro to make the call
 	 */
 
-	TEST(semop(sem_id, &s_buf, 1));
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -80,6 +87,8 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	/* get an IPC resource key */
 	semkey = GETIPCKEY();
 
@@ -102,6 +111,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
index 0faf00a3585f..033065e7bbfc 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop04.c
@@ -38,6 +38,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static int sem_id = -1;
 static int val; /* value for SETVAL */
@@ -62,6 +63,12 @@ static struct test_case_t {
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_nsec(&timeout, 10000);
+
 	/* initialize the s_buf buffer */
 	s_buf.sem_op = tc[i].op;
 	s_buf.sem_flg = tc[i].flg;
@@ -72,7 +79,7 @@ static void run(unsigned int i)
 	if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get_arr) == -1)
 		tst_brk(TBROK | TERRNO, "semctl() failed");
 
-	TEST(semop(sem_id, &s_buf, 1));
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "call succeeded unexpectedly");
 		return;
@@ -86,6 +93,8 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	val = 1;
 
 	/* get an IPC resource key */
@@ -114,6 +123,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
index 9e8e040b0b19..f892cd519ecf 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
@@ -52,6 +52,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static key_t semkey;
 static int sem_id = -1;
@@ -115,7 +116,13 @@ static inline int process_state_wait2(pid_t pid, const char state)
 
 static void do_child(int i)
 {
-	TEST(semop(sem_id, &s_buf, 1));
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "call succeeded when error expected");
 		exit(-1);
@@ -137,6 +144,8 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
+
 	SAFE_SIGNAL(SIGHUP, sighandler);
 
 	/* get an IPC resource key */
@@ -238,6 +247,7 @@ static void do_child_uclinux(void)
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
