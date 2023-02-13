Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5717F6942C4
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Feb 2023 11:24:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B01E83CBF90
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Feb 2023 11:24:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3BA923C1047
 for <ltp@lists.linux.it>; Mon, 13 Feb 2023 11:24:06 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AAF31200929
 for <ltp@lists.linux.it>; Mon, 13 Feb 2023 11:24:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 248BD1FDCD;
 Mon, 13 Feb 2023 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1676283843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r7oltO9TDVUb5KkaTotPIfMsmjWrqjqSppB+/q1DVJs=;
 b=Gxed1h/1crRj1UkDIAI7F/0NDfDJjx1ogZq1o+eJnbRKQSx4F+6DDik56vA0BeaGCQvWRN
 p9TIWNFA7kSjwFdkfZAjaJY/XvaqdhyVu+oroMt9Zmc32lFAz62KmhqMvsgF0gBmLyhQhB
 M8gjN4KA1u/CN363As4KjaRae0u4eck=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0317E138E6;
 Mon, 13 Feb 2023 10:24:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id akaOOsIP6mOpeQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Mon, 13 Feb 2023 10:24:02 +0000
To: ltp@lists.linux.it
Date: Mon, 13 Feb 2023 11:22:01 +0100
Message-Id: <20230213102201.1742-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5] Refactor pidns31 test using new LTP API
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
Small names adjustments
Removed useless TFAIL check
Removed notify_info struct

 testcases/kernel/containers/pidns/pidns31.c | 358 ++++----------------
 1 file changed, 72 insertions(+), 286 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns31.c b/testcases/kernel/containers/pidns/pidns31.c
index 8821ec83c..8eb4ecec3 100644
--- a/testcases/kernel/containers/pidns/pidns31.c
+++ b/testcases/kernel/containers/pidns/pidns31.c
@@ -1,330 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
-* Copyright (c) Bull S.A.S. 2008
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
-* File: pidns31.c
-*
-*   Description:
-*    This testcase checks if the si_pid is correctly set when a process
-*    that has registered for notification on a posix mqueue is in an
-*    ancestor namespace wrt the process that sends a message to that posix
-*    mqueue.
-*
-*   Test Assertion & Strategy:
-*    Parent                                   Child
-*    --------------------------------------------------------------------------
-*    Create a POSIX mqueue.
-*    Create a PID namespace container.
-*    Register for notification when a
-*       message arrives in that mqueue
-*    Install a handler for SIGUSR1.
-*                                             Open that mqueue for writing
-*                                             Write something to the mqueue.
-*    Inside the handler, check that
-*       si_pid is set to the child's pid
-*
-*   Usage: <for command-line>
-*    pidns31
-*
-*   History:
-*    DATE      NAME                             DESCRIPTION
-*    04/12/08  Nadia Derbey               Creation of this test.
-*              <Nadia.Derbey@bull.net>
-*
-******************************************************************************/
-#ifndef _GNU_SOURCE
-#define _GNU_SOURCE
-#endif
-#include <sys/wait.h>
-#include <sys/types.h>
-#include <signal.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <stdio.h>
-#include <mqueue.h>
-#include "lapi/syscalls.h"
-#include "pidns_helper.h"
-#include "test.h"
-
-char *TCID = "pidns31";
-int TST_TOTAL = 1;
-
-char *mqname = "mq1";
-int result = TFAIL;
-
-int father_to_child[2];
-
-#define CHILD_PID       1
-#define PARENT_PID      0
+ * Copyright (c) Bull S.A.S. 2008
+ *               01/12/08  Nadia Derbey <Nadia.Derbey@bull.net>
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
 
-#define MSG      "HOW ARE YOU"
-#define MSG_PRIO 1
+/*\
+ * [Description]
+ *
+ * Clone a process with CLONE_NEWPID flag, register notification on a posix
+ * mqueue and send a mqueue message from the child. Then check if signal
+ * notification contains si_pid of the child.
+ */
 
-#define NO_STEP -1
-#define F_STEP_0 0x00
-#define F_STEP_1 0x01
-#define F_STEP_2 0x02
-#define F_STEP_3 0x03
-#define C_STEP_0 0x10
-#define C_STEP_1 0x11
+#define _GNU_SOURCE 1
+#include <signal.h>
+#include <mqueue.h>
+#include "tst_test.h"
+#include "tst_safe_posix_ipc.h"
+#include "lapi/sched.h"
 
-struct notify_info {
-	mqd_t mqd;
-	pid_t pid;
-};
+#define MQNAME "/LTP_PIDNS30_MQ"
 
-static void remove_pipe(int *fd)
-{
-	close(fd[0]);
-	close(fd[1]);
-}
+static mqd_t mqd = -1;
+static volatile int received;
+static siginfo_t info;
 
 static void remove_mqueue(mqd_t mqd)
 {
-	mq_close(mqd);
-	tst_syscall(__NR_mq_unlink, mqname);
-}
-
-/*
- * steps F_STEP_XX : called from main
- * steps C_STEP_XX : called from child_fn
- */
-static void cleanup_resources(int step, mqd_t mqd)
-{
-	switch (step) {
-	case C_STEP_1:
-		close(father_to_child[0]);
-		/* fall through */
-	case C_STEP_0:
-		mq_close(mqd);
-		break;
-
-	case F_STEP_3:
-		remove_mqueue(mqd);
-		close(father_to_child[1]);
-		break;
+	if (mqd != -1)
+		SAFE_MQ_CLOSE(mqd);
 
-	case F_STEP_2:
-		tst_syscall(__NR_mq_notify, mqd, NULL);
-		/* fall through */
-	case F_STEP_1:
-		remove_mqueue(mqd);
-		/* fall through */
-	case F_STEP_0:
-		remove_pipe(father_to_child);
-		break;
-	default:
-		tst_resm(TWARN, "Unknown code - no resource removed.");
-		break;
-	}
+	mq_unlink(MQNAME);
 }
 
-/*
- * cleanup_mqueue() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- * step == -1 means no local resource to remove.
- */
-void cleanup_mqueue(int result, int step, mqd_t mqd)
+static void signal_handler(LTP_ATTRIBUTE_UNUSED int sig, siginfo_t *si, LTP_ATTRIBUTE_UNUSED void *unused)
 {
-	if (step != NO_STEP)
-		cleanup_resources(step, mqd);
-
-	tst_exit();
+	memcpy(&info, si, sizeof(info));
+	received++;
 }
 
-/*
- * child_fn() - Inside container
- */
-int child_fn(void *arg)
+static void child_func(void)
 {
-	pid_t pid, ppid;
-	mqd_t mqd;
-	char buf[5];
+	pid_t cpid, ppid;
+	mqd_t mqd_child;
 
-	/* Set process id and parent pid */
-	pid = getpid();
+	cpid = getpid();
 	ppid = getppid();
 
-	if (pid != CHILD_PID || ppid != PARENT_PID) {
-		tst_resm(TBROK, "cinit: pidns is not created");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-
-	/* Close the appropriate end of pipe */
-	close(father_to_child[1]);
-
-	/* Is parent ready to receive a message? */
-	read(father_to_child[0], buf, 5);
-	if (strcmp(buf, "f:ok")) {
-		tst_resm(TBROK, "cinit: parent did not send the message!");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-	tst_resm(TINFO, "cinit: my father is ready to receive a message");
-
-	mqd = tst_syscall(__NR_mq_open, mqname, O_WRONLY, 0, NULL);
-	if (mqd == (mqd_t) - 1) {
-		tst_resm(TBROK, "cinit: mq_open() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-	tst_resm(TINFO, "cinit: mq_open succeeded");
-
-	if (mq_send(mqd, MSG, strlen(MSG), MSG_PRIO) == (mqd_t) - 1) {
-		tst_resm(TBROK, "cinit: mq_send() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, C_STEP_0, mqd);
-	}
-	tst_resm(TINFO, "cinit: mq_send() succeeded");
-
-	/* Cleanup and exit */
-	cleanup_resources(C_STEP_1, mqd);
-	exit(0);
-}
+	TST_EXP_EQ_LI(cpid, 1);
+	TST_EXP_EQ_LI(ppid, 0);
 
-/*
- * father_signal_handler()
- */
-static void father_signal_handler(int sig, siginfo_t * si, void *unused)
-{
-	char buf[256];
-	struct mq_attr attr;
-	struct notify_info *info;
+	TST_CHECKPOINT_WAIT(0);
 
-	if (si->si_signo != SIGUSR1) {
-		tst_resm(TBROK, "father: received %s unexpectedly",
-			 strsignal(si->si_signo));
-		return;
-	}
+	tst_res(TINFO, "Send mqueue message from child");
 
-	if (si->si_code != SI_MESGQ) {
-		tst_resm(TBROK, "father: expected signal code SI_MESGQ - "
-			 "Got %d", si->si_code);
-		return;
-	}
+	mqd_child = SAFE_MQ_OPEN(MQNAME, O_WRONLY, 0, NULL);
+	SAFE_MQ_SEND(mqd_child, "pippo", 5, 1);
 
-	if (!si->si_ptr) {
-		tst_resm(TBROK, "father: expected si_ptr - Got NULL");
-		return;
-	}
-
-	info = (struct notify_info *)si->si_ptr;
-
-	if (si->si_pid != info->pid) {
-		tst_resm(TFAIL,
-			 "father: expected signal originator PID = %d - Got %d",
-			 info->pid, si->si_pid);
-		return;
-	}
-
-	tst_resm(TPASS, "father: signal originator PID = %d", si->si_pid);
-	result = TPASS;
-
-	/*
-	 * Now read the message - Be silent on errors since this is not the
-	 * test purpose.
-	 */
-	if (!mq_getattr(info->mqd, &attr))
-		mq_receive(info->mqd, buf, attr.mq_msgsize, NULL);
+	TST_CHECKPOINT_WAKE(0);
 }
 
-static void setup(void)
+static void cleanup(void)
 {
-	tst_require_root();
-	check_newpid();
+	remove_mqueue(mqd);
 }
 
-/***********************************************************************
-*   M A I N
-***********************************************************************/
-
-int main(void)
+static void run(void)
 {
 	pid_t cpid;
-	mqd_t mqd;
-	struct sigevent notif;
-	struct sigaction sa;
 	int status;
-	struct notify_info info;
+	struct sigaction sa;
+	struct sigevent notif;
+	const struct tst_clone_args args = { CLONE_NEWPID, SIGCHLD };
 
-	setup();
+	remove_mqueue(mqd);
+	received = 0;
 
-	if (pipe(father_to_child) == -1) {
-		tst_resm(TBROK, "parent: pipe() failed. aborting!");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
+	cpid = SAFE_CLONE(&args);
+	if (!cpid) {
+		child_func();
+		return;
 	}
 
-	tst_syscall(__NR_mq_unlink, mqname);
-	mqd =
-	    tst_syscall(__NR_mq_open, mqname, O_RDWR | O_CREAT | O_EXCL, 0777,
-		    NULL);
-	if (mqd == (mqd_t) - 1) {
-		tst_resm(TBROK, "parent: mq_open() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_0, 0);
-	}
-	tst_resm(TINFO, "parent: successfully created posix mqueue");
+	tst_res(TINFO, "Register notification on posix mqueue");
 
-	/* container creation on PID namespace */
-	cpid = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_fn, NULL);
-	if (cpid < 0) {
-		tst_resm(TBROK, "parent: clone() failed(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_1, mqd);
-	}
-	tst_resm(TINFO, "parent: successfully created child (pid = %d)", cpid);
+	mqd = SAFE_MQ_OPEN(MQNAME, O_RDWR | O_CREAT | O_EXCL, 0777, NULL);
 
-	/* Register for notification on message arrival */
 	notif.sigev_notify = SIGEV_SIGNAL;
 	notif.sigev_signo = SIGUSR1;
-	info.mqd = mqd;
-	info.pid = cpid;
-	notif.sigev_value.sival_ptr = &info;
-	if (tst_syscall(__NR_mq_notify, mqd, &notif) == (mqd_t) -1) {
-		tst_resm(TBROK, "parent: mq_notify() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_1, mqd);
-	}
-	tst_resm(TINFO, "parent: successfully registered for notification");
 
-	/* Define handler for SIGUSR1 */
-	sa.sa_flags = SA_SIGINFO;
-	sigemptyset(&sa.sa_mask);
-	sa.sa_sigaction = father_signal_handler;
-	if (sigaction(SIGUSR1, &sa, NULL) == -1) {
-		tst_resm(TBROK, "parent: sigaction() failed(%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_2, mqd);
-	}
-	tst_resm(TINFO, "parent: successfully registered handler for SIGUSR1");
-
-	/* Close the appropriate end of pipe */
-	close(father_to_child[0]);
-
-	/* Tell the child a message can be sent */
-	if (write(father_to_child[1], "f:ok", 5) != 5) {
-		tst_resm(TBROK, "parent: pipe is broken(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_2, mqd);
-	}
+	SAFE_MQ_NOTIFY(mqd, &notif);
 
-	sleep(3);
+	sa.sa_flags = SA_SIGINFO;
+	SAFE_SIGEMPTYSET(&sa.sa_mask);
+	sa.sa_sigaction = signal_handler;
+	SAFE_SIGACTION(SIGUSR1, &sa, NULL);
 
-	/* Wait for child to finish */
-	if (wait(&status) == -1) {
-		tst_resm(TBROK, "parent: wait() failed(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_1, mqd);
-	}
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
-	cleanup_mqueue(result, F_STEP_3, mqd);
+	SAFE_WAITPID(cpid, &status, 0);
 
-	tst_exit();
+	TST_EXP_EQ_LI(received, 1);
+	TST_EXP_EQ_LI(info.si_signo, SIGUSR1);
+	TST_EXP_EQ_LI(info.si_code, SI_MESGQ);
+	TST_EXP_EQ_LI(info.si_pid, cpid);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
