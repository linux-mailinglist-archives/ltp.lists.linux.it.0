Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3373072F5
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:41:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FA2A3C5BAE
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:41:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 471453C318F
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:41:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id AF7E61A00FD7
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:41:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="103937338"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 17:41:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2265D4CE6782
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 17:41:18 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 17:41:17 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 28 Jan 2021 04:40:57 -0500
Message-ID: <1611826857-21076-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2265D4CE6782.AA87F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/ipc: semctl07: Convert to new API and
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

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ipc/semctl/Makefile   |   4 +-
 testcases/kernel/syscalls/ipc/semctl/semctl07.c | 248 +++++++++++-------------
 2 files changed, 114 insertions(+), 138 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 4923010..7b7a11d 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-semctl01 semctl06 semctl07: LTPLDLIBS = -lltpipc
-semctl02 semctl03 semctl04 semctl05 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
+semctl01 semctl06: LTPLDLIBS = -lltpipc
+semctl02 semctl03 semctl04 semctl05 semctl07 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl07.c b/testcases/kernel/syscalls/ipc/semctl/semctl07.c
index 5d7fad3..789d4ca 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl07.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl07.c
@@ -1,176 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
  *
- *   Copyright (c) International Business Machines  Corp., 2002
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
+ * HISTORY
+ *	06/30/2001   Port to Linux   nsharoff@us.ibm.com
+ *	10/30/2002   Port to LTP     dbarrera@us.ibm.com
+ *	10/03/2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
+ *	- Fix concurrency issue. A statically defined key was used. Leading
+ *	  to conflict with other instances of the same test.
  */
-
-/* 06/30/2001	Port to Linux	nsharoff@us.ibm.com */
-/* 10/30/2002	Port to LTP	dbarrera@us.ibm.com */
-
-/*
- * NAME
- *	semctl07
+/*\
+ * [DESCRIPTION]
  *
- * CALLS
- *	semctl(2) semget(2)
+ * Basic tests for semctl().
  *
- * ALGORITHM
- *	Get and manipulate a set of semaphores.
+ * - semctl() with IPC_STAT where we check the semid_ds buf content
+ * - semctl() with SETVAL and GETVAL
+ * - semctl() with GETPID
+ * - semctl() with GETNCNT and GETZCNT
  *
- * RESTRICTIONS
- *
- * HISTORY
- *      10/03/2008 Renaud Lottiaux (Renaud.Lottiaux@kerlabs.com)
- *      - Fix concurrency issue. A statically defined key was used. Leading
- *        to conflict with other instances of the same test.
- */
+\*/
 
-#include <sys/types.h>
-#include <sys/ipc.h>
-#include <sys/sem.h>
-#include <signal.h>
-#include <errno.h>
-#include <stdio.h>
-#include <sys/wait.h>
-#include "ipcsem.h"
-#include "test.h"
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewipc.h"
+#include "lapi/sem.h"
 
-void setup(void);
-void cleanup(void);
+static int semid = -1;
+static unsigned long nsems;
 
-char *TCID = "semctl07";
-int TST_TOTAL = 1;
-
-key_t key;
-int semid = -1, nsems;
-
-int main(int argc, char *argv[])
+static void verify_semctl(void)
 {
 	int status;
 	struct semid_ds buf_ds;
 	union semun arg;
 
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
 	arg.buf = &buf_ds;
-	if ((status = semctl(semid, 0, IPC_STAT, arg)) == -1) {
-		tst_resm(TFAIL, "semctl() failed errno = %d", errno);
-		semctl(semid, 1, IPC_RMID, arg);
-
-	}
-
-	/*
-	 * Check contents of semid_ds structure.
-	 */
+	TST_EXP_PASS(semctl(semid, 0, IPC_STAT, arg));
 
 	if (arg.buf->sem_nsems != nsems) {
-		tst_resm(TFAIL, "error: unexpected number of sems %lu",
-			 arg.buf->sem_nsems);
-
-	}
-	if (arg.buf->sem_perm.uid != getuid()) {
-		tst_resm(TFAIL, "error: unexpected uid %d",
-			 arg.buf->sem_perm.uid);
-
-	}
-	if (arg.buf->sem_perm.gid != getgid()) {
-		tst_resm(TFAIL, "error: unexpected gid %d",
-			 arg.buf->sem_perm.gid);
-
-	}
-	if (arg.buf->sem_perm.cuid != getuid()) {
-		tst_resm(TFAIL, "error: unexpected cuid %d",
-			 arg.buf->sem_perm.cuid);
-
-	}
-	if (arg.buf->sem_perm.cgid != getgid()) {
-		tst_resm(TFAIL, "error: unexpected cgid %d",
-			 arg.buf->sem_perm.cgid);
-
+		tst_res(TFAIL, "sem_nsems = %lu, expected %lu",
+			 arg.buf->sem_nsems, nsems);
+	} else {
+		tst_res(TPASS, "sem_nsems = %lu", arg.buf->sem_nsems);
 	}
-	if ((status = semctl(semid, 0, GETVAL, arg)) == -1) {
-		tst_resm(TFAIL, "semctl(GETVAL) failed errno = %d", errno);
-
-	}
-	arg.val = 1;
-	if ((status = semctl(semid, 0, SETVAL, arg)) == -1) {
-		tst_resm(TFAIL, "SEMCTL(SETVAL) failed errno = %d", errno);
-
-	}
-	if ((status = semctl(semid, 0, GETVAL, arg)) == -1) {
-		tst_resm(TFAIL, "semctl(GETVAL) failed errno = %d", errno);
-
-	}
-	if (status != arg.val) {
-		tst_resm(TFAIL, "error: unexpected value %d", status);
 
+	if (arg.buf->sem_perm.uid != getuid()) {
+		tst_res(TFAIL, "sem_perm.uid = %d, expected %d",
+			 arg.buf->sem_perm.uid, getuid());
+	} else {
+		tst_res(TPASS, "sem_perm.uid = %d", arg.buf->sem_perm.uid);
 	}
-	if ((status = semctl(semid, 0, GETPID, arg)) == -1) {
-		tst_resm(TFAIL, "semctl(GETPID) failed errno = %d", errno);
 
+	if (arg.buf->sem_perm.gid != getgid()) {
+		tst_res(TFAIL, "sem_perm.gid = %d, expected %d",
+			 arg.buf->sem_perm.gid, getgid());
+	} else {
+		tst_res(TPASS, "sem_perm.gid = %d", arg.buf->sem_perm.gid);
 	}
-	status = getpid();
-	if (status == 0) {
-		tst_resm(TFAIL, "error: unexpected pid %d", status);
 
+	if (arg.buf->sem_perm.cuid != getuid()) {
+		tst_res(TFAIL, "sem_perm.cuid = %d, expected %d",
+			 arg.buf->sem_perm.cuid, getuid());
+	} else {
+		tst_res(TPASS, "sem_perm.cuid = %d", arg.buf->sem_perm.cuid);
 	}
-	if ((status = semctl(semid, 0, GETNCNT, arg)) == -1) {
-		tst_resm(TFAIL, "semctl(GETNCNT) failed errno = %d", errno);
 
+	if (arg.buf->sem_perm.cgid != getgid()) {
+		tst_res(TFAIL, "sem_perm.cgid = %d, expected %d",
+			 arg.buf->sem_perm.cgid, getgid());
+	} else {
+		tst_res(TPASS, "sem_perm.cgid = %d", arg.buf->sem_perm.cgid);
 	}
-	if (status != 0) {
-		tst_resm(TFAIL, "error: unexpected semncnt %d", status);
 
-	}
-	if ((status = semctl(semid, 0, GETZCNT, arg)) == -1) {
-		tst_resm(TFAIL, "semctl(GETZCNT) failed errno = %d", errno);
+	if ((status = semctl(semid, 0, GETVAL)) == -1)
+		tst_res(TFAIL, "semctl(GETVAL) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(GETVAL) succeeded");
 
-	}
-	if (status != 0) {
-		tst_resm(TFAIL, "error: unexpected semzcnt %d", status);
+	arg.val = 1;
 
-	}
+	if ((status = semctl(semid, 0, SETVAL, arg)) == -1)
+		tst_res(TFAIL, "SEMCTL(SETVAL) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(SETVAL) succeeded");
 
-	tst_resm(TPASS, "semctl07 ran successfully!");
+	if ((status = semctl(semid, 0, GETVAL)) == -1)
+		tst_res(TFAIL, "semctl(GETVAL) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(GETVAL) succeeded");
 
-	cleanup();
-	tst_exit();
+	if (status != arg.val) {
+		tst_res(TFAIL, "semctl(GETVAL) returned %d expected %d",
+			status, arg.val);
+	} else {
+		tst_res(TPASS, "semctl(GETVAL) returned %d", status);
+	}
+
+	if ((status = semctl(semid, 0, GETPID)) == -1)
+		tst_res(TFAIL, "semctl(GETPID) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(GETPID) succeeded");
+
+	if (status != getpid()) {
+		tst_res(TFAIL, "semctl(GETPID) returned %d expected %d",
+			status, getpid());
+	} else {
+		tst_res(TPASS, "semctl(GETPID) returned %d", status);
+	}
+
+	if ((status = semctl(semid, 0, GETNCNT)) == -1)
+		tst_res(TFAIL, "semctl(GETNCNT) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(GETNCNT) succeeded");
+
+	if (status != 0)
+		tst_res(TFAIL, "semctl(GETNCNT) returned %d expected 0",
+			status);
+	else
+		tst_res(TPASS, "semctl(GETNCNT) returned 0");
+
+	if ((status = semctl(semid, 0, GETZCNT)) == -1)
+		tst_res(TFAIL, "semctl(GETZCNT) failed errno = %d", errno);
+	else
+		tst_res(TPASS, "semctl(GETZCNT) succeeded");
+
+	if (status != 0)
+		tst_res(TFAIL, "error: unexpected semzcnt %d", status);
+	else
+		tst_res(TPASS, "semctl(GETZCNT) succeeded 0");
 }
 
-void setup(void)
+static void setup(void)
 {
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	key = getipckey();
+	key_t key = GETIPCKEY();
 	nsems = 1;
 
-	if ((semid = semget(key, nsems, SEM_RA | IPC_CREAT)) == -1) {
-		tst_brkm(TFAIL, NULL, "semget() failed errno = %d", errno);
-	}
+	semid = SAFE_SEMGET(key, nsems, SEM_RA | IPC_CREAT);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
-	rm_sema(semid);
-	tst_rmdir();
+	if (semid != -1)
+		SAFE_SEMCTL(semid, 0, IPC_RMID);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_semctl,
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
