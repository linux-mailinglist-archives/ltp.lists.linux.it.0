Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278B3EB164
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 171EF3C6848
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE16D3C6848
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:11 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 79C0E1A0121C
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:09 +0200 (CEST)
X-QQ-mid: bizesmtp50t1628839622tx0jnfe3
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:26:59 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: g9nl15ZGxlh6xivmcHNnv0gngBdYnKw684Sn0sILZ4gQUwIypZqn8li9++jKz
 ty5ETtd3C6/1RWbANErrn4nXY/EAkhUgz58VAsPAqhysFXa62f1SPutl5Mtsedn1qf0YSUA
 51l2tZUouyDsKHuDapZTcdp27h3EoM91WZ0Rqs1dpjwcwbUWVtg3SQY2foSdFV+EH6efdNq
 G5+6Z335KLvJEDmeo0ofucDhudf+GjYtQfX+7kcj4Di/dVm9PFo8BUJjCCVpbkfK48ULvWS
 hvHG93VfGKrFVS1s9QPs9yEyFD8fG+0sxWH5w/1dsgXpOD/wnF0e4d1mGlQhHi3w0kooy9s
 tn1s9lAuZYjdDrNRkZjgB761lHJOQ==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:26:57 +0800
Message-Id: <20210813072657.21976-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/7] syscalls/clone05: Convert to new API
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

diff --git a/testcases/kernel/syscalls/clone/clone05.c b/testcases/kernel/syscalls/clone/clone05.c
index 494b772dd..7e8253bfe 100644
--- a/testcases/kernel/syscalls/clone/clone05.c
+++ b/testcases/kernel/syscalls/clone/clone05.c
@@ -1,103 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
  * Copyright (c) 2012 Wanlong Gao <gaowanlong@cn.fujitsu.com>
  * Copyright (c) 2012 Cyril Hrubis <chrubis@suse.cz>
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
  */

-/*
+/*\
+ * [Description]
  * Call clone() with CLONE_VFORK flag set. verify that
  * execution of parent is suspended until child finishes
  */

 #define _GNU_SOURCE

-#include <errno.h>
+#include <stdlib.h>
 #include <sched.h>
-#include <sys/wait.h>
-#include "test.h"
+#include "tst_test.h"
 #include "clone_platform.h"

-char *TCID = "clone05";
-int TST_TOTAL = 1;
-
-static void setup(void);
-static void cleanup(void);
-static int child_fn(void *);
-
 static int child_exited = 0;
+static void *child_stack;

-int main(int ac, char **av)
+static int child_fn(void *unused __attribute__((unused)))
 {
+	int i;

-	int lc, status;
-	void *child_stack;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	child_stack = malloc(CHILD_STACK_SIZE);
-	if (child_stack == NULL)
-		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		TEST(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
-		               CHILD_STACK_SIZE, child_stack));
-
-		if ((TEST_RETURN != -1) && (child_exited))
-			tst_resm(TPASS, "Test Passed");
-		else
-			tst_resm(TFAIL, "Test Failed");
+	for (i = 0; i < 100; i++) {
+		sched_yield();
+		usleep(1000);
+	}

-		if ((wait(&status)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "wait failed, status: %d", status);
+	child_exited = 1;
+	_exit(0);
+}

-		child_exited = 0;
-	}
+static void verify_clone(void)
+{
+	TST_EXP_POSITIVE(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
+					CHILD_STACK_SIZE, child_stack), "clone with vfork");

-	free(child_stack);
+	if (!TST_PASS)
+		return;

-	cleanup();
-	tst_exit();
+	TST_EXP_PASS(!child_exited);
 }

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	TEST_PAUSE;
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
+	child_exited = 0;
 }

 static void cleanup(void)
 {
+	free(child_stack);
 }

-static int child_fn(void *unused __attribute__((unused)))
-{
-	int i;
-
-	/* give the kernel scheduler chance to run the parent */
-	for (i = 0; i < 100; i++) {
-		sched_yield();
-		usleep(1000);
-	}
-
-	child_exited = 1;
-	_exit(1);
-}
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_clone,
+	.cleanup = cleanup,
+};
\ No newline at end of file
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
