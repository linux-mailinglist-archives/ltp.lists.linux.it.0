Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F03FE706
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:09:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72CFD3C99A6
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:09:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E7B03C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:09:46 +0200 (CEST)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 958081401164
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:09:45 +0200 (CEST)
X-QQ-mid: bizesmtp43t1630544979t01fw3lg
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 02 Sep 2021 09:09:35 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: uY2dNXMWIo/p1ycj9L62iVv/s+BFHAwhAah7HZuqGFyAhdRhfILo+oYpejV7s
 EWdBO9t5C3ohomhEBdkzuBDS+fSTVa3M3PYe9MyWEKJBx5Y279Eb+f7PImnKeF9EfmSW30b
 xTzFBYrQqWdMf5CHXzAfc7Qz9E74LY7GarOft6HVe08/d4NMaBT4i7enQFut8XcutRvU1ta
 cg1+tDe8ytSqyHuhPNvQkhtagUqiWuJd/PWlh+uAk+gcZrfhaGR5PD9MZ4i92XrlUTCSkSd
 VzhuDQYeApV/IQKoysEtWXQNUjXDKKN9HSn3lCmV0amcR7Bm1UaAhZf2zDHejylWFrj1gh1
 XtlDWuRkybcxXM0KNI=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 09:09:34 +0800
Message-Id: <20210902010934.1442-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/7] syscalls/clone07: Convert to new API
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/clone/clone07.c b/testcases/kernel/syscalls/clone/clone07.c
index 4b2e04ee7..1fe56860f 100644
--- a/testcases/kernel/syscalls/clone/clone07.c
+++ b/testcases/kernel/syscalls/clone/clone07.c
@@ -1,86 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) International Business Machines  Corp., 2003.
  * Copyright (c) 2012 Wanlong Gao <gaowanlong@cn.fujitsu.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-/*
- *	This is a test for a glibc bug for the clone(2) system call.
  */

-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
+/*\
+ * [Description]
+ * This is a test for a glibc bug for the clone(2) system call.
+ */

-#include <errno.h>
 #include <sched.h>
-#include <sys/wait.h>
-#include "test.h"
+#include <stdio.h>
+#include <stdlib.h>
+#include "tst_test.h"
+#include "lapi/syscalls.h"
 #include "clone_platform.h"

-#define TRUE 1
-#define FALSE 0
-
-static void setup();
-static int do_child();
-
-char *TCID = "clone07";
-int TST_TOTAL = 1;
-
-static void sigsegv_handler(int);
-static void sigusr2_handler(int);
 static int child_pid;
-static int fail = FALSE;
+static int fail;
+static void *child_stack;

-int main(int ac, char **av)
+static int do_child(void *arg LTP_ATTRIBUTE_UNUSED)
 {
+	return 0;
+}

-	int lc, status;
-	void *child_stack;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-		child_stack = malloc(CHILD_STACK_SIZE);
-		if (child_stack == NULL)
-			tst_brkm(TBROK, NULL,
-				 "Cannot allocate stack for child");
-
-		child_pid = ltp_clone(SIGCHLD, do_child, NULL,
-				      CHILD_STACK_SIZE, child_stack);
+static void sigsegv_handler(int sig LTP_ATTRIBUTE_UNUSED)
+{
+	if (child_pid == 0) {
+		kill(getppid(), SIGUSR2);
+		_exit(42);
+	}
+}

-		if (child_pid < 0)
-			tst_brkm(TBROK | TERRNO, NULL, "clone failed");
+static void sigusr2_handler(int sig LTP_ATTRIBUTE_UNUSED)
+{
+	if (child_pid != 0)
+		fail = 1;
+}

-		if ((wait(&status)) == -1)
-			tst_brkm(TBROK | TERRNO, NULL,
-				 "wait failed, status: %d", status);
+static void verify_clone(void)
+{
+	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, do_child, NULL, CHILD_STACK_SIZE,
+				child_stack));

-		free(child_stack);
-	}
+	child_pid = TST_RET;
+
+	if (!TST_PASS)
+		return;
+
+	tst_reap_children();

-	if (fail == FALSE)
-		tst_resm(TPASS,
-			 "Use of return() in child did not cause SIGSEGV");
-	else
-		tst_resm(TFAIL, "Use of return() in child caused SIGSEGV");
+	TST_EXP_VAL(fail, 0, "Use of return() in child did not cause SIGSEGV");

-	tst_exit();
 }

 static void setup(void)
@@ -88,41 +60,26 @@ static void setup(void)
 	struct sigaction def_act;
 	struct sigaction act;

-	TEST_PAUSE;
-
 	act.sa_handler = sigsegv_handler;
 	act.sa_flags = SA_RESTART;
-	sigemptyset(&act.sa_mask);
-	if ((sigaction(SIGSEGV, &act, NULL)) == -1)
-		tst_resm(TWARN | TERRNO,
-			 "sigaction() for SIGSEGV failed in test_setup()");
-
-	/* Setup signal handler for SIGUSR2 */
+	SAFE_SIGEMPTYSET(&act.sa_mask);
+	SAFE_SIGACTION(SIGSEGV, &act, NULL);
+
 	def_act.sa_handler = sigusr2_handler;
 	def_act.sa_flags = SA_RESTART | SA_RESETHAND;
-	sigemptyset(&def_act.sa_mask);
-
-	if ((sigaction(SIGUSR2, &def_act, NULL)) == -1)
-		tst_resm(TWARN | TERRNO,
-			 "sigaction() for SIGUSR2 failed in test_setup()");
-}
+	SAFE_SIGEMPTYSET(&def_act.sa_mask);
+	SAFE_SIGACTION(SIGUSR2, &def_act, NULL);

-static int do_child(void)
-{
-	return 0;
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
 }

-static void sigsegv_handler(int sig)
+static void cleanup(void)
 {
-	if (child_pid == 0) {
-		kill(getppid(), SIGUSR2);
-		_exit(42);
-	}
+	free(child_stack);
 }

-/* sig_default_handler() - Default handler for parent */
-static void sigusr2_handler(int sig)
-{
-	if (child_pid != 0)
-		fail = TRUE;
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_clone,
+	.cleanup = cleanup,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
