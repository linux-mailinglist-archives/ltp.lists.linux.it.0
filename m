Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA832CA5B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:13:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1632D3C5A78
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:13:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2A5123C7AD0
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:13:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0CE881A00EBB
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:13:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,221,1610380800"; d="scan'208";a="105129248"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 10:13:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 628D84CE92ED
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 10:13:27 +0800 (CST)
Received: from G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 10:13:16 +0800
Received: from irides.mr.mr.mr (10.167.225.141) by
 G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 4 Mar 2021 10:13:17 +0800
From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 4 Mar 2021 10:13:04 +0800
Message-ID: <20210304021304.1126635-2-ruansy.fnst@fujitsu.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
References: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 628D84CE92ED.AD899
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: ruansy.fnst@fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NEUTRAL autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
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

The logic is same as syscalls/getpid02, which is to check whether
parent's pid equals child's ppid.

Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
---
 testcases/kernel/syscalls/getppid/getppid02.c | 122 ++++--------------
 1 file changed, 27 insertions(+), 95 deletions(-)

diff --git a/testcases/kernel/syscalls/getppid/getppid02.c b/testcases/kernel/syscalls/getppid/getppid02.c
index ae3c8eb26..d0bf984dd 100644
--- a/testcases/kernel/syscalls/getppid/getppid02.c
+++ b/testcases/kernel/syscalls/getppid/getppid02.c
@@ -1,106 +1,38 @@
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
- * NAME
- * 	getppid02.c
- *
- * DESCRIPTION
- * 	Testcase to check the basic functionality of the getppid() syscall.
- *
- * USAGE:  <for command-line>
- *  getppid02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
- *     where,  -c n : Run n copies concurrently.
- *             -f   : Turn off functionality Testing.
- *             -i n : Execute test n times.
- *             -I x : Execute test for x seconds.
- *             -P x : Pause for x seconds between iterations.
- *             -t   : Turn on syscall timing.
+/*\
+ * [DESCRIPTION]
  *
- * HISTORY
- *	07/2001 Ported by Wayne Boyer
- *
- * RESTRICTIONS
- * 	None
- */
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <err.h>
-#include <errno.h>
-#include "test.h"
-#include "safe_macros.h"
+ * Check that getppid() in child returns the same pid as getpid() in parent.
+\*/
 
-char *TCID = "getppid02";
-int TST_TOTAL = 1;
+#include <errno.h>
 
-void setup(void);
-void cleanup(void);
+#include "tst_test.h"
 
-int main(int ac, char **av)
+static void verify_getppid(void)
 {
-
-	int lc;
-	int status;
-	pid_t pid, ppid;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		ppid = getpid();
-		pid = FORK_OR_VFORK();
-		if (pid == -1)
-			tst_brkm(TBROK, cleanup, "fork failed");
-
-		if (pid == 0) {
-			TEST(getppid());
-
-			if (TEST_RETURN != ppid)
-				errx(1, "getppid failed (%ld != %d)",
-				     TEST_RETURN, ppid);
-			else
-				printf("return value and parent's pid "
-				       "value match\n");
-			exit(0);
-		} else {
-			SAFE_WAIT(cleanup, &status);
-			if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
-				tst_resm(TFAIL,
-					 "getppid functionality incorrect");
-		}
+	pid_t proc_id;
+	pid_t pid;
+	pid_t pproc_id;
+
+	proc_id = getpid();
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		pproc_id = getppid();
+
+		if (pproc_id != proc_id)
+			tst_res(TFAIL, "child's ppid(%d) not equal to parent's pid(%d)",
+				pproc_id, proc_id);
+		else
+			tst_res(TPASS, "getppid() functionality is correct");
 	}
-	cleanup();
-
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
+	.test_all = verify_getppid,
+};
-- 
2.30.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
