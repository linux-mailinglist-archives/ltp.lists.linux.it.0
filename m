Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B5231AAB
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:56:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A461E3C2656
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 09:56:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 778D93C5D1C
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:56:20 +0200 (CEST)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 961891A01CA9
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 09:56:19 +0200 (CEST)
Received: by mail-pl1-x62b.google.com with SMTP id p1so11450505pls.4
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=ivKz2CzLlRgAxixB7Doq8b+aBZ0XFvi2rrcRCU1MzW0=;
 b=JutG4ORo/bRW6EJKuSlVq52/P52K2d0m14eG8klj0HOSWEDvLGQ8DIK8oS9+dEn50P
 aea0pgLBd4hIUeanoPitmiJmsUQlf+gaDkDXna3N2JjnD3odIC8/u0yYPQsRALUGfAdq
 Ib7C3hmpLDiSJGtcL326gP55iTPzcxGLXbNgtpNnQmU18Krw8gqHEMqlDWh4IS1+BSH7
 EC0b4HHKKeKRJ7KZf2Fnl+6SK3IUqFj1PZchhuPeOfIubiMiXYcI08BuNXT8Pb6t9p7J
 myPLdrux70IaCNJ7Vm2KXrohKgRw3zLnCgXEkYIRg56gqw4VMkP0VxPRF4JuF5tpOthS
 qyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=ivKz2CzLlRgAxixB7Doq8b+aBZ0XFvi2rrcRCU1MzW0=;
 b=Zh8Mxmm9PwmdHVSwAk2cWXjR/1CJuBPybJNS9GPWtt2zTi89SdB5usmYz1+RR1y+id
 mq+e3PBqvRDQrqbO2CKyoQfXsKUnNsbhTt6drRi/aGrK2Ik5O8wvvMXPKzIiK949vLPf
 eXU92cpZpJleqqw9JkLl1JaqIn0dVITFqSTnWNr4F3NKLCcM5vTY8HrinY+Xoj1Wm0a0
 BeT14lGqPXXR8DM80KdQZy0uHIQEvENw9T5RqN8wbo1qndztjwaWa56VZL5Lzt+BTQUl
 ggGpWRwlE4OWvx1LJ9gI2SsWu+/mzIHlHBx8nZnF1uXDC9L9Rk0i/A9KXJJH6oDR8lMm
 xEEw==
X-Gm-Message-State: AOAM530EQsYrhlwh5A6vOXMPr6DgXaa6DWW61+Njj7rTw05Ss9mdQabG
 oxBVPv//udOXtO4XzUeh+Sbvlbvs9gM=
X-Google-Smtp-Source: ABdhPJwyec7rW1sQgLmPua30P7S3XkHSwg9aZjsJGLzjv5Cz2WD4tfGsq9WCggd0u1ZJxBFCga9bSg==
X-Received: by 2002:a17:90a:1589:: with SMTP id
 m9mr8896662pja.122.1596009376629; 
 Wed, 29 Jul 2020 00:56:16 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id t73sm1335517pfc.78.2020.07.29.00.56.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 00:56:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 13:25:51 +0530
Message-Id: <56d89f2356cf51135c3b6d9219745cbe3868dec8.1596008484.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
References: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
In-Reply-To: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
References: <fab6e65d02767b60594916da89cca34221989229.1596008484.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V8 3/5] syscalls: semop: Merge semop0[234].c files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

All these can be handled together in semop02.c easily.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                               |  2 -
 runtest/syscalls-ipc                           |  2 -
 testcases/kernel/syscalls/ipc/semop/.gitignore |  2 -
 testcases/kernel/syscalls/ipc/semop/semop02.c  | 47 ++++++++++-----
 testcases/kernel/syscalls/ipc/semop/semop03.c  | 67 ---------------------
 testcases/kernel/syscalls/ipc/semop/semop04.c  | 80 --------------------------
 6 files changed, 34 insertions(+), 166 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ipc/semop/semop03.c
 delete mode 100644 testcases/kernel/syscalls/ipc/semop/semop04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 70b3277d38ea..99831f6aa36e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1169,8 +1169,6 @@ semget06 semget06
 
 semop01 semop01
 semop02 semop02
-semop03 semop03
-semop04 semop04
 semop05 semop05
 
 send01 send01
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index c3a35896c5a8..1a63071b22cf 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -44,8 +44,6 @@ semget06 semget06
 
 semop01 semop01
 semop02 semop02
-semop03 semop03
-semop04 semop04
 semop05 semop05
 
 shmat01 shmat01
diff --git a/testcases/kernel/syscalls/ipc/semop/.gitignore b/testcases/kernel/syscalls/ipc/semop/.gitignore
index cc67b1862f41..35b7af66c465 100644
--- a/testcases/kernel/syscalls/ipc/semop/.gitignore
+++ b/testcases/kernel/syscalls/ipc/semop/.gitignore
@@ -1,5 +1,3 @@
 /semop01
 /semop02
-/semop03
-/semop04
 /semop05
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index 66b0bef56257..7a49b2648b2b 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -18,24 +18,37 @@
 static int sem_id_1 = -1;	/* a semaphore set with read & alter permissions */
 static int sem_id_2 = -1;	/* a semaphore set without read & alter permissions */
 static int bad_id = -1;
+static short sem_op_dyn, sem_op_1 = 1, sem_op_negative = -1, sem_op_zero = 0;
 static key_t semkey;
 static struct sembuf s_buf[PSEMS];
+static struct sembuf *faulty_buf;
+static struct sembuf *valid_buf = s_buf;
+static union semun arr;
 
 #define NSOPS	5		/* a reasonable number of operations */
 #define	BIGOPS	1024		/* a value that is too large for the number */
 				/* of semop operations that are permitted */
 static struct test_case_t {
 	int *semid;
-	struct sembuf *t_sbuf;
+	struct sembuf **buf;
+	short *sem_op; /* semaphore operation */
+	unsigned short ctl_sem_num;
+	unsigned short sem_num; /* semaphore index in array */
+	short sem_flg; /* operation flags */
 	unsigned t_ops;
+	int arr_val;
 	int error;
 } tc[] = {
-	{&sem_id_1, s_buf, BIGOPS, E2BIG},
-	{&sem_id_2, s_buf, NSOPS, EACCES},
-	{&sem_id_1, (struct sembuf *)-1, NSOPS, EFAULT},
-	{&sem_id_1, s_buf, 0, EINVAL},
-	{&bad_id, s_buf, NSOPS, EINVAL},
-	{&sem_id_1, s_buf, 1, ERANGE}
+	{&sem_id_1, &valid_buf, &sem_op_dyn, 0, 0, 0, BIGOPS, 1, E2BIG},
+	{&sem_id_2, &valid_buf, &sem_op_dyn, 0, 0, 0, NSOPS, 1, EACCES},
+	{&sem_id_1, &faulty_buf, &sem_op_dyn, 0, 0, 0, NSOPS, 1, EFAULT},
+	{&sem_id_1, &valid_buf, &sem_op_dyn, 0, 0, 0, 0, 1, EINVAL},
+	{&bad_id, &valid_buf, &sem_op_dyn, 0, 0, 0, NSOPS, 1, EINVAL},
+	{&sem_id_1, &valid_buf, &sem_op_dyn, 0, 0, 0, 1, 1, ERANGE},
+	{&sem_id_1, &valid_buf, &sem_op_1, 0, -1, SEM_UNDO, 1, 1, EFBIG},
+	{&sem_id_1, &valid_buf, &sem_op_1, 0, PSEMS + 1, SEM_UNDO, 1, 1, EFBIG},
+	{&sem_id_1, &valid_buf, &sem_op_zero, 2, 2, IPC_NOWAIT, 1, 1, EAGAIN},
+	{&sem_id_1, &valid_buf, &sem_op_negative, 2, 2, IPC_NOWAIT, 1, 0, EAGAIN}
 };
 
 static void setup(void)
@@ -44,7 +57,6 @@ static void setup(void)
 	struct passwd *ltpuser;
 	key_t semkey2;
 	struct seminfo ipc_buf;
-	union semun arr;
 
 	ltpuser = SAFE_GETPWNAM(nobody_uid);
 	SAFE_SETUID(ltpuser->pw_uid);
@@ -65,15 +77,24 @@ static void setup(void)
 	if (semctl(sem_id_1, 0, IPC_INFO, arr) == -1)
 		tst_brk(TBROK | TERRNO, "semctl() IPC_INFO failed");
 
-	arr.val = 1;
-	s_buf[0].sem_op = ipc_buf.semvmx;
-	if (semctl(sem_id_1, 0, SETVAL, arr) == -1)
-		tst_brk(TBROK | TERRNO, "semctl() SETVAL failed");
+	sem_op_dyn = ipc_buf.semvmx;
+	faulty_buf = tst_get_bad_addr(NULL);
 }
 
 static void run(unsigned int i)
 {
-	TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops));
+	if (*tc[i].buf != faulty_buf) {
+		arr.val = tc[i].arr_val;
+
+		if (semctl(sem_id_1, tc[i].ctl_sem_num, SETVAL, arr) == -1)
+			tst_brk(TBROK | TERRNO, "semctl() SETVAL failed");
+
+		s_buf[0].sem_op = *tc[i].sem_op;
+		s_buf[0].sem_flg = tc[i].sem_flg;
+		s_buf[0].sem_num = tc[i].sem_num;
+	}
+
+	TEST(semop(*(tc[i].semid), *tc[i].buf, tc[i].t_ops));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
deleted file mode 100644
index c569033eebc2..000000000000
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * semop03 - test for EFBIG error
- *
- * Copyright (c) International Business Machines  Corp., 2001
- *	03/2001 - Written by Wayne Boyer
- */
-
-#include <sys/sem.h>
-#include "tst_test.h"
-#include "libnewipc.h"
-#include "lapi/semun.h"
-
-static key_t semkey;
-static int sem_id = -1;
-static struct sembuf s_buf;
-
-static int tc[] = { -1, PSEMS + 1 }; /* negative and too many "primitive" semas */
-
-static void run(unsigned int i)
-{
-	s_buf.sem_op = 1;
-	s_buf.sem_flg = SEM_UNDO;
-	s_buf.sem_num = tc[i];
-
-	TEST(semop(sem_id, &s_buf, 1));
-	if (TST_RET != -1) {
-		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
-		return;
-	}
-
-	switch (TST_ERR) {
-	case EFBIG:
-		tst_res(TPASS | TTERRNO, "expected failure");
-		break;
-	default:
-		tst_res(TFAIL | TTERRNO, "unexpected failure");
-		break;
-	}
-}
-
-static void setup(void)
-{
-	semkey = GETIPCKEY();
-
-	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
-	    -1)
-		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
-}
-
-static void cleanup(void)
-{
-	union semun arr;
-
-	if (sem_id != -1) {
-		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
-			tst_res(TINFO, "WARNING: semaphore deletion failed.");
-	}
-}
-
-static struct tst_test test = {
-	.test = run,
-	.tcnt = ARRAY_SIZE(tc),
-	.setup = setup,
-	.cleanup = cleanup,
-	.needs_tmpdir = 1,
-};
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
deleted file mode 100644
index 1904b177f71b..000000000000
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c
+++ /dev/null
@@ -1,80 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * semop04 - test for EAGAIN error
- *
- * Copyright (c) International Business Machines  Corp., 2001
- *	03/2001 - Written by Wayne Boyer
- */
-
-#include <sys/sem.h>
-#include "tst_test.h"
-#include "libnewipc.h"
-#include "lapi/semun.h"
-
-static int sem_id = -1;
-static int val;
-
-static key_t semkey;
-static struct sembuf s_buf;
-
-static struct test_case_t {
-	union semun get_arr;
-	short op;
-	short flg;
-	short num;
-	int error;
-} tc[] = {
-	{{1}, 0, IPC_NOWAIT, 2, EAGAIN},
-	{{0}, -1, IPC_NOWAIT, 2, EAGAIN}
-};
-
-static void run(unsigned int i)
-{
-	s_buf.sem_op = tc[i].op;
-	s_buf.sem_flg = tc[i].flg;
-	s_buf.sem_num = tc[i].num;
-
-	tc[i].get_arr.val = val--;
-	if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get_arr) == -1)
-		tst_brk(TBROK | TERRNO, "semctl() failed");
-
-	TEST(semop(sem_id, &s_buf, 1));
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "call succeeded unexpectedly");
-		return;
-	}
-
-	if (TST_ERR == tc[i].error)
-		tst_res(TPASS | TTERRNO, "expected failure");
-	else
-		tst_res(TFAIL | TTERRNO, "unexpected failure");
-}
-
-static void setup(void)
-{
-	val = 1;
-	semkey = GETIPCKEY();
-
-	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
-	     -1) {
-		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
-	}
-}
-
-static void cleanup(void)
-{
-	union semun arr;
-
-	if (sem_id != -1) {
-		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
-			tst_res(TINFO, "WARNING: semaphore deletion failed.");
-	}
-}
-
-static struct tst_test test = {
-	.test = run,
-	.tcnt = ARRAY_SIZE(tc),
-	.setup = setup,
-	.cleanup = cleanup,
-	.needs_tmpdir = 1,
-};
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
