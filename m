Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A768D4D9
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 11:52:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8D233CC22C
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 11:52:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 97F853CB14E
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 11:52:13 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B3FC52009CB
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 11:52:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 87FA31FED7;
 Tue,  7 Feb 2023 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1675767131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eoBCNXHqMLEr7XYz2wy7vlJc/CTw8x89xmU4Es98O4s=;
 b=X3hgLuzwHZlGfZKSi5fmDHSaw/UnhSD2ERcZZCCSSFMNT+2bUO95HgC5rkuamosdxHK1cV
 TqLKmv9VQu7xsQLgq3I4auMlYGk8i9DTOoJ9VnPaD1nDwTzugAPFwfBKsqucpLHdzJ/ehA
 HS+8ZcYHriaTDXgbsJm9LPPcTUnMCSo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 644D513467;
 Tue,  7 Feb 2023 10:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4dCdFlst4mMpLgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 07 Feb 2023 10:52:11 +0000
To: ltp@lists.linux.it
Date: Tue,  7 Feb 2023 11:50:09 +0100
Message-Id: <20230207105009.9193-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Refactor pidns05 test using new LTP API
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
Use more TST_* macros

 testcases/kernel/containers/pidns/pidns05.c | 286 ++++++--------------
 1 file changed, 76 insertions(+), 210 deletions(-)

diff --git a/testcases/kernel/containers/pidns/pidns05.c b/testcases/kernel/containers/pidns/pidns05.c
index 79e146e36..bbe095c9b 100644
--- a/testcases/kernel/containers/pidns/pidns05.c
+++ b/testcases/kernel/containers/pidns/pidns05.c
@@ -1,256 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
-* Copyright (c) International Business Machines Corp., 2007
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-* This program is distributed in the hope that it will be useful
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-***************************************************************************
-*
-* Assertion:
-*   a) Create a  container.
-*   b) Create many levels of child containers inside this container.
-*   c) Now do kill -9 init , outside of the container.
-*   d) This should kill all the child containers.
-*      (containers created at the level below)
-*
-* Description:
-* 1. Parent process clone a process with flag CLONE_NEWPID
-* 2. The container will recursively loop and creates 4 more containers.
-* 3. All the container init's  goes into sleep(), waiting to be terminated.
-* 4. The parent process will kill child[3] by passing SIGKILL
-* 5. Now parent process, verifies the child containers 4 & 5 are destroyed.
-* 6. If they are killed then
-*	Test passed
-*  else Test failed.
-*
-* Test Name: pidns05
-*
-* History:
-*
-* FLAG DATE		NAME				DESCRIPTION
-* 31/10/08  Veerendra C <vechandr@in.ibm.com>	Verifies killing of NestedCont's
-*
-*******************************************************************************/
-#define _GNU_SOURCE 1
+ * Copyright (c) International Business Machines Corp., 2007
+ *		08/10/08 Veerendra C <vechandr@in.ibm.com>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Clone a process with CLONE_NEWPID flag and create many levels of child
+ * containers. Then kill container init process from parent and check if all
+ * containers have been killed.
+ */
+
 #include <sys/wait.h>
-#include <assert.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <errno.h>
-#include "pidns_helper.h"
-#include "test.h"
-#include "safe_macros.h"
+#include "tst_test.h"
+#include "lapi/sched.h"
 
-#define INIT_PID	1
-#define CINIT_PID	1
-#define PARENT_PID	0
 #define MAX_DEPTH	5
 
-char *TCID = "pidns05";
-int TST_TOTAL = 1;
-int fd[2];
+static pid_t pid_max;
 
-int max_pid(void)
+static int child_func(void *arg)
 {
-	FILE *fp;
 	int ret;
+	int *level;
+	pid_t cpid, ppid;
+
+	cpid = getpid();
+	ppid = getppid();
+
+	TST_EXP_EQ_LI(cpid, 1);
+	TST_EXP_EQ_LI(ppid, 0);
 
-	fp = fopen("/proc/sys/kernel/pid_max", "r");
-	if (fp != NULL) {
-		fscanf(fp, "%d", &ret);
-		fclose(fp);
-	} else {
-		tst_resm(TBROK, "Cannot open /proc/sys/kernel/pid_max");
-		ret = -1;
+	level = (int *)arg;
+
+	if (*level >= MAX_DEPTH) {
+		TST_CHECKPOINT_WAKE(0);
+		return 0;
 	}
-	return ret;
+
+	(*level)++;
+
+	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, level);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "clone failed");
+
+	pause();
+
+	return 0;
 }
 
-/* find_cinit_pids() iteratively finds the pid's having same PGID as its parent.
- * Input parameter - Accepts pointer to pid_t : To copy the pid's matching.
- * Returns - the number of pids matched.
-*/
-int find_cinit_pids(pid_t * pids)
+static int find_cinit_pids(pid_t *pids)
 {
-	int next = 0, pid_max, i;
+	int i;
+	int next = 0;
 	pid_t parentpid, pgid, pgid2;
 
-	pid_max = max_pid();
 	parentpid = getpid();
 	pgid = getpgid(parentpid);
 
-	/* The loop breaks, when the loop counter reaches the parentpid value */
-	for (i = parentpid + 1; i != parentpid; i++) {
-		if (i > pid_max)
-			i = 2;
-
+	for (i = parentpid + 1; i < pid_max; i++) {
 		pgid2 = getpgid(i);
+
 		if (pgid2 == pgid) {
 			pids[next] = i;
 			next++;
 		}
 	}
+
 	return next;
 }
 
-/*
-* create_nested_container() Recursively create MAX_DEPTH nested containers
-*/
-int create_nested_container(void *vtest)
+static void setup(void)
 {
-	int exit_val;
-	int ret, count, *level;
-	pid_t cpid, ppid;
-	cpid = getpid();
-	ppid = getppid();
-	char mesg[] = "Nested Containers are created";
-
-	level = (int *)vtest;
-	count = *level;
-
-	/* Child process closes up read side of pipe */
-	close(fd[0]);
-
-	/* Comparing the values to make sure pidns is created correctly */
-	if (cpid != CINIT_PID || ppid != PARENT_PID) {
-		printf("Got unexpected cpid and/or ppid (cpid=%d ppid=%d)\n",
-		       cpid, ppid);
-		exit_val = 1;
-	}
-	if (count > 1) {
-		count--;
-		ret = do_clone_unshare_test(T_CLONE, CLONE_NEWPID,
-					    create_nested_container,
-					    (void *)&count);
-		if (ret == -1) {
-			printf("clone failed; errno = %d : %s\n",
-			       ret, strerror(ret));
-			exit_val = 1;
-		} else
-			exit_val = 0;
-	} else {
-		/* Sending mesg, 'Nested containers created' through the pipe */
-		write(fd[1], mesg, (strlen(mesg) + 1));
-		exit_val = 0;
-	}
-
-	close(fd[1]);
-	pause();
-
-	return exit_val;
+	SAFE_FILE_SCANF("/proc/sys/kernel/pid_max", "%d\n", &pid_max);
 }
 
-void kill_nested_containers()
+static void run(void)
 {
-	int orig_count, new_count, status = 0, i;
+	int ret, i;
+	int status;
+	int children;
+	int level = 0;
 	pid_t pids[MAX_DEPTH];
 	pid_t pids_new[MAX_DEPTH];
 
-	orig_count = find_cinit_pids(pids);
-	kill(pids[MAX_DEPTH - 3], SIGKILL);
-	sleep(1);
+	ret = ltp_clone_quick(CLONE_NEWPID | SIGCHLD, child_func, &level);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "clone failed");
 
-	/* After killing child container, getting the New PID list */
-	new_count = find_cinit_pids(pids_new);
+	TST_CHECKPOINT_WAIT(0);
 
-	/* Verifying that the child containers were destroyed when parent is killed */
-	if (orig_count - 2 != new_count)
-		status = -1;
+	find_cinit_pids(pids);
 
-	for (i = 0; i < new_count; i++) {
-		if (pids[i] != pids_new[i])
-			status = -1;
-	}
+	SAFE_KILL(pids[0], SIGKILL);
 
-	if (status == 0)
-		tst_resm(TPASS, "The number of containers killed are %d",
-			 orig_count - new_count);
-	else
-		tst_resm(TFAIL, "Failed to kill the sub-containers of "
-			 "the container %d", pids[MAX_DEPTH - 3]);
+	TST_RETRY_FUNC(waitpid(0, &status, WNOHANG), TST_RETVAL_NOTNULL);
 
-	/* Loops through the containers created to exit from sleep() */
-	for (i = 0; i < MAX_DEPTH; i++) {
-		kill(pids[i], SIGKILL);
-		waitpid(pids[i], &status, 0);
-	}
-}
+	children = find_cinit_pids(pids_new);
 
-static void setup(void)
-{
-	tst_require_root();
-	check_newpid();
-}
-
-int main(void)
-{
-	int ret, nbytes, status;
-	char readbuffer[80];
-	pid_t pid, pgid;
-	int count = MAX_DEPTH;
+	if (children > 0) {
+		tst_res(TFAIL, "%d children left after sending SIGKILL", children);
 
-	setup();
-
-	/*
-	 * XXX (garrcoop): why in the hell is this fork-wait written this way?
-	 * This doesn't add up with the pattern used for the rest of the tests,
-	 * so I'm pretty damn sure this test is written incorrectly.
-	 */
-	pid = fork();
-	if (pid == -1) {
-		tst_brkm(TBROK | TERRNO, NULL, "fork failed");
-	} else if (pid != 0) {
-		/*
-		 * NOTE: use waitpid so that we know we're waiting for the
-		 * _top-level_ child instead of a spawned subcontainer.
-		 *
-		 * XXX (garrcoop): Might want to mask SIGCHLD in the top-level
-		 * child too, or not *shrugs*.
-		 */
-		if (waitpid(pid, &status, 0) == -1) {
-			perror("wait failed");
+		for (i = 0; i < MAX_DEPTH; i++) {
+			kill(pids[i], SIGKILL);
+			waitpid(pids[i], &status, 0);
 		}
-		if (WIFEXITED(status))
-			exit(WEXITSTATUS(status));
-		else
-			exit(status);
-	}
 
-	/* To make all the containers share the same PGID as its parent */
-	setpgid(0, 0);
-
-	pid = getpid();
-	pgid = getpgid(pid);
-	SAFE_PIPE(NULL, fd);
-
-	TEST(do_clone_unshare_test(T_CLONE, CLONE_NEWPID,
-				   create_nested_container, (void *)&count));
-	if (TEST_RETURN == -1) {
-		tst_brkm(TFAIL | TTERRNO, NULL, "clone failed");
+		return;
 	}
 
-	close(fd[1]);
-	/* Waiting for the MAX_DEPTH number of containers to be created */
-	nbytes = read(fd[0], readbuffer, sizeof(readbuffer));
-	close(fd[0]);
-	if (nbytes > 0)
-		tst_resm(TINFO, " %d %s", MAX_DEPTH, readbuffer);
-	else
-		tst_brkm(TFAIL, NULL, "unable to create %d containers",
-			 MAX_DEPTH);
-
-	/* Kill the container created */
-	kill_nested_containers();
-
-	tst_exit();
+	tst_res(TPASS, "No children left after sending SIGKILL to the first child");
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
