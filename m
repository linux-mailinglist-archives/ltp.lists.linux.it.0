Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7D3EB157
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:25:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ECA73C6573
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:25:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 72B713C55E7
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:25:23 +0200 (CEST)
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BC6C21000F54
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:25:20 +0200 (CEST)
X-QQ-mid: bizesmtp35t1628839513tobd9c61
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:25:08 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: pPk/KgO/RGLuU6qrifiVLDeBC7eaWFwFXqDnY3R838mB9pUDyejpFOihOGYj3
 8fVoD6heoVboF3MrR6IVl7+xXMW6L1HOc8skbjT9tL8EpeAQbyMHAE2wz+EGuAOjC3j0+dn
 H3R9DVGFvTybfEALgi+liUKm6FURfxUnIsWcU81hxkeY+eGVNGequ3xT8gAerFCprK2g8tL
 8AlKpsCmU+uuNBIjdVRjfg4bZHpFbMEtVoCfJaJDRpdaStSqE+HKgTOG9eh559IvjolUcmM
 IPX9Z6zSf7MyZCDE2lYia2NKx4DOTxiwzMdV0qAS4n1f08dLWOHFU/0PYQL9Jo3SW0d98P+
 ZlhGz2hAN+gR1jNHvY=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:25:05 +0800
Message-Id: <20210813072505.20207-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] syscalls/clone01: Convert to new API
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

diff --git a/testcases/kernel/syscalls/clone/clone01.c b/testcases/kernel/syscalls/clone/clone01.c
index e490b4e77..69d293ad6 100644
--- a/testcases/kernel/syscalls/clone/clone01.c
+++ b/testcases/kernel/syscalls/clone/clone01.c
@@ -1,90 +1,54 @@
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
- *	This is a test for the clone(2) system call.
- *	It is intended to provide a limited exposure of the system call.
+/*\
+ * [Description]
+ * This is a test for the clone(2) system call.
+ * It is intended to provide a limited exposure of the system call.
  */

-#if defined UCLINUX && !__THROW
-/* workaround for libc bug */
-#define __THROW
-#endif
-
-#include <errno.h>
-#include <sched.h>
-#include <sys/wait.h>
-#include "test.h"
-#include "safe_macros.h"
+#include <stdlib.h>
+#include "tst_test.h"
 #include "clone_platform.h"

-static void setup(void);
-static void cleanup(void);
-static int do_child();
+static void *child_stack;

-char *TCID = "clone01";
-int TST_TOTAL = 1;
+static int do_child(void *arg LTP_ATTRIBUTE_UNUSED)
+{
+	exit(0);
+}

-int main(int ac, char **av)
+static void verify_clone(void)
 {
-	void *child_stack;
 	int status, child_pid;

-	tst_parse_opts(ac, av, NULL, NULL);
+	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, do_child, NULL,
+		CHILD_STACK_SIZE, child_stack), "clone()");

-	setup();
+	child_pid = SAFE_WAIT(&status);

-	child_stack = malloc(CHILD_STACK_SIZE);
-	if (child_stack == NULL)
-		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
-
-	tst_count = 0;
-
-	TEST(ltp_clone(SIGCHLD, do_child, NULL, CHILD_STACK_SIZE, child_stack));
-	if (TEST_RETURN == -1)
-		tst_resm(TFAIL | TTERRNO, "clone failed");
-
-	child_pid = SAFE_WAIT(cleanup, &status);
-
-	if (TEST_RETURN == child_pid)
-		tst_resm(TPASS, "clone returned %ld", TEST_RETURN);
+	if (TST_RET == child_pid)
+		tst_res(TPASS, "clone returned %ld", TST_RET);
 	else
-		tst_resm(TFAIL, "clone returned %ld, wait returned %d",
-			 TEST_RETURN, child_pid);
-
-	free(child_stack);
-
-	cleanup();
-
-	tst_exit();
+		tst_res(TFAIL, "clone returned %ld, wait returned %d",
+			 TST_RET, child_pid);
 }

-static void setup(void)
-{
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-	TEST_PAUSE;
+static void setup(void) {
+	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
 }

-static void cleanup(void)
-{
+static void cleanup(void) {
+	free(child_stack);
 }

-static int do_child(void)
-{
-	exit(0);
-}
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_clone,
+	.forks_child = 1,
+//	.needs_tmpdir = 1,
+};
\ No newline at end of file
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
