Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E52EBA72
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 08:28:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80BCA3C3190
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 08:28:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DF0703C319D
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 08:27:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E79061400059
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 08:27:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,479,1599494400"; d="scan'208";a="103232507"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2021 15:27:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DC8E04CE602C
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 15:27:47 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 6 Jan 2021 15:27:47 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 6 Jan 2021 02:27:42 -0500
Message-ID: <1609918063-15810-4-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609918063-15810-1-git-send-email-zhufy.jy@cn.fujitsu.com>
References: <1609918063-15810-1-git-send-email-zhufy.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DC8E04CE602C.AC924
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] syscalls/ipc: semctl05: Convert to new API and
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
 testcases/kernel/syscalls/ipc/semctl/semctl05.c | 169 +++++-------------------
 2 files changed, 34 insertions(+), 139 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 2a379d9..4923010 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-semctl01 semctl05 semctl06 semctl07: LTPLDLIBS = -lltpipc
-semctl02 semctl03 semctl04 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
+semctl01 semctl06 semctl07: LTPLDLIBS = -lltpipc
+semctl02 semctl03 semctl04 semctl05 semctl08 semctl09: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl05.c b/testcases/kernel/syscalls/ipc/semctl/semctl05.c
index 84dace4..86297e2 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl05.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl05.c
@@ -1,59 +1,19 @@
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
+ * Copyright (c) International Business Machines  Corp., 2001
  */
-
 /*
- * NAME
- *	semctl05.c
- *
  * DESCRIPTION
  *	semctl05 - test for ERANGE error
  *
- * ALGORITHM
- *	create a semaphore set with read and alter permissions
- *	loop if that option was specified
- *	call semctl() with three different invalid cases
- *	check the errno value
- *	  issue a PASS message if we get ERANGE
- *	otherwise, the tests fails
- *	  issue a FAIL message
- *	call cleanup
- *
- * USAGE:  <for command-line>
- *  semctl05 [-c n] [-e] [-i n] [-I x] [-P x] [-t]
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
- *	none
  */
 
-#include "ipcsem.h"
-
-char *TCID = "semctl05";
-int TST_TOTAL = 3;
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "lapi/sem.h"
+#include "libnewipc.h"
 
 #ifdef _XLC_COMPILER
 #define SEMUN_CAST
@@ -61,118 +21,53 @@ int TST_TOTAL = 3;
 #define SEMUN_CAST (union semun)
 #endif
 
-int sem_id_1 = -1;
+static int sem_id = -1;
 
 #define BIGV	65535		/* a number ((2^16)-1) that should be larger */
 				/* than the maximum for a semaphore value    */
 
-#ifdef _XLC_COMPILER
-#define SEMUN_CAST
-#else
-#define SEMUN_CAST (union semun)
-#endif
-
 unsigned short big_arr[] = { BIGV, BIGV, BIGV, BIGV, BIGV, BIGV, BIGV, BIGV,
 	BIGV, BIGV
 };
 
-struct test_case_t {
+static struct tcases {
 	int count;
 	int cmd;
 	union semun t_arg;
-} TC[] = {
-	/* ERANGE - the value to set is less than zero - SETVAL */
-	{
-	5, SETVAL, SEMUN_CAST - 1},
-	    /* ERANGE - the values to set are too large, > semaphore max value */
-	{
-	0, SETALL, SEMUN_CAST big_arr},
-	    /* ERANGE - the value to set is too large, > semaphore max value */
-	{
-	5, SETVAL, SEMUN_CAST BIGV}
+	char *message;
+} tests[] = {
+	{5, SETVAL, SEMUN_CAST - 1, "the value to set is less than zero"},
+	{0, SETALL, SEMUN_CAST big_arr, "the value to set are too large"},
+	{5, SETVAL, SEMUN_CAST BIGV, "the value to set is too large"}
 };
 
-int main(int ac, char **av)
+static void verify_semctl(unsigned int n)
 {
-	int lc;
-	int i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();		/* global setup */
+	struct tcases *tc = &tests[n];
 
-	/* The following loop checks looping state if -i option given */
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		/* reset tst_count in case we are looping */
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			TEST(semctl(sem_id_1, TC[i].count,
-				    TC[i].cmd, TC[i].t_arg));
-
-			if (TEST_RETURN != -1) {
-				tst_resm(TFAIL, "call succeeded unexpectedly");
-				continue;
-			}
-
-			switch (TEST_ERRNO) {
-			case ERANGE:
-				tst_resm(TPASS, "expected failure - errno = "
-					 "%d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			default:
-				tst_resm(TFAIL, "unexpected error "
-					 "- %d : %s", TEST_ERRNO,
-					 strerror(TEST_ERRNO));
-				break;
-			}
-		}
-	}
-
-	cleanup();
-
-	tst_exit();
+	TST_EXP_FAIL(semctl(sem_id, tc->count, tc->cmd, tc->t_arg), ERANGE,
+		     "semctl() with %s", tc->message);
 }
 
-/*
- * setup() - performs all the ONE TIME setup for this test.
- */
-void setup(void)
+static void setup(void)
 {
+	static key_t semkey;
 
-	tst_sig(NOFORK, DEF_HANDLER, cleanup);
+	semkey = GETIPCKEY();
 
-	TEST_PAUSE;
-
-	/*
-	 * Create a temporary directory and cd into it.
-	 * This helps to ensure that a unique msgkey is created.
-	 * See libs/libltpipc/libipc.c for more information.
-	 */
-	tst_tmpdir();
-
-	/* get an IPC resource key */
-	semkey = getipckey();
-
-	/* create a semaphore set with read and alter permissions */
-	if ((sem_id_1 =
-	     semget(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA)) == -1) {
-		tst_brkm(TBROK, cleanup, "couldn't create semaphore in setup");
-	}
+	sem_id = SAFE_SEMGET(semkey, PSEMS, IPC_CREAT | IPC_EXCL | SEM_RA);
 }
 
-/*
- * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
- */
-void cleanup(void)
+static void cleanup(void)
 {
-	/* if it exists, remove the semaphore resouce */
-	rm_sema(sem_id_1);
-
-	tst_rmdir();
-
+	if (sem_id != -1)
+		SAFE_SEMCTL(sem_id, 0, IPC_RMID);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.test = verify_semctl,
+	.tcnt = ARRAY_SIZE(tests),
+};
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
