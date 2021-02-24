Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3533235EC
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 04:12:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5CD483C5EB5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 04:12:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AF7583C5EB5
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 04:12:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C477460132B
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 04:12:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,201,1610380800"; d="scan'208";a="104797277"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Feb 2021 11:12:51 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id A8DCD4CE914C
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 11:12:49 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 11:12:36 +0800
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 11:12:33 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 24 Feb 2021 11:12:33 +0800
From: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 24 Feb 2021 11:12:27 +0800
Message-ID: <20210224031227.151844-2-ruansy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
References: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A8DCD4CE914C.A2372
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/getpid02: Convert to new API
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

Signed-off-by: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
---
 testcases/kernel/syscalls/getpid/getpid02.c | 152 +++++---------------
 1 file changed, 34 insertions(+), 118 deletions(-)

diff --git a/testcases/kernel/syscalls/getpid/getpid02.c b/testcases/kernel/syscalls/getpid/getpid02.c
index 6c44ea96a..6b5dd0a63 100644
--- a/testcases/kernel/syscalls/getpid/getpid02.c
+++ b/testcases/kernel/syscalls/getpid/getpid02.c
@@ -1,136 +1,52 @@
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
+ * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
-/*
- * Test Name: getpid02
- *
- * Test Description:
- *  Verify that getpid() system call gets the process ID of the of the
- *  calling process.
- *
- * Expected Result:
- *  getpid() should return pid of the process on success.
- *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
+/*\
+ * [DESCRIPTION]
  *
- *  Test:
- *   Loop if the proper options are given.
- *   Execute system call
- *   Check return code, if system call failed (return=-1)
- *   	Log the errno and Issue a FAIL message.
- *   Otherwise,
- *   	Verify the Functionality of system call
- *      if successful,
- *      	Issue Functionality-Pass message.
- *      Otherwise,
- *		Issue Functionality-Fail message.
- *  Cleanup:
- *   Print errno log and/or timing stats if options given
- *
- * Usage:  <for command-line>
- *  getpid02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *	       -i n : Execute test n times.
- *	       -I x : Execute test for x seconds.
- *	       -P x : Pause for x seconds between iterations.
- *	       -t   : Turn on syscall timing.
- *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS:
- *  None.
- */
+ * Verify that getpid() system call gets the process ID of the of the calling
+ * process.
+\*/
 
-#include <unistd.h>
-#include <sys/types.h>
+#include <stdlib.h>
 #include <errno.h>
-#include <unistd.h>
-#include <string.h>
-#include <signal.h>
+#include <sys/types.h>
 #include <sys/wait.h>
 
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
-
-char *TCID = "getpid02";
-int TST_TOTAL = 1;
+#include "tst_test.h"
 
-int main(int ac, char **av)
+static void verify_getpid(void)
 {
-	int lc;
 	pid_t proc_id;		/* process id of the test process */
 	pid_t pid;		/* process id of the child process */
 	pid_t pproc_id;		/* parent process id */
 	int status;		/* exit status of child process */
 
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		TEST(getpid());
-
-		proc_id = TEST_RETURN;
-
-		if ((pid = FORK_OR_VFORK()) == -1)
-			tst_resm(TFAIL | TERRNO, "fork failed");
-		else if (pid == 0) {
-			pproc_id = getppid();
-
-			if (pproc_id != proc_id)
-				exit(1);
-			exit(0);
-		} else {
-			SAFE_WAIT(cleanup, &status);
-			if (!WIFEXITED(status) ||
-			    WEXITSTATUS(status) != 0)
-				tst_resm(TFAIL, "getpid() returned "
-					 "invalid pid %d", proc_id);
-			else
-				tst_resm(TPASS,
-					 "getpid functionality is correct");
-		}
+	TEST(getpid());
+
+	proc_id = TST_RET;
+
+	if ((pid = SAFE_FORK()) == -1)
+		tst_res(TFAIL | TERRNO, "fork failed");
+	else if (pid == 0) {
+		pproc_id = getppid();
+
+		if (pproc_id != proc_id)
+			exit(1);
+		exit(0);
+	} else {
+		SAFE_WAIT(&status);
+		if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
+			tst_res(TFAIL, "getpid() returned invalid pid %d",
+				proc_id);
+		else
+			tst_res(TPASS, "getpid() functionality is correct");
 	}
-
-	cleanup();
-	tst_exit();
 }
 
-void setup(void)
-{
-
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
-}
-
-void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.forks_child = 1,
+	.test_all = verify_getpid,
+};
-- 
2.30.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
