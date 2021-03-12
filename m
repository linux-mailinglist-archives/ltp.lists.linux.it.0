Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C10C338C45
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 321CF3C6831
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 13:02:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 195AB3C682A
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 736F21401399
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 13:02:29 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AGj5SFKvehtjf8S3XeDlW3Jkv7skDltV00zAX?=
 =?us-ascii?q?/kB9WHVpW+afkN2jm+le6A/shF8qKRUdsP2jGI3Fe3PT8pZp/ZIcVI3OYCDKsH?=
 =?us-ascii?q?alRbsN0aLMzzHsECX19Kp8+M5bGZRWJ8b3CTFB7PrSxCmdP5IezMKc8Kau7N2u?=
 =?us-ascii?q?qktFaQ1xcalv40NYJ2+gYy5LbTJLD5Y4C5aQj/Avz1WdUE4KZce2DGRtZZmgm/?=
 =?us-ascii?q?T3kvvdASIuNloO7QmiqXeS4qfmLh7w5HwjegIK7bA80WWtqWDE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.81,243,1610380800"; d="scan'208";a="105549576"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 20:02:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 25B6A4CEA9A0
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 20:02:24 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 20:02:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 12 Mar 2021 20:02:18 +0800
Message-ID: <1615550541-21714-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20201111163114.GB23576@yuki.lan>
 <1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 25B6A4CEA9A0.AEE27
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/5] syscalls/msgstress01: Convert into new api and
 merge msgstress03 into it
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

Since msgstress01 and msgstress03 has the small difference(whether use procfs value,
msgstress01 uses 16 procs 100000 reps as default and msgstress03 uses 10000 procs
10000 reps as default).

We can merge the two cases directly by using proper process and rep value in runtest.
In here, I use 1000/100000 value as default in msgstress01 tag instead of original
16/10000 value because 16 procs is so small and 1000 procs make more sense(It also
 not exceed the maximum process limit). After this change, excuting msgstress01 doesn't
take a lot of time than before. msgstress03 tag uses "msgstress01 -n 10000 -l 10000" to
replace.

We will use the bigger process num when we add process num check according into
available memory in the future. Of course, we can add it into smoke-test at that time
since it may take a lot of time.

Some changes since old api:
1) cleanup is useless since tid value is always -1 because we assign value in child but
use it in parent. Use a tid array instead and put the position of getting msgget id into
parent process.

2)Ignore SIGTERM instead of empty signhanlder and sighold/sigrelease

3)Add get_avail_queues and setup_msg_key_array in new ipc library

4)Add timeout=-1 since it maybe a smoke test when using bigger proc num or reps num

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libnewipc.h                           |  11 +
 libs/libltpnewipc/libnewipc.c                 |  39 +++
 runtest/syscalls                              |   2 +-
 runtest/syscalls-ipc                          |   2 +-
 .../kernel/syscalls/ipc/msgstress/.gitignore  |   1 -
 .../kernel/syscalls/ipc/msgstress/Makefile    |   5 +-
 .../syscalls/ipc/msgstress/msgstress01.c      | 314 +++++-------------
 .../syscalls/ipc/msgstress/msgstress03.c      | 290 ----------------
 8 files changed, 131 insertions(+), 533 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/ipc/msgstress/msgstress03.c

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 0f099c939..c1fa45ec3 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -44,6 +44,11 @@
 #define SHM_SIZE	2048
 #define INT_SIZE	4
 #define MODE_MASK	0x01FF
+#define MAXNPROCS	1000000
+#define MAXNREPS	100000
+
+key_t keyarray[MAXNPROCS];
+int pidarray[MAXNPROCS];
 
 struct mbuffer {
 	long type;
@@ -65,9 +70,15 @@ void *probe_free_addr(const char *file, const int lineno);
 #define PROBE_FREE_ADDR() \
 	probe_free_addr(__FILE__, __LINE__)
 
+int get_avail_queues(const char *file, const int lineno);
+#define GET_AVAIL_QUEUES() \
+	get_avail_queues(__FILE__, __LINE__)
+
 time_t get_ipc_timestamp(void);
 
 void msg_do_reader(long key, int tid, long type, int child, int nreps);
 
 void msg_do_writer(long key, int tid, long type, int child, int nreps);
+
+void setup_msg_key_array(int nprocs);
 #endif /* newlibipc.h */
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index 09871b421..cb885da13 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -69,6 +69,19 @@ int get_used_queues(const char *file, const int lineno)
 	return used_queues;
 }
 
+int get_avail_queues(const char *file, const int lineno)
+{
+	int used_queues = -1;
+	int max_queues = -1;
+	int avail_queues = -1;
+
+	safe_file_scanf(file, lineno, NULL, "/proc/sys/kernel/msgmni", "%d", &max_queues);
+	used_queues = get_used_queues(file, lineno);
+	avail_queues = max_queues - used_queues;
+
+	return avail_queues;
+}
+
 void *probe_free_addr(const char *file, const int lineno)
 {
 	void *addr;
@@ -174,3 +187,29 @@ void msg_do_writer(long key, int tid, long type, int child, int nreps)
 		key++;
 	}
 }
+
+void setup_msg_key_array(int nprocs)
+{
+	int i, j, ok;
+
+	srand(getpid());
+	/* Set up array of unique keys for use in allocating message queues */
+	for (i = 0; i < nprocs; i++) {
+		ok = 1;
+		do {
+			keyarray[i] = (key_t) rand();
+			/* Make sure key is unique and not private */
+			if (keyarray[i] == IPC_PRIVATE) {
+				ok = 0;
+				continue;
+			}
+			for (j = 0; j < i; j++) {
+				if (keyarray[j] == keyarray[i]) {
+					ok = 0;
+					break;
+				}
+				ok = 1;
+			}
+		} while (ok == 0);
+	}
+}
diff --git a/runtest/syscalls b/runtest/syscalls
index fe22ae5b6..68feb9390 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -815,7 +815,7 @@ msgctl05 msgctl05
 msgctl06 msgctl06
 msgstress01 msgstress01
 msgstress02 msgstress02
-msgstress03 msgstress03
+msgstress03 msgstress01 -n 10000 -l 10000
 msgstress04 msgstress04
 msgctl12 msgctl12
 
diff --git a/runtest/syscalls-ipc b/runtest/syscalls-ipc
index 68fff4038..8adb686c1 100644
--- a/runtest/syscalls-ipc
+++ b/runtest/syscalls-ipc
@@ -6,7 +6,7 @@ msgctl05 msgctl05
 msgctl06 msgctl06
 msgstress01 msgstress01
 msgstress02 msgstress02
-msgstress03 msgstress03
+msgstress03 msgstress01 -n 10000 -l 10000
 msgstress04 msgstress04
 msgctl12 msgctl12
 
diff --git a/testcases/kernel/syscalls/ipc/msgstress/.gitignore b/testcases/kernel/syscalls/ipc/msgstress/.gitignore
index a8f675399..e1df4cda8 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/.gitignore
+++ b/testcases/kernel/syscalls/ipc/msgstress/.gitignore
@@ -1,4 +1,3 @@
 /msgstress01
 /msgstress02
-/msgstress03
 /msgstress04
diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
index b821bda01..27caffb35 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
@@ -3,10 +3,11 @@
 
 top_srcdir              ?= ../../../../..
 
-LTPLIBS = ltpipc
+LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LTPLDLIBS  += -lltpipc
+msgstress01: LTPLDLIBS = -lltpnewipc
+msgstress02 msgstress04: LTPLDLIBS = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
index 0a660c042..d1954616f 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress01.c
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
  * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
+ * 03/10/2021   Convert to new api xuyang2018.jy@cn.fujitsu.com
  */
 
-/*
+/*\
+ * [DESCRIPTION]
+ *
  * Get and manipulate a message queue.
- */
+ * Fork a number of processes, each of which will create a message queue
+ * with one reader/writer pair which will read and write a number (iterations)
+ * of random length messages with specific values.
+\*/
 
-#define _XOPEN_SOURCE 500
 #include <signal.h>
 #include <errno.h>
 #include <string.h>
@@ -31,271 +24,116 @@
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
-
-char *TCID = "msgstress01";
-int TST_TOTAL = 1;
-
-#ifndef CONFIG_COLDFIRE
-#define MAXNPROCS	1000000	/* This value is set to an arbitrary high limit. */
-#else
-#define MAXNPROCS	 100000	/* Coldfire can't deal with 1000000 */
-#endif
-#define MAXNREPS	100000
-
-static key_t keyarray[MAXNPROCS];
-static int pidarray[MAXNPROCS];
-static int tid;
-static int MSGMNI, nprocs, nreps;
-static int procstat;
-static int mykid;
-
-void setup(void);
-void cleanup(void);
-
-static int dotest(key_t key, int child_process);
-static void sig_handler();
+#include "tst_test.h"
+#include "libnewipc.h"
+#include "tst_safe_sysv_ipc.h"
 
+static int nprocs = 1000;
+static int nreps = MAXNREPS;
 static char *opt_nprocs;
+static int tid[MAXNPROCS];
 static char *opt_nreps;
 
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
+static void dotest(key_t key, int id, int child_process)
 {
-	int i, j, ok, pid;
-	int count, status;
-	struct sigaction act;
+	int pid;
 
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
-
-	nreps = MAXNREPS;
-	nprocs = MSGMNI;
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
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		msg_do_reader(key, id, 1, child_process, nreps);
+		exit(0);
 	}
+	msg_do_writer(key, id, 1, child_process, nreps);
+	SAFE_WAIT(NULL);
+	SAFE_MSGCTL(id, IPC_RMID, NULL);
+}
 
-	srand(getpid());
-	tid = -1;
-
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
-	for (i = 0; i < nprocs; i++) {
-		ok = 1;
-		do {
-			/* Get random key */
-			keyarray[i] = (key_t) rand();
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
+static void verify_msgstress(void)
+{
+	int i, pid;
+	int count;
 
-	/* Fork a number of processes, each of which will
-	 * create a message queue with one reader/writer
-	 * pair which will read and write a number (iterations)
-	 * of random length messages with specific values.
+	/*
+	 * Set up array of unique keys for use in allocating message
+	 * queues.
 	 */
+	setup_msg_key_array(nprocs);
 
 	for (i = 0; i < nprocs; i++) {
-		fflush(stdout);
-		if ((pid = FORK_OR_VFORK()) < 0) {
-			tst_brkm(TFAIL,
-				 NULL,
-				 "\tFork failed (may be OK if under stress)");
-		}
-		/* Child does this */
+		tid[i] = SAFE_MSGGET(keyarray[i], IPC_CREAT | S_IRUSR | S_IWUSR);
+		pid = SAFE_FORK();
 		if (pid == 0) {
-			procstat = 1;
-			exit(dotest(keyarray[i], i));
+			dotest(keyarray[i], tid[i], i);
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
 
-	cleanup();
-	tst_exit();
+	tst_res(TPASS, "Test ran successfully!");
 }
 
-static int dotest(key_t key, int child_process)
+static void setup(void)
 {
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
+	int avail_msg_queues;
 
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
+	avail_msg_queues = GET_AVAIL_QUEUES();
+	if (avail_msg_queues <= 0)
+		tst_brk(TCONF, "Max message queues is used, cannot create more.");
 
-	if (ret != PASS)
-		exit(FAIL);
+	if (opt_nreps)
+		nreps = SAFE_STRTOL(opt_nreps, 1, MAXNREPS);
 
-	if ((!WIFEXITED(status) || (WEXITSTATUS(status) != PASS)))
-		exit(FAIL);
+	if (opt_nprocs)
+		nprocs = SAFE_STRTOL(opt_nprocs, 1, MAXNPROCS);
 
-	TEST(msgctl(id, IPC_RMID, 0));
-	if (TEST_RETURN < 0) {
-		printf("msgctl() errno %d: %s\n",
-			TEST_ERRNO, strerror(TEST_ERRNO));
-
-		return FAIL;
+	if (nprocs > avail_msg_queues) {
+		tst_res(TINFO, "Setting max processes to %u", avail_msg_queues);
+		nprocs = avail_msg_queues;
 	}
-	return PASS;
-}
 
-static void sig_handler(void)
-{
+	SAFE_SIGNAL(SIGTERM, SIG_IGN);
+	tst_res(TINFO, "process is %d, iterations is %d", nprocs, nreps);
 }
 
-void setup(void)
+static void cleanup(void)
 {
-	int nr_msgqs;
-
-	tst_tmpdir();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	int i = 0;
 
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
-
-	/*
-	 * Since msgmni scales to the memory size, it may reach huge values
-	 * that are not necessary for this test.
-	 * That's why we define NR_MSGQUEUES as a high boundary for it.
-	 */
-	MSGMNI = min(nr_msgqs, NR_MSGQUEUES);
+	for (i = 0; i < nprocs; i++)
+		msgctl(tid[i], IPC_RMID, NULL);
 }
 
-void cleanup(void)
-{
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
-}
+static struct tst_test test = {
+	.timeout = -1,
+	.needs_tmpdir = 1,
+	.options = options,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.test_all = verify_msgstress,
+};
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
deleted file mode 100644
index 294b401b1..000000000
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ /dev/null
@@ -1,290 +0,0 @@
-/*
- * Copyright (c) International Business Machines  Corp., 2002
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
- *
- * 06/30/2001   Port to Linux   nsharoff@us.ibm.com
- * 11/06/2002   Port to LTP     dbarrera@us.ibm.com
- */
-
-/*
- * Get and manipulate a message queue.
- * Same as msgstress01 but gets the actual msgmni value under procfs.
- */
-
-#define _XOPEN_SOURCE 500
-#include <signal.h>
-#include <errno.h>
-#include <string.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <values.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <sys/stat.h>
-#include <sys/ipc.h>
-#include <sys/msg.h>
-#include "test.h"
-#include "ipcmsg.h"
-#include "libmsgctl.h"
-
-char *TCID = "msgstress03";
-int TST_TOTAL = 1;
-
-#define MAXNPROCS	10000	/*These should be sufficient */
-#define MAXNREPS	10000	/*Else they srewup the system un-necessarily */
-
-static key_t keyarray[MAXNPROCS];
-static int pidarray[MAXNPROCS];
-static int tid;
-static int MSGMNI, nprocs, nreps;
-static int procstat;
-static int mykid;
-
-void setup(void);
-void cleanup(void);
-
-static int dotest(key_t key, int child_process);
-static void sig_handler(int signo);
-
-static char *opt_nprocs;
-static char *opt_nreps;
-
-static option_t options[] = {
-	{"n:", NULL, &opt_nprocs},
-	{"l:", NULL, &opt_nreps},
-	{NULL, NULL, NULL},
-};
-
-static void usage(void)
-{
-	printf("  -n      Number of processes\n");
-	printf("  -l      Number of iterations\n");
-}
-
-int main(int argc, char **argv)
-{
-	int i, j, ok, pid;
-	int count, status;
-	struct sigaction act;
-
-	tst_parse_opts(argc, argv, options, usage);
-
-	setup();
-
-	nreps = MAXNREPS;
-	nprocs = MSGMNI;
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
-	srand(getpid());
-	tid = -1;
-
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
-	for (i = 0; i < nprocs; i++) {
-		ok = 1;
-		do {
-			/* Get random key */
-			keyarray[i] = (key_t) rand();
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
-
-	/* Fork a number of processes, each of which will
-	 * create a message queue with one reader/writer
-	 * pair which will read and write a number (iterations)
-	 * of random length messages with specific values.
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
-			if (status >> 8 != 0) {
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
-}
-
-void setup(void)
-{
-	int nr_msgqs;
-
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
-	MSGMNI = nr_msgqs - get_used_msgqueues();
-	if (MSGMNI > MAXNPROCS)
-		MSGMNI = MAXNPROCS;
-	if (MSGMNI <= 0) {
-		tst_resm(TBROK,
-			 "Max number of message queues already used, cannot create more.");
-		cleanup();
-	}
-}
-
-void cleanup(void)
-{
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
-}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
