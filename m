Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 036322EBA71
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 08:28:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75BCA3C31B0
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 08:28:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 197D63C06D8
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 08:27:56 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D44351A00902
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 08:27:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,479,1599494400"; d="scan'208";a="103232506"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2021 15:27:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 141354CE602A
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 15:27:47 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 6 Jan 2021 15:27:46 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 6 Jan 2021 02:27:41 -0500
Message-ID: <1609918063-15810-3-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609918063-15810-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1609918063-15810-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 141354CE602A.A9279
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] syscalls/ipc: semctl04: Convert to new API and
 cleanup
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

Also make use of TST_EXP_FAIL

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ipc/semctl/Makefile   |   4 +-
 testcases/kernel/syscalls/ipc/semctl/semctl04.c | 212 ++++++------------------
 2 files changed, 49 insertions(+), 167 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 2f64ccf..2a379d9 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-semctl01 semctl04 semctl05 semctl06 semctl07: LTPLDLIBS = -lltpipc
-semctl02 semctl03 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
+semctl01 semctl05 semctl06 semctl07: LTPLDLIBS = -lltpipc
+semctl02 semctl03 semctl04 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl04.c b/testcases/kernel/syscalls/ipc/semctl/semctl04.c
index b1f199e..39af8b6 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl04.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl04.c
@@ -1,200 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
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
-
-/*
- * NAME
- *	semctl04.c
+ * Copyright (c) International Business Machines  Corp., 2001
  *
  * DESCRIPTION
  *	semctl04 - test for EPERM error
  *
- * ALGORITHM
- *	create a semaphore set without read or alter permissions
- *	get the user id for "nobody"
- *	fork a child process
- *	if child
- *	  set the ID of the child process to that of "nobody"
- *	  loop if that option was specified
- *	    call semctl() with two different invalid cases
- *	    check the errno value
- *	      issue a PASS message if we get EPERM
- *	    otherwise, the tests fails
- *	      issue a FAIL message
- *	  call cleanup
- *	if parent
- *	  wait for child to exit
- *	  remove the semaphore set
- *
- * USAGE:  <for command-line>
- *  semctl04 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -e   : Turn on errno logging.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
  * HISTORY
  *	03/2001 - Written by Wayne Boyer
- *
- * RESTRICTIONS
- *	test must be run as root
  */
 
-#include "ipcsem.h"
-
 #include <pwd.h>
 #include <sys/wait.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "lapi/sem.h"
+#include "libnewipc.h"
 
-char *TCID = "semctl04";
-int TST_TOTAL = 2;
+static uid_t ltp_uid;
+static int sem_id = -1;
 
-int sem_id_1 = -1;
+static int tcases[] = { IPC_SET, IPC_RMID };
 
-uid_t ltp_uid;
-char *ltp_user = "nobody";
-
-int TC[] = { IPC_SET, IPC_RMID };
-
-int main(int ac, char **av)
+static void do_child(void)
 {
-	pid_t pid;
-	void do_child(void);
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
-
-	if ((pid = FORK_OR_VFORK()) == -1) {
-		tst_brkm(TBROK, cleanup, "could not fork");
-	}
-
-	if (pid == 0) {		/* child */
-		/* set the user ID of the child to the non root user */
-		if (setuid(ltp_uid) == -1) {
-			tst_resm(TBROK, "setuid() failed");
-			exit(1);
-		}
-
-		do_child();
+	int i;
+	union semun arg;
+	struct semid_ds perm;
 
-	} else {
-		if (waitpid(pid, NULL, 0) == -1) {
-			tst_resm(TBROK, "waitpid() failed");
-			tst_resm(TINFO, "waitpid() error = %d : %s", errno,
-				 strerror(errno));
+	for (i = 0; i < 2; i++) {
+		if (tcases[i] == IPC_SET) {
+			arg.buf = &perm;
+			memset(&perm, 0, sizeof(perm));
+			perm.sem_perm.uid = getuid() + 1;
+			perm.sem_perm.gid = getgid() + 1;
+			perm.sem_perm.mode = 0666;
 		}
 
-		/* if it exists, remove the semaphore resouce */
-		rm_sema(sem_id_1);
-
-		tst_rmdir();
+		TST_EXP_FAIL(semctl(sem_id, 0, tcases[i], arg), EPERM,
+			     "semctl() with nobody user in child");
 	}
-	cleanup();
-
-	tst_exit();
 }
 
-/*
- * do_child() - make the TEST call as the child process
- */
-void do_child(void)
+static void verify_semctl(void)
 {
-	int lc;
-	int i;
-	union semun arg;
-	struct semid_ds perm;
-
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			if (TC[i] == IPC_SET) {
-				arg.buf = &perm;
-				memset(&perm, 0, sizeof perm);
-				perm.sem_perm.uid = getuid() + 1;
-				perm.sem_perm.gid = getgid() + 1;
-				perm.sem_perm.mode = 0666;
-			}
-
-			TEST(semctl(sem_id_1, 0, TC[i], arg));
+	pid_t pid;
 
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
+	pid = SAFE_FORK();
 
-			switch (TEST_ERRNO) {
-			case EPERM:
-				tst_resm(TPASS, "expected failure - errno ="
-					 " %d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			default:
-				tst_resm(TFAIL, "unexpected error "
-					 "- %d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			}
-		}
+	if (pid == 0) {		/* child */
+		SAFE_SETEUID(ltp_uid);
+		do_child();
+	} else {
+		SAFE_WAITPID(pid, NULL, 0);
 	}
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
-	tst_require_root();
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	static key_t semkey;
 
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
+	semkey = GETIPCKEY();
 
-	/* get an IPC resource key */
-	semkey = getipckey();
+	sem_id = SAFE_SEMGET(semkey, PSEMS, IPC_CREAT | IPC_EXCL);
 
-	/* create a semaphore set without read or alter permissions */
-	if ((sem_id_1 = semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
-	}
-
-	/* get the userid for a non root user */
-	ltp_uid = getuserid(ltp_user);
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+	ltp_uid = ltpuser->pw_uid;
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-
+	if (sem_id != -1)
+		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_root = 1,
+	.test_all = verify_semctl,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
