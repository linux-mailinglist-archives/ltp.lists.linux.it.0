Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90C361B02
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:03:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B43333C1C9A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:03:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E6A5D3C1AB6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:03:29 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9EAE6201095
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:03:27 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Au1GQKaGzu2eNQTJkpLqEM8eALOonbusQ8zAX?=
 =?us-ascii?q?/mp2TgFYddHdqtC2kJ0gtSPcpT4NVBgb9OyoF7KHRRrnn6Jdxak0EfOcUBL9uG?=
 =?us-ascii?q?2uRbsC0aLHzyf7EyPzss5xvJ0OT4FEBNf9DUd3gK/BiWHSL/8azMSa66ftvO/C?=
 =?us-ascii?q?zh5WPGJXQpt95AR0ABvzKCFLbTRBbKBWKKah?=
X-IronPort-AV: E=Sophos;i="5.82,226,1613404800"; d="scan'208";a="107193765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Apr 2021 16:03:24 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id A1A334D0B8AA
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 16:03:22 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 16:03:23 +0800
Received: from localhost.localdomain (10.167.220.115) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Fri, 16 Apr 2021 16:03:22 +0800
From: Zenghui Gao <gaozh.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 15 Apr 2021 10:05:52 -0400
Message-ID: <20210415140552.15762-2-gaozh.jy@fujitsu.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20210415140552.15762-1-gaozh.jy@fujitsu.com>
References: <20210415140552.15762-1-gaozh.jy@fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: A1A334D0B8AA.A2F34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: gaozh.jy@fujitsu.com
X-Spam-Status: No, score=1.2 required=7.0 tests=DATE_IN_PAST_12_24,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NEUTRAL autolearn=disabled
 version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/wait02.c: Convert to new API
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
Cc: Zenghui Gao <gaozh.jy@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Take use of macros and clean up.

Signed-off-by: Zenghui Gao <gaozh.jy@fujitsu.com>
Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>
---
 testcases/kernel/syscalls/wait/wait02.c | 106 ++++++------------------
 1 file changed, 25 insertions(+), 81 deletions(-)

diff --git a/testcases/kernel/syscalls/wait/wait02.c b/testcases/kernel/syscalls/wait/wait02.c
index 5695c071c..111849f2a 100644
--- a/testcases/kernel/syscalls/wait/wait02.c
+++ b/testcases/kernel/syscalls/wait/wait02.c
@@ -1,103 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  *    AUTHOR		: William Roske
  *    CO-PILOT		: Dave Fenner
+ *\
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
-
-int main(int ac, char **av)
-{
-	int lc;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
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
-
-	TEST_PAUSE;
-}
+#include <stdlib.h>
+#include "tst_test.h"
 
-static void wait_verify(void)
+static void verify_wait(void)
 {
-	int fork_pid, status, exit_child = 1;
+	int status, exit_child = 1;
+	pid_t fpid;
 
-	fork_pid = FORK_OR_VFORK();
-	if (fork_pid == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup, "fork() Failure");
-	} else if (fork_pid == 0) {
-		sleep(1);
+	fpid = SAFE_FORK();
+	if (fpid == 0)
 		exit(exit_child);
-	}
 
 	TEST(wait(&status));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "wait() failed");
+		return;
+	}
 
-	if (TEST_RETURN == -1) {
-		tst_resm(TFAIL | TTERRNO, "wait(1) Failed");
+	if (fpid != TST_RET) {
+		tst_res(TFAIL, "wait() returned wrong pid %ld, expected %d",
+			TST_RET, fpid);
 	} else if (WIFEXITED(status) && WEXITSTATUS(status) == exit_child) {
-		tst_resm(TPASS, "wait(&status) returned %ld", TEST_RETURN);
+		tst_res(TPASS, "wait() succeeded");
 	} else {
-		tst_resm(TFAIL,
-			 "wait(1) Failed, exit_child - 0x%x, status - 0x%x",
-			 exit_child, status);
+		tst_res(TFAIL, "wait() got wrong exit status 0x%x", status);
 	}
 }
 
-static void cleanup(void)
-{
-}
+static struct tst_test test = {
+	.test_all = verify_wait,
+	.forks_child = 1,
+};
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
