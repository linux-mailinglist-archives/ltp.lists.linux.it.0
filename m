Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9C359C6A
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E63E23C7F34
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:55:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80A463C7359
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:12 +0200 (CEST)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D0B9F1A0110E
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1617965710; i=@fujitsu.com;
 bh=Xqwutuqjg/I+9OeS1cKTp2uvstQLdvPl47xJPYvQwbY=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=aJVCCGl+Y7ajkY1uHnrIQEdkzgQxLOWG79Dy2NeOp4qDa43N1Ko0F0gADZA73Kktt
 FvSqHnDlvQ9B8nFdcjj0zHaI3HRizbqo4ldMtCnfAdTnBf3EYLJRCXtnlCGV7WZRNf
 cn94Ug2ldpwyTVqpO9+XIVsIK96d4EEJRFOpNvTHg1nlagROEtLTUWXW9rL9SqV/ZS
 l3hLaD6DHIGqdPNt1Bs86Eif7sg046LW8AICAr3FXPf6J/viXeN/H5SMa/7jPyhOCc
 ZmyQngipalmEv9EsisRKJwaIYQI40SrMKcelhpTtnJAgtPmlx4BsRfujqtcu8k3r4A
 X0CS4lBpSjgQg==
Received: from [100.112.196.73] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 42/56-46412-D8230706;
 Fri, 09 Apr 2021 10:55:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxRbfXqCD
 BYNEKMYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNWPexQNMBa9nMFYcmzyHsYFxTXUXIxeHkMA8
 Jon3Nz+zQDi7GSX6GmexdTFycrAJaEo861zADGKLCEhIdDS8ZQexmQXUJZZP+sUE0iAsMIVR4
 seu82BFLAIqElcefmUCsXkFPCQaFxwHi0sIKEhMefgezOYU8JR4+e0cC4gtJJAocahnElS9oM
 TJmU9YIBZISBx88QKqV1HiUsc3Rgi7SqLzw3G2CYz8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6
 uoYGBrqGhka6hpYWuobmxXmKVbpJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgUKYUHFu7
 g7HnzQe9Q4ySHExKory/mAoShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwWhoC5QSLUtNTK9Iyc
 4ARApOW4OBREuE9rA+U5i0uSMwtzkyHSJ1itOTYPHfpImaOLV0LljBzPLh6bxWzEEtefl6qlD
 jvKZB5AiANGaV5cONgUXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvN8gUnsy8Eritr4A
 OYgI6qORgLshBJYkIKakGJmfN5zv+ZytdXnhb3OuE+y0l7ks+s2Im35nmeKL/OktZRc1C2zdt
 /g5b81suuGXmH9/6Lyr15VcNmVknPtjJTjffHyH64+0CxZZZwgssTGdGzGez+hNvvr3NN3GvA
 0sG/9uWyxt/Wc/1P502ydrg/Ipn9+7uWCSxy1Gp6ikn25fCTWk+31KfRVw7V3fRqqnsb8UJ4W
 Uztk++lrVCRDG3o2dmeNQ3n90qH/O/PCyed63g4BvJj8Gas9La3f4di3/20qjs/5TlRr0FEiZ
 XFpwzyjg32eCmpWjAOT7L8PXPGe/sqfOVe16ZKXTRiWVH5s5Iv45YZ5GsSZ0eAvwfs//J11kv
 /O7Z5RR6+1x6qrfIWiWW4oxEQy3mouJEAIv3UYldAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-12.tower-285.messagelabs.com!1617965709!723016!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28941 invoked from network); 9 Apr 2021 10:55:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-12.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Apr 2021 10:55:09 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 139At2ng005832
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 9 Apr 2021 11:55:08 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 11:55:06 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 9 Apr 2021 19:55:05 +0800
Message-ID: <1617969305-2237-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <YHAoQooWArsl2rgD@yuki>
 <1617969305-2237-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] syscalls/semctl01: Convert into new api 1)Use
 SAFE MACRO 2)Remove useless macro and UCLINUX 3)Use IPC_PRIVATE instead of
 key
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/semctl/Makefile |   2 +-
 .../kernel/syscalls/ipc/semctl/semctl01.c     | 558 +++++-------------
 2 files changed, 155 insertions(+), 405 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 7b7a11d62..42d00f1cd 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-semctl01 semctl06: LTPLDLIBS = -lltpipc
+semctl06: LTPLDLIBS = -lltpipc
 semctl02 semctl03 semctl04 semctl05 semctl07 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl01.c b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
index 2f443db89..3b410d80e 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl01.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl01.c
@@ -1,429 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2001
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program;  if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
-
-/*
- * NAME
- *	semctl01.c
+/*\
+ * [Description]
  *
- * DESCRIPTION
- *	semctl01 - test the 13 possible semctl() commands
- *
- * ALGORITHM
- *	create a semaphore set with read and alter permissions
- *	loop if that option was specified
- *	  loop through the test cases
- *	    do any setup required for the test case
- *	    make the semctl() call using the TEST() macro
- *	    check the return code
- *	      if failure, issue a FAIL message.
- *	    otherwise,
- *	      if doing functionality testing
- *		call the appropriate test function
- *		if correct,
- *			issue a PASS message
- *		otherwise
- *			issue a FAIL message
- *	call cleanup
+ * Test the 13 possible semctl() commands
  */
 
-
-#ifndef _GNU_SOURCE
 #define _GNU_SOURCE
-#endif
-#include <sys/wait.h>
-#include "ipcsem.h"
-#include "safe_macros.h"
+#include <stdlib.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "lapi/sem.h"
+#include "libnewipc.h"
 
-char *TCID = "semctl01";
+#define INCVAL 2
+#define NEWMODE 066
+#define NCHILD  5
+#define SEMUN_CAST (union semun)
 
-static int sem_id_1 = -1;
+static int sem_id = -1;
 static int sem_index;
-
-/*
- * These are the various setup and check functions for the 10 different
- * commands that are available for the semctl() call.
- */
-static void func_stat(void);
-static void set_setup(void), func_set(void);
-static void func_gall(void);
-static void cnt_setup(int), func_cnt(int);
-static void pid_setup(void), func_pid(int);
-static void func_gval(int);
-static void sall_setup(void), func_sall(void);
-static void func_sval(void);
-static void func_rmid(void);
-static void child_cnt(void);
-static void child_pid(void);
-static void func_iinfo(int);
-static void func_sinfo(void);
-static void func_sstat(int);
-
 static struct semid_ds buf;
 static struct seminfo ipc_buf;
 static unsigned short array[PSEMS];
 static struct sembuf sops;
-
-#define INCVAL 2
-#define NEWMODE	066
-#define NCHILD	5
-#define SEM2	2
-#define SEM4	4
-#define ONE	1
-#ifdef _XLC_COMPILER
-#define SEMUN_CAST
-#else
-#define SEMUN_CAST (union semun)
-#endif
-
 static int pid_arr[NCHILD];
 
-#ifdef UCLINUX
-#define PIPE_NAME	"semctl01"
-static char *argv0;
-static int sem_op;
-#endif
-
-static struct test_case_t {
-	int *semid;
-	int semnum;
-	int cmd;
-	void (*func_test) ();
-	union semun arg;
-	void (*func_setup) ();
-} TC[] = {
-	{&sem_id_1, 0, IPC_STAT, func_stat, SEMUN_CAST & buf, NULL},
-	{&sem_id_1, 0, IPC_SET, func_set, SEMUN_CAST & buf, set_setup},
-	{&sem_id_1, 0, GETALL, func_gall, SEMUN_CAST array, NULL},
-	{&sem_id_1, SEM4, GETNCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
-	{&sem_id_1, SEM2, GETPID, func_pid, SEMUN_CAST & buf, pid_setup},
-	{&sem_id_1, SEM2, GETVAL, func_gval, SEMUN_CAST & buf, NULL},
-	{&sem_id_1, SEM4, GETZCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
-	{&sem_id_1, 0, SETALL, func_sall, SEMUN_CAST array, sall_setup},
-	{&sem_id_1, SEM4, SETVAL, func_sval, SEMUN_CAST INCVAL, NULL},
-	{&sem_id_1, 0, IPC_INFO, func_iinfo, SEMUN_CAST & ipc_buf, NULL},
-	{&sem_id_1, 0, SEM_INFO, func_sinfo, SEMUN_CAST & ipc_buf, NULL},
-	{&sem_index, 0, SEM_STAT, func_sstat, SEMUN_CAST & buf, NULL},
-	{&sem_id_1, 0, IPC_RMID, func_rmid, SEMUN_CAST & buf, NULL},
-};
-
-int TST_TOTAL = ARRAY_SIZE(TC);
-
 static void kill_all_children(void)
 {
-	int j, status;
+	int j;
 
-	for (j = 0; j < NCHILD; j++) {
-		SAFE_KILL(cleanup, pid_arr[j], SIGKILL);
-	}
+	for (j = 0; j < NCHILD; j++)
+		SAFE_KILL(pid_arr[j], SIGKILL);
 
-	/*
-	 * make sure children finished before we proceed with next testcase
-	 */
-	for (j = 0; j < NCHILD; j++) {
-		SAFE_WAIT(cleanup, &status);
-	}
+	for (j = 0; j < NCHILD; j++)
+		SAFE_WAIT(NULL);
 }
 
-int main(int argc, char *argv[])
-{
-	int lc;
-	int i;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-#ifdef UCLINUX
-	argv0 = argv[0];
-	maybe_run_child(&child_pid, "nd", 1, &sem_id_1);
-	maybe_run_child(&child_cnt, "ndd", 2, &sem_id_1, &sem_op);
-#endif
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			/*
-			 * Set up any conditions if needed
-			 */
-			if (TC[i].func_setup != NULL) {
-				/* call the setup function */
-				switch (TC[i].cmd) {
-				case GETNCNT:
-					(*TC[i].func_setup) (-ONE);
-					break;
-				case GETZCNT:
-					(*TC[i].func_setup) (0);
-					break;
-				default:
-					(*TC[i].func_setup) ();
-					break;
-				}
-			}
-
-			TEST(semctl(*(TC[i].semid), TC[i].semnum, TC[i].cmd,
-				    TC[i].arg));
-
-			if (TEST_RETURN == -1) {
-				tst_resm(TFAIL, "%s call failed - errno = %d "
-					 ": %s", TCID, TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-			} else {
-				/*
-				 * call the appropriate test function
-				 * and pass the return value where it
-				 * is needed to perform certain tests.
-				 */
-				switch (TC[i].cmd) {
-				case GETNCNT:
-				case GETZCNT:
-				case GETPID:
-				case GETVAL:
-				case IPC_INFO:
-				case SEM_STAT:
-					(*TC[i].func_test) (TEST_RETURN);
-					break;
-				default:
-					(*TC[i].func_test) ();
-					break;
-				}
-			}
-
-			/*
-			 * If testing GETNCNT or GETZCNT, clean up the children.
-			 */
-			switch (TC[i].cmd) {
-			case GETNCNT:
-			case GETZCNT:
-				kill_all_children();
-				break;
-			}
-		}
-		/*
-		 * recreate the semaphore resource if looping
-		 */
-		if (TEST_LOOPING(lc)) {
-			sem_id_1 = semget(semkey, PSEMS,
-					  IPC_CREAT | IPC_EXCL | SEM_RA);
-			if (sem_id_1 == -1)
-				tst_brkm(TBROK, cleanup,
-					 "couldn't recreate " "semaphore");
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
-}
-
-/*
- * func_stat() - check the functionality of the IPC_STAT command with semctl()
- */
 static void func_stat(void)
 {
-	/* check the number of semaphores and the ipc_perm.mode value */
 	if (buf.sem_nsems == PSEMS && buf.sem_perm.mode == (SEM_RA))
-		tst_resm(TPASS, "buf.sem_nsems and buf.sem_perm.mode"
-			 " are correct");
+		tst_res(TPASS, "buf.sem_nsems and buf.sem_perm.mode are correct");
 	else
-		tst_resm(TFAIL, "semaphore STAT info is incorrect");
+		tst_res(TFAIL, "semaphore STAT info is incorrect");
 }
 
-/*
- * set_setup() - set up for the IPC_SET command with semctl()
- */
 static void set_setup(void)
 {
-	/* set up a new mode for the semaphore set */
 	buf.sem_perm.mode = SEM_RA | NEWMODE;
 }
 
-/*
- * func_set() - check the functionality of the IPC_SET command with semctl()
- */
 static void func_set(void)
 {
-	/* first stat the semaphore to get the new data */
-	if (semctl(sem_id_1, 0, IPC_STAT, (union semun)&buf) == -1) {
-		tst_resm(TBROK, "stat failed in func_set()");
-		return;
-	}
+	SAFE_SEMCTL(sem_id, 0, IPC_STAT, (union semun)&buf);
 
-	/* check that the new mode is what we set */
 	if (buf.sem_perm.mode == (SEM_RA | NEWMODE))
-		tst_resm(TPASS, "buf.sem_perm.mode is correct");
+		tst_res(TPASS, "buf.sem_perm.mode is correct");
 	else
-		tst_resm(TFAIL, "semaphore mode info is incorrect");
+		tst_res(TFAIL, "semaphore mode info is incorrect");
 }
 
-/*
- * func_gall() - check the functionality of the GETALL command with semctl()
- */
 static void func_gall(void)
 {
 	int i;
 
-	/* the initial value of the primitive semaphores should be zero */
 	for (i = 0; i < PSEMS; i++) {
 		if (array[i] != 0) {
-			tst_resm(TFAIL, "semaphore %d has unexpected value", i);
+			tst_res(TFAIL, "semaphore %d has unexpected value", i);
 			return;
 		}
 	}
-	tst_resm(TPASS, "semaphores have expected values");
+	tst_res(TPASS, "semaphores have expected values");
+}
+
+static void child_cnt(void)
+{
+	sops.sem_num = 4;
+	sops.sem_flg = 0;
+
+	/*
+	 * Do a semop that will cause the child to sleep.
+	 * The child process will be killed in the func_ncnt
+	 * routine which should cause an error to be return
+	 * by the semop() call.
+	 */
+	if (semop(sem_id, &sops, 1) != -1)
+		tst_brk(TBROK, "semop succeeded - cnt_setup");
 }
 
-/*
- * cnt_setup() - set up for the GETNCNT and GETZCNT commands with semctl()
- */
 static void cnt_setup(int opval)
 {
 	int pid, i;
 
-	sops.sem_num = SEM4;
+	sops.sem_num = 4;
 	sops.sem_flg = 0;
-
 	/*
 	 * if seting up for GETZCNT, the semaphore value needs to be positive
 	 */
 	if (opval == 0) {
-		/* initialize the semaphore value to ONE */
-		sops.sem_op = ONE;
-		if (semop(sem_id_1, &sops, 1) == -1)
-			tst_brkm(TBROK, cleanup, "semop #1 failed - cnt_setup");
+		sops.sem_op = 1;
+		SAFE_SEMOP(sem_id, &sops, 1);
 	}
 
-	/* set the correct operation */
 	sops.sem_op = opval;
 	for (i = 0; i < NCHILD; i++) {
-		/* fork five children to wait */
-		pid = FORK_OR_VFORK();
-		if (pid == -1)
-			tst_brkm(TBROK, cleanup, "fork failed in cnt_setup");
-
+		pid = SAFE_FORK();
 		if (pid == 0) {
-#ifdef UCLINUX
-			sem_op = sops.sem_op;
-			if (self_exec(argv0, "ndd", 2, sem_id_1, sem_op) < 0)
-				tst_brkm(TBROK, cleanup, "self_exec failed "
-					 "in cnt_setup");
-#else
 			child_cnt();
-#endif
 		} else {
-			TST_PROCESS_STATE_WAIT(cleanup, pid, 'S');
-			/* save the pid so we can kill it later */
+			TST_PROCESS_STATE_WAIT(pid, 'S', 0);
 			pid_arr[i] = pid;
 		}
 	}
 }
 
-static void child_cnt(void)
+static void func_cnt(int rval)
 {
-#ifdef UCLINUX
-	sops.sem_op = (short int)sem_op;
-#endif
+	if (rval == NCHILD)
+		tst_res(TPASS, "number of sleeping processes is correct");
+	else
+		tst_res(TFAIL, "number of sleeping processes is not correct");
+}
 
-	sops.sem_num = SEM4;
+static void child_pid(void)
+{
+	sops.sem_num = 2;
+	sops.sem_op = 1;
 	sops.sem_flg = 0;
-
 	/*
-	 * Do a semop that will cause the child to sleep.
-	 * The child process will be killed in the func_ncnt
-	 * routine which should cause an error to be return
-	 * by the semop() call.
+	 * Do a semop that will increment the semaphore.
 	 */
-	if (semop(sem_id_1, &sops, 1) != -1)
-		tst_resm(TBROK, "semop succeeded - cnt_setup");
-
+	SAFE_SEMOP(sem_id, &sops, 1);
 	exit(0);
 }
 
-/*
- * func_cnt() - check the functionality of the GETNCNT and GETZCNT commands
- *	        with semctl()
- */
-static void func_cnt(int rval)
-{
-
-	if (rval == NCHILD)
-		tst_resm(TPASS, "number of sleeping processes is correct");
-	else
-		tst_resm(TFAIL, "number of sleeping processes is not correct");
-}
-
-/*
- * pid_setup() - set up for the GETPID command with semctl()
- */
 static void pid_setup(void)
 {
 	int pid;
 
-	/*
-	 * Fork a child to do a semop that will pass.
-	 */
-	pid = FORK_OR_VFORK();
-	if (pid == -1)
-		tst_brkm(TBROK, cleanup, "fork failed in pid_setup()");
-
-	if (pid == 0) {		/* child */
-#ifdef UCLINUX
-		if (self_exec(argv0, "nd", 1, sem_id_1) < 0)
-			tst_brkm(TBROK, cleanup, "self_exec failed "
-				 "in pid_setup()");
-#else
+	pid = SAFE_FORK();
+	if (pid == 0) {
 		child_pid();
-#endif
 	} else {
-		pid_arr[SEM2] = pid;
-		TST_PROCESS_STATE_WAIT(cleanup, pid, 'Z');
+		pid_arr[2] = pid;
+		TST_PROCESS_STATE_WAIT(pid, 'Z', 0);
 	}
 }
 
-static void child_pid(void)
-{
-	sops.sem_num = SEM2;
-	sops.sem_op = ONE;
-	sops.sem_flg = 0;
-	/*
-	 * Do a semop that will increment the semaphore.
-	 */
-	if (semop(sem_id_1, &sops, 1) == -1)
-		tst_resm(TBROK, "semop failed - pid_setup");
-	exit(0);
-}
-
-/*
- * func_pid() - check the functionality of the GETPID command with semctl()
- */
 static void func_pid(int rval)
 {
-	/* compare the rval (pid) to the saved pid from the setup */
-	if (rval == pid_arr[SEM2])
-		tst_resm(TPASS, "last pid value is correct");
+	if (rval == pid_arr[2])
+		tst_res(TPASS, "last pid value is correct");
 	else
-		tst_resm(TFAIL, "last pid value is not correct");
+		tst_res(TFAIL, "last pid value is not correct");
 }
 
-/*
- * func_gval() - check the functionality of the GETVAL command with semctl()
- */
 static void func_gval(int rval)
 {
 	/*
@@ -431,142 +164,159 @@ static void func_gval(int rval)
 	 * to ONE as it was set in the last test (GETPID).
 	 */
 	if (rval == 1)
-		tst_resm(TPASS, "semaphore value is correct");
+		tst_res(TPASS, "semaphore value is correct");
 	else
-		tst_resm(TFAIL, "semaphore value is not correct");
+		tst_res(TFAIL, "semaphore value is not correct");
 }
 
-/*
- * all_setup() - set up for the SETALL command with semctl()
- */
 static void sall_setup(void)
 {
 	int i;
 
 	for (i = 0; i < PSEMS; i++) {
-		/* initialize the array values to 3 */
 		array[i] = 3;
 	}
 }
 
-/*
- * func_sall() - check the functionality of the SETALL command with semctl()
- */
 static void func_sall(void)
 {
 	int i;
 	unsigned short rarray[PSEMS];
 
-	/*
-	 * do a GETALL and compare the values to those set above
-	 */
-
-	if (semctl(sem_id_1, 0, GETALL, (union semun)rarray) == -1)
-		tst_brkm(TBROK, cleanup, "semctl failed in func_sall");
-
+	SAFE_SEMCTL(sem_id, 0, GETALL, (union semun)rarray);
 	for (i = 0; i < PSEMS; i++) {
 		if (array[i] != rarray[i]) {
-			tst_resm(TFAIL, "semaphore values are not correct");
+			tst_res(TFAIL, "semaphore values are not correct");
 			return;
 		}
 	}
 
-	tst_resm(TPASS, "semaphore values are correct");
+	tst_res(TPASS, "semaphore values are correct");
 }
 
-/*
- * func_sval() - check the functionality of the SETVAL command with semctl()
- */
 static void func_sval(void)
 {
 	int semv;
 	union semun arr;
 
-	/*
-	 * do a GETVAL and compare it to the value set above
-	 */
-
-	semv = semctl(sem_id_1, SEM4, GETVAL, arr);
-	if (semv == -1)
-		tst_brkm(TBROK, cleanup, "semctl failed in func_sval");
-
+	semv = SAFE_SEMCTL(sem_id, 4, GETVAL, arr);
 	if (semv != INCVAL)
-		tst_resm(TFAIL, "semaphore value is not what was set");
+		tst_res(TFAIL, "semaphore value is not what was set");
 	else
-		tst_resm(TPASS, "semaphore value is correct");
+		tst_res(TPASS, "semaphore value is correct");
 }
 
-/*
- * func_rmid() - check the functionality of the IPC_RMID command with semctl()
- */
 static void func_rmid(void)
 {
-
-	/*
-	 * do a semop() - we should get EINVAL
-	 */
-	if (semop(sem_id_1, &sops, 1) != -1)
-		tst_resm(TFAIL, "semop succeeded on expected fail");
-
-	if (errno != EINVAL)
-		tst_resm(TFAIL, "returned errno - %d - is not expected", errno);
-	else
-		tst_resm(TPASS, "semaphore appears to be removed");
-
-	sem_id_1 = -1;
+	TST_EXP_FAIL(semop(sem_id, &sops, 1), EINVAL, "semaphore appears to be removed");
+	sem_id = -1;
 }
 
 static void func_iinfo(int hidx)
 {
 	if (hidx >= 0) {
 		sem_index = hidx;
-		tst_resm(TPASS, "the highest index is correct");
+		tst_res(TPASS, "the highest index is correct");
 	} else {
 		sem_index = 0;
-		tst_resm(TFAIL, "the highest index is incorrect");
+		tst_res(TFAIL, "the highest index is incorrect");
 	}
 }
 
 static void func_sinfo(void)
 {
 	if (ipc_buf.semusz < 1)
-		tst_resm(TFAIL, "number of semaphore sets is incorrect");
+		tst_res(TFAIL, "number of semaphore sets is incorrect");
 	else
-		tst_resm(TPASS, "number of semaphore sets is correct");
+		tst_res(TPASS, "number of semaphore sets is correct");
 }
 
 static void func_sstat(int semidx)
 {
 	if (semidx >= 0)
-		tst_resm(TPASS, "id of the semaphore set is correct");
+		tst_res(TPASS, "id of the semaphore set is correct");
 	else
-		tst_resm(TFAIL, "id of the semaphore set is incorrect");
+		tst_res(TFAIL, "id of the semaphore set is incorrect");
 }
 
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
+static struct tcases {
+	int *semid;
+	int semnum;
+	int cmd;
+	void (*func_test) ();
+	union semun arg;
+	void (*func_setup) ();
+} tests[] = {
+	{&sem_id, 0, IPC_STAT, func_stat, SEMUN_CAST & buf, NULL},
+	{&sem_id, 0, IPC_SET, func_set, SEMUN_CAST & buf, set_setup},
+	{&sem_id, 0, GETALL, func_gall, SEMUN_CAST array, NULL},
+	{&sem_id, 4, GETNCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
+	{&sem_id, 2, GETPID, func_pid, SEMUN_CAST & buf, pid_setup},
+	{&sem_id, 2, GETVAL, func_gval, SEMUN_CAST & buf, NULL},
+	{&sem_id, 4, GETZCNT, func_cnt, SEMUN_CAST & buf, cnt_setup},
+	{&sem_id, 0, SETALL, func_sall, SEMUN_CAST array, sall_setup},
+	{&sem_id, 4, SETVAL, func_sval, SEMUN_CAST INCVAL, NULL},
+	{&sem_id, 0, IPC_INFO, func_iinfo, SEMUN_CAST & ipc_buf, NULL},
+	{&sem_id, 0, SEM_INFO, func_sinfo, SEMUN_CAST & ipc_buf, NULL},
+	{&sem_index, 0, SEM_STAT, func_sstat, SEMUN_CAST & buf, NULL},
+	{&sem_id, 0, IPC_RMID, func_rmid, SEMUN_CAST & buf, NULL},
+};
 
-	TST_CHECKPOINT_INIT(tst_rmdir);
+static void verify_semctl(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+	int rval;
+
+	if (sem_id == -1)
+		sem_id = SAFE_SEMGET(IPC_PRIVATE, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
+	if (tc->func_setup != NULL) {
+		switch (tc->cmd) {
+		case GETNCNT:
+			tc->func_setup(-1);
+			break;
+		case GETZCNT:
+			tc->func_setup(0);
+			break;
+		default:
+			tc->func_setup();
+			break;
+		}
+	}
 
-	/* get an IPC resource key */
-	semkey = getipckey();
+	rval = SAFE_SEMCTL(*(tc->semid), tc->semnum, tc->cmd, tc->arg);
+	switch (tc->cmd) {
+	case GETNCNT:
+	case GETZCNT:
+	case GETPID:
+	case GETVAL:
+	case IPC_INFO:
+	case SEM_STAT:
+		(*tc->func_test)(rval);
+		break;
+	default:
+		(*tc->func_test)();
+		break;
+	}
 
-	/* create a semaphore set with read and alter permissions */
-	sem_id_1 = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
-	if (sem_id_1 == -1)
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
+	if (tc->cmd == GETNCNT || tc->cmd == GETZCNT)
+		kill_all_children();
 }
 
-void cleanup(void)
+static void setup(void)
 {
-	/* if it exists, remove the semaphore resource */
-	rm_sema(sem_id_1);
+	sem_id = SAFE_SEMGET(IPC_PRIVATE, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
+}
 
-	tst_rmdir();
+static void cleanup(void)
+{
+	if (sem_id >= 0)
+		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_semctl,
+	.tcnt = ARRAY_SIZE(tests),
+	.forks_child = 1,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
