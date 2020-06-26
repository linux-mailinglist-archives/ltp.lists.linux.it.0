Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D143B20AC4D
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 694923C5849
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 08:25:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 060123C583F
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:24 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EEF6D2010EF
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 08:23:23 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id x8so3003782plm.10
 for <ltp@lists.linux.it>; Thu, 25 Jun 2020 23:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/umuoG1hqIRFFmgoQJqYphcG+TLUaqxCgGZnYyatyK0=;
 b=HLT2dQnNJlowFJwr1kZBEgeMUNuXfBfy0SlbrhBeBwC8HOV3dT7wLkrSi7p9iMuIwU
 j3TnVVy073YaTZNAan57LY00NPyD3EVEicTEL7Hsb81XAbbv2PvDagH2SLYnvKTheajX
 rYQK2PH+3NbjLmT+s6tXxvGmuIKb5bfWTfCH7zBzYN3INAgJP/ujN2hiad1zcpanXHS7
 ZpQvMp6lHlGwUkEvUJ8MOEHYPyXtipNv+twSeimvuc7OMVtpJmJok8o/VvJZTJSTMHEk
 RGudsrcBRSYp4503ejpK7ztWZ+QxCz9gdX/eLoE10h2DdoQ4XBGyVgFCvxqi0faVp6h6
 ES1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/umuoG1hqIRFFmgoQJqYphcG+TLUaqxCgGZnYyatyK0=;
 b=gZA6UFGOXWXKup3fbZlrxTs4AIC+UoX0wmZerJ6adUhpA7wbM179esaZEui2D4ySTt
 6BoPuApuG6wprOeRNhpj29vpEZutjMOgtK9vAfrJ/WDOhT/OTm5aSSVQA8Df5WI0CeLX
 XjabfOIUW8u7xDSQzsmRaogOwk9uSmDKvZHhZSyT1+sRm9xHQPqKtVV55+DqHhIqKlgE
 v206yOt3zSiiQyRUB/jBCDkUpqO5Bb85IhssxAzK7bCuTStp3/dWhKswZionzaIAyWR6
 Wi7yY/QFK4DI2f+Z7W8Q8+0lEWJt6hWRt41RJlz+EqN2UXk4QImhHSSl67C7Q8Bd6kfz
 3HWw==
X-Gm-Message-State: AOAM53062Cb5iyfa+HEtForvBXTYVeW7JoWqz7kijFafbENMl/jF7kkN
 usysb6G1iPna5dQAv06s+MMhLPWy5jU=
X-Google-Smtp-Source: ABdhPJwIM9yXVRzjsMTuC6bbsTOShapjxUc6cOyUPbkdBJxW8ByEHVcKFgd0Cyz9y6I27GMMCgDZzw==
X-Received: by 2002:a17:90a:e08f:: with SMTP id
 q15mr1906147pjy.178.1593152601591; 
 Thu, 25 Jun 2020 23:23:21 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id z5sm4809849pfb.1.2020.06.25.23.23.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 23:23:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 26 Jun 2020 11:52:29 +0530
Message-Id: <89b2cbc1c97030026d0eb71112cce293a23675c2.1593152309.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1593152309.git.viresh.kumar@linaro.org>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V7 16/19] syscalls/semtimedop: Add support for
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
 testcases/kernel/syscalls/ipc/semop/semop.h   | 55 +++++++++++++++++++
 testcases/kernel/syscalls/ipc/semop/semop01.c | 14 ++++-
 testcases/kernel/syscalls/ipc/semop/semop02.c | 15 ++++-
 testcases/kernel/syscalls/ipc/semop/semop03.c | 16 +++++-
 testcases/kernel/syscalls/ipc/semop/semop04.c | 16 +++++-
 testcases/kernel/syscalls/ipc/semop/semop05.c | 16 +++++-
 6 files changed, 127 insertions(+), 5 deletions(-)
 create mode 100644 testcases/kernel/syscalls/ipc/semop/semop.h

diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
new file mode 100644
index 000000000000..584d12c68e0d
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
+	{ .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
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
index bcb45fa69320..7947183c837b 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -41,6 +41,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 #define NSEMS	4		/* the number of primitive semaphores to test */
 
@@ -52,11 +53,17 @@ static struct sembuf sops[PSEMS];
 
 static void run(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	union semun arr = { .val = 0 };
+	struct tst_ts timeout;
 	int fail = 0;
 	int i;
 
-	TEST(semop(sem_id, sops, NSEMS));
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, sem_id, sops, NSEMS, &timeout));
 
 	if (TST_RET == -1) {
 		tst_res(TFAIL | TTERRNO, "semop() failed");
@@ -92,8 +99,12 @@ static void run(void)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	int i;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
 	get_arr.array = malloc(sizeof(unsigned short int) * PSEMS);
 	if (get_arr.array == NULL)
 		tst_brk(TBROK, "malloc failed");
@@ -124,6 +135,7 @@ static void cleanup(void)
 
 static struct tst_test test = {
 	.test_all = run,
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index f24d284776a4..4ffb9dd72c1c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -20,6 +20,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static int sem_id_1 = -1;	/* a semaphore set with read & alter permissions */
 static int sem_id_2 = -1;	/* a semaphore set without read & alter permissions */
@@ -46,12 +47,16 @@ static struct test_case_t {
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	char nobody_uid[] = "nobody";
 	struct passwd *ltpuser;
 	key_t semkey2;
 	struct seminfo ipc_buf;
 	union semun arr;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
 	ltpuser = SAFE_GETPWNAM(nobody_uid);
 	SAFE_SETUID(ltpuser->pw_uid);
 
@@ -84,7 +89,14 @@ static void setup(void)
 
 static void run(unsigned int i)
 {
-	TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops));
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, *(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops, &timeout));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -117,6 +129,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 4f5f78eb6d8d..40a6b095c57d 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -38,6 +38,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static key_t semkey;
 static int sem_id = -1;
@@ -47,6 +48,13 @@ static int tc[] = { -1, PSEMS + 1 }; /* negative and too many "primitive" semas
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
 	/* initialize two fields in the sembuf structure here */
 	s_buf.sem_op = 1;	/* add this value to struct sem.semval */
 	s_buf.sem_flg = SEM_UNDO;	/* undo when process exits */
@@ -61,7 +69,7 @@ static void run(unsigned int i)
 	 * use the TEST macro to make the call
 	 */
 
-	TEST(semop(sem_id, &s_buf, 1));
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
@@ -80,6 +88,11 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
 	/* get an IPC resource key */
 	semkey = GETIPCKEY();
 
@@ -102,6 +115,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
index 0faf00a3585f..5e4bfeb625e2 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop04.c
@@ -38,6 +38,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static int sem_id = -1;
 static int val; /* value for SETVAL */
@@ -62,6 +63,13 @@ static struct test_case_t {
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
 	/* initialize the s_buf buffer */
 	s_buf.sem_op = tc[i].op;
 	s_buf.sem_flg = tc[i].flg;
@@ -72,7 +80,7 @@ static void run(unsigned int i)
 	if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get_arr) == -1)
 		tst_brk(TBROK | TERRNO, "semctl() failed");
 
-	TEST(semop(sem_id, &s_buf, 1));
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "call succeeded unexpectedly");
 		return;
@@ -86,6 +94,11 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
 	val = 1;
 
 	/* get an IPC resource key */
@@ -114,6 +127,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
index 9e8e040b0b19..770646bc564c 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
@@ -52,6 +52,7 @@
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/semun.h"
+#include "semop.h"
 
 static key_t semkey;
 static int sem_id = -1;
@@ -115,7 +116,14 @@ static inline int process_state_wait2(pid_t pid, const char state)
 
 static void do_child(int i)
 {
-	TEST(semop(sem_id, &s_buf, 1));
+	struct test_variants *tv = &variants[tst_variant];
+	struct tst_ts timeout;
+
+	timeout.type = tv->type;
+	tst_ts_set_sec(&timeout, 1);
+	tst_ts_set_nsec(&timeout, 10000);
+
+	TEST(call_semop(tv, sem_id, &s_buf, 1, &timeout));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "call succeeded when error expected");
 		exit(-1);
@@ -137,6 +145,11 @@ static void sighandler(int sig)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+	semop_supported_by_kernel(tv);
+
 	SAFE_SIGNAL(SIGHUP, sighandler);
 
 	/* get an IPC resource key */
@@ -238,6 +251,7 @@ static void do_child_uclinux(void)
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
