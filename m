Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9AC68D6A6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 13:26:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10AE03CC201
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 13:26:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B18293CB14D
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 13:26:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E3C2820006F
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 13:26:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C207E20D6C;
 Tue,  7 Feb 2023 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1675772815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jiDxc44RP7AxCy6AW/blxYf/7bbbwkPjL/wH7yd8BE8=;
 b=M1Fv9U0rkgDsAmC0UsW4nM+R9+WqfzGDHDhIhI/iQj3rkIdpeIQ+/16/DW9Zl33KLpUFmq
 66mZUZLTejXAfEupIXDplmYRDJZiWukxehQTxAdwrw98LSdRtceo5wBLjqoerz0MvBVCN0
 KyNyE5AlMhFDCGmJ2nUYe5qvEk4S7PQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9218313467;
 Tue,  7 Feb 2023 12:26:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJwQIY9D4mPKVgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 07 Feb 2023 12:26:55 +0000
To: ltp@lists.linux.it
Date: Tue,  7 Feb 2023 13:24:55 +0100
Message-Id: <20230207122455.28177-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] Refactor pidns16 test using new LTP API
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
Using tst_clone API
More TST_* macro usage
Better TINFO messages

 testcases/kernel/containers/pidns/pidns16.c | 193 +++++++-------------
 1 file changed, 62 insertions(+), 131 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns16.c b/testcases/kernel/containers/pidns/pidns16.c
index 2ee61065a..121da8e63 100644
--- a/testcases/kernel/containers/pidns/pidns16.c
+++ b/testcases/kernel/containers/pidns/pidns16.c
@@ -1,157 +1,88 @@
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
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
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
+#include "lapi/sched.h"
 
-char *TCID = "pidns16";
-int TST_TOTAL = 3;
+static int counter;
+static int signal_pid;
 
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
-
-	if (si->si_pid == expected_pid)
-		tst_resm(TPASS, "child is signalled from expected pid %d",
-			 expected_pid);
-	else
-		tst_resm(TFAIL, "child is signalled from unexpected pid %d,"
-			 " expecting pid %d", si->si_pid, expected_pid);
-
-	c++;
+	signal_pid = si->si_pid;
+	counter++;
 }
 
-/*
- * child_fn() - Inside container
- */
-int child_fn(void *ttype)
+static int child_func(void)
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
+	TST_EXP_EQ_LI(cpid, 1);
+	TST_EXP_EQ_LI(ppid, 0);
+
+	tst_res(TINFO, "Catching SIGUSR1 signal");
 
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
+	SAFE_SIGACTION(SIGUSR1, &sa, NULL);
 
-static void setup(void)
-{
-	tst_require_root();
-	check_newpid();
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
+
+	TST_EXP_EQ_LI(signal_pid, 0);
+
+	tst_res(TINFO, "Sending SIGUSR1 from container itself");
+
+	SAFE_KILL(cpid, SIGUSR1);
+
+	TST_EXP_EQ_LI(signal_pid, 1);
+
+	return 0;
 }
 
-/***********************************************************************
-*   M A I N
-***********************************************************************/
-int main()
+static void run(void)
 {
-	int status;
-	pid_t cpid;
-
-	setup();
+	const struct tst_clone_args args = { CLONE_NEWPID, SIGCHLD };
+	pid_t pid;
 
-	cpid = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_fn, NULL);
+	signal_pid = -1;
 
-	if (cpid < 0) {
-		tst_resm(TBROK, "clone() failed.");
+	pid = SAFE_CLONE(&args);
+	if (!pid) {
+		child_func();
+		return;
 	}
 
-	sleep(1);
-	if (kill(cpid, SIGUSR1) != 0) {
-		tst_resm(TFAIL, "kill(SIGUSR1) fails.");
-	}
-	sleep(1);
-	if (waitpid(cpid, &status, 0) < 0)
-		tst_resm(TWARN, "waitpid() failed.");
-
-	if ((WIFEXITED(status)) && (WEXITSTATUS(status) == 10))
-		tst_resm(TPASS, "container init continued successfuly, "
-			 "after handling signal -USR1");
-	else
-		tst_resm(TFAIL, "c-init failed to continue after "
-			 "passing kill -USR1");
-	tst_exit();
+	TST_CHECKPOINT_WAIT(0);
+
+	tst_res(TINFO, "Sending SIGUSR1 from parent");
+
+	SAFE_KILL(pid, SIGUSR1);
+
+	TST_CHECKPOINT_WAKE(0);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+	.forks_child = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
