Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 964823EB169
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 502BC3C6573
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B98813C57F3
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:33 +0200 (CEST)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E007C600D46
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:31 +0200 (CEST)
X-QQ-mid: bizesmtp38t1628839645twx8ldq2
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:27:21 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: g9nl15ZGxli98uYLxQimgor8W9i2zBAg36knKcs7upQj1S3Ak7UMGMvC545DO
 2vkPooDNLgh/m7B1rncXj+BQ/CvvduyF16H/cym0B8+qLuUwaU6+WshYagZFmTawb+w/phS
 T5ti23u51L5bzNSZKoqVKHXJrSpgbtf4t+j4X6x1dCHAsP3xHSOV2dVw1/TRGk4KNnbvCyv
 YHYgCW+5/vX8tjeCj09Uj4nMuNRaU5MuzaNmrAwjeHpGpLx8dxekIaPQnSeBUJUn/h2XeNQ
 6yI+Wi/MdZhONHzY9QpQNzm5R5tcF4vf+J7HpvkkMl7UiPLtLnvOMCtiXXavZVirILUuit7
 dMn6NG2lF2b3halRmceYg98zbhBjw==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:27:20 +0800
Message-Id: <20210813072720.22318-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 6/7] syscalls/clone06: Convert to new API
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

diff --git a/testcases/kernel/syscalls/clone/clone06.c b/testcases/kernel/syscalls/clone/clone06.c
index 99e7f3864..5ed3bf897 100644
--- a/testcases/kernel/syscalls/clone/clone06.c
+++ b/testcases/kernel/syscalls/clone/clone06.c
@@ -1,35 +1,18 @@
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
- *	Test to verify inheritance of environment variables by child.
+/*\
+ * [Description]
+ * Test to verify inheritance of environment variables by child.
  */

-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
-
-#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <sched.h>
-#include <sys/wait.h>
-#include <fcntl.h>
-#include "test.h"
+#include "tst_test.h"
 #include "clone_platform.h"

 #define MAX_LINE_LENGTH 256
@@ -39,102 +22,56 @@ static void cleanup(void);
 static int child_environ();

 static int pfd[2];
+static void *child_stack;

-char *TCID = "clone06";
-int TST_TOTAL = 1;
-
-int main(int ac, char **av)
+static int child_environ(void *arg LTP_ATTRIBUTE_UNUSED)
 {
+	char var[MAX_LINE_LENGTH];

-	int lc, status;
-	void *child_stack;
-	char *parent_env;
-	char buff[MAX_LINE_LENGTH];
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
-		if ((pipe(pfd)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup, "pipe() failed");
-
-		TEST(ltp_clone(SIGCHLD, child_environ, NULL, CHILD_STACK_SIZE,
-			       child_stack));
-
-		if (TEST_RETURN == -1)
-			tst_brkm(TFAIL | TTERRNO, cleanup, "clone failed");
-
-		/* close write end from parent */
-		if ((close(pfd[1])) == -1)
-			tst_resm(TWARN | TERRNO, "close(pfd[1]) failed");
-
-		/* Read env var from read end */
-		if ((read(pfd[0], buff, sizeof(buff))) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "read from pipe failed");
+	sprintf(var, "%s", getenv("TERM") ? : "");

-		/* Close read end from parent */
-		if ((close(pfd[0])) == -1)
-			tst_resm(TWARN | TERRNO, "close(pfd[0]) failed");
+	SAFE_CLOSE(pfd[0]);
+	SAFE_WRITE(1, pfd[1], var, sizeof(var));
+	SAFE_CLOSE(pfd[1]);
+
+	exit(0);
+}

-		parent_env = getenv("TERM") ? : "";
+static void verify_clone(void)
+{
+	char *parent_env;
+	char buff[MAX_LINE_LENGTH];

-		if ((strcmp(buff, parent_env)) == 0)
-			tst_resm(TPASS, "Test Passed");
-		else
-			tst_resm(TFAIL, "Test Failed");
+	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, child_environ, NULL, CHILD_STACK_SIZE,
+				child_stack));

-		if ((wait(&status)) == -1)
-			tst_brkm(TBROK | TERRNO, cleanup,
-				 "wait failed, status: %d", status);
-	}
+	tst_reap_children();

-	free(child_stack);
+	if (!TST_PASS)
+		return;
+
+	SAFE_CLOSE(pfd[1]);
+	SAFE_READ(1, pfd[0], buff, sizeof(buff));
+	SAFE_CLOSE(pfd[0]);

-	cleanup();
-	tst_exit();
+	parent_env = getenv("TERM") ? : "";
+	TST_EXP_PASS(strcmp(buff, parent_env),
+				"verify environment variables by child");
 }

 static void setup(void)
 {
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
+	SAFE_PIPE(pfd);
 }

 static void cleanup(void)
 {
+	free(child_stack);
 }

-/*
- *	Function executed by child.
- *	Gets the value for environment variable,TERM &
- *	writes it to  a pipe.
- */
-static int child_environ(void)
-{
-
-	char var[MAX_LINE_LENGTH];
-
-	/* Close read end from child */
-	if ((close(pfd[0])) == -1)
-		tst_brkm(TBROK | TERRNO, cleanup, "close(pfd[0]) failed");
-
-	if ((sprintf(var, "%s", getenv("TERM") ? : "")) < 0)
-		tst_resm(TWARN | TERRNO, "sprintf() failed");
-
-	if ((write(pfd[1], var, MAX_LINE_LENGTH)) == -1)
-		tst_resm(TWARN | TERRNO, "write to pipe failed");
-
-	/* Close write end of pipe from child */
-	if ((close(pfd[1])) == -1)
-		tst_resm(TWARN | TERRNO, "close(pfd[1]) failed");
-
-	exit(0);
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
