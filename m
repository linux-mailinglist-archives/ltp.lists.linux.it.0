Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F12104D98D6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 11:33:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B31EB3C934A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 11:33:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B6D33C933A
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 11:33:02 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5632D6008EA
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 11:33:01 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B84C321906;
 Tue, 15 Mar 2022 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647340380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfDKvQ+V5qAq8+O2XbbZFWZ/QmHHyoUaZyhUEcj8mIg=;
 b=Cjhiyjb17EarvVOm6YH22rS2EC8BSpybG/SnoF9Jv+JTrFGRD8Awo4MmTmE9rtYuZgM1w8
 YFooaRkp9hh3mwzHCMu1qaJ231CT6NbLRtCFjwjn07jYE0WT5T2GcRd5vPYbvqQJeN9+hI
 Qr99kJUwUJx+QxLQEceT5Jelpxp67uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647340380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfDKvQ+V5qAq8+O2XbbZFWZ/QmHHyoUaZyhUEcj8mIg=;
 b=DoPm4ynsmoWVdZMBd8Y25Em7SZT0LgSBuSf0N5+QytLB8A46CcuV6PpvhHcrTOfXy/4tNG
 BQTQpq8vxzLrWVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19AB413B59;
 Tue, 15 Mar 2022 10:33:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QItrAFxrMGKHHwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 15 Mar 2022 10:33:00 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue, 15 Mar 2022 11:32:48 +0100
Message-Id: <20220315103254.7185-5-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315103254.7185-1-andrea.cervesato@suse.de>
References: <20220315103254.7185-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 04/10] Rewrite sem_nstest.c using new LTP API
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

Updated containers runtest file to include new sem_nstest.c options.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 runtest/containers                            |   6 +-
 .../kernel/containers/sysvipc/sem_nstest.c    | 210 ++++++------------
 2 files changed, 76 insertions(+), 140 deletions(-)

diff --git a/runtest/containers b/runtest/containers
index d863c10a4..4f56b1b4d 100644
--- a/runtest/containers
+++ b/runtest/containers
@@ -54,9 +54,9 @@ mesgq_nstest_none mesgq_nstest -m none
 mesgq_nstest_clone mesgq_nstest -m clone
 mesgq_nstest_unshare mesgq_nstest -m unshare
 msg_comm msg_comm
-sem_nstest_none sem_nstest none
-sem_nstest_clone sem_nstest clone
-sem_nstest_unshare sem_nstest unshare
+sem_nstest_none sem_nstest -m none
+sem_nstest_clone sem_nstest -m clone
+sem_nstest_unshare sem_nstest -m unshare
 semtest_2ns_none semtest_2ns none
 semtest_2ns_clone semtest_2ns clone
 semtest_2ns_unshare semtest_2ns unshare
diff --git a/testcases/kernel/containers/sysvipc/sem_nstest.c b/testcases/kernel/containers/sysvipc/sem_nstest.c
index 72e04fe4f..ce927ca91 100644
--- a/testcases/kernel/containers/sysvipc/sem_nstest.c
+++ b/testcases/kernel/containers/sysvipc/sem_nstest.c
@@ -1,158 +1,94 @@
-/* *************************************************************************
-* Copyright (c) International Business Machines Corp., 2009
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-* Author: Veerendra C <vechandr@in.ibm.com>
-*
-* In Parent Process , create semaphore with key 154326L
-* Now create container by passing 1 of the below flag values..
-*	clone(NONE), clone(CLONE_NEWIPC), or unshare(CLONE_NEWIPC)
-* In cloned process, try to access the created semaphore
-* Test PASS: If the semaphore is readable when flag is None.
-* Test FAIL: If the semaphore is readable when flag is Unshare or Clone.
-***************************************************************************/
-
-#define _GNU_SOURCE 1
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <sys/ipc.h>
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines Corp., 2009
+ *				Veerendra C <vechandr@in.ibm.com>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test SysV IPC semaphore usage between namespaces.
+ *
+ * [Algorithm]
+ *
+ * In parent process create a new semaphore with a specific key.
+ * In cloned process, try to access the created semaphore
+ *
+ * Test PASS if the semaphore is readable when flag is None.
+ * Test FAIL if the semaphore is readable when flag is Unshare or Clone.
+ */
+
+#define _GNU_SOURCE
+
+#include <sys/wait.h>
+#include <sys/msg.h>
+#include <sys/types.h>
 #include <sys/sem.h>
-#include <libclone.h>
-#include "test.h"
-#include "ipcns_helper.h"
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "common.h"
 
-#define MY_KEY     154326L
-#define UNSHARESTR "unshare"
-#define CLONESTR   "clone"
-#define NONESTR    "none"
+#define MY_KEY 154326L
 
-char *TCID = "sem_nstest";
-int TST_TOTAL = 1;
-int p1[2];
-int p2[2];
+static char *str_op = "clone";
+static int use_clone;
+static int ipc_id = -1;
 
-int check_semaphore(void *vtest)
+static int check_semaphore(LTP_ATTRIBUTE_UNUSED void *vtest)
 {
-	char buf[3];
 	int id;
 
-	(void) vtest;
+	id = semget(MY_KEY, 1, 0);
 
-	close(p1[1]);
-	close(p2[0]);
+	if (id < 0) {
+		if (use_clone == T_NONE)
+			tst_res(TFAIL, "Plain cloned process didn't find semaphore");
+		else
+			tst_res(TPASS, "%s: container didn't find semaphore", str_op);
+	} else {
+		tst_res(TINFO, "PID %d: fetched existing semaphore..id = %d", getpid(), id);
 
-	read(p1[0], buf, 3);
-	id = semget(MY_KEY, 1, 0);
-	if (id == -1)
-		write(p2[1], "notfnd", 7);
-	else {
-		write(p2[1], "exists", 7);
-		tst_resm(TINFO, "PID %d: Fetched existing semaphore..id = %d",
-			 getpid(), id);
+		if (use_clone == T_NONE)
+			tst_res(TPASS, "Plain cloned process found semaphore inside container");
+		else
+			tst_res(TFAIL, "%s: Container init process found semaphore", str_op);
 	}
-	tst_exit();
+
+	return 0;
 }
 
-static void setup(void)
+static void run(void)
 {
-	tst_require_root();
-	check_newipc();
+	clone_unshare_test(use_clone, CLONE_NEWIPC, check_semaphore, NULL);
 }
 
-int main(int argc, char *argv[])
+static void setup(void)
 {
-	int ret, use_clone = T_NONE, id;
-	char *tsttype = NONESTR;
-	char buf[7];
-
-	setup();
-
-	if (argc != 2) {
-		tst_resm(TFAIL, "Usage: %s <clone| unshare| none>", argv[0]);
-		tst_brkm(TFAIL, NULL, " where clone, unshare, or fork specifies"
-			 " unshare method.");
-	}
-
-	/* Using PIPE's to sync between container and Parent */
-	if (pipe(p1) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
-	if (pipe(p2) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
+	use_clone = get_clone_unshare_enum(str_op);
 
-	if (strcmp(argv[1], "clone") == 0) {
-		use_clone = T_CLONE;
-		tsttype = CLONESTR;
-	} else if (strcmp(argv[1], "unshare") == 0) {
-		use_clone = T_UNSHARE;
-		tsttype = UNSHARESTR;
-	}
-
-	/* 1. Create (or fetch if existing) the binary semaphore */
-	id = semget(MY_KEY, 1, IPC_CREAT | IPC_EXCL | 0666);
-	if (id == -1) {
-		perror("Semaphore create");
-		if (errno != EEXIST) {
-			perror("semget failure");
-			tst_brkm(TBROK, NULL, "Semaphore creation failed");
-		}
-		id = semget(MY_KEY, 1, 0);
-		if (id == -1) {
-			perror("Semaphore create");
-			tst_brkm(TBROK, NULL, "Semaphore operation failed");
-		}
-	}
-
-	tst_resm(TINFO, "Semaphore namespaces Isolation test : %s", tsttype);
-	/* fire off the test */
-	ret =
-	    do_clone_unshare_test(use_clone, CLONE_NEWIPC, check_semaphore,
-				  NULL);
-	if (ret < 0) {
-		tst_brkm(TFAIL, NULL, "%s failed", tsttype);
-	}
+	if (use_clone != T_NONE)
+		check_newipc();
 
-	close(p1[0]);
-	close(p2[1]);
-	write(p1[1], "go", 3);
-	read(p2[0], buf, 7);
+	ipc_id = SAFE_SEMGET(MY_KEY, 1, IPC_CREAT | IPC_EXCL | 0666);
+}
 
-	if (strcmp(buf, "exists") == 0) {
-		if (use_clone == T_NONE)
-			tst_resm(TPASS, "Plain cloned process found semaphore "
-				 "inside container");
-		else
-			tst_resm(TFAIL,
-				 "%s: Container init process found semaphore",
-				 tsttype);
-	} else {
-		if (use_clone == T_NONE)
-			tst_resm(TFAIL,
-				 "Plain cloned process didn't find semaphore");
-		else
-			tst_resm(TPASS, "%s: Container didn't find semaphore",
-				 tsttype);
+static void cleanup(void)
+{
+	if (ipc_id != -1) {
+		tst_res(TINFO, "Delete semaphore");
+		SAFE_SEMCTL(ipc_id, IPC_RMID, 0);
 	}
-
-	/* Delete the semaphore */
-	id = semget(MY_KEY, 1, 0);
-	semctl(id, IPC_RMID, 0);
-
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Test execution mode <clone|unshare|none>" },
+		{},
+	},
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
