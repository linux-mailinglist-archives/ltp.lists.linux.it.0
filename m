Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BC338C47
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 490FE3C683A
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A60173C6828
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 642852000D5
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:48 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AqIurD61g7dZmuappc6zjOQqjBFIkLtp033Aq?=
 =?us-ascii?q?2lEZdDV+dMuEm8ey2MkKzBOcskd0ZFgMu/ClfJOBT3TV6IJv7eAqUIuKcQH6tA?=
 =?us-ascii?q?KTQr1KwofvzjbpES+71sM1781dWodkDtmYNzlHpOLbxCX9LNo62tmA98mT9ILj?=
 =?us-ascii?q?5lNgVxtjZa0lzyoRMHf5LmRMSANLBYU0GfOnj6IpmxObZX8VYs6nb0N1PdTrmt?=
 =?us-ascii?q?ujrvLbSC9DLxsmxS3Ltjmw9YP9eiLy4j4uFx9J3pcumFKorzDE?=
X-IronPort-AV: E=Sophos;i="5.81,243,1610380800"; d="scan'208";a="105549595"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 20:02:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5C47F4CEA9B0
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 20:02:47 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 20:02:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 20:02:19 +0800
Message-ID: <1615550541-21714-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5C47F4CEA9B0.A1B47
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/5] syscalls/msgstress02: Convert into new api
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

1)Remove SIGTERM signal handler and ignore it
2)use fork because SAFE_FORK not clean the another writer or
reader proceess

It also missed process num limit check and we will add it in the future.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ipc/msgstress/Makefile    |   4 +-
 .../syscalls/ipc/msgstress/msgstress02.c      | 429 +++++-------------
 2 files changed, 116 insertions(+), 317 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
index 27caffb35..d80d0bf98 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-msgstress01: LTPLDLIBS = -lltpnewipc
-msgstress02 msgstress04: LTPLDLIBS = -lltpipc
+msgstress01 msgstress02: LTPLDLIBS = -lltpnewipc
+msgstress04: LTPLDLIBS = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
index e15131043..672f79e24 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
@@ -1,29 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2002
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
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
  *
  * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
  * 11/11/2002   Port to LTP     dbarrera@us.ibm.com
+ * 03/12/2021   Convert to new api xuyang2018.jy@cn.fujitsu.com
  */
 
-/*
+/*\
+ * [DESCRIPTION]
+ *
  * Get and manipulate a message queue.
- */
+ * Fork a number of processes (nprocs), each of which will create a message
+ * queue with several (nkids) reader/writer pairs which will read and write
+ * a number (iterations) of random length messages with specific values (keys).
+\*/
 
-#define _XOPEN_SOURCE 500
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <sys/ipc.h>
@@ -35,270 +28,82 @@
 #include <string.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include "test.h"
-#include "ipcmsg.h"
-#include "libmsgctl.h"
-
-char *TCID = "msgstress02";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "tst_safe_sysv_ipc.h"
 
-#define MAXNREPS	1000
-#ifndef CONFIG_COLDFIRE
-#define MAXNPROCS	 1000000	/* This value is set to an arbitrary high limit. */
-#else
-#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
-#endif
 #define MAXNKIDS	10
 
-static key_t keyarray[MAXNPROCS];
-static int pidarray[MAXNPROCS];
 static int rkidarray[MAXNKIDS];
 static int wkidarray[MAXNKIDS];
-static int tid;
-static int nprocs, nreps, nkids, MSGMNI;
-static int procstat;
-
-void setup(void);
-void cleanup(void);
-
-static void term(int);
-static int dotest(key_t, int);
-static void cleanup_msgqueue(int i, int tid);
-
+static int tid[MAXNPROCS];
+static int nprocs = 1000;
+static int nreps = 1000;
+static int nkids = MAXNKIDS;
 static char *opt_nprocs;
 static char *opt_nkids;
 static char *opt_nreps;
 
-static option_t options[] = {
-	{"n:", NULL, &opt_nprocs},
-	{"c:", NULL, &opt_nkids},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
+static struct tst_option options[] = {
+	{"n:", &opt_nprocs, "-n N     Number of processes"},
+	{"c:", &opt_nkids, "-c -N    Number of read/write child pairs"},
+	{"l:", &opt_nreps, "-l N     Number of iterations"},
+	{NULL, NULL, NULL}
 };
 
-static void usage(void)
-{
-	printf("  -n      Number of processes\n");
-	printf("  -c      Number of read/write child pairs\n");
-	printf("  -l      Number of iterations\n");
-}
-
-int main(int argc, char **argv)
-{
-	int i, j, ok, pid;
-	int count, status;
-
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
-
-	nreps = MAXNREPS;
-	nprocs = MSGMNI;
-	nkids = MAXNKIDS;
-
-	if (opt_nreps) {
-		nreps = atoi(opt_nreps);
-		if (nreps > MAXNREPS) {
-			tst_resm(TINFO,
-				 "Requested number of iterations too large, "
-				 "setting to Max. of %d", MAXNREPS);
-			nreps = MAXNREPS;
-		}
-	}
-
-	if (opt_nprocs) {
-		nprocs = atoi(opt_nprocs);
-		if (nprocs > MSGMNI) {
-			tst_resm(TINFO,
-				 "Requested number of processes too large, "
-				 "setting to Max. of %d", MSGMNI);
-			nprocs = MSGMNI;
-		}
-	}
-
-	if (opt_nkids) {
-		nkids = atoi(opt_nkids);
-		if (nkids > MAXNKIDS) {
-			tst_resm(TINFO,
-				 "Requested number of read/write pairs too "
-				 "large, setting to Max. of %d", MAXNKIDS);
-			nkids = MAXNKIDS;
-		}
-	}
-
-	procstat = 0;
-	srand48((unsigned)getpid() + (unsigned)(getppid() << 16));
-	tid = -1;
-
-	/* Setup signal handleing routine */
-	if (sigset(SIGTERM, term) == SIG_ERR) {
-		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
-	}
-	/* Set up array of unique keys for use in allocating message
-	 * queues
-	 */
-	for (i = 0; i < nprocs; i++) {
-		ok = 1;
-		do {
-			/* Get random key */
-			keyarray[i] = (key_t) lrand48();
-			/* Make sure key is unique and not private */
-			if (keyarray[i] == IPC_PRIVATE) {
-				ok = 0;
-				continue;
-			}
-			for (j = 0; j < i; j++) {
-				if (keyarray[j] == keyarray[i]) {
-					ok = 0;
-					break;
-				}
-				ok = 1;
-			}
-		} while (ok == 0);
-	}
-	/* Fork a number of processes (nprocs), each of which will
-	 * create a message queue with several (nkids) reader/writer
-	 * pairs which will read and write a number (iterations)
-	 * of random length messages with specific values (keys).
-	 */
-
-	for (i = 0; i < nprocs; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "\tFork failed (may be OK if under stress)");
-		}
-		/* Child does this */
-		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(keyarray[i], i));
-		}
-		pidarray[i] = pid;
-	}
-
-	count = 0;
-	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != PASS) {
-				tst_brkm(TFAIL, NULL,
-					 "Child exit status = %d",
-					 status >> 8);
-			}
-			count++;
-		} else {
-			if (errno != EINTR) {
-				break;
-			}
-#ifdef DEBUG
-			tst_resm(TINFO, "Signal detected during wait");
-#endif
-		}
-	}
-	/* Make sure proper number of children exited */
-	if (count != nprocs) {
-		tst_brkm(TFAIL,
-			 NULL,
-			 "Wrong number of children exited, Saw %d, Expected %d",
-			 count, nprocs);
-	}
-
-	tst_resm(TPASS, "Test ran successfully!");
-
-	cleanup();
-	tst_exit();
-}
-
-static void cleanup_msgqueue(int i, int tid)
+static void cleanup_msgqueue(int i, int id)
 {
 	/*
-	 * Decrease the value of i by 1 because it
-	 * is getting incremented even if the fork
-	 * is failing.
+	 * Decrease the value of i by 1 because it is getting incremented
+	 * even if the fork is failing.
 	 */
-
 	i--;
-	/*
-	 * Kill all children & free message queue.
-	 */
+
+	 /* Kill all children & free message queue. */
 	for (; i >= 0; i--) {
 		(void)kill(rkidarray[i], SIGKILL);
 		(void)kill(wkidarray[i], SIGKILL);
 	}
-
-	if (msgctl(tid, IPC_RMID, 0) < 0) {
-		tst_brkm(TFAIL | TERRNO, NULL, "Msgctl error in cleanup");
-	}
+	SAFE_MSGCTL(id, IPC_RMID, 0);
 }
 
-static int dotest(key_t key, int child_process)
+static void dotest(key_t key, int child_process, int id)
 {
-	int id, pid;
-	int i, count, status, exit_status;
-
-	sighold(SIGTERM);
-	if ((id = msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR)) < 0) {
-		printf("msgget() error in child %d: %s\n",
-			child_process, strerror(errno));
-		return FAIL;
-	}
-	tid = id;
-	sigrelse(SIGTERM);
-
-	exit_status = PASS;
+	int pid, i, count;
 
 	for (i = 0; i < nkids; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			printf("Fork failure in the first child of child group %d\n",
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the first child of child group %d\n",
 				child_process);
-			cleanup_msgqueue(i, tid);
-			return FAIL;
+			cleanup_msgqueue(i, id);
+			return;
 		}
 		/* First child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(doreader(key, tid, getpid(),
-					child_process, nreps));
+			msg_do_reader(key, id, getpid(), child_process, nreps);
+			exit(0);
 		}
 		rkidarray[i] = pid;
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			printf("Fork failure in the second child of child group %d\n",
-				child_process);
-			/*
-			 * Kill the reader child process
-			 */
-			(void)kill(rkidarray[i], SIGKILL);
 
-			cleanup_msgqueue(i, tid);
-			return FAIL;
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the second child of child group %d\n",
+				child_process);
+			cleanup_msgqueue(i, id);
+			return;
 		}
 		/* Second child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(dowriter(key, tid, rkidarray[i],
-					child_process, nreps));
+			msg_do_writer(key, id, rkidarray[i], child_process, nreps);
+			exit(0);
 		}
 		wkidarray[i] = pid;
 	}
 	/* Parent does this */
 	count = 0;
 	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != PASS) {
-				printf("Child exit status = %d from child group %d\n",
-					status >> 8, child_process);
-				for (i = 0; i < nkids; i++) {
-					kill(rkidarray[i], SIGTERM);
-					kill(wkidarray[i], SIGTERM);
-				}
-				if (msgctl(tid, IPC_RMID, 0) < 0) {
-					printf("msgctl() error: %s\n",
-						strerror(errno));
-				}
-				return FAIL;
-			}
+		if (wait(NULL) > 0) {
 			count++;
 		} else {
 			if (errno != EINTR) {
@@ -307,102 +112,96 @@ static int dotest(key_t key, int child_process)
 		}
 	}
 	/* Make sure proper number of children exited */
-	if (count != (nkids * 2)) {
-		printf("Wrong number of children exited in child group %d, saw %d, expected %d\n",
+	if (count != (nkids * 2))
+		tst_res(TFAIL,
+			"Wrong number of children exited in child group %d, saw %d, expected %d\n",
 			child_process, count, (nkids * 2));
-		if (msgctl(tid, IPC_RMID, 0) < 0) {
-			printf("msgctl() error: %s\n", strerror(errno));
-		}
-		return FAIL;
-	}
-	if (msgctl(id, IPC_RMID, 0) < 0) {
-		printf("msgctl() failure in child group %d: %s\n",
-			child_process, strerror(errno));
-		return FAIL;
-	}
-	return exit_status;
+
+	SAFE_MSGCTL(id, IPC_RMID, NULL);
 }
 
-static void term(int sig LTP_ATTRIBUTE_UNUSED)
+static void verify_msgstress(void)
 {
-	int i;
+	int i, pid;
+	int count;
 
-	if (procstat == 0) {
-#ifdef DEBUG
-		tst_resm(TINFO, "SIGTERM signal received, test killing kids");
-#endif
-		for (i = 0; i < nprocs; i++) {
-			if (pidarray[i] > 0) {
-				if (kill(pidarray[i], SIGTERM) < 0) {
-					printf("Kill failed to kill child %d",
-						i);
-					exit(FAIL);
-				}
-			}
+	/*
+	 * Set up array of unique keys for use in allocating message
+	 * queues
+	 */
+	setup_msg_key_array(nprocs);
+
+	for (i = 0; i < nprocs; i++) {
+		tid[i] = SAFE_MSGGET(keyarray[i], IPC_CREAT | S_IRUSR | S_IWUSR);
+		pid = SAFE_FORK();
+		if (pid == 0) {
+			dotest(keyarray[i], i, tid[i]);
+			exit(0);
 		}
-		return;
+		pidarray[i] = pid;
 	}
 
-	if (procstat == 2) {
-		fflush(stdout);
-		exit(PASS);
-	}
+	count = 0;
+	while (1) {
+		if ((wait(NULL)) > 0) {
+			count++;
 
-	if (tid == -1) {
-		exit(FAIL);
+		} else {
+			if (errno != EINTR)
+				break;
+		}
 	}
-	for (i = 0; i < nkids; i++) {
-		if (rkidarray[i] > 0)
-			kill(rkidarray[i], SIGTERM);
-		if (wkidarray[i] > 0)
-			kill(wkidarray[i], SIGTERM);
+	/* Make sure proper number of children exited */
+	if (count != nprocs) {
+		tst_brk(TFAIL,
+			"Wrong number of children exited, Saw %d, Expected %d",
+			count, nprocs);
+		return;
 	}
+
+	tst_res(TPASS, "Test ran successfully!");
 }
 
-void setup(void)
+static void setup(void)
 {
-	int nr_msgqs;
+	int avail_msg_queues;
 
-	tst_tmpdir();
+	avail_msg_queues = GET_AVAIL_QUEUES();
+	if (avail_msg_queues <= 0)
+		tst_brk(TCONF, "Max message queues is used, cannot create more.");
 
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	if (opt_nreps)
+		nreps = SAFE_STRTOL(opt_nreps, 1, MAXNREPS);
 
-	TEST_PAUSE;
+	if (opt_nprocs)
+		nprocs = SAFE_STRTOL(opt_nprocs, 1, MAXNPROCS);
 
-	nr_msgqs = get_max_msgqueues();
-	if (nr_msgqs < 0)
-		cleanup();
-
-	nr_msgqs -= get_used_msgqueues();
-	if (nr_msgqs <= 0) {
-		tst_resm(TBROK,
-			 "Max number of message queues already used, cannot create more.");
-		cleanup();
+	if (nprocs > avail_msg_queues) {
+		tst_res(TINFO, "Setting max processes to %u", avail_msg_queues);
+		nprocs = avail_msg_queues;
 	}
 
-	/*
-	 * Since msgmni scales to the memory size, it may reach huge values
-	 * that are not necessary for this test.
-	 * That's why we define NR_MSGQUEUES as a high boundary for it.
-	 */
-	MSGMNI = min(nr_msgqs, NR_MSGQUEUES);
+	if (opt_nkids)
+		nkids = SAFE_STRTOL(opt_nkids, 1, MAXNKIDS);
+
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "process is %d, iterations is %d, read/write pairs is %d",
+			nprocs, nreps, nkids);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	int status;
-
-#ifdef DEBUG
-	tst_resm(TINFO, "Removing the message queue");
-#endif
-	fflush(stdout);
-	(void)msgctl(tid, IPC_RMID, NULL);
-	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
-		(void)msgctl(tid, IPC_RMID, NULL);
-		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
-
-	}
+	int i = 0;
 
-	fflush(stdout);
-	tst_rmdir();
+	for (i = 0; i < nprocs; i++)
+		msgctl(tid[i], IPC_RMID, NULL);
 }
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.options = options,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.test_all = verify_msgstress,
+};
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
