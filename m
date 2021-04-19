Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA2365519
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:15:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 305563C6C9C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 11:15:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF58B3C9BFB
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 05:42:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6F3531A00439
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 05:42:07 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ARLvuP6mojw9P90h1u1UBvu11YT3pDfLM3DAb?=
 =?us-ascii?q?vn1ZSRFFG/GwvcaogfgdyFvImC8cMUtQ/eyoFYuhZTfn9ZBz6ZQMJrvKZmTbkU?=
 =?us-ascii?q?ahMY0K1+Xf6hLtFyD0/uRekYdMGpIVNPTeFl5/5Pya3CCdM/INhOaK67qpg+C2?=
 =?us-ascii?q?9QYJcShPZ7t75wl0Tia3e3cGJzVuPpYyGJqC6scvnVPJFkg/VNixBXUOQoH41r?=
 =?us-ascii?q?/2va/hCCRnOzcXrCGKjR6NrIXxCgWk2H4lOA9n8PMP9nfknmXCipmejw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,235,1613404800"; d="scan'208";a="107356616"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Apr 2021 11:42:04 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 0D0704CF2650
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 11:42:02 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 20 Apr 2021 11:41:51 +0800
Received: from localhost.localdomain (10.167.220.115) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 11:41:51 +0800
From: Zenghui Gao <gaozh.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 19 Apr 2021 05:44:31 -0400
Message-ID: <20210419094431.2418-1-gaozh.jy@fujitsu.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 0D0704CF2650.A5386
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: gaozh.jy@fujitsu.com
X-Spam-Status: No, score=1.2 required=7.0 tests=DATE_IN_PAST_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NEUTRAL autolearn=disabled
 version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 20 Apr 2021 11:15:23 +0200
Subject: [LTP] [PATCH v2] syscalls/wait02.c: Convert to new API
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

Take use of macros and clean up.

Signed-off-by: Zenghui Gao <gaozh.jy@fujitsu.com>
Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>
---
 testcases/kernel/syscalls/wait/wait02.c | 112 +++++++-----------------
 1 file changed, 30 insertions(+), 82 deletions(-)

diff --git a/testcases/kernel/syscalls/wait/wait02.c b/testcases/kernel/syscalls/wait/wait02.c
index 5695c071c..0217099ca 100644
--- a/testcases/kernel/syscalls/wait/wait02.c
+++ b/testcases/kernel/syscalls/wait/wait02.c
@@ -1,103 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *    AUTHOR		: William Roske
  *    CO-PILOT		: Dave Fenner
+ */
+/*\
+ * [Description]
  *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * Further, this software is distributed without any warranty that it is
- * free of the rightful claim of any third person regarding infringement
- * or the like.  Any license provided herein, whether implied or
- * otherwise, applies only to this software file.  Patent licenses, if
- * any, provided herein do not apply to combinations of this program with
- * other software, or any other product whatsoever.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
- * Mountain View, CA  94043, or:
- *
- * http://www.sgi.com
- *
- * For further information regarding this notice, see:
- *
- * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
- *
+ * For a terminated child, test whether wait(2) can get its pid
+ * and exit status correctly.
  */
 
 #include <errno.h>
-#include <string.h>
-#include <signal.h>
-#include <stdlib.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-#include "test.h"
-
-static void setup(void);
-static void cleanup(void);
-
-char *TCID = "wait02";
-int TST_TOTAL = 1;
-
-static void wait_verify(void);
+#include <stdlib.h>
+#include "tst_test.h"
 
-int main(int ac, char **av)
+static void verify_wait(void)
 {
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
+	int status, exit_child = 1;
+	pid_t fpid;
 
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		wait_verify();
-	}
-
-	cleanup();
-	tst_exit();
-}
-
-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, cleanup);
+	fpid = SAFE_FORK();
+	if (fpid == 0)
+		exit(exit_child);
 
-	TEST_PAUSE;
-}
+	TST_EXP_PID_SILENT(wait(&status));
 
-static void wait_verify(void)
-{
-	int fork_pid, status, exit_child = 1;
+	if (!TST_PASS)
+		return;
 
-	fork_pid = FORK_OR_VFORK();
-	if (fork_pid == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup, "fork() Failure");
-	} else if (fork_pid == 0) {
-		sleep(1);
-		exit(exit_child);
+	if (fpid != TST_RET) {
+		tst_res(TFAIL, "wait(&status) returned wrong pid %ld, expected %d",
+			TST_RET, fpid);
+		return;
 	}
 
-	TEST(wait(&status));
-
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "wait(1) Failed");
-	} else if (WIFEXITED(status) && WEXITSTATUS(status) == exit_child) {
-		tst_resm(TPASS, "wait(&status) returned %ld", TEST_RETURN);
-	} else {
-		tst_resm(TFAIL,
-			 "wait(1) Failed, exit_child - 0x%x, status - 0x%x",
-			 exit_child, status);
+	if (WIFEXITED(status) && WEXITSTATUS(status) == exit_child) {
+		tst_res(TPASS, "wait(&status) succeeded");
+		return;
 	}
-}
 
-static void cleanup(void)
-{
+	tst_res(TFAIL, "wait(&status) got wrong exit status 0x%x", status);
 }
+
+static struct tst_test test = {
+	.test_all = verify_wait,
+	.forks_child = 1,
+};
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
