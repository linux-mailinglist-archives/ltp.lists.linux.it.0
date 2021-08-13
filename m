Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 733C23EB16C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 421643C6599
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 09:27:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1AE53C650B
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:44 +0200 (CEST)
Received: from smtpproxy21.qq.com (smtpbg704.qq.com [203.205.195.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 947CD1400B87
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 09:27:40 +0200 (CEST)
X-QQ-mid: bizesmtp39t1628839656tki2uwhh
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Fri, 13 Aug 2021 15:27:32 +0800 (CST)
X-QQ-SSF: 0140000000200040B000B00A0000000
X-QQ-FEAT: g9nl15ZGxljqkvBg5XAtEAPJaoHqJfMSCrFuM7BB6cSwL/w+OAJtzcj6BM7lf
 gSuhFUzk1ktxgm63LG5UOFlAJj4U2NkiyOr2vH9sFTgmU6aaucIhzccBtnfbcaiLK8Jpdee
 a4BzGQngqwLX2g6j2XaWoXSKZhR2kCME+L/q758oYR/kNFw8Aaojl1/oPrSUeAX5abzzS45
 bOu45xGcdRT3YJqaoioKgRMWNTDTNTRTwM3S7hhoBluEswIJMWLHfEVehA/FONYLlnAyDoQ
 475qBTD2ozR3Nv30oO4K3lOionGwKCISpI0FvCvi4qltWz7zqBfzwPjLkiTjzjiK6ccFTs0
 WRLGGUzlTEAyXMPZp8aQ9iWKKkTkg==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 13 Aug 2021 15:27:31 +0800
Message-Id: <20210813072731.22500-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] syscalls/clone07: Remove the testcase
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

As clone02 now covers both file and directory.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/runtest/syscalls b/runtest/syscalls
index 9aafba932..9bfcd7a91 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -109,7 +109,6 @@ clone03 clone03
 clone04 clone04
 clone05 clone05
 clone06 clone06
-clone07 clone07
 clone08 clone08
 clone09 clone09
 
diff --git a/testcases/kernel/syscalls/clone/.gitignore b/testcases/kernel/syscalls/clone/.gitignore
index 900cac19c..ffa85db57 100644
--- a/testcases/kernel/syscalls/clone/.gitignore
+++ b/testcases/kernel/syscalls/clone/.gitignore
@@ -4,6 +4,5 @@
 /clone04
 /clone05
 /clone06
-/clone07
 /clone08
 /clone09
diff --git a/testcases/kernel/syscalls/clone/clone07.c b/testcases/kernel/syscalls/clone/clone07.c
deleted file mode 100644
index 4b2e04ee7..000000000
--- a/testcases/kernel/syscalls/clone/clone07.c
+++ /dev/null
@@ -1,128 +0,0 @@
-/*
- * Copyright (c) International Business Machines  Corp., 2003.
- * Copyright (c) 2012 Wanlong Gao <gaowanlong@cn.fujitsu.com>
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
- */
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
-#include "clone_platform.h"
-
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
-static int child_pid;
-static int fail = FALSE;
-
-int main(int ac, char **av)
-{
-
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
-
-		if (child_pid < 0)
-			tst_brkm(TBROK | TERRNO, NULL, "clone failed");
-
-		if ((wait(&status)) == -1)
-			tst_brkm(TBROK | TERRNO, NULL,
-				 "wait failed, status: %d", status);
-
-		free(child_stack);
-	}
-
-	if (fail == FALSE)
-		tst_resm(TPASS,
-			 "Use of return() in child did not cause SIGSEGV");
-	else
-		tst_resm(TFAIL, "Use of return() in child caused SIGSEGV");
-
-	tst_exit();
-}
-
-static void setup(void)
-{
-	struct sigaction def_act;
-	struct sigaction act;
-
-	TEST_PAUSE;
-
-	act.sa_handler = sigsegv_handler;
-	act.sa_flags = SA_RESTART;
-	sigemptyset(&act.sa_mask);
-	if ((sigaction(SIGSEGV, &act, NULL)) == -1)
-		tst_resm(TWARN | TERRNO,
-			 "sigaction() for SIGSEGV failed in test_setup()");
-
-	/* Setup signal handler for SIGUSR2 */
-	def_act.sa_handler = sigusr2_handler;
-	def_act.sa_flags = SA_RESTART | SA_RESETHAND;
-	sigemptyset(&def_act.sa_mask);
-
-	if ((sigaction(SIGUSR2, &def_act, NULL)) == -1)
-		tst_resm(TWARN | TERRNO,
-			 "sigaction() for SIGUSR2 failed in test_setup()");
-}
-
-static int do_child(void)
-{
-	return 0;
-}
-
-static void sigsegv_handler(int sig)
-{
-	if (child_pid == 0) {
-		kill(getppid(), SIGUSR2);
-		_exit(42);
-	}
-}
-
-/* sig_default_handler() - Default handler for parent */
-static void sigusr2_handler(int sig)
-{
-	if (child_pid != 0)
-		fail = TRUE;
-}
-- 
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
