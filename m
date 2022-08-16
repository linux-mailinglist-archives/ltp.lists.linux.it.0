Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839259549B
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 10:09:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2884D3C97E4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 10:09:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CEA843C95DD
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 10:09:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1AEB9600698
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 10:09:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D593633DCD;
 Tue, 16 Aug 2022 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1660637366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PyoqIMTDnw00x1ZUCudLDUU8d1r59kBjys7NYZq2kP8=;
 b=JSxLGL4V3f7DjKY/a7disfKlBh/cgC+TTdaYrb+kRiewOyvaML/YK1WbI/zVP8Hlw5loUl
 5rXcdjZkXLJOU6HV+Pm4ouofyXmL678EPmA0yXvqadO7O6kIhCD007izo6xfOjuQg6xxJa
 pos80F3CDtAIxGkgizNT0DjrwMGuKxE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BB711345B;
 Tue, 16 Aug 2022 08:09:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /iC9FbZQ+2IGVgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 16 Aug 2022 08:09:26 +0000
To: ltp@lists.linux.it
Date: Tue, 16 Aug 2022 10:08:36 +0200
Message-Id: <20220816080836.5063-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Refactor pidns16 test using new LTP API
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/containers/pidns/pidns16.c | 197 +++++++-------------
 1 file changed, 68 insertions(+), 129 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns16.c b/testcases/kernel/containers/pidns/pidns16.c
index 2ee61065a..d11e8eaa1 100644
--- a/testcases/kernel/containers/pidns/pidns16.c
+++ b/testcases/kernel/containers/pidns/pidns16.c
@@ -1,157 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
-* Copyright (c) International Business Machines Corp., 2007
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-***************************************************************************
-
-* * Test Assertion.
-* *----------------
-* * kill -USR1 container_init
-* *	- from the parent process and also inside a container
-* *	- Where init has defined a custom handler for USR1
-* *	- Should call the handler and
-* *	- Verify whether the signal handler is called from the proper process.
-* *
-* * Description:
-* *  Create PID namespace container.
-* *  Container init defines the handler for SIGUSR1 and waits indefinetly.
-* *  Parent sends SIGUSR1 to container init.
-* *  The signal handler is handled and the cont-init resumes normally.
-* *  From the container, again the signal SIGUSR1 is sent.
-* *  In the sig-handler check if it's invoked from correct pid(parent/container)
-* *  If cont-init wakes up properly -
-* *  it will return expected value at exit which is verified at the end.
-* *
-* * History:
-* *  DATE	  NAME				   DESCRIPTION
-* *  04/11/08  Veerendra C  <vechandr@in.ibm.com> Verifying cont init kill -USR1
-*
-*******************************************************************************/
-#include "config.h"
+ * Copyright (c) International Business Machines Corp., 2007
+ *               04/11/08  Veerendra C  <vechandr@in.ibm.com>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Clone a process with CLONE_NEWPID flag and verifies that siginfo->si_pid is
+ * set to 0 if sender (parent process) sent the signal. Then send signal from
+ * container itself and check if siginfo->si_pid is set to 1.
+ */
 
 #define _GNU_SOURCE 1
-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/wait.h>
-#include <sys/types.h>
 #include <signal.h>
-#include <unistd.h>
-#include "pidns_helper.h"
-#include "test.h"
-
-#define CHILD_PID	1
-#define PARENT_PID	0
+#include "tst_test.h"
+#include "lapi/namespaces_constants.h"
 
-char *TCID = "pidns16";
-int TST_TOTAL = 3;
+static volatile int exp_pid;
+static volatile int passed;
 
-void child_signal_handler(int sig, siginfo_t * si, void *unused)
+static void child_signal_handler(LTP_ATTRIBUTE_UNUSED int sig, siginfo_t *si, LTP_ATTRIBUTE_UNUSED void *unused)
 {
-	static int c = 1;
-	pid_t expected_pid;
-
-	/* Verifying from which process the signal handler is signalled */
-
-	switch (c) {
-	case 1:
-		expected_pid = PARENT_PID;
-		break;
-	case 2:
-		expected_pid = CHILD_PID;
-		break;
-	default:
-		tst_resm(TBROK, "child should NOT be signalled 3+ times");
-		return;
-	}
+	tst_res(TINFO, "Received signal %s from PID %d", tst_strsig(si->si_signo), si->si_pid);
 
-	if (si->si_pid == expected_pid)
-		tst_resm(TPASS, "child is signalled from expected pid %d",
-			 expected_pid);
-	else
-		tst_resm(TFAIL, "child is signalled from unexpected pid %d,"
-			 " expecting pid %d", si->si_pid, expected_pid);
+	if (si->si_signo != SIGUSR1)
+		return;
 
-	c++;
+	if (si->si_pid == exp_pid)
+		passed = 1;
 }
 
-/*
- * child_fn() - Inside container
- */
-int child_fn(void *ttype)
+static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
 {
 	struct sigaction sa;
-	pid_t pid, ppid;
+	pid_t cpid, ppid;
 
-	/* Set process id and parent pid */
-	pid = getpid();
+	cpid = getpid();
 	ppid = getppid();
 
-	if ((pid != CHILD_PID) || (ppid != PARENT_PID))
-		tst_resm(TBROK, "pidns is not created.");
+	if (cpid != 1 || ppid != 0) {
+		tst_res(TFAIL, "Got unexpected result of cpid=%d ppid=%d", cpid, ppid);
+		return 1;
+	}
 
-	/* Set signal handler for SIGUSR1, also mask other signals */
 	sa.sa_flags = SA_SIGINFO;
-	sigemptyset(&sa.sa_mask);
+	SAFE_SIGFILLSET(&sa.sa_mask);
 	sa.sa_sigaction = child_signal_handler;
-	if (sigaction(SIGUSR1, &sa, NULL) == -1)
-		tst_resm(TBROK, "%d: sigaction() failed", pid);
-
-	pause();
-	tst_resm(TINFO, "Container: Resumed after receiving SIGUSR1 "
-		 "from parentNS ");
-	if (kill(pid, SIGUSR1) != 0) {
-		tst_resm(TFAIL, "kill(SIGUSR1) fails.");
-	}
-	tst_resm(TINFO, "Container: Resumed after sending SIGUSR1 "
-		 "from container itself");
-	_exit(10);
-}
 
-static void setup(void)
-{
-	tst_require_root();
-	check_newpid();
-}
+	SAFE_SIGACTION(SIGUSR1, &sa, NULL);
 
-/***********************************************************************
-*   M A I N
-***********************************************************************/
-int main()
-{
-	int status;
-	pid_t cpid;
+	passed = 0;
+	exp_pid = 0;
 
-	setup();
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
-	cpid = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_fn, NULL);
+	if (passed)
+		tst_res(TPASS, "Container resumed after receiving SIGUSR1 from parent namespace");
+	else
+		tst_res(TFAIL, "Container did not receive the SIGUSR1 signal from parent");
 
-	if (cpid < 0) {
-		tst_resm(TBROK, "clone() failed.");
-	}
+	passed = 0;
+	exp_pid = 1;
 
-	sleep(1);
-	if (kill(cpid, SIGUSR1) != 0) {
-		tst_resm(TFAIL, "kill(SIGUSR1) fails.");
-	}
-	sleep(1);
-	if (waitpid(cpid, &status, 0) < 0)
-		tst_resm(TWARN, "waitpid() failed.");
+	SAFE_KILL(cpid, SIGUSR1);
 
-	if ((WIFEXITED(status)) && (WEXITSTATUS(status) == 10))
-		tst_resm(TPASS, "container init continued successfuly, "
-			 "after handling signal -USR1");
+	if (passed)
+		tst_res(TPASS, "Container resumed after receiving SIGUSR1 from container namespace");
 	else
-		tst_resm(TFAIL, "c-init failed to continue after "
-			 "passing kill -USR1");
-	tst_exit();
+		tst_res(TFAIL, "Container did not receive the SIGUSR1 signal from container");
+
+	return 0;
+}
+
+static void run(void)
+{
+	int ret;
+
+	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, NULL);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "clone failed");
+
+	TST_CHECKPOINT_WAIT(0);
+
+	SAFE_KILL(ret, SIGUSR1);
+
+	TST_CHECKPOINT_WAKE(0);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
