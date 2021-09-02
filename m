Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7ED3FE703
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:09:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A745A3C99B0
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 03:09:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E7F83C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:09:08 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C3383601364
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 03:09:07 +0200 (CEST)
X-QQ-mid: bizesmtp42t1630544942tjrknicj
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 02 Sep 2021 09:08:59 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00A0000000
X-QQ-FEAT: 8EHRr1HdXLr1y5ipuf2raiWSW48DYrXP+N15lElCFUtpMHX5xTnnC654GJanE
 2Qlrq9rX4KInXq/vTagehUtvi9OyVGSnn5pxvSb+RBCOyZYIPD5R65+c6vO2gikospVJmQs
 e/IVbcW8oRNXBdcEaDqIQedS3sIimBG+o613kj8X+KTCLjunmWfRKcT3JtkMhQrFXq39J9K
 amQPFcNAKRAT+uVLw7mO/RMiflSIKfndyJJgKtyGfecbKqf0e8zGWRQUY+JFqvbolD7c7d1
 7kJMvlkENNJA+Lsmk3fREoWB1gXVLgj56Jm75KWNKQ/NtOC5OhbpmNOaTEmaOEWVRcWPSWe
 uov/Syd2HRvms6qHTU=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 09:08:58 +0800
Message-Id: <20210902010858.800-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/7] syscalls/clone03: Convert to new API
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

diff --git a/testcases/kernel/syscalls/clone/clone03.c b/testcases/kernel/syscalls/clone/clone03.c
index f4216ead8..8d22e4fb1 100644
--- a/testcases/kernel/syscalls/clone/clone03.c
+++ b/testcases/kernel/syscalls/clone/clone03.c
@@ -1,147 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
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
  */
-/*
+
+/*\
+ * [Description]
  *	Check for equality of pid of child & return value of clone(2)
- *	Test:
- *	 Open a pipe.
- *	 Loop if the proper options are given.
- *	  Call clone(2) called without SIGCHLD
- *
- *	  CHILD:
- *		writes the pid to pipe
- *	  PARENT:
- *		reads child'd pid from pipe
- *		if child's pid == return value from clone(2)
- *			Test passed
- *		else
- *			test failed
  */
-
-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
-
-#include <errno.h>
-#include <sched.h>
-#include <sys/wait.h>
-#include "test.h"
-
+#include <stdio.h>
+#include <stdlib.h>
+#include "tst_test.h"
 #include "clone_platform.h"

-static void setup(void);
-static void cleanup(void);
-static int child_fn();
-
-static int pfd[2];
+static void *child_stack;
+static char *channel;

-char *TCID = "clone03";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static int child_fn(void *arg LTP_ATTRIBUTE_UNUSED)
 {
+	sprintf(channel, "%d", getpid());
+	exit(0);
+}

-	int lc;
-	void *child_stack;
-	char buff[10];
-	int child_pid, status;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	/* Allocate stack for child */
-	child_stack = malloc(CHILD_STACK_SIZE);
-	if (child_stack == NULL)
-		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		tst_count = 0;
-
-		if ((pipe(pfd)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "pipe failed");
-
-		TEST(ltp_clone(SIGCHLD, child_fn, NULL, CHILD_STACK_SIZE,
-			       child_stack));
-
-		if (TEST_RETURN == -1)
-			tst_brkm(TFAIL | TTERRNO, cleanup, "clone() failed");
-
-		/* close write end from parent */
-		if ((close(pfd[1])) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "close(pfd[1]) failed");
-
-		/* Read pid from read end */
-		if ((read(pfd[0], buff, sizeof(buff))) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "read from pipe failed");
+static void verify_clone(void)
+{
+	int child_pid;

-		/* Close read end from parent */
-		if ((close(pfd[0])) == -1)
-			tst_resm(TWARN | TERRNO, "close(pfd[0]) failed");
+	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, child_fn, NULL, CHILD_STACK_SIZE,
+				child_stack));

-		/* Get child's pid from pid string */
-		child_pid = atoi(buff);
+	if (!TST_PASS)
+		return;

-		if (TEST_RETURN == child_pid)
-			tst_resm(TPASS, "Test passed");
-		else
-			tst_resm(TFAIL, "Test failed");
+	tst_reap_children();

-		if ((wait(&status)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "wait failed, status: %d", status);
-	}
+	child_pid = atoi(channel);

-	free(child_stack);
-
-	cleanup();
-	tst_exit();
+	TST_EXP_PASS(!(TST_RET == child_pid), "pid(%d)", child_pid);
 }

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
+	channel = SAFE_MMAP(NULL, 10, PROT_READ | PROT_WRITE,
+				MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 }

 static void cleanup(void)
 {
-}
-
-static int child_fn(void)
-{
-	char pid[10];
-
-	/* Close read end from child */
-	if ((close(pfd[0])) == -1)
-		perror("close(pfd[0]) failed");
-
-	sprintf(pid, "%d", getpid());
-
-	/* Write pid string to pipe */
-	if ((write(pfd[1], pid, sizeof(pid))) == -1)
-		perror("write to pipe failed");
-
-	/* Close write end of pipe from child */
-	if ((close(pfd[1])) == -1)
-		perror("close(pfd[1]) failed");
+	free(child_stack);

-	exit(1);
+	if (channel)
+		SAFE_MUNMAP(channel, 10);
 }
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = verify_clone,
+	.cleanup = cleanup,
+};
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
