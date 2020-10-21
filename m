Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801C294D1E
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454AB3C31A3
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 14:58:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 66C003C2474
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 1290A200B74
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 14:58:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,401,1596470400"; d="scan'208";a="100375804"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Oct 2020 20:58:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0530348990F4;
 Wed, 21 Oct 2020 20:58:17 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 21 Oct 2020 20:58:12 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 21 Oct 2020 20:57:52 +0800
Message-ID: <1603285074-28392-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200722154558.GB2714@yuki.lan>
 <1603285074-28392-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0530348990F4.AC230
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/4] syscalls/msgstress*: cleanup and convert into
 new api
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1)use some safe macros
2)remove SIGTERM signal handler and ignore it
3)remove CODEFIRE ifdef

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/syscalls/ipc/msgstress/Makefile    |   7 +-
 .../syscalls/ipc/msgstress/msgstress01.c      | 282 ++++---------
 .../syscalls/ipc/msgstress/msgstress02.c      | 371 +++++------------
 .../syscalls/ipc/msgstress/msgstress03.c      | 277 ++++---------
 .../syscalls/ipc/msgstress/msgstress04.c      | 372 +++++-------------
 5 files changed, 366 insertions(+), 943 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
index 2c8fa8e5b..aac90df51 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
@@ -3,10 +3,13 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
+
+LTPLDLIBS  = -lltpnewipc
 FILTER_OUT_MAKE_TARGETS         := msgstress_common
-LTPLDLIBS  += -lltpipc
+MAKE_TARGETS            := $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[1-4].c))
+$(MAKE_TARGETS): %: msgstress_common.o
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
index 0a660c042..0046039ad 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
@@ -1,25 +1,12 @@
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
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
  *
  * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
  * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
- */
-
-/*
+ * 10/21/2020   Convert to new api xuyang2018.jy@cn.fujitsu.com
+ *
  * Get and manipulate a message queue.
  */
 
@@ -31,105 +18,61 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
-#include <values.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/stat.h>
 #include <sys/ipc.h>
 #include <sys/msg.h>
-#include "test.h"
-#include "ipcmsg.h"
-#include "libmsgctl.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "tst_safe_sysv_ipc.h"
+#include "msgstress_common.h"
 
-char *TCID = "msgstress01";
-int TST_TOTAL = 1;
-
-#ifndef CONFIG_COLDFIRE
-#define MAXNPROCS	1000000	/* This value is set to an arbitrary high limit. */
-#else
-#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
-#endif
+#define MAXNPROCS       1000000
 #define MAXNREPS	100000
 
 static key_t keyarray[MAXNPROCS];
-static int pidarray[MAXNPROCS];
 static int tid;
 static int MSGMNI, nprocs, nreps;
-static int procstat;
-static int mykid;
-
-void setup(void);
-void cleanup(void);
-
-static int dotest(key_t key, int child_process);
-static void sig_handler();
-
 static char *opt_nprocs;
 static char *opt_nreps;
+static void cleanup(void);
 
-static option_t options[] = {
-	{"n:", NULL, &opt_nprocs},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
+static struct tst_option options[] = {
+	{"n:", &opt_nprocs, "-n N     Number of processes"},
+	{"l:", &opt_nreps, "-l N     Number of iterations"},
+	{NULL, NULL, NULL}
 };
 
-static void usage(void)
-{
-	printf("  -n      Number of processes\n");
-	printf("  -l      Number of iterations\n");
-}
-
-int main(int argc, char **argv)
+static void dotest(key_t key, int child_process)
 {
-	int i, j, ok, pid;
-	int count, status;
-	struct sigaction act;
-
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
+	int pid;
 
-	nreps = MAXNREPS;
-	nprocs = MSGMNI;
+	tid = SAFE_MSGGET(key, IPC_CREAT | S_IRUSR | S_IWUSR);
 
-	if (opt_nreps) {
-		nreps = atoi(opt_nreps);
-		if (nreps > MAXNREPS) {
-			tst_resm(TINFO,
-				 "Requested number of iterations too large, "
-				 "setting to Max. of %d", MAXNREPS);
-			nreps = MAXNREPS;
-		}
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		do_reader(key, tid, 1, child_process, nreps);
+		exit(0);
 	}
 
-	if (opt_nprocs) {
-		nprocs = atoi(opt_nprocs);
-		if (nprocs > MSGMNI) {
-			tst_resm(TINFO,
-				 "Requested number of processes too large, "
-				 "setting to Max. of %d", MSGMNI);
-			nprocs = MSGMNI;
-		}
-	}
+	do_writer(key, tid, 1, child_process, nreps);
+	SAFE_WAIT(NULL);
+	SAFE_MSGCTL(tid, IPC_RMID, NULL);
+}
+
+static void verify_msgstress(void)
+{
+	int i, j, ok, pid;
+	int count;
 
 	srand(getpid());
 	tid = -1;
 
-	/* Setup signal handling routine */
-	memset(&act, 0, sizeof(act));
-	act.sa_handler = sig_handler;
-	sigemptyset(&act.sa_mask);
-	sigaddset(&act.sa_mask, SIGTERM);
-	if (sigaction(SIGTERM, &act, NULL) < 0) {
-		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
-	}
-	/* Set up array of unique keys for use in allocating message
-	 * queues
-	 */
+	/* Set up array of unique keys for use in allocating message queues */
 	for (i = 0; i < nprocs; i++) {
 		ok = 1;
 		do {
-			/* Get random key */
 			keyarray[i] = (key_t) rand();
 			/* Make sure key is unique and not private */
 			if (keyarray[i] == IPC_PRIVATE) {
@@ -146,156 +89,83 @@ int main(int argc, char **argv)
 		} while (ok == 0);
 	}
 
-	/* Fork a number of processes, each of which will
+	/*
+	 * Fork a number of processes, each of which will
 	 * create a message queue with one reader/writer
 	 * pair which will read and write a number (iterations)
 	 * of random length messages with specific values.
 	 */
-
 	for (i = 0; i < nprocs; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "\tFork failed (may be OK if under stress)");
-		}
-		/* Child does this */
+		pid = SAFE_FORK();
 		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(keyarray[i], i));
+			dotest(keyarray[i], i);
+			exit(0);
 		}
-		pidarray[i] = pid;
 	}
 
 	count = 0;
+
 	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != 0) {
-				tst_brkm(TFAIL, NULL,
-					 "Child exit status = %d",
-					 status >> 8);
-			}
+		if (wait(NULL) > 0) {
 			count++;
 		} else {
-			if (errno != EINTR) {
+			if (errno != EINTR)
 				break;
-			}
-#ifdef DEBUG
-			tst_resm(TINFO, "Signal detected during wait");
-#endif
 		}
 	}
-	/* Make sure proper number of children exited */
-	if (count != nprocs) {
-		tst_brkm(TFAIL,
-			 NULL,
-			 "Wrong number of children exited, Saw %d, Expected %d",
-			 count, nprocs);
-	}
 
-	tst_resm(TPASS, "Test ran successfully!");
+	if (count != nprocs)
+		tst_brk(TFAIL, "Wrong number of children exited, Saw %d, Expected %d",
+			count, nprocs);
 
+	tst_res(TPASS, "Test ran successfully!");
 	cleanup();
-	tst_exit();
-}
-
-static int dotest(key_t key, int child_process)
-{
-	int id, pid;
-	int ret, status;
-
-	sighold(SIGTERM);
-	TEST(msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR));
-	if (TEST_RETURN < 0) {
-		printf("msgget() error in child %d: %s\n",
-			child_process, strerror(TEST_ERRNO));
-
-		return FAIL;
-	}
-	tid = id = TEST_RETURN;
-	sigrelse(SIGTERM);
-
-	fflush(stdout);
-	if ((pid = FORK_OR_VFORK()) < 0) {
-		printf("\tFork failed (may be OK if under stress)\n");
-		TEST(msgctl(tid, IPC_RMID, 0));
-		if (TEST_RETURN < 0) {
-			printf("mscgtl() error in cleanup: %s\n",
-				strerror(TEST_ERRNO));
-		}
-		return FAIL;
-	}
-	/* Child does this */
-	if (pid == 0)
-		exit(doreader(key, id, 1, child_process, nreps));
-	/* Parent does this */
-	mykid = pid;
-	procstat = 2;
-	ret = dowriter(key, id, 1, child_process, nreps);
-	wait(&status);
-
-	if (ret != PASS)
-		exit(FAIL);
-
-	if ((!WIFEXITED(status) || (WEXITSTATUS(status) != PASS)))
-		exit(FAIL);
-
-	TEST(msgctl(id, IPC_RMID, 0));
-	if (TEST_RETURN < 0) {
-		printf("msgctl() errno %d: %s\n",
-			TEST_ERRNO, strerror(TEST_ERRNO));
-
-		return FAIL;
-	}
-	return PASS;
 }
 
-static void sig_handler(void)
-{
-}
-
-void setup(void)
+static void setup(void)
 {
 	int nr_msgqs;
 
-	tst_tmpdir();
+	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%d", &nr_msgqs);
 
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	nr_msgqs -= GET_USED_QUEUES();
+	if (nr_msgqs <= 0)
+		tst_brk(TCONF, "Max number of message queues already used, "
+			"cannot create more.");
 
-	TEST_PAUSE;
+	MSGMNI = min(nr_msgqs, NR_MSGQUEUES);
 
-	nr_msgqs = get_max_msgqueues();
-	if (nr_msgqs < 0)
-		cleanup();
+	if (opt_nreps) {
+		nreps = SAFE_STRTOL(opt_nreps, 1, INT_MAX);
+		nreps = min(nreps, MAXNREPS);
+	} else {
+		nreps = MAXNREPS;
+	}
 
-	nr_msgqs -= get_used_msgqueues();
-	if (nr_msgqs <= 0) {
-		tst_resm(TBROK,
-			 "Max number of message queues already used, cannot create more.");
-		cleanup();
+	if (opt_nprocs) {
+		nprocs = SAFE_STRTOL(opt_nprocs, 1, INT_MAX);
+		nprocs = min(nprocs, MAXNPROCS);
+		nprocs = min(nprocs, MSGMNI);
+	} else {
+		nprocs = MSGMNI;
 	}
 
-	/*
-	 * Since msgmni scales to the memory size, it may reach huge values
-	 * that are not necessary for this test.
-	 * That's why we define NR_MSGQUEUES as a high boundary for it.
-	 */
-	MSGMNI = min(nr_msgqs, NR_MSGQUEUES);
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "Number of message queues is %d, process is %d, "
+		"iterations is %d", MSGMNI, nprocs, nreps);
 }
 
 void cleanup(void)
 {
-	int status;
-
-#ifdef DEBUG
-	tst_resm(TINFO, "Removing the message queue");
-#endif
-	(void)msgctl(tid, IPC_RMID, NULL);
-	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
-		(void)msgctl(tid, IPC_RMID, NULL);
-		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
-
-	}
-
-	tst_rmdir();
+	if (tid >= 0)
+		SAFE_MSGCTL(tid, IPC_RMID, NULL);
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
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
index e15131043..50e0310f0 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress02.c
@@ -1,25 +1,12 @@
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
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
  *
  * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
  * 11/11/2002   Port to LTP     dbarrera@us.ibm.com
- */
-
-/*
+ * 10/21/2020   Convert to new api xuyang2018.jy@cn.fujitsu.com
+ *
  * Get and manipulate a message queue.
  */
 
@@ -35,19 +22,13 @@
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
+#include "msgstress_common.h"
 
 #define MAXNREPS	1000
-#ifndef CONFIG_COLDFIRE
 #define MAXNPROCS	 1000000	/* This value is set to an arbitrary high limit. */
-#else
-#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
-#endif
 #define MAXNKIDS	10
 
 static key_t keyarray[MAXNPROCS];
@@ -56,84 +37,43 @@ static int rkidarray[MAXNKIDS];
 static int wkidarray[MAXNKIDS];
 static int tid;
 static int nprocs, nreps, nkids, MSGMNI;
-static int procstat;
-
-void setup(void);
-void cleanup(void);
-
-static void term(int);
-static int dotest(key_t, int);
-static void cleanup_msgqueue(int i, int tid);
-
 static char *opt_nprocs;
 static char *opt_nkids;
 static char *opt_nreps;
-
-static option_t options[] = {
-	{"n:", NULL, &opt_nprocs},
-	{"c:", NULL, &opt_nkids},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
+static void cleanup(void);
+static void dotest(key_t, int);
+
+static struct tst_option options[] = {
+	{"n:", &opt_nprocs, "-n N     Number of processes"},
+	{"c:", &opt_nkids, "-c -N    Number of read/write child pairs"},
+	{"l:", &opt_nreps, "-l N     Number of iterations"},
+	{NULL, NULL, NULL}
 };
 
-static void usage(void)
+static void cleanup_msgqueue(int i, int tid)
 {
-	printf("  -n      Number of processes\n");
-	printf("  -c      Number of read/write child pairs\n");
-	printf("  -l      Number of iterations\n");
+	/*
+	 * Decrease the value of i by 1 because it is getting incremented
+	 * even if the fork is failing.
+	 */
+	i--;
+
+	 /* Kill all children & free message queue. */
+	for (; i >= 0; i--) {
+		(void)kill(rkidarray[i], SIGKILL);
+		(void)kill(wkidarray[i], SIGKILL);
+	}
+	SAFE_MSGCTL(tid, IPC_RMID, 0);
 }
 
-int main(int argc, char **argv)
+static void verify_msgstress(void)
 {
 	int i, j, ok, pid;
-	int count, status;
-
-	tst_parse_opts(argc, argv, options, usage);
+	int count;
 
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
 	srand48((unsigned)getpid() + (unsigned)(getppid() << 16));
 	tid = -1;
 
-	/* Setup signal handleing routine */
-	if (sigset(SIGTERM, term) == SIG_ERR) {
-		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
-	}
 	/* Set up array of unique keys for use in allocating message
 	 * queues
 	 */
@@ -163,142 +103,76 @@ int main(int argc, char **argv)
 	 */
 
 	for (i = 0; i < nprocs; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "\tFork failed (may be OK if under stress)");
-		}
+		pid = SAFE_FORK();
 		/* Child does this */
 		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(keyarray[i], i));
+			dotest(keyarray[i], i);
+			exit(0);
 		}
 		pidarray[i] = pid;
 	}
 
 	count = 0;
 	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != PASS) {
-				tst_brkm(TFAIL, NULL,
-					 "Child exit status = %d",
-					 status >> 8);
-			}
+		if ((wait(NULL)) > 0) {
 			count++;
+
 		} else {
 			if (errno != EINTR) {
 				break;
 			}
-#ifdef DEBUG
-			tst_resm(TINFO, "Signal detected during wait");
-#endif
 		}
 	}
 	/* Make sure proper number of children exited */
-	if (count != nprocs) {
-		tst_brkm(TFAIL,
-			 NULL,
-			 "Wrong number of children exited, Saw %d, Expected %d",
-			 count, nprocs);
-	}
+	if (count != nprocs)
+		tst_brk(TFAIL,
+			"Wrong number of children exited, Saw %d, Expected %d",
+			count, nprocs);
 
-	tst_resm(TPASS, "Test ran successfully!");
+	tst_res(TPASS, "Test ran successfully!");
 
 	cleanup();
-	tst_exit();
-}
-
-static void cleanup_msgqueue(int i, int tid)
-{
-	/*
-	 * Decrease the value of i by 1 because it
-	 * is getting incremented even if the fork
-	 * is failing.
-	 */
-
-	i--;
-	/*
-	 * Kill all children & free message queue.
-	 */
-	for (; i >= 0; i--) {
-		(void)kill(rkidarray[i], SIGKILL);
-		(void)kill(wkidarray[i], SIGKILL);
-	}
-
-	if (msgctl(tid, IPC_RMID, 0) < 0) {
-		tst_brkm(TFAIL | TERRNO, NULL, "Msgctl error in cleanup");
-	}
 }
 
-static int dotest(key_t key, int child_process)
+static void dotest(key_t key, int child_process)
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
+	int pid, i, count;
 
-	exit_status = PASS;
+	tid = SAFE_MSGGET(key, IPC_CREAT | S_IRUSR | S_IWUSR);
 
 	for (i = 0; i < nkids; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			printf("Fork failure in the first child of child group %d\n",
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the first child of child group %d\n",
 				child_process);
 			cleanup_msgqueue(i, tid);
-			return FAIL;
+			return;
 		}
 		/* First child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(doreader(key, tid, getpid(),
-					child_process, nreps));
+			do_reader(key, tid, getpid(), child_process, nreps);
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
 
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the second child of child group %d\n",
+				child_process);
 			cleanup_msgqueue(i, tid);
-			return FAIL;
+			return;
 		}
 		/* Second child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(dowriter(key, tid, rkidarray[i],
-					child_process, nreps));
+			do_writer(key, tid, rkidarray[i], child_process, nreps);
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
+		if ((wait(NULL)) > 0) {
 			count++;
 		} else {
 			if (errno != EINTR) {
@@ -307,102 +181,71 @@ static int dotest(key_t key, int child_process)
 		}
 	}
 	/* Make sure proper number of children exited */
-	if (count != (nkids * 2)) {
-		printf("Wrong number of children exited in child group %d, saw %d, expected %d\n",
-			child_process, count, (nkids * 2));
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
-}
+	if (count != (nkids * 2))
+		tst_res(TFAIL, "Wrong number of children exited in child group "
+			"%d, saw %d, expected %d\n", child_process, count,
+			(nkids * 2));
 
-static void term(int sig LTP_ATTRIBUTE_UNUSED)
-{
-	int i;
-
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
-		}
-		return;
-	}
-
-	if (procstat == 2) {
-		fflush(stdout);
-		exit(PASS);
-	}
-
-	if (tid == -1) {
-		exit(FAIL);
-	}
-	for (i = 0; i < nkids; i++) {
-		if (rkidarray[i] > 0)
-			kill(rkidarray[i], SIGTERM);
-		if (wkidarray[i] > 0)
-			kill(wkidarray[i], SIGTERM);
-	}
+	SAFE_MSGCTL(tid, IPC_RMID, NULL);
 }
 
-void setup(void)
+static void setup(void)
 {
 	int nr_msgqs;
 
-	tst_tmpdir();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	nr_msgqs = get_max_msgqueues();
-	if (nr_msgqs < 0)
-		cleanup();
-
-	nr_msgqs -= get_used_msgqueues();
-	if (nr_msgqs <= 0) {
-		tst_resm(TBROK,
-			 "Max number of message queues already used, cannot create more.");
-		cleanup();
-	}
+	tid = -1;
+	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%d", &nr_msgqs);
 
+	nr_msgqs -= GET_USED_QUEUES();
+	if (nr_msgqs <= 0)
+		tst_brk(TCONF, "Max number of message queues already used, "
+			"cannot create more.");
 	/*
 	 * Since msgmni scales to the memory size, it may reach huge values
 	 * that are not necessary for this test.
 	 * That's why we define NR_MSGQUEUES as a high boundary for it.
 	 */
 	MSGMNI = min(nr_msgqs, NR_MSGQUEUES);
-}
 
-void cleanup(void)
-{
-	int status;
+	if (opt_nreps) {
+		nreps = SAFE_STRTOL(opt_nreps, 1, INT_MAX);
+		nreps = min(nreps, MAXNREPS);
+	} else {
+		nreps = MAXNREPS;
+	}
 
-#ifdef DEBUG
-	tst_resm(TINFO, "Removing the message queue");
-#endif
-	fflush(stdout);
-	(void)msgctl(tid, IPC_RMID, NULL);
-	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
-		(void)msgctl(tid, IPC_RMID, NULL);
-		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
+	if (opt_nkids) {
+		nkids = SAFE_STRTOL(opt_nkids, 1, INT_MAX);
+		nkids = min(nkids, MAXNKIDS);
+	} else {
+		nkids = MAXNKIDS;
+	}
 
+	if (opt_nprocs) {
+		nprocs = SAFE_STRTOL(opt_nprocs, 1, INT_MAX);
+		nprocs = min(nprocs, MAXNPROCS);
+		nprocs = min(nprocs, MSGMNI);
+	} else {
+		nprocs = MSGMNI;
 	}
 
-	fflush(stdout);
-	tst_rmdir();
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "Number of message queues is %d, process is %d, "
+		"iterations is %d, read/write pairs is %d",
+		MSGMNI, nprocs, nreps, nkids);
+}
+
+static void cleanup(void)
+{
+	if (tid >= 0)
+		SAFE_MSGCTL(tid, IPC_RMID, NULL);
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
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
index 294b401b1..6f6e01853 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
@@ -1,27 +1,14 @@
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
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
  *
  * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
  * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
- */
-
-/*
+ * 10/09/2020   Convert to new api xuyang2018.jy@cn.fujitsu.com
+ *
  * Get and manipulate a message queue.
- * Same as msgstress01 but gets the actual msgmni value under procfs.
+ * Same as msgstress01 but gets the actual msgmni value under procf.
  */
 
 #define _XOPEN_SOURCE 500
@@ -32,101 +19,61 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
-#include <values.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/stat.h>
 #include <sys/ipc.h>
 #include <sys/msg.h>
-#include "test.h"
-#include "ipcmsg.h"
-#include "libmsgctl.h"
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "tst_safe_sysv_ipc.h"
+#include "msgstress_common.h"
 
-char *TCID = "msgstress03";
-int TST_TOTAL = 1;
-
-#define MAXNPROCS	10000	/*These should be sufficient */
-#define MAXNREPS	10000	/*Else they srewup the system un-necessarily */
+#define MAXNPROCS       1000
+#define MAXNREPS	1000
 
 static key_t keyarray[MAXNPROCS];
-static int pidarray[MAXNPROCS];
 static int tid;
 static int MSGMNI, nprocs, nreps;
-static int procstat;
-static int mykid;
-
-void setup(void);
-void cleanup(void);
-
-static int dotest(key_t key, int child_process);
-static void sig_handler(int signo);
-
 static char *opt_nprocs;
 static char *opt_nreps;
+static void cleanup(void);
 
-static option_t options[] = {
-	{"n:", NULL, &opt_nprocs},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
+static struct tst_option options[] = {
+	{"n:", &opt_nprocs, "-n N     Number of processes"},
+	{"l:", &opt_nreps, "-l N     Number of iterations"},
+	{NULL, NULL, NULL}
 };
 
-static void usage(void)
-{
-	printf("  -n      Number of processes\n");
-	printf("  -l      Number of iterations\n");
-}
-
-int main(int argc, char **argv)
+static void dotest(key_t key, int child_process)
 {
-	int i, j, ok, pid;
-	int count, status;
-	struct sigaction act;
-
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
+	int pid;
 
-	nreps = MAXNREPS;
-	nprocs = MSGMNI;
+	tid = SAFE_MSGGET(key, IPC_CREAT | S_IRUSR | S_IWUSR);
 
-	if (opt_nreps) {
-		nreps = atoi(opt_nreps);
-		if (nreps > MAXNREPS) {
-			tst_resm(TINFO,
-				 "Requested number of iterations too large, "
-				 "setting to Max. of %d", MAXNREPS);
-			nreps = MAXNREPS;
-		}
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		do_reader(key, tid, 1, child_process, nreps);
+		exit(0);
 	}
 
-	if (opt_nprocs) {
-		nprocs = atoi(opt_nprocs);
-		if (nprocs > MSGMNI) {
-			tst_resm(TINFO,
-				 "Requested number of processes too large, "
-				 "setting to Max. of %d", MSGMNI);
-			nprocs = MSGMNI;
-		}
-	}
+	do_writer(key, tid, 1, child_process, nreps);
+	SAFE_WAIT(NULL);
+	SAFE_MSGCTL(tid, IPC_RMID, NULL);
+}
+
+static void verify_msgstress(void)
+{
+	int i, j, ok, pid;
+	int count;
 
 	srand(getpid());
 	tid = -1;
 
-	/* Setup signal handling routine */
-	memset(&act, 0, sizeof(act));
-	act.sa_handler = sig_handler;
-	sigemptyset(&act.sa_mask);
-	sigaddset(&act.sa_mask, SIGTERM);
-	if (sigaction(SIGTERM, &act, NULL) < 0) {
-		tst_brkm(TFAIL, NULL, "Sigset SIGTERM failed");
-	}
-	/* Set up array of unique keys for use in allocating message
-	 * queues
-	 */
+	/* Set up array of unique keys for use in allocating message queues */
 	for (i = 0; i < nprocs; i++) {
 		ok = 1;
 		do {
-			/* Get random key */
 			keyarray[i] = (key_t) rand();
 			/* Make sure key is unique and not private */
 			if (keyarray[i] == IPC_PRIVATE) {
@@ -143,148 +90,80 @@ int main(int argc, char **argv)
 		} while (ok == 0);
 	}
 
-	/* Fork a number of processes, each of which will
+	/*
+	 * Fork a number of processes, each of which will
 	 * create a message queue with one reader/writer
 	 * pair which will read and write a number (iterations)
 	 * of random length messages with specific values.
 	 */
-
 	for (i = 0; i < nprocs; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "\tFork failed (may be OK if under stress)");
-		}
-		/* Child does this */
+		pid = SAFE_FORK();
 		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(keyarray[i], i));
+			dotest(keyarray[i], i);
+			exit(0);
 		}
-		pidarray[i] = pid;
 	}
 
 	count = 0;
 	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != 0) {
-				tst_brkm(TFAIL, NULL,
-					 "Child exit status = %d",
-					 status >> 8);
-			}
+		if (wait(NULL) > 0) {
 			count++;
 		} else {
-			if (errno != EINTR) {
+			if (errno != EINTR)
 				break;
-			}
-#ifdef DEBUG
-			tst_resm(TINFO, "Signal detected during wait");
-#endif
 		}
 	}
-	/* Make sure proper number of children exited */
-	if (count != nprocs) {
-		tst_brkm(TFAIL,
-			 NULL,
-			 "Wrong number of children exited, Saw %d, Expected %d",
-			 count, nprocs);
-	}
-
-	tst_resm(TPASS, "Test ran successfully!");
+	if (count != nprocs)
+		tst_brk(TFAIL, "Wrong number of children exited, Saw %d, Expected %d",
+			count, nprocs);
 
+	tst_res(TPASS, "Test ran successfully!");
 	cleanup();
-	tst_exit();
-}
-
-static int dotest(key_t key, int child_process)
-{
-	int id, pid;
-	int ret, status;
-
-	sighold(SIGTERM);
-	TEST(msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR));
-	if (TEST_RETURN < 0) {
-		printf("msgget() error in child %d: %s\n",
-			child_process, strerror(TEST_ERRNO));
-		return FAIL;
-	}
-	tid = id = TEST_RETURN;
-	sigrelse(SIGTERM);
-
-	fflush(stdout);
-	if ((pid = FORK_OR_VFORK()) < 0) {
-		printf("Fork failed (may be OK if under stress)\n");
-		TEST(msgctl(tid, IPC_RMID, 0));
-		if (TEST_RETURN < 0) {
-			printf("msgctl() error in cleanup: %s\n",
-				strerror(TEST_ERRNO));
-		}
-		return FAIL;
-	}
-	if (pid == 0)
-		exit(doreader(key, id, 1, child_process, nreps));
-
-	mykid = pid;
-	procstat = 2;
-	ret = dowriter(key, id, 1, child_process, nreps);
-	wait(&status);
-
-	if (ret != PASS)
-		exit(FAIL);
-
-	if ((!WIFEXITED(status) || (WEXITSTATUS(status) != PASS)))
-		exit(FAIL);
-
-	TEST(msgctl(id, IPC_RMID, 0));
-	if (TEST_RETURN < 0) {
-		printf("msgctl() failed: %s\n",
-			strerror(TEST_ERRNO));
-		return FAIL;
-	}
-	return PASS;
-}
-
-static void sig_handler(int signo LTP_ATTRIBUTE_UNUSED)
-{
 }
 
-void setup(void)
+static void setup(void)
 {
 	int nr_msgqs;
 
-	tst_tmpdir();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	nr_msgqs = get_max_msgqueues();
-	if (nr_msgqs < 0)
-		cleanup();
+	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%d", &nr_msgqs);
 
-	MSGMNI = nr_msgqs - get_used_msgqueues();
+	MSGMNI = nr_msgqs - GET_USED_QUEUES();
 	if (MSGMNI > MAXNPROCS)
 		MSGMNI = MAXNPROCS;
-	if (MSGMNI <= 0) {
-		tst_resm(TBROK,
-			 "Max number of message queues already used, cannot create more.");
-		cleanup();
+	if (MSGMNI <= 0)
+		tst_brk(TCONF, "Max number of message queues already used, "
+			"cannot create more.");
+
+	if (opt_nreps) {
+		nreps = SAFE_STRTOL(opt_nreps, 1, INT_MAX);
+		nreps = min(nreps, MAXNREPS);
+	} else {
+		nreps = MAXNREPS;
+	}
+
+	if (opt_nprocs) {
+		nprocs = SAFE_STRTOL(opt_nprocs, 1, INT_MAX);
+		nprocs = min(nprocs, MSGMNI);
+	} else {
+		nprocs = MSGMNI;
 	}
+
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "Number of message queues is %d, process is %d, "
+		"iterations is %d", MSGMNI, nprocs, nreps);
 }
 
 void cleanup(void)
 {
-	int status;
-
-#ifdef DEBUG
-	tst_resm(TINFO, "Removing the message queue");
-#endif
-	(void)msgctl(tid, IPC_RMID, NULL);
-	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
-		(void)msgctl(tid, IPC_RMID, NULL);
-		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
-
-	}
-
-	tst_rmdir();
+	if (tid >= 0)
+		SAFE_MSGCTL(tid, IPC_RMID, NULL);
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
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
index f1c124990..98acde7e6 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
@@ -1,25 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) International Business Machines  Corp., 2002
  *
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
- *
  * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
  * 11/11/2002   Port to LTP     dbarrera@us.ibm.com
- */
-
-/*
+ * 10/21/2020   Convert to new api xuyang2018.jy@cn.fujitsu.com
  * Get and manipulate a message queue.
  * Same as msgstress02 but gets the actual msgmni value under procfs.
  */
@@ -36,23 +21,15 @@
 #include <string.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include "test.h"
-#include "ipcmsg.h"
-#include "libmsgctl.h"
-
-char *TCID = "msgstress04";
-int TST_TOTAL = 1;
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "tst_safe_sysv_ipc.h"
+#include "msgstress_common.h"
 
 #define MAXNREPS	1000
-#ifndef CONFIG_COLDFIRE
 #define MAXNPROCS	 1000000	/* This value is set to an arbitrary high limit. */
-#else
-#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
-#endif
 #define MAXNKIDS	10
-#define DEFNKIDS	2
 
-static int maxnkids = MAXNKIDS;	/* Used if pid_max is exceeded */
 static key_t keyarray[MAXNPROCS];
 static int pidarray[MAXNPROCS];
 static int rkidarray[MAXNKIDS];
@@ -60,88 +37,45 @@ static int wkidarray[MAXNKIDS];
 static int tid;
 static int nprocs, nreps, nkids, MSGMNI;
 static int maxnprocs;
-static int procstat;
+static void cleanup(void);
 
-void setup(void);
-void cleanup(void);
-
-static void term(int);
-static int dotest(key_t, int);
+static void dotest(key_t, int);
 static void dotest_iteration(int off);
-static void cleanup_msgqueue(int i, int tid);
 
 static char *opt_maxnprocs;
 static char *opt_nkids;
 static char *opt_nreps;
 
-static option_t options[] = {
-	{"n:", NULL, &opt_maxnprocs},
-	{"c:", NULL, &opt_nkids},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
+static struct tst_option options[] = {
+	{"n:", &opt_maxnprocs, "-n N     Number of processes"},
+	{"c:", &opt_nkids, "-c -N    Number of read/write child pairs"},
+	{"l:", &opt_nreps, "-l N     Number of iterations"},
+	{NULL, NULL, NULL}
 };
 
-static void usage(void)
+static void cleanup_msgqueue(int i, int tid)
 {
-	printf("  -n      Number of processes\n");
-	printf("  -c      Number of read/write child pairs\n");
-	printf("  -l      Number of iterations\n");
+	/*
+	 * Decrease the value of i by 1 because it is getting incremented
+	 * even if the fork is failing.
+	 */
+	i--;
+	/* Kill all children & free message queue. */
+	for (; i >= 0; i--) {
+		(void)kill(rkidarray[i], SIGKILL);
+		(void)kill(wkidarray[i], SIGKILL);
+	}
+	SAFE_MSGCTL(tid, IPC_RMID, 0);
 }
 
-
-int main(int argc, char **argv)
+static void verify_msgstress(void)
 {
 	int i, j, ok;
 
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
-
-	nreps = MAXNREPS;
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
-
-	if (opt_maxnprocs) {
-		if (atoi(opt_maxnprocs) > maxnprocs) {
-			tst_resm(TINFO,
-				 "Requested number of processes too large, "
-				 "setting to Max. of %d", MSGMNI);
-		} else {
-			maxnprocs = atoi(opt_maxnprocs);
-		}
-	}
-
-	procstat = 0;
 	srand48((unsigned)getpid() + (unsigned)(getppid() << 16));
 	tid = -1;
 
-	/* Setup signal handling routine */
-	if (sigset(SIGTERM, term) == SIG_ERR)
-		tst_brkm(TFAIL, cleanup, "Sigset SIGTERM failed");
-
-	/* Set up array of unique keys for use in allocating message
-	 * queues
-	 */
+	/* Set up array of unique keys for use in allocating message queues */
 	for (i = 0; i < MSGMNI; i++) {
 		ok = 1;
 		do {
@@ -183,268 +117,162 @@ int main(int argc, char **argv)
 		dotest_iteration(i * maxnprocs);
 	}
 
-	tst_resm(TPASS, "Test ran successfully!");
+	tst_res(TPASS, "Test ran successfully!");
 
 	cleanup();
-	tst_exit();
 }
 
 static void dotest_iteration(int off)
 {
 	key_t key;
-	int i, count, status;
+	int i, count;
 	pid_t pid;
 
 	memset(pidarray, 0, sizeof(pidarray));
 
 	for (i = 0; i < nprocs; i++) {
 		key = keyarray[off + i];
-
-		if ((pid = FORK_OR_VFORK()) < 0)
-			tst_brkm(TFAIL, cleanup,
-				 "Fork failed (may be OK if under stress)");
+		pid = SAFE_FORK();
 
 		/* Child does this */
 		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(key, i));
+			dotest(key, i);
+			exit(0);
 		}
 		pidarray[i] = pid;
 	}
 
 	count = 0;
 	while (1) {
-		if ((wait(&status)) > 0) {
-			if (status >> 8 != PASS)
-				tst_brkm(TFAIL, cleanup,
-					"Child exit status = %d", status >> 8);
+		if (wait(NULL) > 0) {
 			count++;
 		} else {
-			if (errno != EINTR) {
+			if (errno != EINTR)
 				break;
-			}
-#ifdef DEBUG
-			tst_resm(TINFO, "Signal detected during wait");
-#endif
 		}
 	}
 	/* Make sure proper number of children exited */
 	if (count != nprocs)
-		tst_brkm(TFAIL, cleanup,
-			 "Wrong number of children exited, Saw %d, Expected %d",
-			 count, nprocs);
+		tst_brk(TFAIL, "Wrong number of children exited, Saw %d, Expected %d",
+				count, nprocs);
 }
 
-static void cleanup_msgqueue(int i, int tid)
-{
-	/*
-	 * Decrease the value of i by 1 because it
-	 * is getting incremented even if the fork
-	 * is failing.
-	 */
-
-	i--;
-	/*
-	 * Kill all children & free message queue.
-	 */
-	for (; i >= 0; i--) {
-		(void)kill(rkidarray[i], SIGKILL);
-		(void)kill(wkidarray[i], SIGKILL);
-	}
-
-	if (msgctl(tid, IPC_RMID, 0) < 0) {
-		printf("Msgctl error in cleanup_msgqueue %d\n", errno);
-		exit(FAIL);
-	}
-}
 
-static int dotest(key_t key, int child_process)
+static void dotest(key_t key, int child_process)
 {
 	int id, pid;
-	int i, count, status, exit_status;
+	int i, count;
 
-	sighold(SIGTERM);
-	if ((id = msgget(key, IPC_CREAT | S_IRUSR | S_IWUSR)) < 0) {
-		printf("msgget() error in child %d: %s\n",
-			child_process, strerror(errno));
-		return FAIL;
-	}
+	id = SAFE_MSGGET(key, IPC_CREAT | S_IRUSR | S_IWUSR);
 	tid = id;
-	sigrelse(SIGTERM);
-
-	exit_status = PASS;
-
 	for (i = 0; i < nkids; i++) {
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			printf("Fork failure in the first child of child group %d\n",
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the first child of child group %d\n",
 				child_process);
 			cleanup_msgqueue(i, tid);
-			return FAIL;
+			return;
 		}
 		/* First child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(doreader(key, tid, getpid(),
-					child_process, nreps));
+			do_reader(key, tid, getpid(), child_process, nreps);
+			exit(0);
 		}
 		rkidarray[i] = pid;
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			printf("Fork failure in the second child of child group %d\n",
+		pid = fork();
+		if (pid < 0) {
+			tst_res(TFAIL, "Fork failure in the first child of child group %d\n",
 				child_process);
-			/*
-			 * Kill the reader child process
-			 */
-			(void)kill(rkidarray[i], SIGKILL);
-
 			cleanup_msgqueue(i, tid);
-			return FAIL;
+			return;
 		}
 		/* Second child does this */
 		if (pid == 0) {
-			procstat = 2;
-			exit(dowriter(key, tid, rkidarray[i],
-					child_process, nreps));
+			do_writer(key, tid, rkidarray[i], child_process, nreps);
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
-			if (errno != EINTR) {
+			if (errno != EINTR)
 				break;
-			}
 		}
 	}
 	/* Make sure proper number of children exited */
 	if (count != (nkids * 2)) {
-		printf("Wrong number of children exited in child group %d, saw %d, expected %d\n",
+		tst_res(TFAIL, "Wrong number of children exited in child group %d, saw %d, expected %d\n",
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
 	}
-	return exit_status;
+	SAFE_MSGCTL(id, IPC_RMID, NULL);
 }
 
-/* ARGSUSED */
-static void term(int sig LTP_ATTRIBUTE_UNUSED)
-{
-	int i;
-
-	if (procstat == 0) {
-#ifdef DEBUG
-		tst_resm(TINFO, "SIGTERM signal received, test killing kids");
-#endif
-		for (i = 0; i < nprocs; i++) {
-			if (pidarray[i] > 0) {
-				if (kill(pidarray[i], SIGTERM) < 0) {
-					tst_resm(TBROK,
-						 "Kill failed to kill child %d",
-						 i);
-					exit(FAIL);
-				}
-			}
-		}
-		return;
-	}
-
-	if (procstat == 2) {
-		exit(PASS);
-	}
-
-	if (tid == -1) {
-		exit(FAIL);
-	}
-	for (i = 0; i < nkids; i++) {
-		if (rkidarray[i] > 0)
-			kill(rkidarray[i], SIGTERM);
-		if (wkidarray[i] > 0)
-			kill(wkidarray[i], SIGTERM);
-	}
-}
-
-void setup(void)
+static void setup(void)
 {
 	int nr_msgqs, free_pids;
 
-	tst_tmpdir();
-	/* You will want to enable some signal handling so you can capture
-	 * unexpected signals like SIGSEGV.
-	 */
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	/* One cavet that hasn't been fixed yet.  TEST_PAUSE contains the code to
-	 * fork the test with the -c option.  You want to make sure you do this
-	 * before you create your temporary directory.
-	 */
-	TEST_PAUSE;
-
-	nr_msgqs = get_max_msgqueues();
-	if (nr_msgqs < 0)
-		tst_brkm(TBROK, cleanup, "get_max_msgqueues() failed");
+	tid = -1;
+	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%d", &nr_msgqs);
 
-	MSGMNI = nr_msgqs - get_used_msgqueues();
+	MSGMNI = nr_msgqs - GET_USED_QUEUES();
 	if (MSGMNI <= 0)
-		tst_brkm(TBROK, cleanup,
-			 "Max number of message queues already used, cannot create more.");
+		tst_brk(TCONF, "Max number of message queues already used, "
+			"cannot create more.");
 
-	tst_resm(TINFO, "Found %d available message queues", MSGMNI);
+	tst_res(TINFO, "Found %d available message queues", MSGMNI);
 
-	free_pids = tst_get_free_pids(cleanup);
+	free_pids = tst_get_free_pids();
 	if (free_pids < 0) {
-		tst_brkm(TBROK, cleanup, "Can't obtain free_pid count");
+		tst_brk(TBROK, "Can't obtain free_pid count");
 	} else if (!free_pids) {
-		tst_brkm(TBROK, cleanup, "No free pids");
+		tst_brk(TBROK, "No free pids");
+	}
+
+	if (opt_nreps) {
+		nreps = SAFE_STRTOL(opt_nreps, 1, INT_MAX);
+		nreps = min(nreps, MAXNREPS);
+	} else {
+		nreps = MAXNREPS;
+	}
+
+	if (opt_nkids) {
+		nkids = SAFE_STRTOL(opt_nkids, 1, INT_MAX);
+		nkids = min(nkids, MAXNKIDS);
+	} else {
+		nkids = MAXNKIDS;
 	}
 
+
 	/* We don't use more than a half of available pids.
 	 * For each child we fork up to 2*maxnkids grandchildren. */
-	maxnprocs = (free_pids / 2) / (1 + 2 * maxnkids);
+	maxnprocs = (free_pids / 2) / (1 + 2 * nkids);
 
 	if (!maxnprocs)
-		tst_brkm(TBROK, cleanup, "Not enough free pids");
+		tst_brk(TBROK, "Not enough free pids");
 
-	tst_resm(TINFO, "Using upto %d pids", free_pids / 2);
+	if (opt_maxnprocs)
+		maxnprocs = SAFE_STRTOL(opt_maxnprocs, 1, INT_MAX);
+
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "Using upto %d pids, %d processes %d read/write pairs, %d repeats",
+		free_pids/2, maxnprocs, nkids, nreps);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	int status;
-
-	/*
-	 * Remove the message queue from the system
-	 */
-#ifdef DEBUG
-	tst_resm(TINFO, "Removing the message queue");
-#endif
-	(void)msgctl(tid, IPC_RMID, NULL);
-	if ((status = msgctl(tid, IPC_STAT, NULL)) != -1) {
-		(void)msgctl(tid, IPC_RMID, NULL);
-		tst_resm(TFAIL, "msgctl(tid, IPC_RMID) failed");
-
-	}
-
-	tst_rmdir();
+	if (tid >= 0)
+		SAFE_MSGCTL(tid, IPC_RMID, NULL);
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
