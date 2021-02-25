Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE2324EB8
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:02:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 174D43C58B2
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 12:02:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B4EA73C0F06
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:02:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 6CD5E20101B
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 12:02:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,205,1610380800"; d="scan'208";a="104864432"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Feb 2021 19:01:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A5DC94CE76D2
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 19:01:27 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 25 Feb 2021 19:01:28 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 25 Feb 2021 19:01:28 +0800
From: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 25 Feb 2021 19:01:18 +0800
Message-ID: <20210225110118.583486-2-ruansy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210225110118.583486-1-ruansy.fnst@cn.fujitsu.com>
References: <20210225110118.583486-1-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A5DC94CE76D2.A1A71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/getpid02: Convert to new API
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
 testcases/kernel/syscalls/getpid/getpid02.c | 140 +++-----------------
 1 file changed, 21 insertions(+), 119 deletions(-)

diff --git a/testcases/kernel/syscalls/getpid/getpid02.c b/testcases/kernel/syscalls/getpid/getpid02.c
index 6c44ea96a..73011b2b0 100644
--- a/testcases/kernel/syscalls/getpid/getpid02.c
+++ b/testcases/kernel/syscalls/getpid/getpid02.c
@@ -1,136 +1,38 @@
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
 
-/*
- * Test Name: getpid02
- *
- * Test Description:
- *  Verify that getpid() system call gets the process ID of the of the
- *  calling process.
- *
- * Expected Result:
- *  getpid() should return pid of the process on success.
+/*\
+ * [DESCRIPTION]
  *
- * Algorithm:
- *  Setup:
- *   Setup signal handling.
- *   Pause for SIGUSR1 if option specified.
- *
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
+ * Check that getppid() in child returns the same pid as getpid() in parent.
+\*/
 
-#include <unistd.h>
-#include <sys/types.h>
 #include <errno.h>
-#include <unistd.h>
-#include <string.h>
-#include <signal.h>
-#include <sys/wait.h>
-
-#include "test.h"
-#include "safe_macros.h"
-
-void setup();			/* Main setup function of test */
-void cleanup();			/* cleanup function for the test */
 
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
-	int status;		/* exit status of child process */
 
-	tst_parse_opts(ac, av, NULL, NULL);
+	proc_id = getpid();
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		pproc_id = getppid();
 
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
+		if (pproc_id != proc_id)
+			tst_res(TFAIL, "child's ppid(%d) not equal to parent's pid(%d)",
+				pproc_id, proc_id);
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
