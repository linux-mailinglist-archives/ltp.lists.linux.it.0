Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372AC1DE4E7
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D7773C4CAB
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:54:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 515B83C242E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:26 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 824E060087E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:25 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id ci23so4819175pjb.5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZCukCDg3CrF3O/VYZPhozva99YpH7tnHsb8zKvKt2Fk=;
 b=j6AzHV3RErGSK1EK0e3rMn02u4HyeDWwENT86OZ4DEkdXl0qMIEXuRDsTMXzoFNaX2
 w9XUT+q4DAq72Rm5MtvZilVRtNs4OtPS1vIFSrML8UWwMvliGwsiQy47ZTxvumt7hnDP
 JsS1c4UWuDa/jy1/x/jfkXqB8w5Ie23Hakqfm9BMaYdgwpg/IX3ShyjD4cHf/3D5pqqq
 5FeD4q0bXWHR9EURXw33d7UFuGHXhdl8nbEfAY79YY7i9tKAnC2r8uJJ0KAuL0ppakK4
 pnVkzuQH6XKHIzax5i/CsPNf20BcatFu9X0RlgUMtw9cDm5QiIW6rHQiVqW3OQfQNVWw
 ZiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZCukCDg3CrF3O/VYZPhozva99YpH7tnHsb8zKvKt2Fk=;
 b=o9/gO13C6JMBMpgkLxOlBELjjmcZ7OhcpbyVUg44RzBr2jrUCuly8tWyVPqzPmMGPa
 m61t7ajgyYh4UYBHMVWJsfe+m9Ns8SLuJKazb1HOnVFotmdkMo1nIHpaaEAdP3VecSqp
 AkCH7apS1kMMJmwCxKqyAsod1zgzWa9tY2NfMp3c49DHLQWrED7GJ9JHJrfOX/h9HRCX
 CnKUoBuzMufVmJ+AgmTjji07wquznK2buXaboCouZiKnQlB+hqKR5iqzfoDReJBuE9G8
 CqIs4CC4gsELWKL2ol4Kqi5QVedIsiWUaLSo/G/ua6moBn6p52sMDARDD410TkiHUxjR
 /wOg==
X-Gm-Message-State: AOAM531xgMLEnLBGy2JbB+N8E/uRc9FE3DBwy+RqShWmxtcijUhUr62x
 isonLDlj0AMCLBeICoDvdHEqI8wmmbc=
X-Google-Smtp-Source: ABdhPJynwaB85m6VHqnzDC2nHmr1zH0iRcL7JILxbfKJYqZGPDXsDpVEC63ZU7iBARV5dcl02V8h8g==
X-Received: by 2002:a17:902:9d94:: with SMTP id
 c20mr14186252plq.224.1590144743142; 
 Fri, 22 May 2020 03:52:23 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id o11sm6570676pfd.195.2020.05.22.03.52.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:22 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:34 +0530
Message-Id: <cbe662a1bc25afaaf424cddbee8268791efaeabb.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V4 14/17] syscalls/semop: Migrate to new test framework
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

This migrates the semop tests to the new test framework.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/ipc/semop/Makefile  |   2 +-
 testcases/kernel/syscalls/ipc/semop/semop01.c | 140 ++++----
 testcases/kernel/syscalls/ipc/semop/semop02.c | 145 +++------
 testcases/kernel/syscalls/ipc/semop/semop03.c | 150 +++------
 testcases/kernel/syscalls/ipc/semop/semop04.c | 165 ++++------
 testcases/kernel/syscalls/ipc/semop/semop05.c | 303 ++++++++----------
 6 files changed, 347 insertions(+), 558 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/Makefile b/testcases/kernel/syscalls/ipc/semop/Makefile
index 401e5e8cbb9f..5e4c695dd310 100644
--- a/testcases/kernel/syscalls/ipc/semop/Makefile
+++ b/testcases/kernel/syscalls/ipc/semop/Makefile
@@ -4,5 +4,5 @@
 top_srcdir              ?= ../../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
-include $(abs_srcdir)/../Makefile.inc
+include $(abs_srcdir)/../Makefile2.inc
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semop/semop01.c b/testcases/kernel/syscalls/ipc/semop/semop01.c
index ea05c53eb919..bcb45fa69320 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop01.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop01.c
@@ -1,21 +1,5 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) International Business Machines  Corp., 2001 */
 
 /*
  * NAME
@@ -52,92 +36,73 @@
  *	none
  */
 
-#include "ipcsem.h"
+#include <stdlib.h>
+#include <sys/sem.h>
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/semun.h"
 
 #define NSEMS	4		/* the number of primitive semaphores to test */
 
-char *TCID = "semop01";
-int TST_TOTAL = 1;
-
-int sem_id_1 = -1;		/* a semaphore set with read & alter permissions */
+static int sem_id = -1;		/* a semaphore set with read & alter permissions */
+static key_t semkey;
 
-union semun get_arr;
-struct sembuf sops[PSEMS];
+static union semun get_arr;
+static struct sembuf sops[PSEMS];
 
-int main(int ac, char **av)
+static void run(void)
 {
-	int lc;
-	int i;
+	union semun arr = { .val = 0 };
 	int fail = 0;
+	int i;
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(semop(sem_id_1, sops, NSEMS));
-
-		if (TEST_RETURN == -1) {
-			tst_resm(TFAIL, "%s call failed - errno = %d : %s",
-				 TCID, TEST_ERRNO, strerror(TEST_ERRNO));
-		} else {
-			/* get the values and make sure they */
-			/* are the same as what was set      */
-			if (semctl(sem_id_1, 0, GETALL, get_arr) == -1) {
-				tst_brkm(TBROK, cleanup,
-					 "semctl() failed in functional test");
-			}
-
-			for (i = 0; i < NSEMS; i++) {
-				if (get_arr.array[i] != i * i) {
-					fail = 1;
-				}
-			}
-			if (fail)
-				tst_resm(TFAIL,
-					 "semaphore values are wrong");
-			else
-				tst_resm(TPASS,
-					 "semaphore values are correct");
-		}
+	TEST(semop(sem_id, sops, NSEMS));
 
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "semop() failed");
+	} else {
 		/*
-		 * clean up things in case we are looping
+		 * Get the values and make sure they are the same as what was
+		 * set
 		 */
-		union semun set_arr;
-		set_arr.val = 0;
+		if (semctl(sem_id, 0, GETALL, get_arr) == -1) {
+			tst_brk(TBROK | TERRNO, "semctl() failed in functional test");
+		}
+
 		for (i = 0; i < NSEMS; i++) {
-			if (semctl(sem_id_1, i, SETVAL, set_arr) == -1) {
-				tst_brkm(TBROK, cleanup, "semctl failed");
+			if (get_arr.array[i] != i * i) {
+				fail = 1;
 			}
 		}
+		if (fail)
+			tst_res(TFAIL | TERRNO, "semaphore values are wrong");
+		else
+			tst_res(TPASS, "semaphore values are correct");
 	}
 
-	cleanup();
-	tst_exit();
+	/*
+	 * clean up things in case we are looping
+	 */
+	for (i = 0; i < NSEMS; i++) {
+		if (semctl(sem_id, i, SETVAL, arr) == -1) {
+			tst_brk(TBROK | TERRNO, "semctl failed");
+		}
+	}
 }
 
-void setup(void)
+static void setup(void)
 {
 	int i;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
 	get_arr.array = malloc(sizeof(unsigned short int) * PSEMS);
 	if (get_arr.array == NULL)
-		tst_brkm(TBROK, cleanup, "malloc failed");
+		tst_brk(TBROK, "malloc failed");
 
-	semkey = getipckey();
+	semkey = GETIPCKEY();
 
-	sem_id_1 = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
-	if (sem_id_1 == -1)
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
+	sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
+	if (sem_id == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
 
 	for (i = 0; i < NSEMS; i++) {
 		sops[i].sem_num = i;
@@ -146,11 +111,20 @@ void setup(void)
 	}
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	rm_sema(sem_id_1);
+	union semun arr;
 
+	if (sem_id != -1) {
+		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
 	free(get_arr.array);
-
-	tst_rmdir();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/ipc/semop/semop02.c b/testcases/kernel/syscalls/ipc/semop/semop02.c
index f067229b1cf5..f24d284776a4 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop02.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop02.c
@@ -1,21 +1,5 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) International Business Machines  Corp., 2001 */
 
 /*
  * DESCRIPTION
@@ -31,30 +15,27 @@
 
 #define _GNU_SOURCE
 #include <pwd.h>
-#include "test.h"
-#include "safe_macros.h"
-#include "ipcsem.h"
-
-char *TCID = "semop02";
-
-static void semop_verify(int i);
-int sem_id_1 = -1;	/* a semaphore set with read & alter permissions */
-int sem_id_2 = -1;	/* a semaphore set without read & alter permissions */
-int bad_id = -1;
-
-struct sembuf s_buf[PSEMS];
-
-int badbuf = -1;
+#include <sys/ipc.h>
+#include <sys/sem.h>
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/semun.h"
+
+static int sem_id_1 = -1;	/* a semaphore set with read & alter permissions */
+static int sem_id_2 = -1;	/* a semaphore set without read & alter permissions */
+static int bad_id = -1;
+static key_t semkey;
+static struct sembuf s_buf[PSEMS];
 
 #define NSOPS	5		/* a resonable number of operations */
 #define	BIGOPS	1024		/* a value that is too large for the number */
 				/* of semop operations that are permitted   */
-struct test_case_t {
+static struct test_case_t {
 	int *semid;
 	struct sembuf *t_sbuf;
 	unsigned t_ops;
 	int error;
-} TC[] = {
+} tc[] = {
 	{&sem_id_1, (struct sembuf *)&s_buf, BIGOPS, E2BIG},
 	{&sem_id_2, (struct sembuf *)&s_buf, NSOPS, EACCES},
 	{&sem_id_1, (struct sembuf *)-1, NSOPS, EFAULT},
@@ -63,29 +44,7 @@ struct test_case_t {
 	{&sem_id_1, (struct sembuf *)&s_buf, 1, ERANGE}
 };
 
-int TST_TOTAL = ARRAY_SIZE(TC);
-
-int main(int ac, char **av)
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++)
-			semop_verify(i);
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-void setup(void)
+static void setup(void)
 {
 	char nobody_uid[] = "nobody";
 	struct passwd *ltpuser;
@@ -93,71 +52,73 @@ void setup(void)
 	struct seminfo ipc_buf;
 	union semun arr;
 
-	tst_require_root();
-
-	ltpuser = SAFE_GETPWNAM(NULL, nobody_uid);
-	SAFE_SETUID(NULL, ltpuser->pw_uid);
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	SAFE_SETUID(ltpuser->pw_uid);
 
 	/* get an IPC resource key */
-	semkey = getipckey();
+	semkey = GETIPCKEY();
 
 	/* create a semaphore set with read and alter permissions */
 	sem_id_1 = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
-	if (sem_id_1 == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "couldn't create semaphore in setup");
-	}
+	if (sem_id_1 == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
 
 	/* Get an new IPC resource key. */
-	semkey2 = getipckey();
+	semkey2 = GETIPCKEY();
 
 	/* create a semaphore set without read and alter permissions */
 	sem_id_2 = semget(semkey2, PSEMS, IPC_CREAT | IPC_EXCL);
-	if (sem_id_2 == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup,
-			 "couldn't create semaphore in setup");
-	}
+	if (sem_id_2 == -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
 
 	arr.__buf = &ipc_buf;
 	if (semctl(sem_id_1, 0, IPC_INFO, arr) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "semctl() IPC_INFO failed");
+		tst_brk(TBROK | TERRNO, "semctl() IPC_INFO failed");
 
 	/* for ERANGE errno test */
 	arr.val = 1;
 	s_buf[0].sem_op = ipc_buf.semvmx;
 	if (semctl(sem_id_1, 0, SETVAL, arr) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "semctl() SETVAL failed");
+		tst_brk(TBROK | TERRNO, "semctl() SETVAL failed");
 }
 
-static void semop_verify(int i)
+static void run(unsigned int i)
 {
-	TEST(semop(*(TC[i].semid), TC[i].t_sbuf, TC[i].t_ops));
+	TEST(semop(*(tc[i].semid), tc[i].t_sbuf, tc[i].t_ops));
 
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "call succeeded unexpectedly");
+	if (TST_RET != -1) {
+		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
 		return;
 	}
 
-	if (TEST_ERRNO == TC[i].error) {
-		tst_resm(TPASS | TTERRNO, "semop failed as expected");
+	if (TST_ERR == tc[i].error) {
+		tst_res(TPASS | TTERRNO, "semop failed as expected");
 	} else {
-		tst_resm(TFAIL | TTERRNO,
+		tst_res(TFAIL | TTERRNO,
 			 "semop failed unexpectedly; expected: "
-			 "%d - %s", TC[i].error, strerror(TC[i].error));
+			 "%d - %s", tc[i].error, strerror(tc[i].error));
 	}
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	/* if they exist, remove the semaphore resources */
-	rm_sema(sem_id_1);
-	rm_sema(sem_id_2);
+	union semun arr;
 
-	tst_rmdir();
+	if (sem_id_1 != -1) {
+		if (semctl(sem_id_1, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
+	if (sem_id_2 != -1) {
+		if (semctl(sem_id_2, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.needs_root = 1,
+};
diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index a904e99439e2..4f5f78eb6d8d 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -1,21 +1,5 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) International Business Machines  Corp., 2001 */
 
 /*
  * NAME
@@ -50,109 +34,75 @@
  *	none
  */
 
-#include "ipcsem.h"
-
-char *TCID = "semop03";
-int TST_TOTAL = 2;
+#include <sys/sem.h>
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/semun.h"
 
-int sem_id_1 = -1;
+static key_t semkey;
+static int sem_id = -1;
+static struct sembuf s_buf;
 
-struct sembuf s_buf;
+static int tc[] = { -1, PSEMS + 1 }; /* negative and too many "primitive" semas */
 
-int TC[] = { -1, PSEMS + 1 };	/* negative and too many "primitive" semas */
-
-int main(int ac, char **av)
+static void run(unsigned int i)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
 	/* initialize two fields in the sembuf structure here */
 	s_buf.sem_op = 1;	/* add this value to struct sem.semval */
 	s_buf.sem_flg = SEM_UNDO;	/* undo when process exits */
 
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			/* initialize the last field in the sembuf */
-			/* structure to the test dependent value   */
-			s_buf.sem_num = TC[i];
-
-			/*
-			 * use the TEST macro to make the call
-			 */
+	/*
+	 * initialize the last field in the sembuf structure to the test
+	 * dependent value.
+	 */
+	s_buf.sem_num = tc[i];
 
-			TEST(semop(sem_id_1, &s_buf, 1));
+	/*
+	 * use the TEST macro to make the call
+	 */
 
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
+	TEST(semop(sem_id, &s_buf, 1));
 
-			switch (TEST_ERRNO) {
-			case EFBIG:
-				tst_resm(TPASS, "expected failure - errno = "
-					 "%d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			default:
-				tst_resm(TFAIL, "unexpected error - "
-					 "%d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			}
-		}
+	if (TST_RET != -1) {
+		tst_res(TFAIL | TTERRNO, "call succeeded unexpectedly");
+		return;
 	}
 
-	cleanup();
-
-	tst_exit();
+	switch (TST_ERR) {
+	case EFBIG:
+		tst_res(TPASS | TTERRNO, "expected failure");
+		break;
+	default:
+		tst_res(TFAIL | TTERRNO, "unexpected failure");
+		break;
+	}
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See ../lib/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
 	/* get an IPC resource key */
-	semkey = getipckey();
+	semkey = GETIPCKEY();
 
 	/* create a semaphore with read and alter permissions */
-	if ((sem_id_1 =
-	     semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
-	}
+	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
+	    -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	/* if it exists, remove the semaphore resource */
-	rm_sema(sem_id_1);
-
-	tst_rmdir();
+	union semun arr;
 
+	if (sem_id != -1) {
+		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/ipc/semop/semop04.c b/testcases/kernel/syscalls/ipc/semop/semop04.c
index bf425b54bb4c..0faf00a3585f 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop04.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop04.c
@@ -1,21 +1,5 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) International Business Machines  Corp., 2001 */
 
 /*
  * NAME
@@ -50,22 +34,24 @@
  *	none
  */
 
-#include "ipcsem.h"
-
-char *TCID = "semop04";
-int TST_TOTAL = 2;
+#include <sys/sem.h>
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/semun.h"
 
-int sem_id_1 = -1;
+static int sem_id = -1;
+static int val; /* value for SETVAL */
 
-struct sembuf s_buf;
+static key_t semkey;
+static struct sembuf s_buf;
 
-struct test_case_t {
+static struct test_case_t {
 	union semun get_arr;
 	short op;
 	short flg;
 	short num;
 	int error;
-} TC[] = {
+} tc[] = {
 	/* EAGAIN sem_op = 0 */
 	{ {
 	1}, 0, IPC_NOWAIT, 2, EAGAIN},
@@ -74,104 +60,61 @@ struct test_case_t {
 	0}, -1, IPC_NOWAIT, 2, EAGAIN}
 };
 
-int main(int ac, char **av)
+static void run(unsigned int i)
 {
-	int lc;
-	int val;		/* value for SETVAL */
-
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		val = 1;
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			/* initialize the s_buf buffer */
-			s_buf.sem_op = TC[i].op;
-			s_buf.sem_flg = TC[i].flg;
-			s_buf.sem_num = TC[i].num;
-
-			/* initialize all the primitive semaphores */
-			TC[i].get_arr.val = val--;
-			if (semctl(sem_id_1, TC[i].num, SETVAL, TC[i].get_arr)
-			    == -1) {
-				tst_brkm(TBROK, cleanup, "semctl() failed");
-			}
-
-			/*
-			 * make the call with the TEST macro
-			 */
-
-			TEST(semop(sem_id_1, &s_buf, 1));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			if (TEST_ERRNO == TC[i].error) {
-				tst_resm(TPASS,
-					 "expected failure - errno = %d"
-					 " : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			} else {
-				tst_resm(TFAIL, "unexpected error - "
-					 "%d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			}
-		}
+	/* initialize the s_buf buffer */
+	s_buf.sem_op = tc[i].op;
+	s_buf.sem_flg = tc[i].flg;
+	s_buf.sem_num = tc[i].num;
+
+	/* initialize all the primitive semaphores */
+	tc[i].get_arr.val = val--;
+	if (semctl(sem_id, tc[i].num, SETVAL, tc[i].get_arr) == -1)
+		tst_brk(TBROK | TERRNO, "semctl() failed");
+
+	TEST(semop(sem_id, &s_buf, 1));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "call succeeded unexpectedly");
+		return;
 	}
 
-	cleanup();
-
-	tst_exit();
+	if (TST_ERR == tc[i].error)
+		tst_res(TPASS | TTERRNO, "expected failure");
+	else
+		tst_res(TFAIL | TTERRNO, "unexpected failure");
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
+	val = 1;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	/* get an IPC resource key */
+	semkey = GETIPCKEY();
 
 	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See ../lib/libipc.c for more information.
+	 * create a semaphore set with read and alter permissions and PSEMS
+	 * "primitive" semaphores.
 	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	semkey = getipckey();
-
-	/* create a semaphore set with read and alter permissions */
-	/* and PSEMS "primitive" semaphores                       */
-	if ((sem_id_1 =
-	     semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
+	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
+	     -1) {
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
 	}
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	/* if it exists, remove the semaphore resource */
-	rm_sema(sem_id_1);
-
-	tst_rmdir();
+	union semun arr;
 
+	if (sem_id != -1) {
+		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
 }
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+};
diff --git a/testcases/kernel/syscalls/ipc/semop/semop05.c b/testcases/kernel/syscalls/ipc/semop/semop05.c
index 6ed25014c7af..9e8e040b0b19 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop05.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop05.c
@@ -1,21 +1,5 @@
-/*
- *
- *   Copyright (c) International Business Machines  Corp., 2001
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
- */
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) International Business Machines  Corp., 2001 */
 
 /*
  * NAME
@@ -60,18 +44,18 @@
  *	none
  */
 
-#include "ipcsem.h"
-
+#include <stdio.h>
+#include <stdlib.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-#include "safe_macros.h"
-
-char *TCID = "semop05";
-int TST_TOTAL = 4;
-
-int sem_id_1 = -1;
+#include <sys/sem.h>
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "lapi/semun.h"
 
-struct sembuf s_buf;
+static key_t semkey;
+static int sem_id = -1;
+static struct sembuf s_buf;
 
 struct test_case_t {
 	union semun semunptr;
@@ -79,7 +63,7 @@ struct test_case_t {
 	short flg;
 	short num;
 	int error;
-} TC[] = {
+} tc[] = {
 	/* EIRDM sem_op = 0 */
 	{ {
 	1}, 0, 0, 2, EIDRM},
@@ -96,189 +80,166 @@ struct test_case_t {
 
 #ifdef UCLINUX
 #define PIPE_NAME	"semop05"
-void do_child_uclinux();
+static void do_child_uclinux();
 static int i_uclinux;
 #endif
 
-int main(int ac, char **av)
+static inline int process_state_wait2(pid_t pid, const char state)
 {
-	int lc;
-	int i;
-	pid_t pid;
-	void do_child();
+	char proc_path[128], cur_state;
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	snprintf(proc_path, sizeof(proc_path), "/proc/%i/stat", pid);
 
-#ifdef UCLINUX
-	maybe_run_child(&do_child_uclinux, "dd", &i_uclinux, &sem_id_1);
-#endif
-
-	setup();		/* global setup */
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			/* initialize the s_buf buffer */
-			s_buf.sem_op = TC[i].op;
-			s_buf.sem_flg = TC[i].flg;
-			s_buf.sem_num = TC[i].num;
-
-			/* initialize all of the primitive semaphores */
-			if (semctl(sem_id_1, TC[i].num, SETVAL, TC[i].semunptr)
-			    == -1) {
-				tst_brkm(TBROK, cleanup, "semctl() failed");
-			}
-
-			if ((pid = FORK_OR_VFORK()) == -1) {
-				tst_brkm(TBROK, cleanup, "could not fork");
-			}
-
-			if (pid == 0) {	/* child */
+	for (;;) {
+		FILE *f = fopen(proc_path, "r");
+		if (!f) {
+			tst_res(TFAIL, "Failed to open '%s': %s\n", proc_path,
+				strerror(errno));
+			return 1;
+		}
 
-#ifdef UCLINUX
-				if (self_exec(av[0], "dd", i, sem_id_1) < 0) {
-					tst_brkm(TBROK, cleanup,
-						 "could not self_exec");
-				}
-#else
-				do_child(i);
-#endif
-			} else {
-				TST_PROCESS_STATE_WAIT(cleanup, pid, 'S');
-
-				/*
-				 * If we are testing for EIDRM then remove
-				 * the semaphore, else send a signal that
-				 * must be caught as we are testing for
-				 * EINTR.
-				 */
-				if (TC[i].error == EIDRM) {
-					/* remove the semaphore resource */
-					rm_sema(sem_id_1);
-				} else {
-					SAFE_KILL(cleanup, pid, SIGHUP);
-				}
-
-				/* let the child carry on */
-				waitpid(pid, NULL, 0);
-			}
-
-			/*
-			 * recreate the semaphore resource if needed
-			 */
-			if (TC[i].error == EINTR) {
-				continue;
-			}
-
-			if ((sem_id_1 = semget(semkey, PSEMS, IPC_CREAT |
-					       IPC_EXCL | SEM_RA)) == -1) {
-				tst_brkm(TBROK, cleanup, "couldn't recreate "
-					 "semaphore");
-			}
+		if (fscanf(f, "%*i %*s %c", &cur_state) != 1) {
+			fclose(f);
+			tst_res(TFAIL, "Failed to read '%s': %s\n", proc_path,
+				strerror(errno));
+			return 1;
 		}
-	}
+		fclose(f);
 
-	cleanup();
+		if (state == cur_state)
+			return 0;
 
-	tst_exit();
+		usleep(10000);
+	}
 }
 
-/*
- * do_child()
- */
-void do_child(int i)
+static void do_child(int i)
 {
-	/*
-	 * make the call with the TEST macro
-	 */
-
-	TEST(semop(sem_id_1, &s_buf, 1));
-
-	if (TEST_RETURN != -1) {
-		tst_resm(TFAIL, "call succeeded when error expected");
+	TEST(semop(sem_id, &s_buf, 1));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "call succeeded when error expected");
 		exit(-1);
 	}
 
-	if (TEST_ERRNO == TC[i].error) {
-		tst_resm(TPASS, "expected failure - errno = %d"
-			 " : %s", TEST_ERRNO, strerror(TEST_ERRNO));
-	} else {
-		tst_resm(TFAIL, "unexpected error - "
-			 "%d : %s", TEST_ERRNO, strerror(TEST_ERRNO));
-	}
+	if (TST_ERR == tc[i].error)
+		tst_res(TPASS | TTERRNO, "expected failure");
+	else
+		tst_res(TFAIL | TTERRNO, "unexpected failure");
 
 	exit(0);
 }
 
-void sighandler(int sig)
+static void sighandler(int sig)
 {
-	if (sig == SIGHUP)
-		return;
-	else
-		tst_brkm(TBROK, NULL, "unexpected signal %d received", sig);
+	if (sig != SIGHUP)
+		tst_brk(TBROK, "unexpected signal %d received", sig);
 }
 
-#ifdef UCLINUX
-/*
- * do_child_uclinux() - capture signals, re-initialize s_buf then call do_child
- *                      with the appropriate argument
- */
-void do_child_uclinux(void)
+static void setup(void)
 {
-	int i = i_uclinux;
+	SAFE_SIGNAL(SIGHUP, sighandler);
 
-	tst_sig(FORK, sighandler, cleanup);
+	/* get an IPC resource key */
+	semkey = GETIPCKEY();
 
-	/* initialize the s_buf buffer */
-	s_buf.sem_op = TC[i].op;
-	s_buf.sem_flg = TC[i].flg;
-	s_buf.sem_num = TC[i].num;
+	/*
+	 * create a semaphore set with read and alter permissions and PSEMS
+	 * "primitive" semaphores.
+	 */
+	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
+	    -1)
+		tst_brk(TBROK | TERRNO, "couldn't create semaphore in setup");
+}
 
-	do_child(i);
+static void cleanup(void)
+{
+	union semun arr;
+
+	if (sem_id != -1) {
+		if (semctl(sem_id, 0, IPC_RMID, arr) == -1)
+			tst_res(TINFO, "WARNING: semaphore deletion failed.");
+	}
 }
-#endif
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void run(unsigned int i)
 {
+	pid_t pid;
 
-	tst_sig(FORK, sighandler, cleanup);
+#ifdef UCLINUX
+	maybe_run_child(&do_child_uclinux, "dd", &i_uclinux, &sem_id);
+#endif
+	/* initialize the s_buf buffer */
+	s_buf.sem_op = tc[i].op;
+	s_buf.sem_flg = tc[i].flg;
+	s_buf.sem_num = tc[i].num;
 
-	TEST_PAUSE;
+	/* initialize all of the primitive semaphores */
+	if (semctl(sem_id, tc[i].num, SETVAL, tc[i].semunptr) == -1)
+		tst_brk(TBROK | TERRNO, "semctl() failed");
 
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See ../lib/libipc.c for more information.
-	 */
-	tst_tmpdir();
+	pid = SAFE_FORK();
 
-	/* get an IPC resource key */
-	semkey = getipckey();
+	if (pid == 0) {	/* child */
+#ifdef UCLINUX
+		if (self_exec(av[0], "dd", i, sem_id) < 0)
+			tst_brk(TBROK, "could not self_exec");
+#else
+		do_child(i);
+#endif
+	} else {
+		process_state_wait2(pid, 'S');
+
+		/*
+		 * If we are testing for EIDRM then remove
+		 * the semaphore, else send a signal that
+		 * must be caught as we are testing for
+		 * EINTR.
+		 */
+		if (tc[i].error == EIDRM) {
+			/* remove the semaphore resource */
+			cleanup();
+		} else {
+			SAFE_KILL(pid, SIGHUP);
+		}
 
-	/* create a semaphore set with read and alter permissions */
-	/* and PSEMS "primitive" semaphores                       */
-	if ((sem_id_1 =
-	     semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
+		/* let the child carry on */
+		waitpid(pid, NULL, 0);
 	}
+
+	/*
+	 * recreate the semaphore resource if needed
+	 */
+	if (tc[i].error == EINTR)
+		return;
+
+	if ((sem_id = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) ==
+	    -1)
+		tst_brk(TBROK | TERRNO, "couldn't recreate semaphore");
 }
 
+#ifdef UCLINUX
 /*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- *	       or premature exit.
+ * do_child_uclinux() - capture signals, re-initialize s_buf then call do_child
+ *                      with the appropriate argument
  */
-void cleanup(void)
+static void do_child_uclinux(void)
 {
-	/* if it exists, remove the semaphore resource */
-	rm_sema(sem_id_1);
+	int i = i_uclinux;
+
+	/* initialize the s_buf buffer */
+	s_buf.sem_op = tc[i].op;
+	s_buf.sem_flg = tc[i].flg;
+	s_buf.sem_num = tc[i].num;
 
-	tst_rmdir();
+	do_child(i);
 }
+#endif
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tc),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.forks_child = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
