Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3E6590EE6
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Aug 2022 12:13:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74BAC3C954C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Aug 2022 12:13:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB47D3C02C2
 for <ltp@lists.linux.it>; Fri, 12 Aug 2022 12:13:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BBF39600C3A
 for <ltp@lists.linux.it>; Fri, 12 Aug 2022 12:12:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA8F15C858;
 Fri, 12 Aug 2022 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1660299178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PP1ujnQrzIwv5ttucilayfc0TPS521QHophlKqAy1LA=;
 b=KIjlrUJxRi/RmzLfwgLDV3Z2AphnXHNe8/WrrWuFAIs430i7jiwWCyqSI01CuUhZUqI1tt
 iJaaXjYOTOcxOtgtMPbv68M4b69YIwxraI7jfeL6xkMAkkd1JzibkdGqGraNXbhkrL5Ug/
 OZD4LqzL0PDrChp8PebBrSD7ZVSbNko=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E53613305;
 Fri, 12 Aug 2022 10:12:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id q1X9IKon9mJ6VAAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 12 Aug 2022 10:12:58 +0000
To: ltp@lists.linux.it
Date: Fri, 12 Aug 2022 12:12:19 +0200
Message-Id: <20220812101219.10233-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Refactor pidns31 test using new LTP API
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
 testcases/kernel/containers/pidns/pidns31.c | 352 +++++---------------
 1 file changed, 80 insertions(+), 272 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns31.c b/testcases/kernel/containers/pidns/pidns31.c
index 8821ec83c..1c2728fb5 100644
--- a/testcases/kernel/containers/pidns/pidns31.c
+++ b/testcases/kernel/containers/pidns/pidns31.c
@@ -1,330 +1,138 @@
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
+ * Copyright (c) Bull S.A.S. 2008
+ *               01/12/08  Nadia Derbey <Nadia.Derbey@bull.net>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
 
-#define CHILD_PID       1
-#define PARENT_PID      0
+/*\
+ * [Description]
+ *
+ * Clone a process with CLONE_NEWPID flag, register notification on a posix
+ * mqueue and send a mqueue message from the child. Then check if signal
+ * notification contains si_pid of the child.
+ */
 
-#define MSG      "HOW ARE YOU"
-#define MSG_PRIO 1
+#define _GNU_SOURCE 1
+#include <signal.h>
+#include <mqueue.h>
+#include "tst_test.h"
+#include "lapi/namespaces_constants.h"
 
-#define NO_STEP -1
-#define F_STEP_0 0x00
-#define F_STEP_1 0x01
-#define F_STEP_2 0x02
-#define F_STEP_3 0x03
-#define C_STEP_0 0x10
-#define C_STEP_1 0x11
+#define MQNAME "/LTP_PIDNS30_MQ"
 
 struct notify_info {
 	mqd_t mqd;
 	pid_t pid;
 };
 
-static void remove_pipe(int *fd)
-{
-	close(fd[0]);
-	close(fd[1]);
-}
+static mqd_t mqd = -1;
+static int received;
 
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
+	if (mqd != -1)
 		mq_close(mqd);
-		break;
-
-	case F_STEP_3:
-		remove_mqueue(mqd);
-		close(father_to_child[1]);
-		break;
-
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
-}
-
-/*
- * cleanup_mqueue() - performs all ONE TIME cleanup for this test at
- *             completion or premature exit.
- * step == -1 means no local resource to remove.
- */
-void cleanup_mqueue(int result, int step, mqd_t mqd)
-{
-	if (step != NO_STEP)
-		cleanup_resources(step, mqd);
 
-	tst_exit();
+	mq_unlink(MQNAME);
 }
 
-/*
- * child_fn() - Inside container
- */
-int child_fn(void *arg)
+static void child_signal_handler(LTP_ATTRIBUTE_UNUSED int sig, siginfo_t *si, LTP_ATTRIBUTE_UNUSED void *unused)
 {
-	pid_t pid, ppid;
-	mqd_t mqd;
-	char buf[5];
-
-	/* Set process id and parent pid */
-	pid = getpid();
-	ppid = getppid();
-
-	if (pid != CHILD_PID || ppid != PARENT_PID) {
-		tst_resm(TBROK, "cinit: pidns is not created");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-
-	/* Close the appropriate end of pipe */
-	close(father_to_child[1]);
+	struct notify_info *info;
 
-	/* Is parent ready to receive a message? */
-	read(father_to_child[0], buf, 5);
-	if (strcmp(buf, "f:ok")) {
-		tst_resm(TBROK, "cinit: parent did not send the message!");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-	tst_resm(TINFO, "cinit: my father is ready to receive a message");
+	received = 0;
 
-	mqd = tst_syscall(__NR_mq_open, mqname, O_WRONLY, 0, NULL);
-	if (mqd == (mqd_t) - 1) {
-		tst_resm(TBROK, "cinit: mq_open() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
-	tst_resm(TINFO, "cinit: mq_open succeeded");
+	if (si->si_signo != SIGUSR1 || si->si_code != SI_MESGQ)
+		return;
 
-	if (mq_send(mqd, MSG, strlen(MSG), MSG_PRIO) == (mqd_t) - 1) {
-		tst_resm(TBROK, "cinit: mq_send() failed (%s)",
-			 strerror(errno));
-		cleanup_mqueue(TBROK, C_STEP_0, mqd);
-	}
-	tst_resm(TINFO, "cinit: mq_send() succeeded");
+	info = (struct notify_info*)si->si_ptr;
 
-	/* Cleanup and exit */
-	cleanup_resources(C_STEP_1, mqd);
-	exit(0);
+	if (si->si_pid == info->pid)
+		received++;
 }
 
-/*
- * father_signal_handler()
- */
-static void father_signal_handler(int sig, siginfo_t * si, void *unused)
+static int child_func(LTP_ATTRIBUTE_UNUSED void *arg)
 {
-	char buf[256];
-	struct mq_attr attr;
-	struct notify_info *info;
+	int ret;
+	pid_t cpid, ppid;
+	mqd_t mqd_child;
 
-	if (si->si_signo != SIGUSR1) {
-		tst_resm(TBROK, "father: received %s unexpectedly",
-			 strsignal(si->si_signo));
-		return;
-	}
+	cpid = getpid();
+	ppid = getppid();
 
-	if (si->si_code != SI_MESGQ) {
-		tst_resm(TBROK, "father: expected signal code SI_MESGQ - "
-			 "Got %d", si->si_code);
-		return;
+	if (cpid != 1 || ppid != 0) {
+		tst_res(TFAIL, "got unexpected result of cpid=%d ppid=%d", cpid, ppid);
+		return 0;
 	}
 
-	if (!si->si_ptr) {
-		tst_resm(TBROK, "father: expected si_ptr - Got NULL");
-		return;
-	}
+	TST_CHECKPOINT_WAIT(0);
 
-	info = (struct notify_info *)si->si_ptr;
+	mqd_child = mq_open(MQNAME, O_WRONLY, 0, NULL);
+	if (mqd_child == -1)
+		tst_brk(TBROK | TERRNO, "mq_open failed");
 
-	if (si->si_pid != info->pid) {
-		tst_resm(TFAIL,
-			 "father: expected signal originator PID = %d - Got %d",
-			 info->pid, si->si_pid);
-		return;
-	}
+	ret = mq_send(mqd_child, "pippo", 5, 1);
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "mq_send failed");
 
-	tst_resm(TPASS, "father: signal originator PID = %d", si->si_pid);
-	result = TPASS;
+	TST_CHECKPOINT_WAKE(0);
 
-	/*
-	 * Now read the message - Be silent on errors since this is not the
-	 * test purpose.
-	 */
-	if (!mq_getattr(info->mqd, &attr))
-		mq_receive(info->mqd, buf, attr.mq_msgsize, NULL);
+	return 0;
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
-	pid_t cpid;
-	mqd_t mqd;
-	struct sigevent notif;
+	int cpid, ret, status;
 	struct sigaction sa;
-	int status;
+	struct sigevent notif;
 	struct notify_info info;
 
-	setup();
-
-	if (pipe(father_to_child) == -1) {
-		tst_resm(TBROK, "parent: pipe() failed. aborting!");
-		cleanup_mqueue(TBROK, NO_STEP, 0);
-	}
+	remove_mqueue(mqd);
 
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
+	mqd = mq_open(MQNAME, O_RDWR | O_CREAT | O_EXCL, 0777, NULL);
+	if (mqd == -1)
+		tst_brk(TBROK | TERRNO, "mq_open failed");
 
-	/* container creation on PID namespace */
-	cpid = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_fn, NULL);
-	if (cpid < 0) {
-		tst_resm(TBROK, "parent: clone() failed(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_1, mqd);
-	}
-	tst_resm(TINFO, "parent: successfully created child (pid = %d)", cpid);
+	cpid = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, NULL);
+	if (cpid < 0)
+		tst_brk(TBROK | TERRNO, "clone failed");
 
-	/* Register for notification on message arrival */
 	notif.sigev_notify = SIGEV_SIGNAL;
 	notif.sigev_signo = SIGUSR1;
 	info.mqd = mqd;
 	info.pid = cpid;
 	notif.sigev_value.sival_ptr = &info;
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
+	ret = mq_notify(mqd, &notif);
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "mq_notify failed");
 
-	/* Close the appropriate end of pipe */
-	close(father_to_child[0]);
+	sa.sa_flags = SA_SIGINFO;
+	SAFE_SIGEMPTYSET(&sa.sa_mask);
+	sa.sa_sigaction = child_signal_handler;
+	SAFE_SIGACTION(SIGUSR1, &sa, NULL);
 
-	/* Tell the child a message can be sent */
-	if (write(father_to_child[1], "f:ok", 5) != 5) {
-		tst_resm(TBROK, "parent: pipe is broken(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_2, mqd);
-	}
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
 
-	sleep(3);
+	SAFE_WAITPID(cpid, &status, 0);
 
-	/* Wait for child to finish */
-	if (wait(&status) == -1) {
-		tst_resm(TBROK, "parent: wait() failed(%s)", strerror(errno));
-		cleanup_mqueue(TBROK, F_STEP_1, mqd);
+	if (received != 1) {
+		tst_res(TFAIL, "Signal hasn't been received after mqueue event");
+		return;
 	}
 
-	cleanup_mqueue(result, F_STEP_3, mqd);
-
-	tst_exit();
+	tst_res(TPASS, "Signal has been received after mqueue event");
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
